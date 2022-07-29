using Gee;

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
			Model.AddNode(NewNode, InsertAfter);
		}

		public override void Undo()
		{
			Model.RemoveNode(NewNode);
		}
	}

	public class AddNodesCommand : Command
	{
		public AddNodesCommand(LdrawObject model, Collection<LdrawNode> newNode, LdrawNode? insertAfter)
		{
			Object(Model: model, NewNodes: newNode, InsertAfter: insertAfter);
		}

		public LdrawObject Model {get; construct;}
		public Collection<LdrawNode> NewNodes {get; construct;}
		public LdrawNode InsertAfter {get; construct;}

		public override void Execute()
		{

			Model.AddNodes(NewNodes);
		}

		public override void Undo()
		{
			Model.RemoveNodes(NewNodes);
		}
	}
}
