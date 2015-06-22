using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Ui
{
    public class AnimatedModel : GLib.Object
    {
        public AnimatedModel(LdrawObject? model)
        {
            var map = new HashMap<string, float?>();
            var selection = new HashSet<LdrawNode>();
            GLib.Object(
				Model: model, 
				CurrentParameters: map,
				Selection: selection
			);
        }
        
		public LdrawObject Model {get; construct set;}
        public Map<string, float?> CurrentParameters {get; construct; }
        public Set<LdrawNode> Selection {get; construct;}

		public void Load(LdrawObject model)
		{
			Model = model;
			CurrentParameters.clear();
			Selection.clear();
			
			view_changed();
			Model.VisibleChange.connect(() => view_changed());
		}

        public void UpdateParameter(string Identifier, float value)
        {
            CurrentParameters[Identifier] = value;
			view_changed();
        }
        
        public void ClearSelection()
        {
			Selection.clear();
			view_changed();
		}
		
		public void Select(LdrawNode node)
		{
			Selection.add(node);
			view_changed();
		}
		
		public void SelectAll(Collection<LdrawNode> node)
		{
			Selection.add_all(node);
			view_changed();
		}

        public signal void view_changed();
    }	
}
