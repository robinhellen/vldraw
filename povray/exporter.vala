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

		public virtual void Export(LdrawObject model, ExportOptions exportOptions)
			requires(exportOptions.CameraOptions != null)
		{
			var file = File.new_for_path(exportOptions.Filename);
			try
			{
				var outStream = file.replace(null, false, FileCreateFlags.NONE);
				var pov = Visitor.Visit(model);

				WriteColours(pov.Colours, outStream);
				WriteObjects(pov.ObjectsToDefine, outStream);
				WriteMainObject(model, outStream);

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
background { color rgb <$(extraOptions.BackgroundRed),$(extraOptions.BackgroundGreen),$(extraOptions.BackgroundBlue)>}";
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
				ObjectWriter.WriteDefinitionForObject(object, stream, new StandardUnionWriter());
			}
		}

		protected virtual void WriteMainObject(LdrawObject object, OutputStream stream)
		{
			ObjectWriter.WriteDefinitionForObject(object, stream, new StandardUnionWriter());
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

	private class PartBuildExporter : PovrayExporter
	{
		public override string Name { get {return "Povray by Parts"; } }
		public override string PreferredExtension {get {return "mpg";}}

		public override void Export(LdrawObject model, ExportOptions exportOptions)
		{
			InnerExport.begin(model, exportOptions);
		}

		private async void InnerExport(LdrawObject model, ExportOptions exportOptions)
		{
			// create temp dir
			var tempDir = DirUtils.mkdtemp("/tmp/vldpovXXXXXX");
			// create pov file in temp dir
			var tdf = File.new_for_path(tempDir);
			var tempPovray = tdf.get_child("sequence.pov");
			var movieFilename = exportOptions.Filename;
			exportOptions.Filename = tempPovray.get_path();
			base.Export(model, exportOptions);

			var frameCount = model.Nodes.size;
			// invoke povray to render to a sequence of image files
			stderr.printf(@"Rendering povray images to $tempDir\n");
            string[] povrayArgv = {"povray", tempPovray.get_path(), @"+KFF$(frameCount)", @"+O$tempDir/", "-D"};
            var povrayStatus = yield async_spawn(null, povrayArgv, null
					, SpawnFlags.SEARCH_PATH
					| SpawnFlags.STDOUT_TO_DEV_NULL
					| SpawnFlags.STDERR_TO_DEV_NULL
					| SpawnFlags.DO_NOT_REAP_CHILD
					, null);
			stderr.printf(@"povray finished: status $povrayStatus\n");

			int digits = (int)Math.log10(frameCount) + 1;
			// stitch the image files into a single movie
			string[] ffmpegArgv = {"ffmpeg", "-f", "image2", "-start_number", "0", "-i", @"sequence%0$(digits)d.png", movieFilename};
			var ffmpegResult = yield async_spawn(tempDir, ffmpegArgv, null
				, SpawnFlags.SEARCH_PATH
				| SpawnFlags.STDOUT_TO_DEV_NULL
				| SpawnFlags.STDERR_TO_DEV_NULL
				| SpawnFlags.DO_NOT_REAP_CHILD
				, null);
			stderr.printf(@"ffmpeg finished: status $ffmpegResult\n");

			// clean up the temp folder
			try
			{
				var childEnum = yield tdf.enumerate_children_async("standard::*", FileQueryInfoFlags.NOFOLLOW_SYMLINKS);

				var childList = yield childEnum.next_files_async(frameCount + 1);
				foreach(var fi in childList)
				{
					var child = tdf.get_child(fi.get_name());
					yield child.delete_async();
				}

				var unexpectedChildren = yield childEnum.next_files_async(1);
				if(unexpectedChildren.length() == 0)
				{
					yield childEnum.close_async();
					yield tdf.delete_async();
				}
				else
				{
					stderr.printf("Temp folder has more files in it than expected.");
					yield childEnum.close_async();
				}
			}
			catch(Error e)
			{
				stderr.printf(@"Error cleaning up temporary povray and renders: $(e.message)\n");
			}
		}

		protected override void WriteMainObject(LdrawObject object, OutputStream stream)
		{
			ObjectWriter.WriteDefinitionForObject(object, stream, new ByPartClockedUnionWriter());
		}
	}

	private class ByPartClockedUnionWriter : StandardUnionWriter
	{
		public override void WriteUnion(Action<string> write,
				Gee.List<SdlObjectReference> subObjects,
				Gee.List<SdlTriangle> triangles,
				LdrawObject object,
				int unionCount)
		{
			var header = GetObjectHeader(object, unionCount);
			write(@"// object: $(object.FileName), $unionCount distinct components.\n");
			write(header);
			write(@"#declare stepClock = int(clock * $unionCount);\n");
			write(@"#switch (stepClock)\n");
			write(@"#case($unionCount)\n");

			for(int i = (subObjects.size - 1); i >= 0; i--)
			{
				write(@"#case($i)\n");
				write(sdlGenerator.ObjectReference(subObjects[i]));
			}
			write(@"#end\n");
			if(!(triangles.is_empty))
				write(sdlGenerator.Mesh(triangles));
			write(ObjectFooter(object));
		}
	}

	private class StepBuildExporter : PovrayExporter
	{
		public override string Name { get {return "Povray by Steps"; } }

		protected override void WriteMainObject(LdrawObject object, OutputStream stream)
		{
			ObjectWriter.WriteDefinitionForObject(object, stream, new StandardUnionWriter());
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
		public abstract void WriteDefinitionForObject(LdrawObject object, OutputStream stream, UnionWriter writer);
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
