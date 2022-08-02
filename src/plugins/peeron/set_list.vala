using Gdk;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Peeron;
using Ldraw.Utils;
using Ldraw.Ui;

namespace Ldraw.Peeron
{
	private class SetList : Object, IPartDragSource
	{
		private ObservableList<Inventory> sets;
		private PartGroupUsage usage;
		private TreeView partsView;
		private PartUsageViewModel usageViewModel;
		private Paned widget;
		
		private Map<string, string> extra_name_ref = new HashMap<string, string>();

		public IDatFileCache Library {private get; construct;}
		public InventoryReader InventoryReader {private get; construct;}
		public ColourChart ColourChart {private get; construct;}
		public AnimatedModel Model {construct; private get;}

		construct
		{
			sets = new ObservableList<Inventory>();
			widget = new Paned(Orientation.VERTICAL);
			InitializeControls();
			Model.view_changed.connect(() => UpdateUsage.begin(false));
			extra_name_ref["x187"] = "3648a";
		}

		private async void UpdateUsage(bool reset)
		{
			var availableParts = Aggregate(yield ToPartGroups(sets, Library));
			var modelFile = Model.File as LdrawModelFile;
			PartGroup modelGroup;
			if(modelFile == null)
			{
				var c = Collection.empty<PartGroupItem>();
				modelGroup = (PartGroup) GLib.Object.new(typeof(PartGroup), Items: c);
			}
			else
			{
				modelGroup = new PartGroup.FromModel(modelFile);
			}
			usage = new PartGroupUsage(availableParts, modelGroup);
			if(usageViewModel == null)
			{
				usageViewModel = new PartUsageViewModel(usage);
				partsView.model = usageViewModel;
			}
			else
			{
				usageViewModel.Update(usage);
			}
		}

		private void InitializeControls()
		{
			var setControls = new Box(Orientation.VERTICAL, 0);
			var setButtons = new Box(Orientation.HORIZONTAL, 2);
			var addButton = new Button.with_label("Add");
			addButton.clicked.connect(() =>
				{
					var dialog = new Dialog.with_buttons("Set number", null,
						DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
						"_OK", ResponseType.ACCEPT,
						"_Cancel", ResponseType.REJECT);

					var content = (Box) dialog.get_content_area();
					var setnameEntry = new Entry();
					setnameEntry.activates_default = true;
					content.pack_start(setnameEntry);
					var ok = dialog.get_widget_for_response(ResponseType.ACCEPT);
					ok.can_default = true;
					ok.grab_default();

					dialog.show_all();

					var response = dialog.run();

					var setname = setnameEntry.text;

					dialog.destroy();
					if(response != ResponseType.ACCEPT)
						return;

					InventoryReader.GetInventoryFor.begin(setname,
						(obj, res) =>
					{
						try
						{
							sets.add(InventoryReader.GetInventoryFor.end(res));							
						}
						catch (Error e)
						{
							stderr.printf(@"Unable to get inventory for set $setname: $(e.message).\n");
							return;
						}
						UpdateUsage.begin(true);
					});
				});
			setButtons.pack_start(addButton);
			var clearButton = new Button.with_label("Clear");
			setButtons.pack_start(clearButton);
			clearButton.clicked.connect(() =>
			{
				sets.clear();
				UpdateUsage.begin(true);
			});

			var setsView = new SimpleList<Inventory>.with_model(sets);
			setsView.insert_text_column_with_data_func(-1, "", s => s.SetNumber);
			setsView.headers_visible = false;
			setControls.pack_start(WithScrolls(setsView));
			setControls.pack_start(setButtons, false);
			widget.add1(setControls);
			partsView = new TreeView();
			partsView.headers_visible = false;
			
			append_column_for_children_only<CellRendererPixbuf>(partsView, new CellRendererPixbuf(),
					(cell, item) => cell.pixbuf = GetPixbufImageForColour(item.Colour),
					cell => cell.pixbuf = null);
					
			partsView.insert_column_with_data_func(-1, "", new CellRendererText(),
					(col, cell, model, iter) =>
					{
						Value rowTypeValue;
						model.get_value(iter, 0, out rowTypeValue);
						var rowType = rowTypeValue.get_int();
						if(rowType == 0)
						{
							Value str;
							model.get_value(iter, 1, out str);
							((CellRendererText) cell).text = str.get_string();
						}
						else if(rowType == 1)
						{
							Value pgi;
							model.get_value(iter, 2, out pgi);
							var item = (PartGroupItem)pgi.get_object();
							if(item == null)
								return;
							var desc = item.Part.Description;
							var name = item.Part.Name;
							((CellRendererText) cell).text = @"$desc ($name)";
						}
					});

			partsView.drag_begin.connect_after((context) => {
				var icon = new Pixbuf(Colorspace.RGB, true, 8, 4, 4);
				icon.fill(0);
				drag_set_icon_pixbuf(context, icon, 2, 2);
			});
			
			partsView.set_tooltip_column(3);
			
			widget.add2(WithScrolls(partsView));

			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			partsView.enable_model_drag_source(Gdk.ModifierType.BUTTON1_MASK, {LdrawDragData}, Gdk.DragAction.COPY);
			partsView.drag_data_get.connect((context, data, info, time) =>
				{
					TreeIter active;
					TreeSelection sel = partsView.get_selection();
					TreeModel model;
					if(!sel.get_selected(out model, out active))
					{
						return; // no selection
					}

					Value val;
					model.get_value(active, 0, out val);
					int rowType = val.get_int();

					if(rowType != 1)
						return;

					Value partVal ;
					model.get_value(active, 2, out partVal);
					GLib.Object partObj = partVal.get_object();
					var current = partObj as PartGroupItem;

					string currentName = current.Part.Name;
					var colourId = current.Colour.Code;
					var dragData = @"$currentName,$colourId";
					data.set(Gdk.Atom.intern("LdrawFile", false), 8, dragData.data);
				});
			partsView.cursor_changed.connect(OnCursorChanged);
		}
		
