
using Ldraw.Maths;

namespace Ldraw.Tests.Vectors
{
	public class MathsAsserts
	{
		public static void AreEqualVectors(Vector expected, Vector actual, string message = "")
		{
			if(!FloatsEquivalent(expected.X, actual.X)
				|| !FloatsEquivalent(expected.Y, actual.Y)
				|| !FloatsEquivalent(expected.Z, actual.Z))
			{
				GLib.message(@"$message\nExpected: $expected\nActual   : $actual");
				Test.fail();
			}
		}

		private static bool FloatsEquivalent(float a, float b)
		{
			if(a == 0)
				return b == 0;

			var diff = Math.fabsf(a - b);
			return (diff / a) < 0.0001;
		}
	}
}
