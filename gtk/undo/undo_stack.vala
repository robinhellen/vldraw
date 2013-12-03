using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.Commands
{
	public class UndoStack : Object
	{
		private Deque<Command> undoItems = new ArrayQueue<Command>();
		private Deque<Command> redoItems = new ArrayQueue<Command>();

		public bool HasUndoItems {get; private set; default = false;}
		public bool HasRedoItems {get; private set; default = false;}

		public void ExecuteCommand(Command item)
		{
			HasRedoItems = false;
			HasUndoItems = true;
			redoItems.clear();
			undoItems.offer_head(item);
			item.Execute();
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
		}

		public void Clear()
		{
			undoItems.clear();
			redoItems.clear();
			HasUndoItems = false;
			HasRedoItems = false;
		}
	}

	public abstract class Command : Object
	{
		public abstract void Undo();

		public abstract void Execute();
	}

	public class ChangeColourCommand : Command
	{
		private Collection<LdrawNode> selection;
		private Map<LdrawNode, int> oldColours = new HashMap<LdrawNode, int>();

		public ChangeColourCommand(Collection<LdrawNode> selection, int newColourId)
		{
			Object(Selection: selection, NewColourId: newColourId);
		}

		public Collection<LdrawNode> Selection
		{
			get
			{
				return selection;
			}
			construct
			{
				selection = value;
				foreach(var node in value)
				{
					oldColours[node] = node.ColourId;
				}
			}
		}
		public int NewColourId {get; construct;}

		public override void Execute()
		{
			foreach(var node in Selection)
			{
				node.ColourId = NewColourId;
			}
		}

		public override void Undo()
		{
			foreach(var node in oldColours.keys)
			{
				node.ColourId = oldColours[node];
			}
		}
	}
}

