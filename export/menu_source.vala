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
		
		public Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent)
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
				AddMenuItem(modelExportMenu.submenu, exporter.Name, () => Export(exporter, dialogParent));
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

        private void Export(Exporter exporter, Window parent)
        {
			FileChooserDialog dialog = new FileChooserDialog("Export", parent, FileChooserAction.SAVE
                                                , "_Cancel", ResponseType.CANCEL
                                                , "_Export", ResponseType.ACCEPT);
			dialog.do_overwrite_confirmation = true;
			var filter = new FileFilter();
			filter.add_pattern("*." + exporter.PreferredExtension);
			var basename = File.new_for_path(Model.Model.File.FileName).get_basename();
			var newName = SwitchExtension(basename, exporter.PreferredExtension);
			dialog.set_current_name(newName);
            
            if(dialog.run() != ResponseType.ACCEPT)
            {
                dialog.close();
                return;
            }
            var filename = dialog.get_filename();
            dialog.close();            
            
            exporter.Export(Model.Model.File.MainObject, filename);
        }
        
        private string SwitchExtension(string filename, string newExtension)
        {
			var nameOnly = filename.substring(0, filename.last_index_of_char('.'));
			return @"$nameOnly.$newExtension";
		}
        
		private delegate void Action();
	}
}

