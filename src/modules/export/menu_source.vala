using Diva;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.Ui;
using Ldraw.Ui.Widgets;

namespace Ldraw.Export
{
	private class ExportMenuSource : Object, MenuItemSource
	{
		static construct
		{
			var cls = (ObjectClass)typeof(ExportMenuSource).class_ref();
			set_collection_injection<Exporter>(cls, "Exporters");
		}

		public AnimatedModel Model {construct; private get;}
        public Collection<Exporter> Exporters {construct; private get;}
        public ExportManager ExportManager {construct; private get;}

		public Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent, CommandExecutor executor)
		{
			switch(menu)
			{
				case TopMenu.Model:
					return GetModelItems(dialogParent);
				default:
					return Collection.empty<Gtk.MenuItem>();
			}
		}

		private Collection<Gtk.MenuItem> GetModelItems(Window dialogParent)
		{
			var items = new ArrayList<Gtk.MenuItem>();

			var modelExportMenu = new Gtk.MenuItem.with_mnemonic("_Export");
            modelExportMenu.submenu = new Gtk.Menu();

			foreach(var exporter in Exporters)
			{
				AddMenuItem(modelExportMenu.submenu, exporter.Name, () => ExportManager.Export(exporter, dialogParent, Model.Model));
			}

			items.add(modelExportMenu);
			return items;
		}

		private Gtk.MenuItem AddMenuItem(Gtk.Menu menu, string title, owned Action onActivate)
		{
			var item = new Gtk.MenuItem.with_mnemonic(title);
			menu.append(item);
			item.activate.connect(() => onActivate());
			return item;
		}

		private delegate void Action();
	}
}

