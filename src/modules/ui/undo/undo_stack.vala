using Gee;


namespace Ldraw.Ui.Commands
{
	public class UndoStack : Object
	{
		private Deque<Command> undoItems = new ArrayQueue<Command>();
		private Deque<Command> redoItems = new ArrayQueue<Command>();

		public bool HasUndoItems {get; private set; default = false;}
		public bool HasRedoItems {get; private set; default = false;}
		
		public bool saved {get; private set; default = true;}
		
		public DateTime? lastCommand = null;
		private int commands_since_save = 0;

		public void ExecuteCommand(Command item)
		{
			item.Execute();
			
			if(TryCombineWithRecent(item))
			{					
				lastCommand = new DateTime.now_utc();
				return;
			}
			HasRedoItems = false;
			HasUndoItems = true;
			commands_since_save++;
			saved = false;
			redoItems.clear();
			undoItems.offer_head(item);
			
			lastCommand = new DateTime.now_utc();
		}

		public void UndoSingle()
			requires (HasUndoItems)
		{
			var item = undoItems.poll_head();

			item.Undo();

			redoItems.offer_head(item);
			HasRedoItems = true;
			if(undoItems.peek_head() == null)
				HasUndoItems = false;
			lastCommand = null;
			commands_since_save--;
			saved = commands_since_save == 0;
		}

		public void RedoSingle()
			requires(HasRedoItems)
		{
			var item = redoItems.poll_head();

			item.Execute();

			undoItems.offer_head(item);
			HasUndoItems = true;
			if(redoItems.peek_head() == null)
				HasRedoItems = false;
			lastCommand = null;
			commands_since_save++;
			saved = commands_since_save == 0;
		}

		public void Clear()
		{
			undoItems.clear();
			redoItems.clear();
			HasUndoItems = false;
			HasRedoItems = false;
			commands_since_save = 0;
			saved = true;
		}
		
		private bool TryCombineWithRecent(Command item)
		{
			var lastCmd = undoItems.peek_head();
			if(saved || lastCmd == null || lastCommand == null)
				return false;				
			
			var now = new DateTime.now_utc();
			var diff = now.difference(lastCommand);
			if(diff > 1000000)
				return false;
			
			return lastCmd.TryCombine(item);
		}
		
		public void mark_save() {
			saved = true;
			commands_since_save = 0;
		}
	}
}

