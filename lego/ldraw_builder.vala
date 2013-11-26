using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawVisitor : Object
	{
		public void Visit(LdrawObject object, bool useFlattened = false)
		{
			var nodesToVisit = useFlattened ? object.FlattenedNodes : object.Nodes;

			foreach(var node in nodesToVisit)
			{
				VisitNode(node);
			}
		}

		public virtual void VisitNode(LdrawNode node)
		{
			node.Accept(this);
		}

		public virtual void VisitLine(LineNode line) {}
		public virtual void VisitTriangle(TriangleNode line) {}
		public virtual void VisitQuad(QuadNode line) {}
		public virtual void VisitCondLine(CondLineNode line) {}
		public virtual void VisitSubModel(PartNode line) {}
		public virtual void VisitComment(Comment line) {}
	}
}
