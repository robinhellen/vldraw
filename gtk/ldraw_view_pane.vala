using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Maths;
using GL;
using GLX;

namespace Ldraw.Ui.Widgets
{
	public class LdrawViewPane : Layout, Scrollable
	{
		private LdrawObject m_Model;
		private ViewAngle m_Angle;
		protected float m_Scale;
		protected Vector? m_Eyeline = null;
		protected Vector? m_Center = null;
		protected Vector? m_Up = null;
		private DateTime m_LastRedraw = null;

		private unowned X.Display xDisp;
		private Context context;
		private XVisualInfo xvInfo;

		public LdrawViewPane(ViewAngle angle)
			throws GlError
		{
			m_Model = null;
			m_Angle = angle;
			m_Eyeline = m_Center = m_Up = null;

			// initialize this control for OpenGl rendering
			int[] attrlist = {
				GLX_RGBA,
				GLX_RED_SIZE, 1,
				GLX_GREEN_SIZE, 1,
				GLX_BLUE_SIZE, 1,
				GLX_DEPTH_SIZE, 1,
				GLX_DOUBLEBUFFER, 0
			};
			xDisp = x11_get_default_xdisplay();
			xvInfo = glXChooseVisual(xDisp, Gdk.x11_get_default_screen(), attrlist);
			set_double_buffered(false);

			set_size_request(6000, 6000);
		}

		public LdrawViewPane.WithModel(ViewAngle angle, LdrawObject model)
			throws GlError
		{
			this(angle);
			m_Model = model;
			m_Model.VisibleChange.connect(() => queue_draw());
			m_Model.SelectionChanged.connect(() => queue_draw());
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
				m_Model.SelectionChanged.connect(() => queue_draw());
				m_Eyeline = m_Center = m_Up = null;

				queue_draw();
			}
		}

		public int DefaultColour {get; set; default = 0;}

		public void Redraw()
			throws GlError
		{
			if(m_Model == null)
			{
				return;
			}

			context = glXCreateContext(xDisp, xvInfo, null, true);
			glXMakeCurrent(xDisp, Gdk.X11Window.get_xid(get_window()), context );

			m_LastRedraw = new DateTime.now_utc();

			int width = get_allocated_width();
			int height = get_allocated_height();

			if(m_Eyeline == null)
			{
				// setup viewing area.
				InitializeView();
			}

			GlBuilder builder = CreateGlBuilder(width, height, DefaultColour, CalculateViewArea(), m_Eyeline, m_Center, m_Up);

			BuildModel(builder);

			builder.Flush();
			glXSwapBuffers(xDisp, Gdk.X11Window.get_xid(get_window()));
		}

		protected virtual GlBuilder CreateGlBuilder(int widthPx, int heightPx, int defaultColour, Bounds viewArea
					, Vector eyeline, Vector centre, Vector up)
		{
			return new GlBuilder(widthPx, heightPx, defaultColour, viewArea, eyeline, centre, up);
		}

		protected virtual void BuildModel(GlBuilder builder)
		{
			m_Model.BuildFromFile(builder);
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

		public override bool draw (Cairo.Context cr)
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

		public Adjustment hadjustment
		{
			get
			{
				return hadj;
			}
			construct set
			{
				hadj = value;
				if(hadj != null)
					OnUpdateHadj(value);
			}
		}

		public Adjustment vadjustment
		{
			get
			{
				return vadj;
			}
			construct set
			{
				vadj = value;
				if(vadj != null)
					OnUpdateVadj(value);
			}
		}

		private Adjustment hadj;
		private Adjustment vadj;

		public void OnUpdateHadj(Adjustment hadj)
		{
			hadj = hadj ?? new Adjustment(0, 0, 0, 0, 0, 0);
			hadj.lower = -3000;
			hadj.upper = 3000;
			hadj.page_increment = 150;
			hadj.step_increment = 30;
			hadj.value = -m_Center.X;
			hadj.value_changed.connect(adj =>
					{
						float dx = -(float)adj.value - m_Center.X;
						m_Center = m_Center.Add(Vector(dx, 0, 0));
						m_Eyeline = m_Eyeline.Add(Vector(dx, 0, 0));
						queue_draw();
					});
		}

		public void OnUpdateVadj(Adjustment vadj)
		{
			vadj.lower = -3000;
			vadj.upper = 3000;
			vadj.page_increment = 150;
			vadj.step_increment = 30;
			vadj.value_changed.connect(adj =>
					{
						float dy = -(float)adj.value - m_Center.Y;

						m_Center = m_Center.Add(Vector(0, dy, 0));
						m_Eyeline = m_Eyeline.Add(Vector(0, dy, 0));
						queue_draw();
					});
			vadj.value = -m_Center.Y;
		}

		public ViewAngle Angle
		{
			get
			{
				return m_Angle;
			}
			protected set
			{
				m_Angle = value;
				m_Eyeline = m_Center = m_Up = null;
				queue_draw();
			}
		}

		private void InitializeView()
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
			m_Scale = (modelRadius) / size;
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
