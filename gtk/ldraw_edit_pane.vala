using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.OpenGl;
using Ldraw.Maths;
using Ldraw.Options;

namespace Ldraw.Ui.Widgets
{
	public class LdrawEditPane : LdrawViewPane
	{
		private IOptions m_Settings;
		private PartNode dropItem = null;

		public LdrawEditPane(ViewAngle angle, IOptions settings)
			throws GlError
		{
			base(angle);
			m_Settings = settings;

			can_focus = true;
			events |= Gdk.EventMask.BUTTON_PRESS_MASK;
			events |= Gdk.EventMask.KEY_PRESS_MASK;

			// set up this control for drag-and-drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			drag_dest_set(this, (DestDefaults)0, {LdrawDragData}, DragAction.COPY);
			drag_dest_set_track_motion(this, true);
		}

		public override bool button_press_event(Gdk.EventButton event)
		{
			// if button is right, popup context menu
			grab_focus();
			switch(event.button)
			{
				case 1: // left
					SelectTopMostUnderMouse(event.x, event.y);
					break;
				case 3: // right button
					CreateContextMenu().popup(null, null, null, event.button, event.time);
					return true;
			}
			return false;
		}

		public override bool scroll_event(Gdk.EventScroll event)
		{
			switch(event.direction)
			{
				case Gdk.ScrollDirection.UP:
					m_Scale *= Math.powf(2, -0.2f);
					queue_draw();
					break;
				case Gdk.ScrollDirection.DOWN:
					m_Scale *= Math.powf(2, 0.2f);
					queue_draw();
					break;
			}
			return true;
		}

