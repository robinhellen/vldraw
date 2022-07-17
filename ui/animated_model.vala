using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Ui
{
    public class AnimatedModel : GLib.Object
    {
        public AnimatedModel(LdrawFile model)
        {
            var map = new HashMap<string, float?>();
            var selection = new HashSet<LdrawNode>();
            GLib.Object(
				Model: model.MainObject, 
				CurrentParameters: map,
				Selection: selection,
				File: model
			);
        }
        
		public LdrawObject Model {get; construct set;}
		public LdrawFile File {get; construct set;}
        public Map<string, float?> CurrentParameters {get; construct; }
        public Set<LdrawNode> Selection {get; construct;}

		public void Load(LdrawFile model)
		{
			File = model;
			Model = model.MainObject;
			CurrentParameters.clear();
			Selection.clear();
			
			view_changed();
			Model.VisibleChange.connect(() => view_changed());
		}
		
		public void Switch(LdrawObject object)
		{
			Model = object;
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
			changed_selection();
		}
		
		public void Select(Set<LdrawNode> nodes, bool toggle)
		{
			if(toggle)
				ToggleSelection(nodes);
			else
				SelectOnly(nodes);
			changed_selection();
		}
		
		private void SelectOnly(Set<LdrawNode> nodes)
		{
			Selection.clear();
			Selection.add_all(nodes);
		}
		
		private void ToggleSelection(Set<LdrawNode> nodes)
		{
			foreach(var node in nodes)
			{
				if(node in Selection)
					Selection.remove(node);
				else
					Selection.add(node);
			}
		}
		
		public void SelectSingle(LdrawNode node)
		{
			Selection.clear();
			Selection.add(node);
			changed_selection();
		}
		
		public void SelectAll(Collection<LdrawNode> node)
		{
			Selection.add_all(node);
			changed_selection();
		}
		
		public LdrawNode? LastSelected
		{
			get
			{
				weak LdrawNode? node = Model.Nodes.filter(x => x in Selection).fold<unowned LdrawNode?>((x, a) => x, null);
				return node;
			}
		}

        public signal void view_changed();
        public signal void changed_selection();
    }	
}
