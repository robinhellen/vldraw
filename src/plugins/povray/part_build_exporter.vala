using GLib.Math;

using Ldraw.Export;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;

namespace Ldraw.Povray
{
	private class PartBuildExporter : PovrayExporter
	{
		public override string Name { get {return "Povray by Parts"; } }
		public override string PreferredExtension {get {return "mp4";}}

		public override async void Export(LdrawObject model, ExportOptions exportOptions)
		{
			var export_model = prepare_model(model);
			stderr.printf("Exporting to movie.\n");
			// create temp dir
			var tempDir = DirUtils.mkdtemp("/tmp/vldpovXXXXXX");
			// create pov file in temp dir
			var tdf = File.new_for_path(tempDir);
			var tempPovray = tdf.get_child("sequence.pov");
			var movieFilename = exportOptions.Filename;
			exportOptions.Filename = tempPovray.get_path();
			yield base.Export(export_model, exportOptions);

			var frameCount = export_model.Nodes.size;
			// invoke povray to render to a sequence of image files
			stderr.printf(@"Rendering povray images to $tempDir\n");
            string[] povrayArgv = {"povray", tempPovray.get_path(), @"+KFF$(frameCount)", @"+O$tempDir/", "-D"/*, "+WT1"*/};
            var povrayStatus = yield async_spawn(null, povrayArgv, null
					, SpawnFlags.SEARCH_PATH
					| SpawnFlags.STDOUT_TO_DEV_NULL
					| SpawnFlags.STDERR_TO_DEV_NULL
					| SpawnFlags.DO_NOT_REAP_CHILD
					, null);
			stderr.printf(@"povray finished: status $povrayStatus\n");

			int digits = (int)log10(frameCount) + 1;
			// stitch the image files into a single movie
			string[] ffmpegArgv = {"ffmpeg", "-y", "-f", "image2", "-start_number", "0", "-i", @"sequence%0$(digits)d.png", movieFilename};
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

		protected override async void WriteMainObject(LdrawObject object, OutputStream stream)
		{
			yield ObjectWriter.WriteDefinitionForObject(object, stream, new ByPartClockedUnionWriter());
		}
		
		private LdrawObject prepare_model(LdrawObject original)
		{
			var new_model = new LdrawObject("Inlined " + original.Description);
			
			foreach(var node in original.Nodes)
			{
				var pn = node as PartNode;
				if(pn == null || (pn.File as LdrawPart) != null)
				{
					new_model.AddNode(node);
					continue;
				}
				var cts = prepare_model(pn.Contents);
				foreach(var child_node in cts.Nodes)
				{
					new_model.AddNode(child_node.TransformNode(pn.Transform, pn.Center));
				}
			}			
			new_model.FileName = original.FileName;
			return new_model;
		}
	}

	private class ByPartClockedUnionWriter : StandardUnionWriter
	{
		public override async void WriteUnion(OutputStream s,
				Gee.List<SdlObjectReference> subObjects,
				Gee.List<SdlTriangle> triangles,
				LdrawObject object,
				int unionCount)
		{
			var header = GetObjectHeader(object, unionCount);
			yield s.write_async(@"// object: $(object.FileName), $unionCount distinct components.\n".data);
			yield s.write_async(header.data);
			yield s.write_async(@"#declare stepClock = int(clock * $unionCount);\n".data);
			yield s.write_async(@"#switch (stepClock)\n".data);
			yield s.write_async(@"#case($unionCount)\n".data);

			for(int i = (subObjects.size - 1); i >= 0; i--)
			{
				yield s.write_async(@"#case($i)\n".data);
				yield s.write_async(sdlGenerator.ObjectReference(subObjects[i]).data);
			}
			yield s.write_async(@"#end\n".data);
			if(!(triangles.is_empty))
				yield s.write_async(sdlGenerator.Mesh(triangles).data);
			yield s.write_async(ObjectFooter(object).data);
		}
	}
}
