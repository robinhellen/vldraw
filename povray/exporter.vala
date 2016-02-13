
using Gee;
using GLib.Math;
using Gtk;

using Ldraw.Export;
using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	private class PovrayExporter : Object, Exporter
	{
		public string Name { get {return "Povray"; } }
		public string PreferredExtension { get { return "pov"; } }
		public ExportOptionSections OptionSections {get {return ExportOptionSections.CameraPosition | ExportOptionSections.FileName;} }

		public PovrayVisitor2 Visitor {construct; get;}
		public PovrayObjectWriter ObjectWriter {construct; get;}

		private SdlGenerator sdlGenerator = new SdlGenerator();

		public void Export(LdrawObject model, ExportOptions exportOptions)
			requires(exportOptions.CameraOptions != null)
		{
			var file = File.new_for_path(exportOptions.Filename);
			try
			{
				var outStream = file.replace(null, false, FileCreateFlags.NONE);
				var pov = Visitor.Visit(model);

				WriteColours(pov.Colours, outStream);
				WriteObjects(pov.ObjectsToDefine, outStream);

				AddGroundPlane(model, outStream);

				AddCameraAndLights(outStream, model, exportOptions.CameraOptions);

				outStream.close();
			}
			catch(Error e)
			{
				var msg = new MessageDialog(null, DialogFlags.MODAL, MessageType.WARNING, ButtonsType.CLOSE, @"Unable to export to file $(exportOptions.Filename): $(e.message)");
				msg.run();
				msg.close();
			}
		}

		private void AddCameraAndLights(OutputStream stream, LdrawObject object, ExportCameraOptions cameraOptions)
			throws Error
		{
			var angle = 67.3801f;
			var angleRad =  (float)PI * angle / 180;
			var longitude = (float)PI * cameraOptions.Longitude / 180;
			var latitude =  (float)PI * cameraOptions.Latitude / 180;

			float cameraDistance = object.BoundingBox.Radius / tanf(angleRad / 2);

			var cameraVector = Vector(	cameraDistance * cosf(latitude) * sinf(longitude),
										-cameraDistance * sinf(latitude),
										-cameraDistance * cosf(latitude) * cosf(longitude))
					.Add(object.BoundingBox.Center());

			var cameraObject = @"object { $(EscapeFilenameForSdl(object.FileName)) }
// Background:
background { color rgb <0,0.1,0.5>}";
			stream.write(cameraObject.data);

			stream.write(sdlGenerator.Camera(cameraVector, object.BoundingBox.Center(), angle).data);

			stream.write(sdlGenerator.WhiteLightSource(Vector(8.5f,-400.778f,-152.778f)).data);     // Latitude,Longitude,Radius: 45,   0,477.69
			stream.write(sdlGenerator.WhiteLightSource(Vector(366.768f,-301.845f,391.846f)).data);  // Latitude,Longitude,Radius: 30, 120,477.69
			stream.write(sdlGenerator.WhiteLightSource(Vector(-198.346f,-476.692f,304.422f)).data); // Latitude,Longitude,Radius: 60,-120,477.69
		}

		private void AddGroundPlane(LdrawObject model, OutputStream stream)
			throws Error
		{
			var planePosition = model.BoundingBox.MaxY;
			stream.write(@"plane { -y, $(-planePosition) material { texture {
	pigment { rgb <0.9,0.9,0.9> }
} }} \n\n".data);
		}

		private void WriteColours(Set<Colour> colours, OutputStream stream)
			throws Error
		{
			foreach(var colour in colours)
			{
				stream.write(sdlGenerator.ColourDefinition(colour).data);
			}
		}

		private void WriteObjects(Gee.List<LdrawObject> objects, OutputStream stream)
			throws Error
		{
			foreach(var object in objects)
			{
				ObjectWriter.WriteDefinitionForObject(object, stream);
			}
		}
	}

	public interface PovrayObjectWriter : Object
	{
		public abstract void WriteDefinitionForObject(LdrawObject object, OutputStream stream);
	}
}
