using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.Ui.Widgets
{
	public interface ModelView : Widget
	{
		public abstract LdrawObject Model { set; protected get;}
		public abstract ViewAngle Angle {set; get;}
		public abstract Overlay Overlay {set;}
	}
	
	public interface DrawingContext : GLib.Object
	{
		public abstract void DrawLine(Vector a, Vector b);
	}
	
	public interface Overlay : GLib.Object
	{
		public abstract void Draw(DrawingContext context);	
		public signal void Changed();
	}
}
