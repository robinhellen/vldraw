
using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;

namespace Ldraw.Povray
{
	private class PovrayVisitor2 : LdrawVisitor<Pov>
	{
		private Set<Colour> colours;
		private Gee.List<LdrawObject> objectsToDefine;

		protected override void Initialize()
		{
			colours = new HashSet<Colour>();
			objectsToDefine = new LinkedList<LdrawObject>();
		}

		protected override Pov GetResult(LdrawObject object)
		{
			//objectsToDefine.add(object);
			return (Pov)Object.new(typeof(Pov), Colours: colours, ObjectsToDefine: objectsToDefine);
		}

		public override bool VisitSubModel(PartNode line)
		{
			colours.add(line.Colour);
			if(!(line.Contents in objectsToDefine))
			{
				VisitInner(line.Contents);
				objectsToDefine.add(line.Contents);
			}
			return true;
		}
		public override bool VisitTriangle(TriangleNode line)
		{
			colours.add(line.Colour);
			return true;
		}
		public override bool VisitQuad(QuadNode line)
		{
			colours.add(line.Colour);
			return true;
		}
	}

	private class Pov : Object
	{
		public Set<Colour> Colours {get; construct set;}

		public Gee.List<LdrawObject> ObjectsToDefine {get; construct set;}
	}
}
