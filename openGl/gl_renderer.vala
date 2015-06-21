//using Gtk;
using Gdk;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui;
using Ldraw.Ui.Widgets;

namespace Ldraw.OpenGl
{
	public class GlRenderer : Object, Renderer
	{
		public IRenderModel ModelRenderer {construct; private get;}
		private static GLContext sharingContext;		
		
		public GlRenderer()
		{
			var m = new FromFlatRenderer();
			Object(ModelRenderer: m);
		}
		
		public void Render(
				GLDrawable drawable, Colour defaultColour, 
				Bounds viewArea, Vector eyeline, Vector center, Vector up, 
				LdrawObject model, PartNode? extraBounds,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay = null)
			throws GlError
		{
			GLContext context = new GLContext(drawable, sharingContext, true, GLRenderType.RGBA_TYPE);
			if(sharingContext == null)
				sharingContext = context;
				
			drawable.gl_begin(context);

			int width = 0; int height = 0;
			drawable.get_size(out width, out height);
			
			// Set up the openGL viewing area
			// Clear the colour and alpha
			glClearColor(1.0f, 1.0f, 1.0f, 0.0f);
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			// enable depth, and alpha
			glEnable(GL_DEPTH_TEST);
			glDepthFunc(GL_LESS);
			glEnable(GL_BLEND);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
			// set up the view
			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();

			glOrtho(viewArea.MinX, viewArea.MaxX,
					viewArea.MinY, viewArea.MaxY,
					viewArea.MinZ, viewArea.MaxZ);
					
			// Set up the current openGl area for drawing
			var finalEyeline = lookAt(eyeline, center, up);

			glMatrixMode(GL_MODELVIEW);
			//glScalef(1.0f, 1.0f, -1.0f);
			glLoadIdentity();

			glLineWidth(3.0f);
			glMatrixMode(GL_MODELVIEW);

			ModelRenderer.RenderModel(model, defaultColour, finalEyeline, selection);
			if(extraBounds != null)
				ModelRenderer.RenderBoundsFor(extraBounds);
			
			if(overlay != null)
				overlay.Draw(new GlDrawingContext());

			drawable.gl_end();
			drawable.swap_buffers();
			//drawable.wait_gl();
		}

		private Vector lookAt(Vector eye, Vector center, Vector up)
		{
			Vector f = center.Subtract(eye).Normalized();
			Vector s = f.Cross(up.Normalized());
			Vector u = s.Cross(f);

			float viewTransform[16] = {s.X, u.X, -f.X, 0,
									   s.Y, u.Y, -f.Y, 0,
									   s.Z, u.Z, -f.Z, 0,
									   0  , 0  , 0   , 1};

			glMultMatrixf(viewTransform);

			return center.Subtract(eye);
		}
	}
	
	private class GlDrawingContext : Object, DrawingContext
	{
		public void DrawLine(Vector a, Vector b)
		{
			glColor4f(1F, 0F, 0F, 1F);
			glBegin(GL_LINES);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());

			glEnd();
		}
	}
	
	public class StandardModelRenderer : Object, IRenderModel
	{
		public void RenderModel(LdrawObject model, Colour colour, Vector finalEyeline, Gee.Set<LdrawNode> selection)
		{
			GlBuilder builder = new GlBuilder(colour, finalEyeline, Gee.Map.empty<string, float?>(), selection);
			model.BuildFromFile<void>(builder);	
			
			builder.Flush();		
		}
	}
	
	public interface IRenderModel : Object
	{
		public abstract void RenderModel(LdrawObject object, Colour colour, Vector finalEyeline, Gee.Set<LdrawNode> selection);			
		public virtual void RenderBoundsFor(PartNode part)	{}
	}
}
