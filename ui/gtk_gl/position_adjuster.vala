

namespace Ldraw.Ui.GtkGl
{
	public interface PositionAdjuster : Object
	{
		public abstract float adjust_x(float x);
		public abstract float adjust_y(float y);
		public abstract float adjust_z(float z);
	}
}
