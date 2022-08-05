using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui;

namespace Ldraw.Refactor
{	
	private class SwitchColourCommand : Command {
		Colour original;
		Colour new_colour;
		Collection<PartNode> references;
		
		public SwitchColourCommand(Colour original, Colour new_colour, SwitchMode mode, AnimatedModel model) {
			this.original = original;
			this.new_colour = new_colour;
			references = get_references(model, original, mode);			
		}
		
		public override void Execute() {
			foreach(var node in references)
				node.Colour = new_colour;
		}
		
		public override void Undo() {
			foreach(var node in references)
				node.Colour = original;
		}
		
		private Collection<PartNode> get_references(AnimatedModel model, Colour original, SwitchMode mode) {
			switch(mode) {
				case SwitchMode.CurrentSubModel:
					return get_sub_model_references(model, original);
				case SwitchMode.WholeModel:
					return get_all_references(model, original);
				case SwitchMode.Selection:
					return get_selection_references(model, original);
			}
			assert_not_reached();
		}
		
		private Collection<PartNode> get_all_references(AnimatedModel model, Colour original) {
			var mpd = model.File as MultipartModel;
			if(mpd == null)
				return get_sub_model_references(model, original);
			var references = Iterator.concat<LdrawNode>(mpd.SubModels.map<Iterator<LdrawNode>>(x => x.Nodes.iterator()))
					.map<PartNode?>(x => x as PartNode)
					.filter(x => x != null)
					.filter(x => x.Colour == original);
			
			var result = new ArrayList<PartNode>();
			references.foreach(x => {result.add(x); return true;});		
			return result;
		}
		
		private Collection<PartNode> get_sub_model_references(AnimatedModel model, Colour original) {
			var result = new ArrayList<PartNode>();
			foreach(var pn in model.Model.NodesOfType<PartNode>()) {
				if(pn.Colour == original)
					result.add(pn);
			}
			return result;
		}
		
		private Collection<PartNode> get_selection_references(AnimatedModel model, Colour original) {
			var result = new ArrayList<PartNode>();
			foreach(var n in model.Selection) {
				var pn = n as PartNode;
				if(pn != null && pn.Colour == original)
					result.add(pn);
			}
			return result;
		}
	}
}
