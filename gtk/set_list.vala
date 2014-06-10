using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Peeron;
using Ldraw.Utils;

namespace Ldraw.Ui
{
	public class SetList : VPaned
	{
		private ObservableList<Inventory> sets;
		private PartGroupUsage usage;
		private LdrawLibrary library;
		private InventoryReader inventoryReader;
		private ColourChart colourChart;
		private LdrawModelFile modelFile;
		private SimpleList<PartGroupItem> partsView;

		public SetList(LdrawLibrary library, InventoryReader inventoryReader, ColourChart colourChart)
		{
			sets = new ObservableList<Inventory>();
			this.library = library;
			this.inventoryReader = inventoryReader;
			this.colourChart = colourChart;

			InitializeControls();
		}

		public LdrawModelFile ModelFile
		{
			set
			{
				modelFile = value;
				UpdateUsage();
			}
		}

		private void UpdateUsage()
		{
			var availableParts = Aggregate(ToPartGroups(sets, library));
			usage = new PartGroupUsage(availableParts, new PartGroup.FromModel(modelFile));
			var list = new ObservableList<PartGroupItem>();
			list.add_all(usage.Used.Items);
			partsView.model = list;
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

					sets.add(inventoryReader.GetInventoryFor(setname));
					UpdateUsage();
				});
				setButtons.pack_start(addButton);

			var setsView = new SimpleList<Inventory>.with_model(sets);
			setsView.insert_text_column_with_data_func(-1, "", s => s.SetNumber);
			setControls.pack_start(WithScrolls(setsView));
			setControls.pack_start(setButtons);
			add1(setControls);
			partsView = new SimpleList<PartGroupItem>();
			partsView.insert_text_column_with_data_func(-1, "Quantity",
				pgi => pgi.Quantity.to_string());
			partsView.insert_text_column_with_data_func(-1, "Number", pgi => pgi.Part.Name);
			partsView.insert_text_column_with_data_func(-1, "Colour", pgi => pgi.Colour.Name);
			add2(WithScrolls(partsView));
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

		private PartGroup ToPartGroup(Inventory i, LdrawLibrary lib)
		{
			var items = new ArrayList<PartGroupItem>();
			foreach(var line in i.Lines)
			{
				LdrawPart p;
				lib.TryGetPart(line.PartNumber , out p);
				items.add((PartGroupItem)GLib.Object.new(typeof(PartGroupItem),
						Part: p,
						Colour: colourChart.GetColourFromName(line.Colour),
						Quantity: line.Quantity));
			}
			return (PartGroup)GLib.Object.new(typeof(PartGroup), Items: items);
		}

		private Collection<PartGroup> ToPartGroups(Collection<Inventory> sets, LdrawLibrary lib)
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
