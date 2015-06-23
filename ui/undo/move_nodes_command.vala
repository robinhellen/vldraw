using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Ui.Commands
{
	public class MoveNodesCommand : Command
	{
		public MoveNodesCommand(Collection<LdrawNode> selection, Vector move)
		{
			Object(Selection : selection, Move: move);
		}

		public Collection<LdrawNode> Selection {get; construct;}
		public Vector Move {get; construct set;}

		public override void Execute()
		{
			foreach(var node in Selection)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;

				partNode.Move(Move);
			}
		}

		public override void Undo()
		{
			var undoMove = Move.Scale(-1);
			foreach(var node in Selection)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;

				partNode.Move(undoMove);
			}
		}
		
		public override bool TryCombine(Command other)
		{			
			var otherMove = other as MoveNodesCommand;
			if(otherMove == null)
				return false;
				
			Move = otherMove.Move.Add(Move);
			return true;
		}
	}
}
