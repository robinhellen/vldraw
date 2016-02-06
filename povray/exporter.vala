
using Ldraw.Export;
using Ldraw.Lego;

namespace Ldraw.Povray
{
	public class PovrayExporter : Object, Exporter
	{
		public string Name { get {return "Povray"; } }
		public string PreferredExtension { get { return "pov"; } }
		public ExportOptionSections OptionSections {get {return ExportOptionSections.CameraPosition | ExportOptionSections.FileName;} }

		public void Export(LdrawObject model, ExportOptions exportOptions)
			requires(exportOptions.CameraOptions != null)
		{
			var visitor = new PovrayVisitor(exportOptions.Filename);

			visitor.Visit(model);

			visitor.Finalise(model, exportOptions.CameraOptions.Longitude, exportOptions.CameraOptions.Latitude);
			visitor.Finish();
		}
	}
}