		public override bool key_press_event(Gdk.EventKey event)
		{
			// if button is right, popup context menu
			if(event.keyval == m_UpKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, 0.0f, m_Settings.CurrentGrid.Z));
				return true;
			}
			if(event.keyval == m_DownKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, 0.0f, -m_Settings.CurrentGrid.Z));
				return true;
			}
			if(event.keyval == m_LeftKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(m_Settings.CurrentGrid.X, 0.0f, 0.0f));
				return true;
			}
			if(event.keyval == m_RightKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(-m_Settings.CurrentGrid.X, 0.0f, 0.0f));
				return true;
			}
			if(event.keyval == m_EndKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, m_Settings.CurrentGrid.Y, 0.0f));
				return true;
			}
			if(event.keyval == m_HomeKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, -m_Settings.CurrentGrid.Y, 0.0f));
				return true;
			}
			return false;
		}

		private bool finishDrag = false;

		public override bool drag_drop(DragContext context, int x, int y, uint time_)
		{
			finishDrag = true;
			dropItem = null;
			drag_get_data(this, context, Atom.intern("LdrawFile", false), time_);
			finishDrag = false;
			return true;
		}

		public override bool drag_motion(DragContext context, int x, int y, uint time_)
		{
			dropItem = null;
			drag_get_data(this, context, Atom.intern("LdrawFile", false), time_);
			return true;
		}

		public override void drag_leave(DragContext context, uint time)
		{
			dropItem = null;
		}

		public override void drag_data_received (DragContext context, int x, int y,
												 SelectionData selection_data, uint info,
												 uint time)
		{
			if(!finishDrag)
			{
				// this is the drag motion, so the provided mouse coordinates are bunkum
				get_pointer(out x, out y);
			}

			string partName = (string)selection_data.data;
			LdrawPart part;
			if(!LdrawLibrary.Instance.TryGetPart(partName, out part))
				return;

			// rotation is same as last or selected part, or no rotation
			// offest is same as last or selected part, then moved for drop location, else 0,0,0
			Matrix newTransform = Matrix.Identity;
			Vector newPosition = Vector.NullVector;
			int newColour = 0;
			PartNode copyPart = null;
			copyPart = Model.LastSelected ?? Model.LastSubFile;

			if(copyPart != null)
			{
				newTransform = copyPart.Transform;
				newPosition = copyPart.Center;
				newColour = copyPart.ColourId;
			}

			Allocation alloc;
			get_allocation(out alloc);
			int deltaXPx = x - (alloc.width / 2);
			int deltaYPx = y - (alloc.height / 2);

			float deltaX = deltaXPx * m_Scale;
			float deltaY = deltaYPx * m_Scale;

			// TODO: adjust addition position for drop location
			switch(Angle)
			{
				case ViewAngle.Ortho:
					break; // do not adjust in the 3D view as that is PAINFUL
				case ViewAngle.Front:
					newPosition = Vector(
						SnapTo(m_Center.X - deltaX, m_Settings.CurrentGrid.X),
						SnapTo(-m_Center.Y + deltaY, m_Settings.CurrentGrid.Y),
						newPosition.Z);
					break;
				case ViewAngle.Back:
					newPosition = Vector(
						SnapTo(-m_Center.X + deltaX, m_Settings.CurrentGrid.X),
						SnapTo(-m_Center.Y + deltaY, m_Settings.CurrentGrid.Y),
						newPosition.Z);
					break;
				case ViewAngle.Left:
					newPosition = Vector(
						newPosition.X,
						SnapTo(-m_Center.Y + deltaY, m_Settings.CurrentGrid.Y),
						SnapTo(-m_Center.X + deltaX, m_Settings.CurrentGrid.Z));
					break;
				case ViewAngle.Right:
					newPosition = Vector(
						newPosition.X,
						SnapTo(-m_Center.Y + deltaY, m_Settings.CurrentGrid.Y),
						SnapTo(m_Center.X - deltaX, m_Settings.CurrentGrid.Z));
					break;
				case ViewAngle.Top:
					newPosition = Vector(
						SnapTo(m_Center.X - deltaX, m_Settings.CurrentGrid.X),
						newPosition.Y,
						SnapTo(m_Center.Y - deltaY, m_Settings.CurrentGrid.Z));
					break;
				case ViewAngle.Bottom:
					newPosition = Vector(
						SnapTo(-m_Center.X + deltaX, m_Settings.CurrentGrid.X),
						newPosition.Y,
						SnapTo(m_Center.Y - deltaY, m_Settings.CurrentGrid.Z));
					break;
				default:
					newPosition = Vector.NullVector;
					break;
			}

			if(finishDrag)
			{
				LdrawNode newNode = new PartNode(newPosition, newTransform, part.MainObject, newColour);
				Model.AddNode(newNode, copyPart);
				drag_finish(context, true, false, time);
			}
			else
			{
				dropItem = new PartNode(newPosition, newTransform, part.MainObject, newColour);
				// TODO: make an outline get drawn.
				drag_status(context, context.suggested_action, time);
			}
		}

		private Gtk.Menu CreateContextMenu()
		{
			Gtk.Menu menu = new Gtk.Menu();

			Gtk.MenuItem frontAngle  = new Gtk.MenuItem.with_label("Front");
			frontAngle.activate.connect(() => Angle = ViewAngle.Front);
			frontAngle.show();
			menu.append(frontAngle);

			Gtk.MenuItem backAngle   = new Gtk.MenuItem.with_label("Back");
			backAngle.activate.connect(() => Angle = ViewAngle.Back);
			menu.append(backAngle);
			backAngle.show();

			Gtk.MenuItem leftAngle   = new Gtk.MenuItem.with_label("Left");
			leftAngle.activate.connect(() => Angle = ViewAngle.Left);
			menu.append(leftAngle);
			leftAngle.show();

			Gtk.MenuItem rightAngle  = new Gtk.MenuItem.with_label("Right");
			rightAngle.activate.connect(() => Angle = ViewAngle.Right);
			menu.append(rightAngle);
			rightAngle.show();

			Gtk.MenuItem topAngle    = new Gtk.MenuItem.with_label("Top");
			topAngle.activate.connect(() => Angle = ViewAngle.Top);
			menu.append(topAngle);
			topAngle.show();

			Gtk.MenuItem bottomAngle = new Gtk.MenuItem.with_label("Bottom");
			bottomAngle.activate.connect(() => Angle = ViewAngle.Bottom);
			menu.append(bottomAngle);
			bottomAngle.show();

			Gtk.MenuItem orthoAngle  = new Gtk.MenuItem.with_label("3D");
			orthoAngle.activate.connect(() => Angle = ViewAngle.Ortho);
			menu.append(orthoAngle);
			orthoAngle.show();

			return menu;
		}

		protected override void BuildModel(GlBuilder builder)
		{
			base.BuildModel(builder);
			if(dropItem != null)
			{
				var part = dropItem;
				builder.RenderBounds(part.Contents.BoundingBox.Transform(part.Transform, part.Center));
			}
		}

		private void SelectTopMostUnderMouse(double x, double y)
		{
			Allocation alloc;
			get_allocation(out alloc);

			var fullBounds = CalculateViewArea();

			var modelBounds = Model.BoundingBox;
			var radius = modelBounds.Radius;
			var modelCenterZ = modelBounds.Center().Z;

			var pixelVolume = new Bounds();
			pixelVolume.Union(Vector(ScaleBetween(fullBounds.MaxX, fullBounds.MinX, ((float)x + 0.5f) / alloc.width),
									 ScaleBetween(fullBounds.MaxY, fullBounds.MinY, ((float)y + 0.5f) / alloc.height),
									 modelCenterZ + radius * 100));
			pixelVolume.Union(Vector(ScaleBetween(fullBounds.MaxX, fullBounds.MinX, ((float)x - 0.5f) / alloc.width),
									 ScaleBetween(fullBounds.MaxY, fullBounds.MinY, ((float)y - 0.5f) / alloc.height),
									 modelCenterZ - radius * 100));

			GLWindow drawableWin = widget_get_gl_window(this);
			GLDrawable drawable = (GLDrawable)drawableWin;
			GLContext context = new GLContext(drawable, null, true, GLRenderType.RGBA_TYPE);

			drawable.gl_begin(context);

			var builder = new GlSelectorBuilder(pixelVolume, m_Eyeline, m_Center, m_Up);
			Model.BuildFromFile(builder);

			builder.ApplySelection(Model);
			drawable.gl_end();
			drawable.wait_gl();
		}

		private float ScaleBetween(float start, float end, float ratio)
		{
			return start + ((end - start) * ratio);
		}

		private float SnapTo(float raw, float step)
		{
			var result = step * Math.roundf(raw / step);
			stderr.printf(@"Snapping $raw to $step gives $result.\n");
			return result;
		}

		private uint m_UpKeyVal = Gdk.keyval_from_name("Up");
		private uint m_DownKeyVal = Gdk.keyval_from_name("Down");
		private uint m_LeftKeyVal = Gdk.keyval_from_name("Left");
		private uint m_RightKeyVal = Gdk.keyval_from_name("Right");
		private uint m_HomeKeyVal = Gdk.keyval_from_name("Home");
		private uint m_EndKeyVal = Gdk.keyval_from_name("End");
	}
}
