using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui.Widgets;
using GL;

namespace Ldraw.Ui.GtkGl
{
	private class LdrawViewPane : GLArea, ModelView
	{
		private LdrawObject m_Model;

		protected ViewParameters viewParameters;
		protected Ldraw.Ui.Widgets.Overlay overlay = null;

		public Renderer renderer {construct; protected get;}
		public ColourContext ColourContext {construct; protected get;}

		construct
		{
			auto_render = true;
			has_alpha = true;
			has_depth_buffer = false; // WE're going to manage the depth buffer ourselves as the GLArea management doesn't work on windows.
			// minimum size 100 px square
			set_size_request(100, 100);

			m_Model =  new LdrawObject("");

			DefaultColour = ColourContext.GetColourById(0);
			base.realize.connect(realize); // if we override the virtual, the base won't get called properly.
			viewParameters = ViewParameters();
			viewParameters.lduHeight = 400F;
			viewParameters.lduWidth = 400F;
		}

		public LdrawObject Model
		{
			protected get
			{
				return m_Model;
			}
			set
			{
				m_Model = value;
				m_Model.VisibleChange.connect(() => queue_render());
				CenterScrollAndZoom();
				realize();

				queue_render();
			}
		}

		public Ldraw.Ui.Widgets.Overlay Overlay {set{overlay = value; overlay.Changed.connect(() => queue_render());}}

		public Colour DefaultColour {get; set;}
		
		int depth_buffer_width = 0;
		int depth_buffer_height = 0;

		public override bool render(GLContext context)
		{
			if(m_Model == null)
			{
				return true;
			}
			Allocation alloc;
			get_allocation(out alloc);
			if(alloc.height != depth_buffer_height || alloc.width != depth_buffer_width)
			{
				if(depth_buffer != 0)
					glDeleteRenderbuffers(1, {depth_buffer});
				GLuint[] buffer = {0};
				// ensure_buffers
				glGenRenderbuffers(1, buffer);
				// allocate buffers
				glBindRenderbuffer(GL_RENDERBUFFER, buffer[0]);				
				glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT24, alloc.width, alloc.height);
				// attach buffers
				glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, buffer[0]);
				depth_buffer = buffer[0];
				depth_buffer_height = alloc.height;
				depth_buffer_width = alloc.height;
			}
			glEnable(GL_DEPTH_TEST);
			renderer.Render(context, CurrentSelection, overlay, viewParameters, DefaultColour); // scroll

			var error = get_error();
			if(error != null)
			{
				stderr.printf(@"rendering error: $(error.message).\n");
			}
			return true;
		}
		
		GLuint depth_buffer = 0;

		public new void realize()
		{
			if(!get_realized()) {			
				return;
			}
			make_current();
			var error = get_error();
			if(error != null) {
				stderr.printf(@"error making gl area current: $(error.message).\n");
			}

			renderer.PrepareRender(m_Model);
		}

		public override void size_allocate(Allocation allocation)
		{
			Allocation old_allocation;
			get_allocation(out old_allocation);
			viewParameters.lduHeight *= ((float)allocation.height / old_allocation.height);
			viewParameters.lduWidth *= ((float)allocation.width / old_allocation.width);
			base.size_allocate(allocation);
		}

		public ViewAngle Angle
		{
			public set
			{
				switch(value)
				{
					case ViewAngle.Left:
						viewParameters.cameraLatitude = 0;
						viewParameters.cameraLongitude = 90;
						break;
					case ViewAngle.Right:
						viewParameters.cameraLatitude = 0;
						viewParameters.cameraLongitude = -90;
						break;
					case ViewAngle.Top:
						viewParameters.cameraLatitude = -90;
						viewParameters.cameraLongitude = 0;
						break;
					case ViewAngle.Bottom:
						viewParameters.cameraLatitude = 90;
						viewParameters.cameraLongitude = 0;
						break;
					case ViewAngle.Front:
						viewParameters.cameraLatitude = 0;
						viewParameters.cameraLongitude = 0;
						break;
					case ViewAngle.Back:
						viewParameters.cameraLatitude = 0;
						viewParameters.cameraLongitude = 180;
						break;
					case ViewAngle.Ortho:
						viewParameters.cameraLatitude = -30;
						viewParameters.cameraLongitude = -45;
						break;
					default:
						assert_not_reached();
				}
				CenterScrollAndZoom();
				queue_render();
			}
		}

		private void CenterScrollAndZoom()
		{
			var bounds = m_Model.BoundingBox;
			
			if(bounds.m_Initialized) {
				var longTransform = Matrix.ForRotation(Vector(0,1,0), -viewParameters.cameraLongitude);
				var latTransform = Matrix.ForRotation(Vector(1,0,0), -viewParameters.cameraLatitude);
				var m = latTransform.TransformMatrix(longTransform);
				var transformedCenter = m.TransformVector(bounds.Center());
				viewParameters.lduScrollX = -transformedCenter.X;
				viewParameters.lduScrollY = -transformedCenter.Y;


				viewParameters.lduWidth = float.max(2 * bounds.Radius, 1.0F);
				viewParameters.lduHeight = float.max(2 * bounds.Radius, 1.0F);
			} else {
				viewParameters.lduScrollX = 0;
				viewParameters.lduScrollY = 0;

				viewParameters.lduWidth = 300;
				viewParameters.lduHeight = 300;				
			}

			Allocation alloc;
			get_allocation(out alloc);
			var allocRatio = (float)alloc.width / alloc.height;
			if(allocRatio > 1)
			{
				viewParameters.lduWidth *= allocRatio;
			}
			else
			{
				viewParameters.lduHeight /= allocRatio;
			}
		}

		private static Gee.Set<LdrawNode> emptySelection = Gee.Set.empty<LdrawNode>();

		protected virtual Gee.Set<LdrawNode> CurrentSelection
		{
			get
			{
				return emptySelection;
			}
		}
	}
}
