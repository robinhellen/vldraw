using Gdk;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Ui
{
	public interface Renderer : Object
	{
		public abstract void Render(
				GLDrawable drawable, Colour defaultColour, 
				Bounds viewArea, Vector eyeline, Vector center, Vector up, 
				LdrawObject model, PartNode? extraBounds,
				Gee.Set<LdrawNode> selection)
			throws GlError;
	}
}
