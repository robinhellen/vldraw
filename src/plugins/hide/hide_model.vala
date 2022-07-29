using Gee;

using Ldraw.Lego;
using Ldraw.Ui;
using Ldraw.Ui.Commands;

namespace Ldraw.Steps
{
	private class HideModel : Object
	{
		public AnimatedModel Model { construct; private get; }
		
		construct
		{
			// TODO: remember which nodes are hidden for each individual sub-file of a multipart
			Model.notify["Model"].connect(() => { unhide_all(); }); 
		}
		
		private Set<LdrawNode> hidden_nodes = new HashSet<LdrawNode>();
		
		public void hide_selection()
		{
			hidden_nodes.add_all(Model.Selection);
			Model.view_changed();
		}
		
		public void unhide_selection()
		{
			hidden_nodes.remove_all(Model.Selection);
			Model.view_changed();
		}
		
		public void unhide_all()
		{
			hidden_nodes.clear();
			Model.view_changed();
		}
		
		public bool is_hidden(LdrawNode node)
		{
			return hidden_nodes.contains(node);
		}
	}
}
