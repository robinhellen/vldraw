using Gtk;
using Gdk;
using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.OpenGl;
using Ldraw.Options;
using Ldraw.Ui.DragAndDrop;
using Ldraw.Ui.Commands;
//using Diva;

namespace Ldraw.Ui.Widgets
{
	private class LdrawEditPane : LdrawViewPane
	{
		public IOptions Settings {construct; private get;}
		public IDroppedObjectLocator Locator {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
		public AnimatedModel model {construct; private get;}

		public LdrawEditPane(ViewAngle angle, IOptions settings, IDroppedObjectLocator locator, UndoStack undoStack)
			throws GlError
		{
			GLib.Object(Angle: angle, Settings: settings, Locator: locator, UndoStack: undoStack);
		}

		construct
		{
			can_focus = true;
			events |= Gdk.EventMask.BUTTON_PRESS_MASK;
			events |= Gdk.EventMask.KEY_PRESS_MASK;

			// set up this control for drag-and-drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			drag_dest_set(this, (DestDefaults)0, {LdrawDragData}, DragAction.COPY);
			drag_dest_set_track_motion(this, true);
			model.bind_property("Model", this, "Model");
			model.view_changed.connect(() => queue_draw());
			Model = model.Model;
		}
		
		public override void Redraw()
			throws GlError
		{
			if(model == null)
			{
				return;
			}

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

			renderer.Render(drawable, DefaultColour, CalculateViewArea(), m_Eyeline, m_Center, m_Up, Model, dropItem, model.Selection, overlay);
		}

		public override bool button_press_event(Gdk.EventButton event)
		{
			// if button is right, popup context menu
			grab_focus();
			switch(event.button)
			{
				case 1: // left
					if((event.state & ModifierType.CONTROL_MASK) != ModifierType.CONTROL_MASK)
					{
						model.ClearSelection();
					}

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
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, 0, Settings.CurrentGrid.Z)));
				return true;
			}
			if(event.keyval == m_DownKeyVal) // right mouse button
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, 0, -Settings.CurrentGrid.Z)));
				return true;
			}
			if(event.keyval == m_LeftKeyVal) // right mouse button
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(-Settings.CurrentGrid.X, 0, 0)));
				return true;
			}
			if(event.keyval == m_RightKeyVal) // right mouse button
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(Settings.CurrentGrid.X, 0, 0)));
				return true;
			}
			if(event.keyval == m_EndKeyVal) // right mouse button
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, Settings.CurrentGrid.Y, 0)));
				return true;
			}
			if(event.keyval == m_HomeKeyVal) // right mouse button
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, -Settings.CurrentGrid.Y, 0)));
				return true;
			}
			if(event.keyval == delKeyVal)
			{
				UndoStack.ExecuteCommand(new DeleteNodesCommand(model.Model, model.Selection));
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
			grab_focus();
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
			queue_draw();
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
			
			// rotation is same as last or selected part, or no rotation
			// offest is same as last or selected part, then moved for drop location, else 0,0,0
			Matrix newTransform = Matrix.Identity;
			Vector newPosition = Vector.NullVector;
			var newColour = LdrawColour.GetColour(0);
			PartNode copyPart = model.Model.LastSubFile;

			if(copyPart != null)
			{
				newTransform = copyPart.Transform;
				newPosition = copyPart.Center;
				newColour = copyPart.Colour;
			}

			// get the part from the drag data
			string partName = (string)selection_data.data;
			if(partName.contains(","))
			{
				var sections = partName.split(",");
				partName = sections[0];
				// set the colour from the drag data. This should override any colour copied from another part.
				newColour = LdrawColour.GetColour(int.parse(sections[1]));
			}
			
			var dragFinished = finishDrag;
			Locator.GetObjectForName.begin(partName, (obj, res) =>
			{
				var droppedObject = Locator.GetObjectForName.end(res);
				if(droppedObject == null)
				{
					return;
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
							SnapTo(m_Center.X + deltaX, Settings.CurrentGrid.X),
							SnapTo(-m_Center.Y + deltaY, Settings.CurrentGrid.Y),
							newPosition.Z);
						break;
					case ViewAngle.Back:
						newPosition = Vector(
							SnapTo(-m_Center.X - deltaX, Settings.CurrentGrid.X),
							SnapTo(-m_Center.Y + deltaY, Settings.CurrentGrid.Y),
							newPosition.Z);
						break;
					case ViewAngle.Left:
						newPosition = Vector(
							newPosition.X,
							SnapTo(-m_Center.Y + deltaY, Settings.CurrentGrid.Y),
							SnapTo(-m_Center.X - deltaX, Settings.CurrentGrid.Z));
						break;
					case ViewAngle.Right:
						newPosition = Vector(
							newPosition.X,
							SnapTo(-m_Center.Y + deltaY, Settings.CurrentGrid.Y),
							SnapTo(m_Center.X + deltaX, Settings.CurrentGrid.Z));
						break;
					case ViewAngle.Top:
						newPosition = Vector(
							SnapTo(m_Center.X + deltaX, Settings.CurrentGrid.X),
							newPosition.Y,
							SnapTo(m_Center.Y - deltaY, Settings.CurrentGrid.Z));
						break;
					case ViewAngle.Bottom:
						newPosition = Vector(
							SnapTo(-m_Center.X - deltaX, Settings.CurrentGrid.X),
							newPosition.Y,
							SnapTo(m_Center.Y - deltaY, Settings.CurrentGrid.Z));
						break;
					default:
						newPosition = Vector.NullVector;
						break;
				}
				
				if(dragFinished)
				{
					LdrawNode newNode = new PartNode(newPosition, newTransform, droppedObject, newColour);
					model.ClearSelection();
					model.Select(newNode);
					UndoStack.ExecuteCommand(new AddNodeCommand(model.Model, newNode, copyPart));
					drag_finish(context, true, false, time);
				}
				else
				{
					dropItem = new PartNode(newPosition, newTransform, droppedObject, newColour);
					drag_status(context, context.suggested_action, time);
					queue_draw();
				}
			});
		}

		private Gtk.Menu CreateContextMenu()
		{
			Gtk.Menu menu = new Gtk.Menu();
			
			AppendMenuFor(ViewAngle.Front, "Front", menu);
			AppendMenuFor(ViewAngle.Back, "Back", menu);
			AppendMenuFor(ViewAngle.Left, "Left", menu);
			AppendMenuFor(ViewAngle.Right, "Right", menu);
			AppendMenuFor(ViewAngle.Top, "Top", menu);
			AppendMenuFor(ViewAngle.Bottom, "Bottom", menu);
			AppendMenuFor(ViewAngle.Ortho, "3D", menu);

			return menu;
		}
		
		private void AppendMenuFor(ViewAngle angle, string label, Gtk.Menu parent)
		{
			var item = new Gtk.MenuItem.with_label(label);
			item.activate.connect(() => Angle = angle);
			parent.append(item);
			item.show();
		}

		private void SelectTopMostUnderMouse(double x, double y)
		{
			Allocation alloc;
			get_allocation(out alloc);

			var fullBounds = CalculateViewArea();

			var modelBounds = model.Model.BoundingBox;
			var radius = modelBounds.Radius;
			var modelCenterZ = modelBounds.Center().Z;

			var pixelVolume = new Bounds();
			pixelVolume.Union(Vector(ScaleBetween(fullBounds.MinX, fullBounds.MaxX, ((float)x + 0.5f) / alloc.width),
									 ScaleBetween(fullBounds.MaxY, fullBounds.MinY, ((float)y + 0.5f) / alloc.height),
									 modelCenterZ + radius * 100));
			pixelVolume.Union(Vector(ScaleBetween(fullBounds.MinX, fullBounds.MaxX, ((float)x - 0.5f) / alloc.width),
									 ScaleBetween(fullBounds.MaxY, fullBounds.MinY, ((float)y - 0.5f) / alloc.height),
									 modelCenterZ - radius * 100));

			GLWindow drawableWin = widget_get_gl_window(this);
			GLDrawable drawable = (GLDrawable)drawableWin;
			GLContext context = new GLContext(drawable, null, true, GLRenderType.RGBA_TYPE);

			drawable.gl_begin(context);

			var builder = new GlSelectorBuilder(pixelVolume, m_Eyeline, m_Center, m_Up);
			model.Model.BuildFromFile<void>(builder);
			
			var selected = builder.ApplySelection(model.Model);
			if(selected != null)
				model.Select(selected);
			drawable.gl_end();
			drawable.wait_gl();
		}

		private float ScaleBetween(float start, float end, float ratio)
		{
			return start + ((end - start) * ratio);
		}

		private float SnapTo(float raw, float step)
		{
			return step * Math.roundf(raw / step);
		}

		private uint m_UpKeyVal = Gdk.keyval_from_name("Up");
		private uint m_DownKeyVal = Gdk.keyval_from_name("Down");
		private uint m_LeftKeyVal = Gdk.keyval_from_name("Left");
		private uint m_RightKeyVal = Gdk.keyval_from_name("Right");
		private uint m_HomeKeyVal = Gdk.keyval_from_name("Home");
		private uint m_EndKeyVal = Gdk.keyval_from_name("End");
		private uint delKeyVal = Gdk.keyval_from_name("Delete");
	}
}
