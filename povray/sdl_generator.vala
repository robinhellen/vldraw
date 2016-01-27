
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
	}
}
