using Gtk;
using Gdk;
using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Maths;

namespace Ldraw.Ui.Widgets
{
	public class LdrawEditPane : LdrawViewPane
	{
		private Settings m_Settings;

		public LdrawEditPane(ViewAngle angle, Settings settings)
			throws GlError
		{
			base(angle);
			m_Settings = settings;

			can_focus = true;
			events |= Gdk.EventMask.BUTTON_PRESS_MASK;
			events |= Gdk.EventMask.KEY_PRESS_MASK;

			// set up this control for drag-and-drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			drag_dest_set(this, DestDefaults.ALL, {LdrawDragData}, DragAction.COPY);
		}

		public LdrawEditPane.WithModel(ViewAngle angle, LdrawFile model, Settings settings)
			throws GlError
		{
			base.WithModel(angle, model);
			m_Settings = settings;

			can_focus = true;
			events |= Gdk.EventMask.BUTTON_PRESS_MASK;
			events |= Gdk.EventMask.KEY_PRESS_MASK;

			// set up this control for drag-and-drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			drag_dest_set(this, DestDefaults.ALL, {LdrawDragData}, DragAction.COPY);
		}

		public override bool button_press_event(Gdk.EventButton event)
		{
			// if button is right, popup context menu
			grab_focus();
			if(event.button == 3) // right mouse button
			{
				CreateContextMenu().popup(null, null, null, event.button, event.time);
				return true;
			}
			return false;
		}

		public override bool key_press_event(Gdk.EventKey event)
		{
			// if button is right, popup context menu
			if(event.keyval == m_UpKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, 0.0f, -m_Settings.GridZ));
				return true;
			}
			if(event.keyval == m_DownKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, 0.0f, m_Settings.GridZ));
				return true;
			}
			if(event.keyval == m_LeftKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(m_Settings.GridX, 0.0f, 0.0f));
				return true;
			}
			if(event.keyval == m_RightKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(-m_Settings.GridX, 0.0f, 0.0f));
				return true;
			}
			if(event.keyval == m_EndKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, m_Settings.GridY, 0.0f));
				return true;
			}
			if(event.keyval == m_HomeKeyVal) // right mouse button
			{
				Model.MoveSelectedNodes(Vector(0.0f, -m_Settings.GridY, 0.0f));
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

			// rotation is same as last or selected part, or no rotation
			// offest is same as last or selected part, then moved for drop location, else 0,0,0
			Matrix newTransform = Matrix.Identity;
			Vector newPosition = Vector.NullVector;
			int newColour = 0;
			PartNode copyPart = null;
			copyPart = Model.LastSelected;
			if(copyPart == null)
			{
				copyPart = Model.LastSubFile;
			}
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

			stdout.printf(@"part dropped at ($x, $y), delta values are ($deltaX, $deltaY), center is $m_Center.\n");


			// TODO: adjust addition position for drop location
			switch(Angle)
			{
				case ViewAngle.Ortho:
					break; // do not adjust in the 3D view as that is PAINFUL
				case ViewAngle.Front:
					newPosition.X = m_Settings.GridX * Math.roundf((m_Center.X + deltaX) / m_Settings.GridX);
					newPosition.Y = m_Settings.GridX * Math.roundf((-m_Center.Y + deltaY) / m_Settings.GridX);
					break;
				case ViewAngle.Back:
					newPosition.X = m_Settings.GridX * Math.roundf((m_Center.X - deltaX) / m_Settings.GridX);
					newPosition.Y = m_Settings.GridX * Math.roundf((-m_Center.Y + deltaY) / m_Settings.GridX);
					break;
				case ViewAngle.Left:
					newPosition.Z = m_Settings.GridZ * Math.roundf((m_Center.Z - deltaX) / m_Settings.GridZ);
					newPosition.Y = m_Settings.GridX * Math.roundf((-m_Center.Y + deltaY) / m_Settings.GridX);
					break;
				case ViewAngle.Right:
					newPosition.Z = m_Settings.GridZ * Math.roundf((m_Center.Z + deltaX) / m_Settings.GridZ);
					newPosition.Y = m_Settings.GridX * Math.roundf((-m_Center.Y + deltaY) / m_Settings.GridX);
					break;
				case ViewAngle.Top:
					newPosition.X = m_Settings.GridX * Math.roundf((m_Center.X - deltaX) / m_Settings.GridX);
					newPosition.Z = m_Settings.GridZ * Math.roundf((m_Center.Z + deltaY) / m_Settings.GridZ);
					break;
				case ViewAngle.Bottom:
					newPosition.X = m_Settings.GridX * Math.roundf((m_Center.X + deltaX) / m_Settings.GridX);
					newPosition.Z = m_Settings.GridZ * Math.roundf((m_Center.Z + deltaY) / m_Settings.GridZ);
					break;
			}


			LdrawNode newNode = new PartNode(newPosition, newTransform, part, newColour);
			Model.AddNode(newNode, copyPart);
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

		private uint m_UpKeyVal = Gdk.keyval_from_name("Up");
		private uint m_DownKeyVal = Gdk.keyval_from_name("Down");
		private uint m_LeftKeyVal = Gdk.keyval_from_name("Left");
		private uint m_RightKeyVal = Gdk.keyval_from_name("Right");
		private uint m_HomeKeyVal = Gdk.keyval_from_name("Home");
		private uint m_EndKeyVal = Gdk.keyval_from_name("End");
	}
}
