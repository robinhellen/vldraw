//using Gtk;
using Gdk;
using GL;

using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	public class GlRenderer : Object
	{
		public void Render(GLDrawable drawable, int defaultColour, Bounds viewArea, Vector eyeline, Vector center, Vector up, LdrawObject model)
		{
			GLContext context = new GLContext(drawable, null, true, GLRenderType.RGBA_TYPE);

			drawable.gl_begin(context);

			int width = 0; int height = 0;
			drawable.get_size(out width, out height);

			GlBuilder builder = new GlBuilder(width, height, defaultColour, viewArea, eyeline, center, up);

			model.BuildFromFile<void>(builder);

			builder.Flush();
			drawable.gl_end();
			drawable.wait_gl();
		}
	}
}
