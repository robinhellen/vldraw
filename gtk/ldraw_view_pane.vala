using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Maths;

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
						m_Center.X += dx;
						m_Eyeline.X += dx;
						RedrawWithError();
					});
			m_Vadj = vadj;
			m_Vadj.value_changed.connect(adj =>
					{
						float dy = (float)adj.value - m_Center.Y;
						m_Center.Y += dy;
						m_Eyeline.Y += dy;
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
			m_Center = Vector(0, 0, 0);
			Vector modelCenter = m_Model.BoundingBox.Center();
			float modelRadius = m_Model.BoundingBox.Radius;

			Vector cameraShift;
			switch(m_Angle)
			{
				case ViewAngle.Ortho:
					cameraShift = Vector(modelRadius * -0.390731128f,modelRadius * -0.650895224f,modelRadius * -0.650895224f);
					break;
				case ViewAngle.Front:
					cameraShift = Vector(0.0f, 0.0f, modelRadius * -1.5f);
					m_Center.Y = modelCenter.Y;
					m_Center.X = modelCenter.X;
					break;
				case ViewAngle.Back:
					cameraShift = Vector(0.0f, 0.0f, modelRadius * 1.5f);
					m_Center.Y = modelCenter.Y;
					m_Center.X = -modelCenter.X;
					break;
				case ViewAngle.Top:
					cameraShift = Vector(0.0f, modelRadius * -1.5f, 0.0f);
					m_Center.Y = modelCenter.Z;
					m_Center.X = modelCenter.X;
					break;
				case ViewAngle.Bottom:
					cameraShift = Vector(0.0f, modelRadius * 1.5f, 0.0f);
					m_Center.Y = -modelCenter.Z;
					m_Center.X = modelCenter.X;
					break;
				case ViewAngle.Left:
					cameraShift = Vector(modelRadius * -1.5f, 0.0f, 0.0f);
					m_Center.Y = -modelCenter.Y;
					m_Center.X = modelCenter.Z;
					break;
				case ViewAngle.Right:
					cameraShift = Vector(modelRadius * 1.5f, 0.0f, 0.0f);
					m_Center.Y = -modelCenter.Y;
					m_Center.X = -modelCenter.Z;
					break;
				default:
					cameraShift = Vector.NullVector;
					break;
			}

			m_Eyeline = m_Center.Add(cameraShift);

			Allocation alloc;
			get_allocation(out alloc);
			int size = (alloc.height > alloc.width) ? alloc.width : alloc.height;
			m_Scale = (2.0f * modelRadius) / size;
			if(m_Scale < 0.0f) {m_Scale = -m_Scale;}
			switch(m_Angle)
			{
				case ViewAngle.Top:
				case ViewAngle.Bottom:
					m_Up = Vector(0.0f, 0.0f, 1.0f);
					break;
				default:
					m_Up = Vector(0.0f, 1.0f, 0.0f);
					break;

			}
		}

		private Bounds CalculateViewArea()
		{
			Allocation alloc;
			get_allocation(out alloc);

			float minX = m_Center.X + (alloc.width * m_Scale / 2.0f);
			float maxX = m_Center.X - (alloc.width * m_Scale / 2.0f);
			float minY = m_Center.Y - (alloc.height * m_Scale / 2.0f);
			float maxY = m_Center.Y + (alloc.height * m_Scale / 2.0f);
			Bounds box = m_Model.BoundingBox;
			float minZ = -50.0f * (box.MaxZ - box.MinZ);
			float maxZ = -minZ;

			Bounds retval = new Bounds();
			retval.Union(Vector(minX, minY, minZ));
			retval.Union(Vector(maxX, maxY, maxZ));
			return retval;
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

		Ortho,
	}
}

// extra methods for gdkglext / x11

/*
public static extern void* GetXDisplayForConfig(Gdk.GLConfig config);
public static extern int GetScreenForConfig(Gdk.GLConfig config);
*/
