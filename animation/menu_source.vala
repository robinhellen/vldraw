using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.Ui;

namespace Ldraw.Animation
{
	public class AnimationMenuSource : Object, MenuItemSource
	{
		public AnimatedModel Model {construct; private get;}
		
		public Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent)
		{
			switch(menu)
			{
				case TopMenu.Selection:
					return GetSelectionItems(dialogParent);
				case TopMenu.Model:
					return GetModelItems(dialogParent);
				default:
					return Collection.empty<Gtk.MenuItem>();
			}
		}
		
		private Collection<Gtk.MenuItem> GetSelectionItems(Window dialogParent)
		{				
			var items = new ArrayList<Gtk.MenuItem>();
			var item = new Gtk.MenuItem.with_mnemonic("_Animation");
			item.activate.connect(() => {
                    var dlg = new AnimationDialog(Model, dialogParent);
                    dlg.Run();
                });
			items.add(item);
			return items;
		}	
		
		private Collection<Gtk.MenuItem> GetModelItems(Window dialogParent)
		{				
			var items = new ArrayList<Gtk.MenuItem>();
			var item = new Gtk.MenuItem.with_mnemonic("_Parameters");
			item.activate.connect(() => {
					var dlg = new ParametersDialog(Model.Model, dialogParent);
					dlg.Run();
					});
			items.add(item);
			return items;
		}		
	}
}
