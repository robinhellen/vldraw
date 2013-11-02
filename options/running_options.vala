using Ldraw.Maths;

namespace Ldraw.Options
{
	public class RunningOptions : Object, IOptions
	{
		public RunningOptions(IOptions initialValues)
		{
			SmallGrid = initialValues.SmallGrid;
			MediumGrid = initialValues.MediumGrid;
			LargeGrid = initialValues.LargeGrid;

			SmallAngle = initialValues.SmallAngle;
			MediumAngle = initialValues.MediumAngle;
			LargeAngle = initialValues.LargeAngle;

			Grid = initialValues.Grid;
		}

		public Vector SmallGrid {get; set;}
		public Vector MediumGrid {get; set;}
		public Vector LargeGrid {get; set;}

		public float SmallAngle {get; set;}
		public float MediumAngle {get; set;}
		public float LargeAngle {get; set;}

		public Vector CurrentGrid
		{
			get
			{
				switch(Grid)
				{
					case GridSize.Small:
						return SmallGrid;
					case GridSize.Large:
						return LargeGrid;
					case GridSize.Medium:
					default:
						return MediumGrid;
				}
			}
		}

		public float CurrentAngle
		{
			get
			{
				switch(Grid)
				{
					case GridSize.Small:
						return SmallAngle;
					case GridSize.Large:
						return LargeAngle;
					case GridSize.Medium:
					default:
						return MediumAngle;
				}
			}
		}

		public int PreviewColourId { get {return 14;} }

		public GridSize Grid{get; set;}
	}
}
