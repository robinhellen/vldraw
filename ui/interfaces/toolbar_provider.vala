
namespace Ldraw.Ui
{
	public interface ToolbarProvider : Object
	{
		public abstract Gtk.Toolbar CreateToolbar(Gtk.Window dialogParent);
	}
}
