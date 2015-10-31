using Ldraw.Lego;

namespace Ldraw.Ui
{
	public interface GlSelector : Object
	{
		public abstract LdrawNode? SelectAt(
							int selectionLeft, int selectionTop,
							int selectionRight, int selectionBottom,
							LdrawObject model,
							int width, int height,
							float lduViewWidth, float lduViewHeight, // scale
						    float cameraLongitude, float cameraLatitude,
						    float lduScrollX, float lduScrollY);
	}
}
