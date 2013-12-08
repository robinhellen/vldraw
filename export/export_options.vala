


namespace Ldraw.Export
{
	public class ExportOptions
	{
		public float AzimuthAngle {get; set; default = 0;}
		public float ZenithAngle {get; set; default = 0;}

		public int PixelWidth {get; set; default = 1024;}
		public int PixelHeight {get; set; default = 768;}

		public float ViewPortion {get; set; default = 1;}

		public string Filename {get; set;}
	}
}
