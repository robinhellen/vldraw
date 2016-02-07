
using Ldraw.Maths;

namespace Ldraw.Povray
{
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
