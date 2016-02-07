
using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	private class SdlGenerator
	{
		public string SdlFor(Vector v)
		{
			return @"<$(v.X), $(v.Y), $(v.Z)>";
		}

		public string SdlMatrixFor(Matrix m, Vector v)
		{
			return @"<$(m[0,0]), $(m[1,0]), $(m[2,0]), $(m[0,1]), $(m[1,1]), $(m[2,1]), $(m[0,2]), $(m[1,2]), $(m[2,2]), $(v.X), $(v.Y), $(v.Z) >";
		}

		public string WhiteLightSource(Vector position)
		{
			return @"light_source {
	$(SdlFor(position))
	color rgb <1,1,1>
}";
		}

		public string ColourDefinition(Colour colour)
		{
			float red = colour.Red / 255f;
			float green = colour.Green / 255f;
			float blue = colour.Blue / 255f;
			float alpha = colour.Alpha / 255f;

			var filter = alpha == 1 ? "" : @"filter $alpha ";

			return
@"#declare Colour$(colour.Code) = material { texture {
	pigment { rgb <$red,$green,$blue> $filter}
	finish { ambient 0.4 diffuse 0.4 }
	finish { phong 0.5 phong_size 40 reflection 0.08 }
} }
";
		}

		public string ColourReference(Colour colour)
		{
			return @"material { Colour$(colour.Code) } ";
		}

		public string Mesh(Gee.List<SdlTriangle> triangles)
			requires(!triangles.is_empty)
		{
			string mesh = "\tmesh {\n";
			foreach(var triangle in triangles)
			{
				mesh += Triangle(triangle);
			}
			mesh += "\t}\n";
			return mesh;
		}

		public string Triangle(SdlTriangle triangle)
		{
			var sdlA = SdlFor(triangle.A);
			var sdlB = SdlFor(triangle.B);
			var sdlC = SdlFor(triangle.C);

			return @"\t\ttriangle { $sdlA, $sdlB, $sdlC }\n";
		}

		public string Camera(Vector cameraPosition, Vector cameraLookAt, float viewAngle)
		{
			var cameraLocationSdl = SdlFor(cameraPosition);
			var cameraLookAtSdl = SdlFor(cameraLookAt);
			return @"camera {
	#declare PCT = 0; // Percentage further away
	#declare STEREO = 0; // Normal view
	location $cameraLocationSdl + PCT/100.0*$cameraLocationSdl
	sky      -y
	right    -4/3*x
	look_at  $cameraLookAtSdl // calculated
	angle    $viewAngle
	rotate   <0,1e-5,0> // Prevent gap between adjacent quads
	//orthographic
}";
		}
	}

	private class SdlTriangle
	{
		public Vector A;
		public Vector B;
		public Vector C;

		public SdlTriangle(Vector a, Vector b, Vector c)
		{
			A = a; B = b; C = c;
		}
	}
}
