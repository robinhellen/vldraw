
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
		
		public override bool VisitSubModel(PartNode line) 
		{
			line.Move(shift);
			return true;
		}		
	}
}

