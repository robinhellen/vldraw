


namespace Ldraw.Export
{
	public class ExportOptions
	{
		public ExportCameraOptions? CameraOptions {get; set;}

		public ExportImageDiemnsions? ImageDimensions{get;set;}

		public string? Filename {get; set;}
	}
	
	public class ExportCameraOptions
	{
		public float Latitude {get; set; default = 0;}
		public float Longitude {get; set; default = 0;}		
	}
	
	public class ExportImageDiemnsions
	{
		public int PixelWidth {get; set; default = 1024;}
		public int PixelHeight {get; set; default = 768;}		
	}

	public enum ExportOptionSections
	{
		CameraPosition = 1,
		ImageDimensions = 2,
		FileName = 4;
	}
}