		private async void OnCursorChanged()
		{ 
			CurrentChanged(yield GetCurrentObject());
		}
		
		private Pixbuf GetPixbufImageForColour(Colour colour)
		{
			Gdk.Pixbuf image = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 16, 16);
			Gdk.Pixbuf swatch = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 14, 14);

			uint32 fillColour = (colour.Red << 24)
							  | (colour.Green << 16)
							  | (colour.Blue << 8)
							  | (colour.Alpha);
			swatch.fill(fillColour);
			image.fill((uint32)255);
			swatch.copy_area(0, 0, 14, 14, image, 1, 1);
			return image;
		}

		private delegate void RenderDelegate<T>(T cell, PartGroupItem item);
		private delegate void EmptyRenderDelegate<T>(T cell);

		private void append_column_for_children_only<T>(TreeView view, T cell, RenderDelegate<T> renderer, EmptyRenderDelegate<T> emptyCellRenderer)
			requires(typeof(T).is_a(typeof(CellRenderer)))
		{
			view.insert_column_with_data_func(-1, "", (CellRenderer)cell,
					(col, cell, model, iter) =>
					{
						Value rowTypeValue;
						model.get_value(iter, 0, out rowTypeValue);
						var rowType = rowTypeValue.get_int();
						if(rowType == 1)
						{
							Value pgi;
							model.get_value(iter, 2, out pgi);
							var item = (PartGroupItem)pgi.get_object();
							if(item == null)
								return;
							renderer(cell, item);
						}
						else
						{
							emptyCellRenderer(cell);
						}
					});
		}

		private PartGroup Aggregate(Collection<PartGroup> sets)
		{
			var items = new ArrayList<PartGroupItem>();
			var result = (PartGroup)GLib.Object.new(typeof(PartGroup), Items: items);
			foreach(var group in sets)
			{
				Combine(result, group);
			}
			return result;
		}

		private void Combine(PartGroup result, PartGroup p)
		{
			foreach(var item in p.Items)
			{
				var match = result.GetItemFor(item.Part, item.Colour);
				if(match == null)
				{
					result.Items.add(new PartGroupItem(item));
				}
				else
				{
					match.Quantity += item.Quantity;
				}
			}
		}

		private async PartGroup ToPartGroup(Inventory i, IDatFileCache lib)
		{
			var items = new ArrayList<PartGroupItem>();
			foreach(var line in i.Lines)
			{
					items.add((PartGroupItem)GLib.Object.new(typeof(PartGroupItem),
							Part: line.part,
							Colour: line.colour,
							Quantity: line.quantity));
			}
			return (PartGroup)GLib.Object.new(typeof(PartGroup), Items: items);
		}

		private async Collection<PartGroup> ToPartGroups(Collection<Inventory> sets, IDatFileCache lib)
		{
			var result = new ArrayList<PartGroup>();
			foreach(var inventory in sets)
			{
				result.add(yield ToPartGroup(inventory, lib));
			}
			return result;
		}
				
		public string GetTabName()
		{
			return "Sets";
		}
		
		public Widget GetWidget()
		{
			return widget;
		}
		
		public async LdrawObjectWithColour? GetCurrentObject()
		{
			TreeIter active;
			TreeSelection sel = partsView.get_selection();
			TreeModel model;
			if(!sel.get_selected(out model, out active))
			{
				return LdrawObjectWithColour(null); // no selection
			}

			Value val;
			model.get_value(active, 0, out val);
			int rowType = val.get_int();

			if(rowType != 1)
				return LdrawObjectWithColour(null);

			Value partVal ;
			model.get_value(active, 2, out partVal);
			GLib.Object partObj = partVal.get_object();
			var current = partObj as PartGroupItem;

			return LdrawObjectWithColour(current.Part.MainObject, current.Colour);
		}
	}
}
