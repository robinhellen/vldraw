

namespace Ldraw
{
	public interface IReportProgress : Object
	{
		public abstract void Report(string event, float progress)
			requires(progress >= 0.0f);
			//requires(progress <= 1.0f);
	}
}
