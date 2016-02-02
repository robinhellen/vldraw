
using Ldraw.Export;
using Ldraw.Lego;

namespace Ldraw.Povray
{	
	public class PovrayExporter : Object, Exporter
	{
		public string Name { get {return "Povray"; } }
		public string PreferredExtension { get { return "pov"; } }
		public ExportOptionSections OptionSections {get {return ExportOptionSections.CameraPosition | ExportOptionSections.ImageDimensions | ExportOptionSections.FileName;} }
		
		public void Export(LdrawObject model, string filename)
		{
			var visitor = new PovrayVisitor(filename);

			visitor.Visit(model);

			visitor.Finalise(model);
			visitor.Finish();
		}
	}
}
