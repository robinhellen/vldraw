using Diva;
using Gtk;
using Gdk;
using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui.DragAndDrop;
using Ldraw.Ui.Commands;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui.GtkGl
{
	private class LdrawEditPane : LdrawViewPane, ModelEditor, Scrollable
	{
		public IOptions Settings {construct; private get;}
		public IDroppedObjectLocator Locator {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
		public AnimatedModel model {construct; private get;}
		public DropBoundsOverlay DropOverlay {construct; private get;}
		public GlSelector Selector {construct; get;}
		public Collection<EditorInteraction> interactions {get; construct;}
		public Collection<PositionAdjuster> adjusters {get; construct;}
		
		static construct
		{
			var cls = (ObjectClass)typeof(LdrawEditPane).class_ref();
			set_collection_injection<EditorInteraction>(cls, "interactions");
			set_collection_injection<PositionAdjuster>(cls, "adjusters");
		}

		private Adjustment m_Hadj = null;
		private Adjustment m_Vadj = null;

		public LdrawEditPane(ViewAngle angle, IOptions settings, IDroppedObjectLocator locator, UndoStack undoStack)
		{
			GLib.Object(Angle: angle, Settings: settings, Locator: locator, UndoStack: undoStack);
		}

		construct
		{
			can_focus = true;
			events |= EventMask.BUTTON_PRESS_MASK 
				   |  EventMask.BUTTON_RELEASE_MASK
				   |  EventMask.LEAVE_NOTIFY_MASK
				   |  EventMask.POINTER_MOTION_MASK
				   |  EventMask.KEY_PRESS_MASK
				   |  EventMask.SCROLL_MASK;

			// set up this control for drag-and-drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			drag_dest_set(this, (DestDefaults)0, {LdrawDragData}, DragAction.COPY);
			drag_dest_set_track_motion(this, true);
			model.bind_property("Model", this, "Model");
			model.view_changed.connect(() => model_view_changed());
			model.changed_selection.connect(() => model_view_changed());
			Model = model.Model;
			overlay = DropOverlay;
			foreach(var interaction in interactions)
			{
				interaction.attach(this);
			}
			renderer.mode = RenderCacheMode.CacheSubModels;
		}
		
		private void model_view_changed()
		{			
			queue_draw();
		}
		
		protected override Gee.Set<LdrawNode> CurrentSelection
		{
			get
			{
				return model.Selection;
			}
		}
		
		// event overrides.		
		public override bool button_press_event(Gdk.EventButton event)
		{
			base.button_press_event(event);
			// if button is right, popup context menu
			grab_focus();
			switch(event.button)
			{
				case 1:
					mouseData = new MouseData(event.x, event.y, event.button, viewParameters);
					break;
				case 2: // middle button - scroll
					mouseData = new MouseData(event.x, event.y, event.button, viewParameters);
					break;					
				case 3: // right button
					CreateContextMenu().popup_at_pointer(event);
					break;
			}
			return false;
		}
		
		private MouseData mouseData;
		
		public override bool button_release_event(EventButton event)
		{
			base.button_release_event(event);
			switch(event.button)
			{
				case 1: // left
					bool toggle = (event.state & ModifierType.CONTROL_MASK) == ModifierType.CONTROL_MASK;

					SelectTopMostUnderMouse(event.x, event.y, toggle);
					break;
				case 2: // middle
					// if 3d view, move camera
					move_camera(event.x, event.y, mouseData);
					mouseData = null;
					break;
					
			}
			return false;
		}
		
		public override bool leave_notify_event(EventCrossing event)
		{
			mouseData = null;
			return false;
		}
		
		public override bool motion_notify_event(EventMotion event)
		{
			base.motion_notify_event(event);
			if(mouseData == null)
				return false;
				
			if(mouseData.button == 2)
				move_camera(event.x, event.y, mouseData);
			return false;
		}
		
		public override bool popup_menu()
		{
			base.popup_menu();
			CreateContextMenu().popup_at_pointer();
			return false;		
		}

		public override bool scroll_event(Gdk.EventScroll event)
		{
			switch(event.direction)
			{
				case ScrollDirection.UP:
					viewParameters.lduHeight *= Math.powf(2, -0.2f);
					viewParameters.lduWidth *= Math.powf(2, -0.2f);
					queue_draw();
					break;
				case ScrollDirection.DOWN:
					viewParameters.lduHeight *= Math.powf(2, 0.2f);
					viewParameters.lduWidth *= Math.powf(2, 0.2f);
					queue_draw();
					break;
				case ScrollDirection.LEFT:
				case ScrollDirection.RIGHT:
				case ScrollDirection.SMOOTH:
					// No action on other scrolls
					break;
			}
			update_scroll_limits();
			return true;
		}

		public override bool key_press_event(Gdk.EventKey event)
		{
			if(event.keyval == delKeyVal)
			{
				UndoStack.ExecuteCommand(new DeleteNodesCommand(model.Model, model.Selection));
				return true;
			}
			return false;
		}

		// end of event overrides.
		
		// drag and drop events
		private bool finishDrag = false;

		public override bool drag_drop(DragContext context, int x, int y, uint time_)
		{
			finishDrag = true;
			DropOverlay.dropObject = null;
			drag_get_data(this, context, Atom.intern("LdrawFile", false), time_);
			finishDrag = false;
			grab_focus();
			return true;
		}

		public override bool drag_motion(DragContext context, int x, int y, uint time_)
		{
			DropOverlay.dropObject = null;
			drag_get_data(this, context, Atom.intern("LdrawFile", false), time_);
			return true;
		}

		public override void drag_leave(DragContext context, uint time)
		{
			DropOverlay.dropObject = null;
			queue_draw();
		}

		public override void drag_data_received (DragContext context, int x, int y,
												 SelectionData selection_data, uint info,
												 uint time)
		{
			if(!finishDrag)
			{
				// this is the drag motion, so the provided mouse coordinates are bunkum
				get_window().get_device_position(context.get_device(), out x, out y, null);
			}
			Allocation allocation;
			get_allocation(out allocation);
			
			// rotation is same as last or selected part, or no rotation
			// offest is same as last or selected part, then moved for drop location, else 0,0,0
			Matrix newTransform = Matrix.Identity;
			Vector newPosition = Vector.NullVector;
			var newColour = ColourContext.GetColourById(0);
			PartNode copyPart = model.Model.LastSubFile;
			LdrawNode addAfterNode = model.Model.Nodes.is_empty ? null : model.Model.Nodes.last();

			if(copyPart != null)
			{
				newTransform = copyPart.Transform;
				newPosition = copyPart.Center;
				newColour = copyPart.Colour;
			}
			
			// Go from world coordinates to screen:
			var v = Matrix.ForRotation(Vector(1,0,0), -viewParameters.cameraLatitude).TransformMatrix(
					Matrix.ForRotation(Vector(0,1,0), -viewParameters.cameraLongitude)).TransformVector(
					newPosition).Add(Vector(viewParameters.lduScrollX, viewParameters.lduScrollY, 0));
					
			v = Matrix(2 * allocation.width / viewParameters.lduWidth, 0, 0, 0, 2 * allocation.height / viewParameters.lduHeight, 0, 0, 0, 1).TransformVector(v);
			v = v.Add(Vector(allocation.width / 2, allocation.height / 2, 0));
			
			var dropPosition = Vector(x, y, v.Z);
			
			dropPosition = dropPosition.Subtract(Vector(allocation.width / 2, allocation.height / 2, 0));
			dropPosition = Matrix(viewParameters.lduWidth / (allocation.width), 0, 0, 0, viewParameters.lduHeight / (allocation.height), 0, 0, 0, 1)
							.TransformVector(dropPosition);
			dropPosition = dropPosition
							.Subtract(Vector(viewParameters.lduScrollX, viewParameters.lduScrollY, 0));
							
			dropPosition = 
					Matrix.ForRotation(Vector(0,1,0), viewParameters.cameraLongitude).TransformMatrix(
					Matrix.ForRotation(Vector(1,0,0), viewParameters.cameraLatitude)).TransformVector(
					dropPosition);
			var xD = dropPosition.X;
			var yD = dropPosition.Y;
			var zD = dropPosition.Z;
			foreach(var adjuster in adjusters)
			{
				xD = dropPosition.X == newPosition.X ? newPosition.X : adjuster.adjust_x(xD);
				yD = dropPosition.Y == newPosition.Y ? newPosition.Y : adjuster.adjust_y(yD);
				zD = dropPosition.Z == newPosition.Z ? newPosition.Z : adjuster.adjust_z(zD);			
			}
			
			newPosition = Vector(xD,yD,zD);		
			// get the part from the drag data
			string partName = (string)selection_data.get_data();
			if(partName.contains(","))
			{
				var sections = partName.split(",");
				partName = sections[0];
				// set the colour from the drag data. This should override any colour copied from another part.
				newColour = ColourContext.GetColourById(int.parse(sections[1]));
			}
			
			var dragFinished = finishDrag;
			if(finishDrag) finishDrag = false;
			Locator.GetObjectForName.begin(partName, (obj, res) =>
			{
				var droppedObject = Locator.GetObjectForName.end(res);
				if(droppedObject == null)
				{
					return;
				}
				var file = droppedObject.file;
				var obje = droppedObject.object;

				if(dragFinished)
				{
					LdrawNode newNode = new PartNode(newPosition, newTransform, file, obje, newColour);
					model.SelectSingle(newNode);
					UndoStack.ExecuteCommand(new AddNodeCommand(model.Model, newNode, addAfterNode));
					finishDrag = false;
					drag_finish(context, true, false, time);
				}
				else
				{
					DropOverlay.dropObject = obje;
					DropOverlay.dropLocation = newPosition;
					DropOverlay.dropTransform = newTransform;
					drag_status(context, context.get_suggested_action(), time);
					queue_draw();
				}
			});
		}

		// end of drag and drop events.
	
		private Gtk.Menu CreateContextMenu()
		{
			Gtk.Menu menu = new Gtk.Menu();
			menu.attach_widget = this;
			
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
		
		// implementation of Scrollable
		public Adjustment hadjustment
		{
			construct set
			{
				m_Hadj = value;
				if(value == null)
					return;
				m_Hadj.lower = -300;
				m_Hadj.upper = 300;
				m_Hadj.page_increment = 150;
				m_Hadj.step_increment = 30;
				m_Hadj.value_changed.connect(adj =>
				{
					viewParameters.lduScrollX = -(float)adj.value;
					queue_draw();
				});			
				m_Hadj.value = viewParameters.lduScrollX;		
			}
			get
			{
				return m_Hadj;
			}
		}
		
		public Adjustment vadjustment
		{
			construct set
			{
				m_Vadj = value;
				if(value == null)
					return;
				m_Vadj.lower = -300;
				m_Vadj.upper = 300;
				m_Vadj.page_increment = 150;
				m_Vadj.step_increment = 30;
				m_Vadj.value_changed.connect(adj =>
					{
						viewParameters.lduScrollY = -(float)adj.value;
						queue_draw();
					});
				m_Vadj.value = viewParameters.lduScrollY;					
			}
			get
			{
				return m_Vadj;
			}
		}
		
		public ScrollablePolicy hscroll_policy {get;set;}
		public ScrollablePolicy vscroll_policy {get;set;}
		
		private void update_scroll_limits()
		{
			var longTransform = Matrix.ForRotation(Vector(0,1,0), -viewParameters.cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -viewParameters.cameraLatitude);
			var m = latTransform.TransformMatrix(longTransform);
			var bounds = model.Model.BoundingBox;
			
			var new_bounds = new Ldraw.Maths.Bounds();
			new_bounds.Union(m.TransformVector(Vector(bounds.MinX, bounds.MinY, bounds.MinZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MinX, bounds.MinY, bounds.MaxZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MinX, bounds.MaxY, bounds.MinZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MinX, bounds.MaxY, bounds.MaxZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MaxX, bounds.MinY, bounds.MinZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MaxX, bounds.MinY, bounds.MaxZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MaxX, bounds.MaxY, bounds.MinZ)));
			new_bounds.Union(m.TransformVector(Vector(bounds.MaxX, bounds.MaxY, bounds.MaxZ)));	
			
			if(m_Vadj != null)
			{
				m_Vadj.lower = new_bounds.MinY;
				m_Vadj.upper = new_bounds.MaxY;
				m_Vadj.page_increment = 150;
				m_Vadj.step_increment = 30;
			}
			if(m_Hadj != null)
			{
				m_Hadj.lower = new_bounds.MinX;
				m_Hadj.upper = new_bounds.MaxX;
				m_Hadj.page_increment = 150;
				m_Hadj.step_increment = 30;
			}
		}
		
		public bool get_border(out Border border)
		{
			border = Border();
			border.bottom = 0;
			border.left = 0;
			border.right = border.top = 0;
			return true;
		}

		// end implementation of Scrollable

		private void SelectTopMostUnderMouse(double x, double y, bool toggle)
		{
			if(mouseData == null)
				mouseData = new MouseData(x, y, 1, viewParameters);
			Allocation alloc;
			get_allocation(out alloc);
			
			make_current();
			
			var top = int.min((int)y, (int)mouseData.y);
			var left = int.min((int)x, (int)mouseData.x);
			var right = int.max((int)x, (int)mouseData.x);
			var bottom = int.max((int)y, (int)mouseData.y);
			
			var chosen = Selector.SelectAt(
							left,top, right, bottom,
							model.Model,
							alloc.width, alloc.height,
							viewParameters
						);
						    
			if(chosen != null)
				model.Select(chosen, toggle);
			mouseData = null;
		}
		
		private void move_camera(double x, double y, MouseData start)
		{
			Allocation alloc;
			get_allocation(out alloc);
			var dx = (x - start.x) / alloc.width;
			var dlong = dx * 270;
			var dy = (y - start.y) / alloc.height;
			var dlat = dy * 270;
			viewParameters.cameraLatitude = start.orig_lat - (float)dlat;
			viewParameters.cameraLongitude = start.orig_long + (float)dlong;
			queue_draw();
		}
		private uint delKeyVal = keyval_from_name("Delete");
	}
	
	private class MouseData : Object
	{
		public MouseData(double x, double y, uint button, ViewParameters p)
		{
			this.x = x; this.y = y; this.button = button;
			orig_long = p.cameraLongitude;
			orig_lat = p.cameraLatitude;
		}
		
		public double x;
		public double y;
		public uint button;
		public float orig_long;
		public float orig_lat;
	}	
}
