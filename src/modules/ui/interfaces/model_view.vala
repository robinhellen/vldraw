using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.Ui.Widgets
{
	public interface ModelView : Widget
	{
		public abstract LdrawObject Model { set; protected get;}
		public abstract ViewAngle Angle {set;}
		public abstract Colour DefaultColour {get; set;}
		public abstract Overlay Overlay {set;}
		public signal void RenderingError(string description);
	}
	
	public interface DrawingContext : GLib.Object
	{
		public abstract void DrawLine(Vector a, Vector b, Colour colour);
	}
	
	public interface Overlay : GLib.Object
	{
		public abstract void Draw(DrawingContext context);	
		public signal void Changed();
	}
}
