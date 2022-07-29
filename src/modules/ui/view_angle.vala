
using Ldraw.Maths;

namespace Ldraw.Ui
{
	public enum ViewAngle
	{
		Front,
		Back,

		Right,
		Left,

		Top,
		Bottom,

		Ortho;

		public Vector GetCameraDirection()
		{
			switch(this)
			{
				case Front:
					return Vector(0, 0, -1.5f);
				case Back:
					return Vector(0, 0, 1.5f);
				case Right:
					return Vector(1.5f, 0, 0);
				case Left:
					return Vector(-1.5f, 0, 0);
				case Top:
					return Vector(0, -1.5f, 0);
				case Bottom:
					return Vector(0, 1.5f, 0);
				case Ortho:
					return Vector(0.390731128f, -0.650895224f, -0.650895224f);
				default:
					assert_not_reached();
			}
		}

		public Vector GetCameraUp()
		{
			switch(this)
			{
				case Top:
				case Bottom:
					return Vector(0, 0, 1);
				default:
					return Vector(0, -1, 0);
			}
		}

		public Vector GetViewCenter(Vector modelCenter)
		{
			switch(this)
			{
				case Front:
				case Back:
					return Vector(modelCenter.X, -modelCenter.Y, 0);
				case Top:
				case Bottom:
					return Vector(modelCenter.X, modelCenter.Z, 0);
				case Left:
				case Right:
					return Vector(modelCenter.Z, -modelCenter.Y, 0);
				case Ortho:
					var yRot = Matrix.ForRotation(Vector(0F, 1F, 0F), -40F);
					var zRot = Matrix.ForRotation(Vector(0F, 0F, 1F), 40F);
					var invertY = Matrix(1F, 0F, 0F, 0F, -1F, 0F, 0F, 0F, 1F);
					return invertY.TransformVector(yRot.TransformVector(zRot.TransformVector(modelCenter)));
				default:
					assert_not_reached();
			}
		}

		public Bounds GetViewBounds(int viewWidth, int viewHeight, float scale, Vector viewCenter)
		{
			var viewWidthLdu = viewWidth * scale;
			var viewHeightLdu = viewHeight * scale;

			Bounds b = new Bounds();
			b.Union(viewCenter.Add(Vector(viewWidthLdu / 2, viewHeightLdu / 2, 1000000)));
			b.Union(viewCenter.Subtract(Vector(viewWidthLdu / 2, viewHeightLdu / 2, 1000000)));

			return b;
		}
	}
}
