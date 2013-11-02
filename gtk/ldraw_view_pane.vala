using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Maths;
using GL;

namespace Ldraw.Ui.Widgets
{
	public class LdrawViewPane : Layout
	{
		private LdrawObject m_Model;
		private ViewAngle m_Angle;
		protected float m_Scale;
		private Vector? m_Eyeline = null;
		protected Vector? m_Center = null;
		private Vector? m_Up = null;
		private DateTime m_LastRedraw = null;

		private Adjustment m_Hadj = null;
		private Adjustment m_Vadj = null;

		public LdrawViewPane(ViewAngle angle)
			throws GlError
		{
			m_Model = null;
			m_Angle = angle;
			m_Eyeline = m_Center = m_Up = null;

			// initialize this control for OpenGl rendering
			GLConfig config = new GLConfig.by_mode(GLConfigMode.DEPTH | GLConfigMode.RGBA);
			if(!widget_set_gl_capability(this, config, null, true, GLRenderType.RGBA_TYPE))
			{
				throw new GlError.InitializationError("Unable to initialize a drawing area for OpenGL rendering.");
			}

			// create overlay rendering window

		}

		public LdrawViewPane.WithModel(ViewAngle angle, LdrawObject model)
			throws GlError
		{
			this(angle);
			m_Model = model;
			m_Model.VisibleChange.connect(() => RedrawWithError());
			m_Model.SelectionChanged.connect(() => RedrawWithError());
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
				m_Model.VisibleChange.connect(() => RedrawWithError());
				m_Model.SelectionChanged.connect(() => RedrawWithError());
				m_Eyeline = m_Center = m_Up = null;
				try
				{
					Redraw();
				}
				catch(GlError e)
				{
					RenderingError(@"Unable to render model:\n $(e.message)");
				}
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

			m_LastRedraw = new DateTime.now_utc();
			GLWindow drawableWin = widget_get_gl_window(this);
			if(!(drawableWin is GLDrawable))
			{
				throw new GlError.InvalidWidget("GtkGlExt library is playing silly beggars");
			}
			GLDrawable drawable = (GLDrawable)drawableWin;
			GLContext context = new GLContext(drawable, null, true, GLRenderType.RGBA_TYPE);

			drawable.gl_begin(context);

			int width = 0; int height = 0;
			drawable.get_size(out width, out height);

			if(m_Eyeline == null)
			{
				// setup viewing area.
				InitializeView();
			}

			GlBuilder builder = new GlBuilder(width, height, DefaultColour, CalculateViewArea(), m_Eyeline, m_Center, m_Up);
			m_Model.BuildFromFile(builder);

			builder.Flush();
			drawable.gl_end();
			drawable.wait_gl();
		}

		private void RedrawWithError()
		{
			try
			{
				Redraw();
				stdout.printf("redraw finished.\n");
			}
			catch (GlError e)
			{
				RenderingError(e.message);
			}
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
			if(has_focus)
			{
				stdout.printf("view pane has focus.\n");
			}
			return false;
		}

		public override void set_scroll_adjustments(Adjustment hadj, Adjustment vadj)
		{
			m_Hadj = hadj;
			m_Hadj.value_changed.connect(adj =>
					{
						float dx = (float)adj.value - m_Center.X;
						m_Center.X = (m_Center.X + dx);
						m_Eyeline.X = (m_Eyeline.X + dx);
						RedrawWithError();
					});
			m_Vadj = vadj;
			m_Vadj.value_changed.connect(adj =>
					{
						float dy = (float)adj.value - m_Center.Y;
						m_Center.Y = (m_Center.Y + dy);
						m_Eyeline.Y = (m_Eyeline.Y + dy);
						RedrawWithError();
					});

			SetAdjustmentRanges();
		}

		private void SetAdjustmentRanges()
			requires(m_Hadj != null)
			requires(m_Center != null)
		{
			m_Hadj.lower = 2 * m_Model.BoundingBox.MinX - m_Center.X;
			m_Hadj.upper = 2 * m_Model.BoundingBox.MaxX - m_Center.X;
			m_Hadj.value = m_Center.X;
			m_Vadj.lower = 2 * m_Model.BoundingBox.MinY - m_Center.Y;
			m_Vadj.upper = 2 * m_Model.BoundingBox.MaxY - m_Center.Y;
			m_Vadj.value = m_Center.Y;
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
				try
				{
					Redraw();
				}
				catch (GlError e)
				{
					RenderingError(@"OpenGL error redrawing due to changte of view angle: \n $(e.message).");
				}
				if(m_Hadj != null)
				{
					SetAdjustmentRanges();
				}
			}
		}

