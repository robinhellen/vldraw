using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawVisitor<T> : Object
	{
		public virtual void Visit(LdrawObject object)
		{
			foreach(var node in object.Nodes)
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
