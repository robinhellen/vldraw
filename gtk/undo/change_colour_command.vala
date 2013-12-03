using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.Commands
{
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
