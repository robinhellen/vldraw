using Gee;
using Gtk;

using Ldraw.Animation;
using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.Ui
{
	public class AnimationMenuSource : Object, MenuItemSource
	{
		public AnimatedModel Model {construct; private get;}
		
		public Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent)
		{
			if(menu != TopMenu.Selection)
				return Collection.empty<Gtk.MenuItem>();
				
			var items = new ArrayList<Gtk.MenuItem>();
			var item = new Gtk.MenuItem.with_mnemonic("_Animation");
			item.activate.connect(() => {
                    var dlg = new AnimationDialog(Model, dialogParent);
                    dlg.Run();
                });
			items.add(item);
			return items;
		}
	}
}
