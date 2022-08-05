using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Lego.Library;
using Ldraw.Maths;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	private enum SwitchMode {
		WholeModel,
		CurrentSubModel,
		Selection,
	}
	
	private class SwitchPartCommand : Command {
		LdrawPart original;
		LdrawPart new_part;
		Collection<PartNode> references;
		
		public SwitchPartCommand(LdrawPart original, LdrawPart new_part, SwitchMode mode, AnimatedModel model) {
			this.original = original;
			this.new_part = new_part;
			references = get_references(model, original, mode);			
		}
		
		public override void Execute() {
			foreach(var node in references)
				node.change_part(new_part, new_part.MainObject);
		}
		
		public override void Undo() {
			foreach(var node in references)
				node.change_part(original, original.MainObject);
		}
		
		private Collection<PartNode> get_references(AnimatedModel model, LdrawPart original, SwitchMode mode) {
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
		
		private Collection<PartNode> get_all_references(AnimatedModel model, LdrawPart original) {
			var mpd = model.File as MultipartModel;
			if(mpd == null)
				return get_sub_model_references(model, original);
			var references = Iterator.concat<LdrawNode>(mpd.SubModels.map<Iterator<LdrawNode>>(x => x.Nodes.iterator()))
					.map<PartNode?>(x => x as PartNode)
					.filter(x => x != null)
					.filter(x => x.File == original);
			
			var result = new ArrayList<PartNode>();
			references.foreach(x => {result.add(x); return true;});		
			return result;
		}
		
		private Collection<PartNode> get_sub_model_references(AnimatedModel model, LdrawPart original) {
			var result = new ArrayList<PartNode>();
			foreach(var pn in model.Model.NodesOfType<PartNode>()) {
				if(pn.File == original)
					result.add(pn);
			}
			return result;
		}
		
		private Collection<PartNode> get_selection_references(AnimatedModel model, LdrawPart original) {
			var result = new ArrayList<PartNode>();
			foreach(var n in model.Selection) {
				var pn = n as PartNode;
				if(pn != null && pn.File == original)
					result.add(pn);
			}
			return result;
		}
	}
}
