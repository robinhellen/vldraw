
namespace Ldraw.Ui
{
	public interface ToolbarProvider : Object
	{
		public abstract Gtk.Toolbar CreateToolbar(Gtk.Window dialogParent, CommandExecutor executor);
	}
	
	public delegate void CommandExecutor(Command cmd);
}
