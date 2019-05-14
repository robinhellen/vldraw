using Gdk;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public interface Renderer : Object
	{
		public abstract void Render(GLContext context,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay,
				ViewParameters viewParameters,
				Colour defaultColour);

		public abstract void PrepareRender(LdrawObject model);
		
		public abstract RenderCacheMode mode {set;}
	}
	
	public enum RenderCacheMode
	{
		CacheWholeModel,
		CacheSubModels
	}
}
