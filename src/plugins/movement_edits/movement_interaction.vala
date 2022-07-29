using Gtk;
using Gdk;

using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui;
using Ldraw.Ui.Commands;
using Ldraw.Ui.Widgets;

namespace Ldraw.Plugins.Movement
{
	private class MovementInteraction : Object, EditorInteraction
	{
		public AnimatedModel model {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
		public GridSetting grid {construct; private get;}
		
		public void attach(ModelEditor editor)
		{
			editor.events |= EventMask.KEY_PRESS_MASK;			
			editor.key_press_event.connect(key_press_event);
		}
		
		private bool key_press_event(Gdk.EventKey event)
		{
			if(event.keyval == up_keyval)
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, 0, grid.Z)));
				return true;
			}
			if(event.keyval == down_keyval)
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, 0, -grid.Z)));
				return true;
			}
			if(event.keyval == left_keyval)
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(-grid.X, 0, 0)));
				return true;
			}
			if(event.keyval == right_keyval)
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(grid.X, 0, 0)));
				return true;
			}
			if(event.keyval == end_keyval)
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, grid.Y, 0)));
				return true;
			}
			if(event.keyval == home_keyval)
			{
				UndoStack.ExecuteCommand(new MoveNodesCommand(model.Selection, Vector(0, -grid.Y, 0)));
				return true;
			}
			return false;
		}

		private uint up_keyval = keyval_from_name("Up");
		private uint down_keyval = keyval_from_name("Down");
		private uint left_keyval = keyval_from_name("Left");
		private uint right_keyval = keyval_from_name("Right");
		private uint home_keyval = keyval_from_name("Home");
		private uint end_keyval = keyval_from_name("End");
	}
}
