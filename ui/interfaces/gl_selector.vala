using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui
{
	public interface GlSelector : Object
	{
		public abstract Set<LdrawNode> SelectAt(
							int selectionLeft, int selectionTop,
							int selectionRight, int selectionBottom,
							LdrawObject model,
							int width, int height,
							ViewParameters viewParams);
	}
	
	public struct ViewParameters
	{
		public float lduWidth;
		public float lduHeight;
		public float cameraLongitude;
		public float cameraLatitude;
		public float lduScrollX;
		public float lduScrollY;
	}
}
