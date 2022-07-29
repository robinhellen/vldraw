using Gtk;

using Ldraw.Lego;

namespace Ldraw.Ui
{
	public interface IPartDragSource : GLib.Object
	{
		public abstract string GetTabName();
		public abstract Widget GetWidget();
		public async abstract LdrawObjectWithColour? GetCurrentObject();
		public signal void CurrentChanged(LdrawObjectWithColour newCurrent);
	}
	
	public struct LdrawObjectWithColour
	{
		public LdrawObjectWithColour(LdrawObject? object, Colour? colour = null)
		{
			Object = object;
			Colour = colour;
		}
		
		public LdrawObject? Object;
		public Colour? Colour;
	}	
}
