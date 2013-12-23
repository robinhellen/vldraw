


namespace Ldraw.Export
{
	public class ExportOptions
	{
		public float Latitude {get; set; default = 0;}
		public float Longitude {get; set; default = 0;}

		public int PixelWidth {get; set; default = 1024;}
		public int PixelHeight {get; set; default = 768;}

		public float ViewPortion {get; set; default = 1;}

		public string Filename {get; set;}
	}

	public enum ExportOptionSections
	{
		CameraPosition = 1,
		ImageDimensions = 2,
		FileName = 4;
	}
}
