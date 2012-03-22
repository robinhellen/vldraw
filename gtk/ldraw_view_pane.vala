using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Maths;

namespace Ldraw.Ui.Widgets
{
	public class LdrawViewPane : DrawingArea
	{
		private LdrawFile m_Model;
		private ViewAngle m_Angle;
		private float m_Scale;
		private Vector? m_Eyeline = null;
		private Vector? m_Center = null;
		private Vector? m_Up = null;

		public LdrawViewPane(ViewAngle angle)
			throws GlError
		{
			// base();
			m_Model = null;
			m_Angle = angle;
			m_Eyeline = m_Center = m_Up = null;

			events |= Gdk.EventMask.BUTTON_PRESS_MASK;

			// initialize this control for OpenGl rendering
			GLConfig config = new GLConfig.by_mode(GLConfigMode.DEPTH | GLConfigMode.RGBA);
			if(!widget_set_gl_capability(this, config, null, true, GLRenderType.RGBA_TYPE))
			{
				throw new GlError.InitializationError("Unable to initialize a drawing area for OpenGL rendering.");
			}

			// set up this control for drag-and-drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			drag_dest_set(this, DestDefaults.ALL, {LdrawDragData}, DragAction.COPY);
		}

		public LdrawViewPane.WithModel(ViewAngle angle, LdrawFile model)
			throws GlError
		{
			this(angle);
			m_Model = model;
			m_Model.VisibleChange.connect(() => Redraw());
		}

		public signal void RenderingError(string description);

		public LdrawFile Model
		{
			set
			{
				m_Model = value;
				m_Model.VisibleChange.connect(() => Redraw());
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

		public void Redraw()
			throws GlError
		{
			if(m_Model == null)
			{
				return;
			}

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

			GlBuilder builder = new GlBuilder(width, height, 0, CalculateViewArea(), m_Eyeline, m_Center, m_Up);
			m_Model.BuildFromFile(builder);

			builder.Flush();
			drawable.gl_end();
			drawable.wait_gl();
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

		public override bool button_press_event(Gdk.EventButton event)
		{
			// if button is right, popup context menu
			if(event.button == 3) // right mouse button
			{
				CreateContextMenu().popup(null, null, null, event.button, event.time);
				return true;
			}
			return false;
		}

		public override bool drag_drop(DragContext context, int x, int y, uint time_)
		{
			stdout.printf("model view drop.\n");
			drag_finish(context, true, false, time_);
			return true;
		}

		public override bool drag_motion(DragContext context, int x, int y, uint time_)
		{
			stdout.printf("model view motion.\n");
			return true;
		}

		public override void drag_data_received (DragContext context, int x, int y,
												 SelectionData selection_data, uint info,
												 uint time)
		{
			stdout.printf("model view data recieved:\n");
			string partName = (string)selection_data.data;
			LdrawPart part;
			if(!LdrawLibrary.Instance.TryGetPart(partName, out part))
				return;

			stdout.printf(@"part received: $(part.Description)\n");
			// TODO: work out where to add the new part, and what orientation
			
			// rotation is same as last or selected part, or no rotation
			// offest is same as last or selected part, then moved for drop location, else 0,0,0
			Matrix newTransform = Matrix.Identity;
			Vector newPosition = Vector.NullVector;
			int newColour = 0;
			PartNode copyPart = null;
			copyPart = m_Model.LastSelected;
			if(copyPart == null)
			{
				copyPart = m_Model.LastSubFile;
			}
			if(copyPart != null)
			{
				newTransform = copyPart.Transform;
				newPosition = copyPart.Center;
				newColour = copyPart.ColourId;
			}
			
			// TODO: adjust addition position for drop location
			switch(m_Angle)
			{
				case: ViewAngle.Ortho:
					break; // do not adjust in the 3D view as that is PAINFUL
			}
			
			
			LdrawNode newNode = new PartNode(newPosition, newTransform, part, newColour);
			m_Model.AddNode(newNode, copyPart);
			stdout.printf(@"part dropped at $(newPosition)\n");
		}


		private Menu CreateContextMenu()
		{
			Menu menu = new Menu();

			MenuItem frontAngle  = new MenuItem.with_label("Front");
			frontAngle.activate.connect(() => Angle = ViewAngle.Front);
			frontAngle.show();
			menu.append(frontAngle);

			MenuItem backAngle   = new MenuItem.with_label("Back");
			backAngle.activate.connect(() => Angle = ViewAngle.Back);
			menu.append(backAngle);
			backAngle.show();

			MenuItem leftAngle   = new MenuItem.with_label("Left");
			leftAngle.activate.connect(() => Angle = ViewAngle.Left);
			menu.append(leftAngle);
			leftAngle.show();

			MenuItem rightAngle  = new MenuItem.with_label("Right");
			rightAngle.activate.connect(() => Angle = ViewAngle.Right);
			menu.append(rightAngle);
			rightAngle.show();

			MenuItem topAngle    = new MenuItem.with_label("Top");
			topAngle.activate.connect(() => Angle = ViewAngle.Top);
			menu.append(topAngle);
			topAngle.show();

			MenuItem bottomAngle = new MenuItem.with_label("Bottom");
			bottomAngle.activate.connect(() => Angle = ViewAngle.Bottom);
			menu.append(bottomAngle);
			bottomAngle.show();

			MenuItem orthoAngle  = new MenuItem.with_label("3D");
			orthoAngle.activate.connect(() => Angle = ViewAngle.Ortho);
			menu.append(orthoAngle);
			orthoAngle.show();

			return menu;
		}

		public ViewAngle Angle
		{
			get
			{
				return m_Angle;
			}
			private set
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
			}
		}

		private void InitializeView()
		{
			m_Center = m_Model.BoundingBox.Center();
			m_Center.Y = -m_Center.Y;
			float modelRadius = m_Model.BoundingBox.Radius;

			Vector cameraShift;
			switch(m_Angle)
			{
				case ViewAngle.Ortho:
					cameraShift = Vector(modelRadius * -0.390731128f,modelRadius * -0.650895224f,modelRadius * -0.650895224f);
					break;
				case ViewAngle.Front:
					cameraShift = Vector(0.0f, 0.0f, modelRadius * -1.5f);
					break;
				case ViewAngle.Back:
					cameraShift = Vector(0.0f, 0.0f, modelRadius * 1.5f);
					break;
				case ViewAngle.Top:
					cameraShift = Vector(0.0f, modelRadius * -1.5f, 0.0f);
					break;
				case ViewAngle.Bottom:
					cameraShift = Vector(0.0f, modelRadius * 1.5f, 0.0f);
					break;
				case ViewAngle.Left:
					cameraShift = Vector(modelRadius * -1.5f, 0.0f, 0.0f);
					break;
				case ViewAngle.Right:
					cameraShift = Vector(modelRadius * 1.5f, 0.0f, 0.0f);
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
