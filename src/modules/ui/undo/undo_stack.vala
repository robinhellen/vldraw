using Gee;


namespace Ldraw.Ui.Commands
{
	public class UndoStack : Object
	{
		private Deque<Command> undoItems = new ArrayQueue<Command>();
		private Deque<Command> redoItems = new ArrayQueue<Command>();

		public bool HasUndoItems {get; private set; default = false;}
		public bool HasRedoItems {get; private set; default = false;}
		
		public DateTime? lastCommand = null;

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
		}

		public void Clear()
		{
			undoItems.clear();
			redoItems.clear();
			HasUndoItems = false;
			HasRedoItems = false;
		}
		
		private bool TryCombineWithRecent(Command item)
		{
			var lastCmd = undoItems.peek_head();
			if(lastCmd == null || lastCommand == null)
				return false;				
			
			var now = new DateTime.now_utc();
			var diff = now.difference(lastCommand);
			if(diff > 1000000)
				return false;
			
			return lastCmd.TryCombine(item);
		}
	}
}

