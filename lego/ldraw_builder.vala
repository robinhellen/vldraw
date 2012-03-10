namespace Ldraw.Lego
{
	public abstract class LdrawBuilder : Object
	{
		public virtual void BuildLine(LineNode line) {}
		public virtual void BuildTriangle(TriangleNode line) {}
		public virtual void BuildQuad(QuadNode line) {}
		public virtual void BuildCondLine(CondLineNode line) {}
		public virtual void BuildSubModel(PartNode line) {}
		public virtual void BuildComment(Comment line) {}
	}
}
