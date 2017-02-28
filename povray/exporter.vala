using Gdk;
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
		public virtual string Name { get {return "Povray"; } }
		public virtual string PreferredExtension { get { return "pov"; } }
		public ExportOptionSections OptionSections {get {return ExportOptionSections.CameraPosition | ExportOptionSections.FileName;} }

		public PovrayVisitor2 Visitor {construct; get;}
		public PovrayObjectWriter ObjectWriter {construct; get;}

		private SdlGenerator sdlGenerator = new SdlGenerator();
		private PovrayExtraOptions extraOptions = new PovrayExtraOptions();

		public virtual async void Export(LdrawObject model, ExportOptions exportOptions)
		{
			stderr.printf("Exporting to povray.\n");
			var file = File.new_for_path(exportOptions.Filename);
			var errorMsg = @"Unable to export to file $(exportOptions.Filename)";
			try
			{
				var outStream = yield file.replace_async(null, false, FileCreateFlags.NONE);
				var pov = Visitor.Visit(model);

				stderr.printf("Writing colours as povray materials.\n");
				yield WriteColours(pov.Colours, outStream);
				stderr.printf("Writing sub object definitions");
				yield WriteObjects(pov.ObjectsToDefine, outStream);
				stderr.printf("Writing main object.");
				yield WriteMainObject(model, outStream);

				yield AddGroundPlane(model, outStream);

				yield AddCameraAndLights(outStream, model, exportOptions.CameraOptions);

				yield outStream.close_async();
				stderr.printf("Finished writing povray.");
			}
			catch(Error e)
			{
				var msg = new MessageDialog(null, DialogFlags.MODAL, MessageType.WARNING, ButtonsType.CLOSE, @"$errorMsg: $(e.message)");
				msg.run();
				msg.close();
			}
		}

		private async void AddCameraAndLights(OutputStream stream, LdrawObject object, ExportCameraOptions cameraOptions)
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
background { color rgb <$(extraOptions.BackgroundRed),$(extraOptions.BackgroundGreen),$(extraOptions.BackgroundBlue)>}";
			yield stream.write_async(cameraObject.data);

			yield stream.write_async(sdlGenerator.Camera(cameraVector, object.BoundingBox.Center(), angle).data);

			yield stream.write_async(sdlGenerator.WhiteLightSource(Vector(8.5f,-400.778f,-152.778f)).data);     // Latitude,Longitude,Radius: 45,   0,477.69
			yield stream.write_async(sdlGenerator.WhiteLightSource(Vector(366.768f,-301.845f,391.846f)).data);  // Latitude,Longitude,Radius: 30, 120,477.69
			yield stream.write_async(sdlGenerator.WhiteLightSource(Vector(-198.346f,-476.692f,304.422f)).data); // Latitude,Longitude,Radius: 60,-120,477.69
		}

		private async void AddGroundPlane(LdrawObject model, OutputStream stream)
			throws Error
		{
			var planePosition = model.BoundingBox.MaxY;
			yield stream.write_async(@"plane { -y, $(-planePosition) material { texture {
	pigment { rgb <0.9,0.9,0.9> }
} }} \n\n".data);
		}

		private async void WriteColours(Set<Colour> colours, OutputStream stream)
			throws Error
		{
			foreach(var colour in colours)
			{
				yield stream.write_async(sdlGenerator.ColourDefinition(colour).data);
			}
		}

		private async void WriteObjects(Gee.List<LdrawObject> objects, OutputStream stream)
			throws Error
		{
			foreach(var object in objects)
			{
				yield ObjectWriter.WriteDefinitionForObject(object, stream, new StandardUnionWriter());
			}
		}

		protected virtual async void WriteMainObject(LdrawObject object, OutputStream stream)
		{
			yield ObjectWriter.WriteDefinitionForObject(object, stream, new StandardUnionWriter());
		}

		public Widget? GetAdditionalOptionControls()
		{
			var grid = new Grid();

			grid.attach(new Label("Background Colour: ") , 0, 0);
			var backgroundColour = new ColorButton();
			var colour = RGBA();
			colour.red = extraOptions.BackgroundRed;
			colour.green = extraOptions.BackgroundGreen;
			colour.blue = extraOptions.BackgroundBlue;
			colour.alpha = 1;
			backgroundColour.rgba = colour;
			backgroundColour.use_alpha = false;
			grid.attach(backgroundColour, 1, 0);
			backgroundColour.color_set.connect(() => {
				var rgba = backgroundColour.rgba;
				extraOptions.BackgroundRed = rgba.red;
				extraOptions.BackgroundGreen = rgba.green;
				extraOptions.BackgroundBlue = rgba.blue;
			});

			return grid;
		}
	}

	private class StepBuildExporter : PovrayExporter
	{
		public override string Name { get {return "Povray by Steps"; } }

		protected override async void WriteMainObject(LdrawObject object, OutputStream stream)
		{
			yield ObjectWriter.WriteDefinitionForObject(object, stream, new StandardUnionWriter());
		}
	}



	private class PovrayExtraOptions
	{
		public double BackgroundRed   {get; set; default = 0;}
		public double BackgroundGreen {get; set; default = 0.1;}
		public double BackgroundBlue  {get; set; default = 0.5;}
	}

	private interface PovrayObjectWriter : Object
	{
		public abstract async void WriteDefinitionForObject(LdrawObject object, OutputStream stream, UnionWriter writer);
	}

	private async int async_spawn(string? working_directory, string[] argv, string[]? envp, SpawnFlags _flags, SpawnChildSetupFunc? child_setup)
		throws SpawnError
	{
		SourceFunc cb = async_spawn.callback;
		Pid pid;
		int status = int.MIN;
		Process.spawn_async(working_directory, argv, envp, _flags | SpawnFlags.DO_NOT_REAP_CHILD, child_setup, out pid);
		var commandline = string.joinv(" ", argv);
		stderr.printf(@"Running '$commandline'\n");
		ChildWatch.add(pid, (pid, _status) => {
			status = _status;
			cb();
			});
		yield;

		return status;
	}
}
