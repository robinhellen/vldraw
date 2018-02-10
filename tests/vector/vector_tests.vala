using Gee;

using Ldraw.Maths;

namespace Ldraw.Tests.Vectors
{
	public class VectorTests : TestFixture
	{
		private Collection<Vector?> data;
		Vector[] datapoints;
		construct
		{
			datapoints = {
					Vector(0, 0, 0),
					Vector(1, 0, 0),
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

		public VectorTests()
		{
			base("VectorTests");

			var unitX = Vector(1, 0, 0);
			var unitY = Vector(0, 1, 0);
			var unitZ = Vector(0, 0, 1);
			AddTheory<Vector?>("DotSelf", DotSelfIsMagnitudeSquared, data, v => v.to_string());
			AddTheory<Vector?>("CrossSelf", CrossSelfIsNullVector, data, v => v.to_string());
			AddTheory<Vector?>("IdentityTransform", IdentityMatrixWorks, data, v => v.to_string());
			AddTheory<Vector?>("NullTransform", NullMatrixWorks, data, v => v.to_string());

			// cross product for unit vectors
			add_test("CrossXY", () => TestCrossProduct(unitX, unitY, unitZ));
			add_test("CrossYZ", () => TestCrossProduct(unitY, unitZ, unitX));
			add_test("CrossZX", () => TestCrossProduct(unitZ, unitX, unitY));
		}

		public void DotSelfIsMagnitudeSquared(Vector? v)
		{
			var squareMagnitude = v.Magnitude * v.Magnitude;

			Assert.AreEqualFloat(squareMagnitude, v.Dot(v));
		}

		public void CrossSelfIsNullVector(Vector? v)
		{
			var result = v.Cross(v);
			AssertAreEqualVectors(Vector.NullVector, result);
		}

		public void TestCrossProduct(Vector v1, Vector v2, Vector expected)
		{
			AssertAreEqualVectors(expected, v1.Cross(v2));
		}

		public void IdentityMatrixWorks(Vector? v)
		{
			Matrix i = Matrix.Identity;
			AssertAreEqualVectors(v, i.TransformVector(v));
		}

		public void NullMatrixWorks(Vector? v)
		{
			Matrix i = Matrix.NullMatrix;
			AssertAreEqualVectors(Vector.NullVector, i.TransformVector(v));
		}

		private void AssertAreEqualVectors(Vector expected, Vector actual, string message = "")
		{
			if(expected.X != actual.X
				|| expected.Y != actual.Y
				|| expected.Z != actual.Z)
			{
				GLib.message(@"$message\nExpected: $expected\nActual   : $actual");
				Test.fail();
			}
		}
	}
}
