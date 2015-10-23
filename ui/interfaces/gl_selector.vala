using Ldraw.Lego;

namespace Ldraw.Ui
{
	public interface GlSelector : Object
	{
		public abstract LdrawNode? SelectAt(int x,int y,LdrawObject model,
							int width, int height,
							float lduViewWidth, float lduViewHeight, // scale
						    float cameraLongitude, float cameraLatitude,
						    float lduScrollX, float lduScrollY);
	}
}
