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
		public abstract void Render(
				GLContext context, Colour defaultColour, 
				Bounds viewArea, Vector eyeline, Vector center, Vector up, 
				LdrawObject model,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay = null);
				
		public abstract void Render2(GLContext context,
				Gee.Set<LdrawNode> selection, 
				Overlay? overlay,
				float lduWidth, float lduHeight,
				float cameraLongitude, float cameraLatitude,
				float lduScrollX, float lduScrollY);
				
		public abstract void PrepareRender(LdrawObject model, Colour defaultColour);
	}
}
