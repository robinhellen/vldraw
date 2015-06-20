using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.OpenGl;
using Ldraw.Maths;
using GL;

namespace Ldraw.Ui.Widgets
{
	public interface ModelView : Widget
	{
		public abstract LdrawObject Model { set; protected get;}
		public abstract ViewAngle Angle {set; get;}
	}
	
	private class LdrawViewPane : Layout, ModelView
	{
		private LdrawObject m_Model;
		private ViewAngle m_Angle;
		protected float m_Scale;
		protected Vector? m_Eyeline = null;
		protected Vector? m_Center = null;
		protected Vector? m_Up = null;
		private DateTime m_LastRedraw = null;

		private Adjustment m_Hadj = null;
		private Adjustment m_Vadj = null;
		
		protected PartNode dropItem = null;
		
		public GlRenderer renderer;

		public LdrawViewPane(ViewAngle angle)
			throws GlError
		{
			GLib.Object(Angle: angle);
		}

		construct
		{
			// initialize this control for OpenGl rendering
			GLConfig config = new GLConfig.by_mode(GLConfigMode.DEPTH | GLConfigMode.RGBA | GLConfigMode.DOUBLE);
			widget_set_gl_capability(this, config, null, true, GLRenderType.RGBA_TYPE);

			// minimum size 100 px square
			set_size_request(100, 100);
			
			renderer = new GlRenderer();
			if(m_Model == null)
				m_Model =  new LdrawObject("", null);				
		}

		public LdrawViewPane.WithModel(ViewAngle angle, LdrawObject model)
			throws GlError
		{
			this(angle);
			m_Model = model;
			m_Model.VisibleChange.connect(() => queue_draw());
		}

		public signal void RenderingError(string description);

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
				SetAdjustmentRanges();

				queue_draw();
			}
		}

		public Colour DefaultColour {get; set; default = LdrawColour.GetColour(0);}

		public virtual void Redraw()
			throws GlError
		{
			if(m_Model == null)
			{
				return;
			}

			m_LastRedraw = new DateTime.now_utc();
			GLWindow drawableWin = widget_get_gl_window(this);
			if(!(drawableWin is GLDrawable))
			{
				throw new GlError.InvalidWidget("GtkGlExt library is playing silly beggars");
			}
			
			var drawable = (GLDrawable)drawableWin;

			if(m_Eyeline == null)
			{
				// setup viewing area.
				InitializeView();
			}

			renderer.Render(drawable, DefaultColour, CalculateViewArea(), m_Eyeline, m_Center, m_Up, m_Model, dropItem, Gee.Set.empty<LdrawNode>());
		}

		public override bool configure_event(Gdk.EventConfigure event)
		{
			try
			{
				Redraw();
			}
			catch (GlError e)
			{
				RenderingError(@"OpenGL error during window resize: \n $(e.message).");
			}
			return false;
		}

		public override bool expose_event(Gdk.EventExpose event)
		{
			try
			{
				Redraw();
			}
			catch (GlError e)
			{
				RenderingError(@"OpenGL error during window redraw: \n $(e.message).");
			}
			return false;
		}

		public override void set_scroll_adjustments(Adjustment hadj, Adjustment vadj)
		{
			m_Hadj = hadj ?? new Adjustment(0, 0, 0, 0, 0, 0);
			m_Hadj.lower = -3000;
			m_Hadj.upper = 3000;
			m_Hadj.page_increment = 150;
			m_Hadj.step_increment = 30;
			m_Hadj.value_changed.connect(adj =>
					{
						float dx = -(float)adj.value - m_Center.X;
						m_Center = m_Center.Add(Vector(dx, 0, 0));
						m_Eyeline = m_Eyeline.Add(Vector(dx, 0, 0));
						queue_draw();
					});
			m_Vadj = vadj ?? new Adjustment(0, 0, 0, 0, 0, 0);
			m_Vadj.lower = -3000;
			m_Vadj.upper = 3000;
			m_Vadj.page_increment = 150;
			m_Vadj.step_increment = 30;
			m_Vadj.value_changed.connect(adj =>
					{
						float dy = -(float)adj.value - m_Center.Y;

						m_Center = m_Center.Add(Vector(0, dy, 0));
						m_Eyeline = m_Eyeline.Add(Vector(0, dy, 0));
						queue_draw();
					});

			SetAdjustmentRanges();
		}

		private void SetAdjustmentRanges()
		{
			if(m_Center == null
				|| m_Hadj == null
				|| m_Vadj == null)
				return;

			m_Hadj.value = -m_Center.X;

			m_Vadj.value = -m_Center.Y;
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
				if(m_Hadj != null)
				{
					SetAdjustmentRanges();
				}
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

			SetAdjustmentRanges();
		}

		protected Bounds CalculateViewArea()
		{
			Allocation alloc;
			get_allocation(out alloc);

			return m_Angle.GetViewBounds(alloc.width, alloc.height, m_Scale, m_Center);
		}
	}

	public enum ViewAngle
	{
		Front,
		Back,

		Right,
		Left,

		Top,
		Bottom,

		Ortho;

		public Vector GetCameraDirection()
		{
			switch(this)
			{
				case Front:
					return Vector(0, 0, -1.5f);
				case Back:
					return Vector(0, 0, 1.5f);
				case Right:
					return Vector(1.5f, 0, 0);
				case Left:
					return Vector(-1.5f, 0, 0);
				case Top:
					return Vector(0, -1.5f, 0);
				case Bottom:
					return Vector(0, 1.5f, 0);
				case Ortho:
					return Vector(0.390731128f, -0.650895224f, -0.650895224f);
				default:
					return Vector.NullVector;
			}
		}

		public Vector GetCameraUp()
		{
			switch(this)
			{
				case Top:
				case Bottom:
					return Vector(0, 0, 1);
				default:
					return Vector(0, -1, 0);
			}
		}

		public Vector GetViewCenter(Vector modelCenter)
		{
			switch(this)
			{
				case Front:
				case Back:
					return Vector(modelCenter.X, -modelCenter.Y, 0);
				case Top:
				case Bottom:
					return Vector(modelCenter.X, modelCenter.Z, 0);
				case Left:
				case Right:
					return Vector(modelCenter.Z, -modelCenter.Y, 0);
				case Ortho:
				default:
					return Vector(0, 0, 0);
			}
		}

		public Bounds GetViewBounds(int viewWidth, int viewHeight, float scale, Vector viewCenter)
		{
			var viewWidthLdu = viewWidth * scale;
			var viewHeightLdu = viewHeight * scale;

			Bounds b = new Bounds();
			b.Union(viewCenter.Add(Vector(viewWidthLdu / 2, viewHeightLdu / 2, 1000000)));
			b.Union(viewCenter.Subtract(Vector(viewWidthLdu / 2, viewHeightLdu / 2, 1000000)));

			return b;
		}
	}
}
