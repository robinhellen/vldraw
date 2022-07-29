

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Maths;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui.GtkGl
{
	private class DropBoundsOverlay : GLib.Object, Overlay
	{
		public LdrawObject? dropObject;
		public Vector dropLocation;
		public Matrix dropTransform;
		
		public ColourContext Colours {construct; private get;}
		
		public void Draw(DrawingContext context)
		{			
			if(dropObject == null)
				return;
				
			var bounds = dropObject.BoundingBox;
			var a = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MinX, bounds.MinY, bounds.MinZ))); // (a)
			var b = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MinX, bounds.MinY, bounds.MaxZ))); // (b)
			var c = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MinX, bounds.MaxY, bounds.MaxZ))); // (c)
			var d = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MinX, bounds.MaxY, bounds.MinZ))); // (d)
			var e = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MaxX, bounds.MaxY, bounds.MinZ))); // (e)
			var f = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MaxX, bounds.MaxY, bounds.MaxZ))); // (f)
			var g = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MaxX, bounds.MinY, bounds.MaxZ))); // (g)
			var h = dropLocation.Add(dropTransform.TransformVector(Vector(bounds.MaxX, bounds.MinY, bounds.MinZ))); // (h)
			
			var colour = Colours.GetColourById(0);
			
			context.DrawLine(a,b, colour);
			context.DrawLine(b,c, colour);
			context.DrawLine(c,d, colour);
			context.DrawLine(d,a, colour);
			context.DrawLine(a,h, colour);
			context.DrawLine(h,e, colour);
			context.DrawLine(e,f, colour);
			context.DrawLine(f,g, colour);
			context.DrawLine(g,h, colour);
			context.DrawLine(g,b, colour);
			context.DrawLine(c,f, colour);
			context.DrawLine(d,e, colour);
		}
	}
}
