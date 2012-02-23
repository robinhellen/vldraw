namespace Ldraw.Lego
{
	public abstract class LdrawBuilder : Object
	{
		public void BuildLine(LineNode line) {}
		public void BuildTriangle(TriangleNode line) {}
		public void BuildQuad(QuadNode line) {}
		public void BuildCondLine(CondLineNode line) {}
		public void BuildSubModel(PartNode line) {}
		public void BuildComment(Comment line) {}
	}
}
