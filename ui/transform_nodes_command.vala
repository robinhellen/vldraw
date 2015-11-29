using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui
{
	private class TransformNodesCommand : Command
	{
		public TransformNodesCommand.Rotation(Set<LdrawNode> nodes, Vector axis, float angle)
		{
			var forwardTransform = Matrix.ForRotation(axis, angle);
			var reverseTransform = Matrix.ForRotation(axis, -angle);
			Object(Nodes: nodes, ForwardTransform: forwardTransform, ReverseTransform: reverseTransform);
		}
		
		public Set<LdrawNode> Nodes {get; construct;}
		public Matrix ForwardTransform {get; construct;}
		public Matrix ReverseTransform {get; construct;}
		
		public override void Execute()
		{
			foreach(var node in Nodes)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;
				partNode.TransformPart(ForwardTransform);
			}
		}

		public override void Undo()
		{
			foreach(var node in Nodes)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;
				partNode.TransformPart(ReverseTransform);
			}
		}
	}
}
