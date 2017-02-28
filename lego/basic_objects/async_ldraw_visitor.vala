using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class AsyncLdrawVisitor<T> : Object
	{
		public virtual async T? Visit(LdrawObject object)
		{
			yield Initialize();
			foreach(var node in object.Nodes)
			{
				yield VisitNode(node);
			}
			return yield GetResult(object);
		}

		protected async void VisitInner(LdrawObject object)
		{
			foreach(var node in object.Nodes)
			{
				yield VisitNode(node);
			}
		}

		public virtual async void VisitNode(LdrawNode node)
		{
			yield node.AcceptAsync(this);
		}

		public virtual async void VisitLine(LineNode line) {}
		public virtual async void VisitTriangle(TriangleNode line) {}
		public virtual async void VisitQuad(QuadNode line) {}
		public virtual async void VisitCondLine(CondLineNode line) {}
		public virtual async void VisitSubModel(PartNode line) {}
		public virtual async void VisitComment(Comment line) {}

		protected virtual async void Initialize() {}
		protected virtual async T? GetResult(LdrawObject object) {return null;}
	}
}
