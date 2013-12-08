using Ldraw.Lego;

namespace Ldraw.Ui.Commands
{
	public class AddNodeCommand : Command
	{
		public AddNodeCommand(LdrawObject model, LdrawNode newNode, LdrawNode? insertAfter)
		{
			Object(Model: model, NewNode: newNode, InsertAfter: insertAfter);
		}

		public LdrawObject Model {get; construct;}
		public LdrawNode NewNode {get; construct;}
		public LdrawNode InsertAfter {get; construct;}

		public override void Execute()
		{
			Model.ClearSelection();
			NewNode.Selected = true;
			Model.AddNode(NewNode, InsertAfter);
		}

		public override void Undo()
		{
			Model.RemoveNode(NewNode);
		}
	}
}
