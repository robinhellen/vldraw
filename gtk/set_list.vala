using Gdk;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Peeron;
using Ldraw.Utils;

namespace Ldraw.Ui
{
	public class SetList : VPaned
	{
		private ObservableList<Inventory> sets;
		private PartGroupUsage usage;
		private LdrawModelFile modelFile;
		private TreeView partsView;
		private PartUsageViewModel usageViewModel;

		public IDatFileCache Library {private get; construct;}
		public InventoryReader InventoryReader {private get; construct;}
		public ColourChart ColourChart {private get; construct;}

		construct
		{
			sets = new ObservableList<Inventory>();

			InitializeControls();
		}

		public LdrawModelFile ModelFile
		{
			set
			{
				modelFile = value;
				modelFile.MainObject.VisibleChange.connect(() => UpdateUsage(false));
				UpdateUsage(true);
			}
		}

		private void UpdateUsage(bool reset)
		{
			var availableParts = Aggregate(ToPartGroups(sets, Library));
			usage = new PartGroupUsage(availableParts, new PartGroup.FromModel(modelFile));
			if(reset)
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
			var setControls = new VBox(false, 0);
			var setButtons = new HBox(true, 2);
			var addButton = new Button.with_label("Add");
			addButton.clicked.connect(() =>
				{
					var dialog = new Dialog.with_buttons("Set number", null,
						DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
						Stock.OK, ResponseType.ACCEPT,
						Stock.CANCEL, ResponseType.REJECT);

					var content = (Box) dialog.get_content_area();
					var setnameEntry = new Entry();
					content.pack_start(setnameEntry);

					dialog.show_all();

					var response = dialog.run();

					var setname = setnameEntry.text;

					dialog.destroy();
					if(response != ResponseType.ACCEPT)
						return;

					InventoryReader.GetInventoryFor.begin(setname,
						(obj, res) =>
					{
						sets.add(InventoryReader.GetInventoryFor.end(res));
						UpdateUsage(true);
					});
				});
				setButtons.pack_start(addButton);

			var setsView = new SimpleList<Inventory>.with_model(sets);
			setsView.insert_text_column_with_data_func(-1, "", s => s.SetNumber);
			setControls.pack_start(WithScrolls(setsView));
			setControls.pack_start(setButtons);
			add1(setControls);
			partsView = new TreeView();
			
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
			add2(WithScrolls(partsView));

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
		}
		
		private Pixbuf GetPixbufImageForColour(Colour colour)
		{
			Gdk.Pixbuf image = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 16, 16);
			Gdk.Pixbuf swatch = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 14, 14);
			float red, green, blue, alpha;
			LdrawColour.SurfaceColour(colour.Code, out red, out green, out blue, out alpha);

			uint32 fillColour = ((int)(red * 255) << 24)
							  | ((int)(green * 255) << 16)
							  | ((int)(blue * 255) << 8)
							  | ((int)(alpha * 255));
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

		private PartGroup ToPartGroup(Inventory i, IDatFileCache lib)
		{
			var items = new ArrayList<PartGroupItem>();
			foreach(var line in i.Lines)
			{
				LdrawPart p;
				if(lib.TryGetPart(line.PartNumber , out p))
				{
					items.add((PartGroupItem)GLib.Object.new(typeof(PartGroupItem),
							Part: p,
							Colour: ColourChart.GetColourFromName(line.Colour),
							Quantity: line.Quantity));
				}
				else
				{
					stderr.printf(@"Unable to find part $(line.PartNumber) in library.\n");
				}
			}
			return (PartGroup)GLib.Object.new(typeof(PartGroup), Items: items);
		}

		private Collection<PartGroup> ToPartGroups(Collection<Inventory> sets, IDatFileCache lib)
		{
			var result = new ArrayList<PartGroup>();
			foreach(var inventory in sets)
			{
				result.add(ToPartGroup(inventory, lib));
			}
			return result;
		}
	}
}
