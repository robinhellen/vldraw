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
				stderr.printf("Writing sub object definitions\n");
				yield WriteObjects(pov.ObjectsToDefine, outStream);
				stderr.printf("Writing main object.\n");
				yield WriteMainObject(model, outStream);

				yield AddGroundPlane(model, outStream);

				yield AddCameraAndLights(outStream, model, exportOptions.CameraOptions);

				yield outStream.close_async();
				stderr.printf("Finished writing povray.\n");
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
			
			var scene_center = object.BoundingBox.Center();
			var object_ball = object.BoundingBox.Radius;

			float cameraDistance = object.BoundingBox.Radius / tanf(angleRad / 2);

			var cameraVector = vector_from_lat_long(latitude, longitude, cameraDistance)
					.Add(scene_center);

			var cameraObject = @"object { $(EscapeFilenameForSdl(object.FileName)) }
// Background:
background { color rgb <$(extraOptions.BackgroundRed),$(extraOptions.BackgroundGreen),$(extraOptions.BackgroundBlue)>}";
			yield stream.write_async(cameraObject.data);

			yield stream.write_async(sdlGenerator.Camera(cameraVector, scene_center, angle).data);
			
			var lights = new ArrayList<Vector?>();
			lights.add(vector_from_lat_long_deg(45, 0,    5 * object_ball));
			lights.add(vector_from_lat_long_deg(30, 120,  5 * object_ball));
			lights.add(vector_from_lat_long_deg(60, -120, 5 * object_ball));
			
			foreach(var light in lights)
			{
				yield stream.write_async(sdlGenerator.WhiteLightSource(light).data);
			}
		}
		
		private Vector vector_from_lat_long(float lat, float long, float radius)
		{
			return Vector(radius * cosf(lat) * sinf(long),
						  -radius * sinf(lat),
						  -radius * cosf(lat) * cosf(long));
		}
		
		private Vector vector_from_lat_long_deg(float lat, float long, float radius)
		{
			return vector_from_lat_long((float)PI * lat / 180, (float)PI * long / 180, radius);
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
		var extra_flags = SpawnFlags.DO_NOT_REAP_CHILD
						| SpawnFlags.STDOUT_TO_DEV_NULL
						| SpawnFlags.STDERR_TO_DEV_NULL;
		Process.spawn_async(working_directory, argv, envp, _flags | extra_flags, child_setup, out pid);
		var commandline = string.joinv(" ", argv);
		stderr.printf(@"Running '$commandline'\n");
		ChildWatch.add(pid, (pid, _status) => {
			status = _status;
			cb();
			});
		yield;

		return status;
	}

	private async int async_spawn_with_stderr(string? working_directory, string[] argv, string[]? envp, SpawnFlags _flags, SpawnChildSetupFunc? child_setup, ProcessOutputLine on_stderr)
		throws SpawnError
	{
		SourceFunc cb = async_spawn_with_stderr.callback;
		Pid pid;
		int status = int.MIN;
		var extra_flags = SpawnFlags.DO_NOT_REAP_CHILD
						| SpawnFlags.STDOUT_TO_DEV_NULL;
		int std_error;
		Process.spawn_async_with_pipes(working_directory, argv, envp, _flags | extra_flags, child_setup, out pid, null, null, out std_error);
		var commandline = string.joinv(" ", argv);
		stderr.printf(@"Running '$commandline'\n");
		ChildWatch.add(pid, (pid, _status) => {
			status = _status;
			cb();
			});
		IOChannel error = new IOChannel.unix_new (std_error);
		error.add_watch (IOCondition.IN | IOCondition.HUP, (channel, condition) => {
			if (condition == IOCondition.HUP) {
				return false;
			}

			try {
				string line;
				channel.read_line (out line, null, null);
				on_stderr(line);
			} catch (IOChannelError e) {
				print ("IOChannelError: %s\n", e.message);
				return false;
			} catch (ConvertError e) {
				print ("ConvertError: %s\n", e.message);
				return false;
			}

			return true;
		});
		yield;

		return status;
	}
	
	private delegate void ProcessOutputLine(string line);
}
