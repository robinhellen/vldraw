
using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.OpenGl
{    
    public interface NodeAdjuster : Object
    {
		public abstract GlMatrix GetAdjustmentFor(LdrawNode node);
	}
	
	private class DefaultNodeAdjuster : Object, NodeAdjuster
	{
		private GlMatrix m = new GlMatrix.Identity();
		
		public GlMatrix GetAdjustmentFor(LdrawNode node)
		{
			return m;
		}
	}
}
