using Gee;
using GLib.Math;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	public class PovrayVisitor : LdrawVisitor<void>
	{
		private string currentObjectSdl = "";
		private bool currentObjectHasNonLines = false;
		private int currentDistinctObjs = 0;
		private Gee.List<SdlTriangle> currentTriangles;

		private Set<string> exportedFiles = new HashSet<string>();
		private Set<string> emptyObjects = new HashSet<string>();
		private Set<Colour>	exportedColours = new HashSet<Colour>();

		private File file;
		private FileOutputStream outStream;
		private Error caughtError;
		private bool hadError = false;
		private SdlGenerator sdlGenerator = new SdlGenerator();

		public PovrayVisitor(string filename)
		{
			file = File.new_for_path(filename);
			outStream = file.replace(null, false, FileCreateFlags.NONE);
		}

		public override void Visit(LdrawObject object)
		{
			if(object.FileName in exportedFiles)
				return;

			var outerTriangles = currentTriangles;
			currentTriangles = new LinkedList<SdlTriangle>();

			base.Visit(object);

			if(!currentTriangles.is_empty)
			{
				currentDistinctObjs++;
				currentObjectSdl += sdlGenerator.Mesh(currentTriangles);
			}

			if(!currentObjectHasNonLines)
			{
				emptyObjects.add(object.FileName);
			}
			else
			{
				var header = currentDistinctObjs > 1 ? GetObjectHeaderUnion(object) : GetObjectHeader(object);
				Append(@"// object: $(object.FileName), $currentDistinctObjs distinct components.\n");
				Append(header);
				Append(currentObjectSdl);
				Append(ObjectFooter(object));
			}

			currentTriangles = outerTriangles;

			exportedFiles.add(object.FileName);
		}

		public override void VisitTriangle(TriangleNode node)
		{
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C));
			currentObjectHasNonLines = true;
		}

		public override void VisitQuad(QuadNode node)
		{
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C));
			currentTriangles.add(new SdlTriangle(node.D, node.A, node.C));
			currentObjectHasNonLines = true;
		}

		public override void VisitSubModel(PartNode node)
		{
			var currentSdl = currentObjectSdl;
			var nonLinesInCurrent = currentObjectHasNonLines;
			var isUnion = currentDistinctObjs;

			currentObjectSdl = "";
			currentObjectHasNonLines = false;
			currentDistinctObjs = 0;

			Visit(node.Contents);

			currentObjectSdl = currentSdl;
			currentDistinctObjs = isUnion;

			if(!(node.Contents.FileName in emptyObjects))
			{
				currentObjectHasNonLines = true;
				currentDistinctObjs++;

				var colourSdl = SdlForColour(node.Colour);

				var sdlTransform = sdlGenerator.SdlMatrixFor(node.Transform, node.Center);

				currentObjectSdl += @"\tobject { $(EscapeFilename(node.Contents.FileName)) matrix $sdlTransform $colourSdl }\n";
			}
			else
			{
				currentObjectHasNonLines = nonLinesInCurrent;
			}
		}

		public void Finalise(LdrawObject object, float cameraLong, float cameraLat)
		{
			var angle = 67.3801f;
			var angleRad =  (float)PI * angle / 180;
			var longitude = (float)PI * cameraLong / 180;
			var latitude =  (float)PI * cameraLat / 180;

			float cameraDistance = object.BoundingBox.Radius / tanf(angleRad / 2);

			var cameraVector = Vector(	cameraDistance * cosf(latitude) * sinf(longitude),
										-cameraDistance * sinf(latitude),
										-cameraDistance * cosf(latitude) * cosf(longitude))
					.Add(object.BoundingBox.Center());

			var cameraObject = @"object { $(EscapeFilename(object.FileName)) }";
			Append(cameraObject);

			Append(sdlGenerator.Camera(cameraVector, object.BoundingBox.Center(), angle));

			Append(sdlGenerator.WhiteLightSource(Vector(8.5f,-400.778f,-152.778f)));     // Latitude,Longitude,Radius: 45,   0,477.69
			Append(sdlGenerator.WhiteLightSource(Vector(366.768f,-301.845f,391.846f)));  // Latitude,Longitude,Radius: 30, 120,477.69
			Append(sdlGenerator.WhiteLightSource(Vector(-198.346f,-476.692f,304.422f))); // Latitude,Longitude,Radius: 60,-120,477.69
		}

		private string GetObjectHeader(LdrawObject object)
		{
			var escapedFilename = EscapeFilename(object.FileName);
			return @"#declare $escapedFilename = object {\n";
		}

		private string GetObjectHeaderUnion(LdrawObject object)
		{
			var escapedFilename = EscapeFilename(object.FileName);
			return @"#declare $escapedFilename = union {\n";
		}

		private string ObjectFooter(LdrawObject object)
		{
			return @"}\n\n";
		}

		private void Append(string sdl)
		{
			if(hadError)
				return;
			try
			{
				outStream.write(sdl.data);
			}
			catch (Error e)
			{
				hadError = true;
				caughtError = e;
			}
		}

		public string SdlForColour(Colour colour)
		{
			if(colour.Code == 24 || colour.Code == 16)
			{
				return "";
			}

			if(!(colour in exportedColours))
			{
				var colourDefSdl = sdlGenerator.ColourDefinition(colour);
				Append(colourDefSdl);
				exportedColours.add(colour);
			}

			return sdlGenerator.ColourReference(colour);
		}

		public string EscapeFilename(string filename)
		{
			var escaped = filename
					.replace(".", "_")
					.replace("/", "__")
					.replace("\\", "__")
					.replace("-", "_dash_");

			if(escaped[0].isdigit())
				escaped = "_" + escaped;

			return escaped;
		}

		public void Finish()
			throws Error
		{
			if(hadError)
				throw caughtError;

			outStream.close();
		}
	}
}
