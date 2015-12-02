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
		
		// camera viewpoint definition
		protected ViewParameters viewParameters;
		/*protected float cameraLongitude;
		protected float cameraLatitude;
		protected float lduViewWidth;
		protected float lduViewHeight;
		protected float lduScrollX;
		protected float lduScrollY;*/		
		
		protected Ldraw.Ui.Widgets.Overlay overlay = null;
		
		public Renderer renderer {construct; protected get;}
		public ColourContext ColourContext {construct; protected get;}

		public LdrawViewPane(ViewAngle angle)
		{
			GLib.Object(Angle: angle);
		}

		construct
		{
			auto_render = true;
			has_alpha = true;
			has_depth_buffer = true;
			// minimum size 100 px square
			set_size_request(100, 100);
			
			if(m_Model == null)
				m_Model =  new LdrawObject("", null);
				
			DefaultColour = ColourContext.GetColourById(0);
			base.realize.connect(realize); // if we override the virtual, the base won't get called properly.
			viewParameters = ViewParameters();
		}

		public LdrawViewPane.WithModel(ViewAngle angle, LdrawObject model)
		{
			this(angle);
			m_Model = model;
			m_Model.VisibleChange.connect(() => queue_render());
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
		
		public override bool render(GLContext context)
		{
			if(m_Model == null)
			{
				return true;
			}
			
			renderer.Render2(context, CurrentSelection, overlay, viewParameters, DefaultColour); // scroll
							 
			var error = get_error();
			if(error != null)
			{
				stderr.printf(@"rendering error: $(error.message).\n");
			}
			return true;
		}
		
		public new void realize()
		{
			if(!get_realized())
			{
				return;
			}
			make_current();
			if(get_error() != null)
				return;
				
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
						viewParameters.cameraLongitude = 45;
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
						
			var longTransform = Matrix.ForRotation(Vector(0,1,0), -viewParameters.cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -viewParameters.cameraLatitude);			
			var m = latTransform.TransformMatrix(longTransform);
			var transformedCenter = m.TransformVector(bounds.Center());
			viewParameters.lduScrollX = -transformedCenter.X;
			viewParameters.lduScrollY = -transformedCenter.Y;
			
			
			viewParameters.lduWidth = 2 * bounds.Radius;
			viewParameters.lduHeight = 2 * bounds.Radius;
			
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
