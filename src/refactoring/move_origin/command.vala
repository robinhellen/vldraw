using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class MoveOriginCommand : Command
	{
		Vector originShift;
		Vector reverseShift;
		LdrawObject target;
		Collection<PartNode> references;
		
		public MoveOriginCommand(Vector v, AnimatedModel model)
		{
			originShift = v;
			reverseShift = v.Scale(-1F);
			target = model.Model;
			references = GetReferences(model, target);			
		}
		
		public override void Execute()
		{
			// update all references so that the overall view doesn't change
			foreach(var node in references)
				node.Move(originShift);
			// move all nodes in the current model
			var visitor = new MoveOriginVisitor(reverseShift);
			visitor.Visit(target);
		}
		
		public override void Undo()
		{
			// move all nodes in the current model
			var visitor = new MoveOriginVisitor(originShift);
			visitor.Visit(target);
			// update all references so that the overall view doesn't change
			foreach(var node in references)
				node.Move(reverseShift);
		}
		
		public Collection<PartNode> GetReferences(AnimatedModel model, LdrawObject target)
		{
			var mpd = model.File as MultipartModel;
			if(mpd == null)
				return Collection.empty<PartNode>();
				
			var references = Iterator.concat<LdrawNode>(mpd.SubModels.map<Iterator<LdrawNode>>(x => x.Nodes.iterator()))
					.map<PartNode>(x => x as PartNode)
					.filter(x => x != null)
					.filter(x => x.Contents.FileName == target.FileName);
			
			var result = new ArrayList<PartNode>();
			references.foreach(x => {result.add(x); return true;});		
			return result;
		}
	}
}
