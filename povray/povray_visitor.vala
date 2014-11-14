using Gee;
using GLib.Math;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	public class PovrayVisitor : LdrawVisitor<void>
	{
		private string currentObjectSdl = "";
		private bool writingMesh = false;
		private bool currentObjectHasNonLines = false;
		private int currentDistinctObjs = 0;

		private Set<string> exportedFiles = new HashSet<string>();
		private Set<string> emptyObjects = new HashSet<string>();
		private Set<int>	exportedColours = new HashSet<int>();

		private File file;
		private FileOutputStream outStream;
		private Error caughtError;
		private bool hadError = false;

		public PovrayVisitor(string filename)
		{
			file = File.new_for_path(filename);
			outStream = file.replace(null, false, FileCreateFlags.NONE);
		}

		public override void Visit(LdrawObject object)
		{
			if(object.FileName in exportedFiles)
				return;

			base.Visit(object);


			WriteObjectFooter(object);
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
			}

			exportedFiles.add(object.FileName);
		}

		public override void VisitTriangle(TriangleNode node)
		{
			WriteMeshTriangle(node.A, node.B, node.C);
			currentObjectHasNonLines = true;
		}

		public override void VisitQuad(QuadNode node)
		{
			WriteMeshTriangle(node.A, node.B, node.C);
			WriteMeshTriangle(node.D, node.A, node.C);
			currentObjectHasNonLines = true;
		}

		public override void VisitSubModel(PartNode node)
		{
			FinishMesh();

			var currentSdl = currentObjectSdl;
			var currentInMesh = writingMesh;
			var nonLinesInCurrent = currentObjectHasNonLines;
			var isUnion = currentDistinctObjs;

			currentObjectSdl = "";
			currentInMesh = false;
			currentObjectHasNonLines = false;
			currentDistinctObjs = 0;

			Visit(node.Contents);

			currentObjectSdl = currentSdl;
			writingMesh = currentInMesh;
			currentDistinctObjs = isUnion;

			if(!(node.Contents.FileName in emptyObjects))
			{
				currentObjectHasNonLines = true;
				currentDistinctObjs++;

				var colourSdl = SdlForColour(node.ColourId);

				currentObjectSdl += @"\tobject { $(EscapeFilename(node.Contents.FileName)) matrix $(SdlMatrixFor(node.Transform, node.Center)) $colourSdl }\n";
			}
			else
			{
				currentObjectHasNonLines = nonLinesInCurrent;
			}
		}

		public void Finalise(LdrawObject object)
		{
			var angle = 67.3801f;
			var angleRad =  (float)PI * angle / 180;
			var longitude = (float)PI * 45.0f / 180;
			var latitude =  (float)PI * 30.0f / 180;

			float cameraDistance = object.BoundingBox.Radius / tanf(angleRad / 2);

			var cameraVector = Vector(	cameraDistance * cosf(latitude) * sinf(longitude),
										-cameraDistance * sinf(latitude),
										-cameraDistance * cosf(latitude) * cosf(longitude))
					.Add(object.BoundingBox.Center());

			var lightsCameraObject = @"object { $(EscapeFilename(object.FileName)) }


// Background:
background { color rgb <0,0.1,0.5>}

camera {
	#declare PCT = 0; // Percentage further away
	#declare STEREO = 0; // Normal view
	location $(SdlFor(cameraVector)) + PCT/100.0*$(SdlFor(cameraVector))
	sky      -y
	right    -4/3*x
	look_at  $(SdlFor(object.BoundingBox.Center())) // calculated
	angle    $angle
	rotate   <0,1e-5,0> // Prevent gap between adjecent quads
	//orthographic
}

// Lights:
light_source {
	<8.5,-400.778,-152.778>  // Latitude,Longitude,Radius: 45,0,477.69
	color rgb <1,1,1>
}
light_source {
	<366.768,-301.845,391.846>  // Latitude,Longitude,Radius: 30,120,477.69
	color rgb <1,1,1>
}
light_source {
	<-198.346,-476.692,304.422>  // Latitude,Longitude,Radius: 60,-120,477.69
	color rgb <1,1,1>
}";

			Append(lightsCameraObject);
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

		private void WriteObjectFooter(LdrawObject object)
		{
			FinishMesh();
			currentObjectSdl += @"}\n\n";
		}

		private void WriteMeshTriangle(Vector a, Vector b, Vector c)
		{
			StartMesh();

			currentObjectSdl += @"\t\ttriangle { $(SdlFor(a)), $(SdlFor(b)), $(SdlFor(c)) }\n";

			writingMesh = true;
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

		private void StartMesh()
		{
			if(!writingMesh)
			{
				currentObjectSdl += "\tmesh {\n";
				currentDistinctObjs++;
			}

			writingMesh = true;
		}

		private void FinishMesh()
		{
			if(writingMesh)
				currentObjectSdl += "\t}\n";

			writingMesh = false;
		}

		public string SdlFor(Vector v)
		{
			return @"<$(v.X), $(v.Y), $(v.Z)>";
		}

		public string SdlMatrixFor(Matrix m, Vector v)
		{
			return @"<$(m[0,0]), $(m[1,0]), $(m[2,0]), $(m[0,1]), $(m[1,1]), $(m[2,1]), $(m[0,2]), $(m[1,2]), $(m[2,2]), $(v.X), $(v.Y), $(v.Z) >";
		}

		public string SdlForColour(int colourId)
		{
			if(colourId == 24 || colourId == 16)
			{
				return "";
			}

			if(!(colourId in exportedColours))
			{
				float red, green, blue, alpha;
				LdrawColour.SurfaceColour(colourId, out red, out green, out blue, out alpha);

				var filter = alpha == 1 ? "" : @"filter $alpha ";

				var colourDefSdl =
@"#declare Colour$colourId = material { texture {
	pigment { rgb <$red,$green,$blue> $filter}
	finish { ambient 0.4 diffuse 0.4 }
	finish { phong 0.5 phong_size 40 reflection 0.08 }
} }
";
				Append(colourDefSdl);
				exportedColours.add(colourId);
			}

			return @"material { Colour$colourId } ";
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
