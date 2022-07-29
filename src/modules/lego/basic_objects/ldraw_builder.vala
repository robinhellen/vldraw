using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawVisitor<T> : Object
	{
		public virtual T? Visit(LdrawObject object)
		{
			Initialize();
			foreach(var node in object.Nodes)
			{
				if(!VisitNode(node))
					break;
			}
			return GetResult(object);
		}
		
		protected bool VisitInner(LdrawObject object)
		{
			foreach(var node in object.Nodes)
			{
				if(!VisitNode(node))
					return false;
			}
			return true;
		}

		public virtual bool VisitNode(LdrawNode node)
		{
			return node.Accept(this);
		}

		public virtual bool VisitLine(LineNode line) {return true;}
		public virtual bool VisitTriangle(TriangleNode line) {return true;}
		public virtual bool VisitQuad(QuadNode line) {return true;}
		public virtual bool VisitCondLine(CondLineNode line) {return true;}
		public virtual bool VisitSubModel(PartNode line) {return true;}
		public virtual bool VisitComment(Comment line) {return true;}
		
		protected virtual void Initialize() {}
		protected virtual T? GetResult(LdrawObject object) {return null;}
	}
}
