using Ldraw.Maths;

namespace Ldraw.Options
{
	public class DefaultOptions : Object, IOptions
	{
		public Vector SmallGrid {get{return Vector(1f,1f,1f);} set{}}
		public Vector MediumGrid {get{return Vector(5f, 4f, 5f);} set{}}
		public Vector LargeGrid {get{return Vector(10f, 8f, 10f);} set{}}

		public float SmallAngle {get{return 7.5f;} set{}}
		public float MediumAngle {get{return 22.5f;} set{}}
		public float LargeAngle {get{return 90f;} set{}}

		public Vector CurrentGrid {get{return MediumGrid;}}
		public float CurrentAngle {get{return 22.5f;}}

		public int PreviewColourId { get {return 14;} }

		public GridSize Grid{get{return GridSize.Medium;} set{}}
	}
}
