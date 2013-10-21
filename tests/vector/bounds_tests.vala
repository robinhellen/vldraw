using Gee;

using Ldraw.Maths;

namespace Ldraw.Tests.Vectors
{
	public class BoundsTests : TestFixture
	{
		public BoundsTests()
		{
			base("Bounds Tests");
			add_test("AllUnitVectors", AllUnitVectors);
			add_test("IncludeBounds", PairedBounds);
			add_test("BoundsWithRotation", BoundsWithRotation);
			add_test("BoundsWithShift", BoundsWithShift);
			add_test("BoundsWithRotationAndShift", BoundsWithRotationAndShift);
			add_test("ScaleCenteredBound", ScaleCenteredBounds);
			add_test("ScaleNonCenteredBound", ScaleNonCenteredBounds);
		}

		public void AllUnitVectors()
		{
			var b = new Bounds();
			b.Union(Vector(1, 0, 0));
			b.Union(Vector(0, 1, 0));
			b.Union(Vector(0, 0, 1));

			MathsAsserts.AreEqualVectors(b.Center(), Vector(0.5f, 0.5f, 0.5f));
			Assert.AreEqualFloat(1.0f, b.MaxX);
			Assert.AreEqualFloat(1.0f, b.MaxY);
			Assert.AreEqualFloat(1.0f, b.MaxZ);
			Assert.AreEqualFloat(0.0f, b.MinX);
			Assert.AreEqualFloat(0.0f, b.MinY);
			Assert.AreEqualFloat(0.0f, b.MinZ);
		}

		public void PairedBounds()
		{
			var b = CreateSymmetricBounds(Vector(2, 0.5f, 0.5f));
			var b2 = CreateSymmetricBounds(Vector(1, 1, 1));
			b.IncludeBounds(b2, Matrix.Identity, Vector.NullVector);

			MathsAsserts.AreEqualVectors(b.Center(), Vector.NullVector);
			Assert.AreEqualFloat(2.0f, b.MaxX, "maxX is wrong");
			Assert.AreEqualFloat(1.0f, b.MaxY, "maxY is wrong");
			Assert.AreEqualFloat(1.0f, b.MaxZ, "maxZ is wrong");
			Assert.AreEqualFloat(-2.0f, b.MinX, "minX is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinY, "minY is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinZ, "minZ is wrong");
		}

		public void BoundsWithRotation()
		{
			var b = CreateSymmetricBounds(Vector(1, 1, 1));
			var b2 = CreateSymmetricBounds(Vector(2, 0.5f, 0.5f));
			b.IncludeBounds(b2, Matrix.ForRotation(Vector(0, 0, 1), 90), Vector.NullVector);

			MathsAsserts.AreEqualVectors(b.Center(), Vector.NullVector);
			Assert.AreEqualFloat(1.0f, b.MaxX, "maxX is wrong");
			Assert.AreEqualFloat(2.0f, b.MaxY, "maxY is wrong");
			Assert.AreEqualFloat(1.0f, b.MaxZ, "maxZ is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinX, "minX is wrong");
			Assert.AreEqualFloat(-2.0f, b.MinY, "minY is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinZ, "minZ is wrong");
		}

		public void BoundsWithShift()
		{
			var b = CreateSymmetricBounds(Vector(1, 1, 1));
			var b2 = CreateSymmetricBounds(Vector(2, 0.5f, 0.5f));
			b.IncludeBounds(b2, Matrix.Identity, Vector(1, 1, 1));

			MathsAsserts.AreEqualVectors(b.Center(), Vector(1, 0.25f, 0.25f));
			Assert.AreEqualFloat(3.0f, b.MaxX, "maxX is wrong");
			Assert.AreEqualFloat(1.5f, b.MaxY, "maxY is wrong");
			Assert.AreEqualFloat(1.5f, b.MaxZ, "maxZ is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinX, "minX is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinY, "minY is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinZ, "minZ is wrong");
		}

		public void BoundsWithRotationAndShift()
		{
			var b = CreateSymmetricBounds(Vector(1, 1, 1));
			var b2 = CreateSymmetricBounds(Vector(2, 0.5f, 0.5f));
			b.IncludeBounds(b2, Matrix.ForRotation(Vector(0, 0, 1), 90), Vector(1, 1, 1));

			MathsAsserts.AreEqualVectors(b.Center(), Vector(0.25f, 1, 0.25f));
			Assert.AreEqualFloat(1.5f, b.MaxX, "maxX is wrong");
			Assert.AreEqualFloat(3.0f, b.MaxY, "maxY is wrong");
			Assert.AreEqualFloat(1.5f, b.MaxZ, "maxZ is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinX, "minX is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinY, "minY is wrong");
			Assert.AreEqualFloat(-1.0f, b.MinZ, "minZ is wrong");
		}

		public void ScaleCenteredBounds()
		{
			var original = CreateSymmetricBounds(Vector(1, 2, 3));
			var b = original.Scale(2);

			MathsAsserts.AreEqualVectors(b.Center(), Vector.NullVector);
			Assert.AreEqualFloat(2, b.MaxX, "maxX is wrong");
			Assert.AreEqualFloat(4, b.MaxY, "maxY is wrong");
			Assert.AreEqualFloat(6, b.MaxZ, "maxZ is wrong");
			Assert.AreEqualFloat(-2, b.MinX, "minX is wrong");
			Assert.AreEqualFloat(-4, b.MinY, "minY is wrong");
			Assert.AreEqualFloat(-6, b.MinZ, "minZ is wrong");
		}

		public void ScaleNonCenteredBounds()
		{
			var original = CreateSymmetricBounds(Vector(1, 2, 3));
			original.Union(Vector(2, 3, 4));
			var b = original.Scale(2);

			MathsAsserts.AreEqualVectors(b.Center(), Vector(0.5f, 0.5f, 0.5f));
			Assert.AreEqualFloat(3.5f, b.MaxX, "maxX is wrong");
			Assert.AreEqualFloat(5.5f, b.MaxY, "maxY is wrong");
			Assert.AreEqualFloat(7.5f, b.MaxZ, "maxZ is wrong");
			Assert.AreEqualFloat(-2.5f, b.MinX, "minX is wrong");
			Assert.AreEqualFloat(-4.5f, b.MinY, "minY is wrong");
			Assert.AreEqualFloat(-6.5f, b.MinZ, "minZ is wrong");

		}

		private Bounds CreateSymmetricBounds(Vector a)
		{
			var b = new Bounds();
			b.Union(a);
			b.Union(a.Scale(-1.0f));
			return b;
		}
	}
}
