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
		private float cameraLongitude;
		private float cameraLatitude;
		protected float lduViewWidth;
		protected float lduViewHeight;
		protected float lduScrollX;
		protected float lduScrollY;		
		
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
			
			renderer.Render2(context, CurrentSelection, overlay,
							 lduViewWidth, lduViewHeight, // scale
							 cameraLongitude, cameraLatitude,
							 lduScrollX, lduScrollY); // scroll
							 
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
				
			renderer.PrepareRender(m_Model, DefaultColour);
		}

		public override void size_allocate(Allocation allocation)
		{
			Allocation old_allocation;
			get_allocation(out old_allocation);
			lduViewHeight *= ((float)allocation.height / old_allocation.height);
			lduViewWidth *= ((float)allocation.width / old_allocation.width);	
			base.size_allocate(allocation);
					
		}

		public ViewAngle Angle
		{
			public set
			{
				switch(value)
				{
					case ViewAngle.Left:
						cameraLatitude = 0;
						cameraLongitude = 90;
						break;
					case ViewAngle.Right:
						cameraLatitude = 0;
						cameraLongitude = -90;
						break;
					case ViewAngle.Top:
						cameraLatitude = -90;
						cameraLongitude = 0;
						break;
					case ViewAngle.Bottom:
						cameraLatitude = 90;
						cameraLongitude = 0;
						break;
					case ViewAngle.Front:
						cameraLatitude = 0;
						cameraLongitude = 0;
						break;
					case ViewAngle.Back:
						cameraLatitude = 0;
						cameraLongitude = 180;
						break;
					case ViewAngle.Ortho:
						cameraLatitude = -30;
						cameraLongitude = 45;
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
						
			var longTransform = Matrix.ForRotation(Vector(0,1,0), -cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -cameraLatitude);			
			var m = latTransform.TransformMatrix(longTransform);
			var transformedCenter = m.TransformVector(bounds.Center());
			lduScrollX = -transformedCenter.X;
			lduScrollY = -transformedCenter.Y;
			
			
			lduViewWidth = 2 * bounds.Radius;
			lduViewHeight = 2 * bounds.Radius;
			
			Allocation alloc;
			get_allocation(out alloc);
			var allocRatio = (float)alloc.width / alloc.height;
			if(allocRatio > 1)
			{
				lduViewWidth *= allocRatio;
			}
			else
			{
				lduViewHeight /= allocRatio;
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
