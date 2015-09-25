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

			//renderer.Render(context, DefaultColour, CalculateViewArea(), m_Eyeline, m_Center, m_Up, m_Model, Gee.Set.empty<LdrawNode>(), overlay);
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
			// TODO
			lduScrollX = lduScrollY = 0;
			var bounds = m_Model.BoundingBox;
			lduViewWidth = bounds.Radius;
			lduViewHeight = bounds.Radius;
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
