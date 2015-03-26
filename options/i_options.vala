
using Ldraw.Maths;

namespace Ldraw.Options
{
	public interface IOptions : Object
	{
		public abstract Vector SmallGrid {get; set;}
		public abstract Vector MediumGrid {get; set;}
		public abstract Vector LargeGrid {get; set;}

		public abstract float SmallAngle {get; set;}
		public abstract float MediumAngle {get; set;}
		public abstract float LargeAngle {get; set;}

		public abstract Vector CurrentGrid {get;}
		public abstract float CurrentAngle {get;}

		public abstract int PreviewColourId { get; }

		public abstract GridSize Grid {get; set;}
	}

	public enum GridSize {Small, Medium, Large;}
}
