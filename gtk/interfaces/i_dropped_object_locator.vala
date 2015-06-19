using Ldraw.Lego;

namespace Ldraw.Ui.DragAndDrop
{
	public interface IDroppedObjectLocator : GLib.Object
	{
		public abstract async LdrawObject? GetObjectForName(string name);
	}
}
