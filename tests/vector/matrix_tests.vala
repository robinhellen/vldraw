using Gee;

using Ldraw.Maths;

namespace Ldraw.Tests.Vectors
{
	public class MatrixTests : TestFixture
	{
		private Collection<Vector?> data;
		Vector[] datapoints;
		construct
		{
			datapoints = {
					Vector(0, 0, 0),
					Vector(1, 0, 0),
					Vector(2, 0, 0),
					Vector(0, 1, 0),
					Vector(0, 0, 1),
					Vector(3, 7, 4)
				};
			data = new LinkedList<Vector?>();
			foreach(var d in datapoints)
			{
				data.add(d);
			}

		}

		public MatrixTests()
		{
			base("Matrix Tests");

			AddTheory<Vector>("RotationOfAxis", RotationMatrixIsIdentityForAxis, data, v => v.to_string());
			AddTheory<Vector>("RotationByZero", RotationOfZeroIsIdentity, data, v => v.to_string());
		}

		public void RotationMatrixIsIdentityForAxis(Vector v)
		{
			Matrix m = Matrix.ForRotation(v, 90);
			var res = m.TransformVector(v);
			AssertAreEqualVectors(v, res);
		}

		public void RotationOfZeroIsIdentity(Vector v)
		{
			var other = v.Cross(Vector(1, 1, 1));

			Matrix m = Matrix.ForRotation(v, 0);
			var res = m.TransformVector(other);
			AssertAreEqualVectors(other, res);
		}

		private void AssertAreEqualVectors(Vector expected, Vector actual, string message = "")
		{
			if(!FloatsEquivalent(expected.X, actual.X)
				|| !FloatsEquivalent(expected.Y, actual.Y)
				|| !FloatsEquivalent(expected.Z, actual.Z))
			{
				GLib.message(@"$message\nExpected: $expected\nActual   : $actual");
				Test.fail();
			}
		}

		private bool FloatsEquivalent(float a, float b)
		{
			if(a == 0)
				return b == 0;

			var diff = Math.fabsf(a - b);
			return (diff / a) < 0.0001;
		}
	}
}