		private void InitializeView()
		{
			float modelRadius = m_Model.BoundingBox.Radius;
			var modelCenter = m_Model.BoundingBox.Center();
			Vector cameraShift = m_Angle.GetCameraDirection().Scale(modelRadius);
			m_Center = m_Angle.GetViewCenter(modelCenter);

			m_Eyeline = m_Center.Add(cameraShift);

			Allocation alloc;
			get_allocation(out alloc);
			int size = (alloc.height > alloc.width) ? alloc.width : alloc.height;
			m_Scale = (2.0f * modelRadius) / size;
			if(m_Scale < 0.0f) {m_Scale = -m_Scale;}

			m_Up = m_Angle.GetCameraUp();
		}

		private Bounds CalculateViewArea()
		{
			Allocation alloc;
			get_allocation(out alloc);

			return m_Angle.GetViewBounds(m_Model.BoundingBox, alloc.width, alloc.height, 1);
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
					return Vector(modelCenter.X, modelCenter.Y, 0);
				case Top:
				case Bottom:
					return Vector(modelCenter.X, modelCenter.Z, 0);
				case Left:
				case Right:
					return Vector(modelCenter.Z, modelCenter.Y, 0);
				case Ortho:
				default:
					return Vector(0, 0, 0);
			}
		}

		public Bounds GetViewBounds(Bounds modelBounds, int viewWidth, int viewHeight, int zoomLevel)
		{
			float viewRatio = (float)viewWidth / viewHeight;
			var scaleFactor = 1.1 * Math.pow(2, ((float)zoomLevel / 4));

			Bounds b = new Bounds();
			switch(this)
			{
				case Front:
				case Back:
					b.Union(Vector(modelBounds.MaxX, -modelBounds.MaxY, 0));
					b.Union(Vector(modelBounds.MinX, -modelBounds.MinY, 0));
					break;
				case Left:
				case Right:
					b.Union(Vector(modelBounds.MaxZ, -modelBounds.MaxY, 0));
					b.Union(Vector(modelBounds.MinZ, -modelBounds.MinY, 0));
					break;
				case Top:
				case Bottom:
					b.Union(Vector(modelBounds.MaxX, modelBounds.MaxZ, 0));
					b.Union(Vector(modelBounds.MinX, modelBounds.MinZ, 0));
					break;
				case Ortho:
				default:
					b.IncludeBounds(modelBounds, Matrix(1, 0, 0, 0, -1, 0, 0, 0, 1), Vector.NullVector);
					break;
			}

			var modelRatio = (b.MaxX - b.MinX) / (b.MaxY - b.MinY);
			var viewCenter = b.Center();
			if(modelRatio > viewRatio)
			{
				b.Union(Vector(0, (float)((b.MaxY - viewCenter.Y) * (modelRatio / viewRatio) + viewCenter.Y), 0));
				b.Union(Vector(0, (float)((b.MinY - viewCenter.Y) * (modelRatio / viewRatio) + viewCenter.Y), 0));
			}
			else
			{
				b.Union(Vector((float)((b.MaxX - viewCenter.X) * (viewRatio / modelRatio) + viewCenter.X), 0, 0));
				b.Union(Vector((float)((b.MinX - viewCenter.X) * (viewRatio / modelRatio) + viewCenter.X), 0, 0));
			}

			b = b.Scale((float)scaleFactor);

			var radius = modelBounds.Radius;
			var modelCenterZ = modelBounds.Center().Z;
			b.Union(Vector(0, 0, modelCenterZ + radius * 100));
			b.Union(Vector(0, 0, modelCenterZ - radius * 100));
			return b;
		}
	}
}

// extra methods for gdkglext / x11

/*
public static extern void* GetXDisplayForConfig(Gdk.GLConfig config);
public static extern int GetScreenForConfig(Gdk.GLConfig config);
*/
