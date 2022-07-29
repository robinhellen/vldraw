
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.OpenGl;

namespace Ldraw.Steps
{
	private class HideNodesStrategy : Object, RenderNodeStrategy
	{
		public HideModel Model {construct; private get;}
				
		public void StartModel(LdrawObject object)
		{}
				
		public bool ShouldRenderNode(LdrawNode node)
		{
			if(Model.is_hidden(node))
				return false;
			
			return true;
		}
	}
}
