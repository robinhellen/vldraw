using Gdk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.OpenGl;
using Ldraw.Povray;

namespace Ldraw.Export
{
	public class Exporter : Object
	{
		public void ExportJpg(LdrawObject model, string filename)
		{
			var angle = Ui.Widgets.ViewAngle.Ortho;

			var pixmap = new Pixmap(null, 800, 600, 24);
			var glPixmap = new GLPixmap(new GLConfig.by_mode(GLConfigMode.DEPTH | GLConfigMode.RGBA), pixmap, 0);

			var center = Vector.NullVector;
			var up = Vector(0, -1, 0);

			var eyeline = Vector(0.390731128f, -0.650895224f, -0.650895224f);
			var scale = model.BoundingBox.Radius / 400;
			var viewBounds = angle.GetViewBounds(800, 600, scale, angle.GetViewCenter(model.BoundingBox.Center()));

			GLDrawable drawable = (GLDrawable)glPixmap;
			
			var renderer = new GlRenderer();
			renderer.Render(drawable, 0, viewBounds, eyeline, center, up, model, null, Gee.Set.empty<LdrawNode>());

			var pixbuf = pixbuf_get_from_drawable(null, pixmap, null, 0, 0, 0, 0, 800, 600);
			pixbuf.save(filename, "jpeg");
		}

		public void ExportPovray(LdrawObject model, string filename)
		{
			var visitor = new PovrayVisitor(filename);

			visitor.Visit(model);

			visitor.Finalise(model);
			visitor.Finish();
		}
	}
}
