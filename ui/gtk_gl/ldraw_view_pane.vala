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
		private ViewAngle m_Angle;
		protected float m_Scale;
		protected Vector? m_Eyeline = null;
		protected Vector? m_Center = null;
		protected Vector? m_Up = null;
		private DateTime m_LastRedraw = null;
		
		protected Ldraw.Ui.Widgets.Overlay overlay = null;
		
		public Renderer renderer {construct; protected get;}
		public ColourContext ColourContext {construct; protected get;}

		public LdrawViewPane(ViewAngle angle)
		{
			GLib.Object(Angle: angle);
		}

		construct
		{
			// minimum size 100 px square
			set_size_request(100, 100);
			
			if(m_Model == null)
				m_Model =  new LdrawObject("", null);
				
			DefaultColour = ColourContext.GetColourById(0);
		}

		public LdrawViewPane.WithModel(ViewAngle angle, LdrawObject model)
		{
			this(angle);
			m_Model = model;
			m_Model.VisibleChange.connect(() => queue_draw());
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
				m_Model.VisibleChange.connect(() => queue_draw());
				m_Eyeline = m_Center = m_Up = null;

				queue_draw();
			}
		}
		
		public Ldraw.Ui.Widgets.Overlay Overlay {set{overlay = value; overlay.Changed.connect(() => queue_draw());}}

		public Colour DefaultColour {get; set;}
		
		public override bool render(GLContext context)
		{
			if(m_Model == null)
			{
				return false;
			}

			if(m_Eyeline == null)
			{
				// setup viewing area.
				InitializeView();
			}

			renderer.Render(context, DefaultColour, CalculateViewArea(), m_Eyeline, m_Center, m_Up, m_Model, Gee.Set.empty<LdrawNode>(), overlay);
			return false;
		}

		public ViewAngle Angle
		{
			get
			{
				return m_Angle;
			}
			public set
			{
				m_Angle = value;
				m_Eyeline = m_Center = m_Up = null;
				queue_draw();
			}
		}

		protected void InitializeView()
		{
			var modelBounds = new Bounds.Clone(m_Model.BoundingBox);
			if(modelBounds.Radius == 0)
			{
				var v = Vector(240, 120, 240);
				modelBounds.Union(Vector.NullVector.Add(v));
				modelBounds.Union(Vector.NullVector.Subtract(v));
			}

			float modelRadius = modelBounds.Radius;
			var modelCenter = modelBounds.Center();
			Vector cameraShift = m_Angle.GetCameraDirection().Scale(modelRadius);
			m_Center = m_Angle.GetViewCenter(modelCenter);

			m_Eyeline = m_Center.Add(cameraShift);

			Allocation alloc;
			get_allocation(out alloc);
			int size = (alloc.height > alloc.width) ? alloc.width : alloc.height;
			m_Scale = (2 * modelRadius) / size;
			if(m_Scale < 0.0f) {m_Scale = -m_Scale;}
			m_Scale = Math.fmaxf(m_Scale, 0.25f);

			m_Up = m_Angle.GetCameraUp();
		}

		protected Bounds CalculateViewArea()
		{
			Allocation alloc;
			get_allocation(out alloc);

			return m_Angle.GetViewBounds(alloc.width, alloc.height, m_Scale, m_Center);
		}
	}
}
