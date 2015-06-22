using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.Commands
{
	public class ChangeColourCommand : Command
	{
		private Collection<LdrawNode> selection;
		private Map<LdrawNode, Colour> oldColours = new HashMap<LdrawNode, Colour>();

		public ChangeColourCommand(Collection<LdrawNode> selection, Colour newColour)
		{
			Object(Selection: selection, NewColour: newColour);
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
					oldColours[node] = node.Colour;
				}
			}
		}
		public Colour NewColour {get; construct;}

		public override void Execute()
		{
			foreach(var node in Selection)
			{
				node.Colour = NewColour;
			}
		}

		public override void Undo()
		{
			foreach(var node in oldColours.keys)
			{
				node.Colour = oldColours[node];
			}
		}
	}
}
