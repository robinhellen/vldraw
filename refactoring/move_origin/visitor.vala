
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Refactor
{
	public class MoveOriginVisitor : LdrawVisitor<void>
	{
		Vector shift;
		
		public MoveOriginVisitor(Vector shift)
		{
			this.shift = shift;
		}		

		public override void VisitLine(LineNode line) {}
		public override void VisitTriangle(TriangleNode line) {}
		public override void VisitQuad(QuadNode line) {}
		public override void VisitCondLine(CondLineNode line) {}
		public override void VisitSubModel(PartNode line) 
		{
			line.Move(shift);
		}		
	}
}

