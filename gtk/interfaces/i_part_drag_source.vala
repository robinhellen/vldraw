using Gtk;

using Ldraw.Lego;

namespace Ldraw.Ui
{
	public interface IPartDragSource : GLib.Object
	{
		public abstract string GetTabName();
		public abstract Widget GetWidget();
		public async abstract LdrawObject? GetCurrentObject();
		public signal void CurrentChanged(LdrawObject newCurrent);
	}
}
