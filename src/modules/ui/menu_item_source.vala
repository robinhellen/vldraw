using Gee;
using Gtk;

namespace Ldraw.Ui
{
	public interface MenuItemSource : Object
	{
		public abstract Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent);
	}
	
	public enum TopMenu
	{
		File,
		Edit,
		Model,
		Selection,
		Refactor		
	}
}
