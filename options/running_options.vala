using Ldraw.Maths;

namespace Ldraw.Options
{
    public class RunningOptions : Object, IOptions
    {
        public Vector SmallGrid {get; set; default = Vector(1f, 1f, 1f);}
        public Vector MediumGrid {get; set; default = Vector(5f, 4f, 5f);}
        public Vector LargeGrid {get; set; default = Vector(10f, 8f, 10f);}

        public float SmallAngle {get; set; default = 7.5f;}
        public float MediumAngle {get; set; default = 22.5f;}
        public float LargeAngle {get; set; default = 90f;}

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

        public GridSize Grid{get; set; default = GridSize.Medium;}
    }
}
