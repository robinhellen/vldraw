using GLib.Math;

namespace Ldraw.Maths
{
	public struct Matrix
	{
		private float[,] m_Values;

		public Matrix(float a, float b, float c, float d, float e, float f, float g, float h, float i)
		{
			m_Values = {{a, b, c}, {d, e, f}, {g, h, i}};
		}

		public Matrix.ForRotation(Vector axis, float angle)
		{
			angle = (float)(angle * (2 * PI / 360));
			m_Values = {
				{cosf(angle) + axis.X * axis.X * (1 - cosf(angle))		,axis.X*axis.Y*(1 - cosf(angle)) - axis.Z*sinf(angle)	,axis.X*axis.Z*(1 - cosf(angle)) + axis.Y*sinf(angle)},
				{axis.X*axis.Y*(1 - cosf(angle)) + axis.Z*sinf(angle)	,cosf(angle) + axis.Y * axis.Y * (1 - cosf(angle))		,axis.Y*axis.Z*(1 - cosf(angle)) - axis.X*sinf(angle)},
				{axis.X*axis.Z*(1 - cosf(angle)) - axis.Y*sinf(angle)	,axis.Y*axis.Z*(1 - cosf(angle)) + axis.X*sinf(angle)	,cosf(angle) + axis.Z * axis.Z * (1 - cosf(angle))}
				};
		}

		// TODO: Work out a way to use these constants properly.
		public static Matrix? s_NullMatrix = null;
		public static Matrix? s_Identity = null;

		public static Matrix NullMatrix
		{
			get
			{
				if(s_NullMatrix == null)
				{
					s_NullMatrix = Matrix(0,0,0 ,0,0,0 ,0,0,0);
				}
				return s_NullMatrix;
			}
		}

		public static Matrix Identity
		{
			get
			{
				if(s_Identity == null)
				{
					s_Identity = Matrix(1,0,0 ,0,1,0 ,0,0,1);
				}
				return s_Identity;
			}
		}

		public Matrix TransformMatrix(Matrix m)
		{
			return Matrix(	m_Values[0,0] * m.m_Values[0,0] + m_Values[0,1] * m.m_Values[1,0] + m_Values[0,2] * m.m_Values[2,0],
							m_Values[0,0] * m.m_Values[0,1] + m_Values[0,1] * m.m_Values[1,1] + m_Values[0,2] * m.m_Values[2,1],
							m_Values[0,0] * m.m_Values[0,2] + m_Values[0,1] * m.m_Values[1,2] + m_Values[0,2] * m.m_Values[2,2],
							m_Values[1,0] * m.m_Values[0,0] + m_Values[1,1] * m.m_Values[1,0] + m_Values[1,2] * m.m_Values[2,0],
							m_Values[1,0] * m.m_Values[0,1] + m_Values[1,1] * m.m_Values[1,1] + m_Values[1,2] * m.m_Values[2,1],
							m_Values[1,0] * m.m_Values[0,2] + m_Values[1,1] * m.m_Values[1,2] + m_Values[1,2] * m.m_Values[2,2],
							m_Values[2,0] * m.m_Values[0,0] + m_Values[2,1] * m.m_Values[1,0] + m_Values[2,2] * m.m_Values[2,0],
							m_Values[2,0] * m.m_Values[0,1] + m_Values[2,1] * m.m_Values[1,1] + m_Values[2,2] * m.m_Values[2,1],
							m_Values[2,0] * m.m_Values[0,2] + m_Values[2,1] * m.m_Values[1,2] + m_Values[2,2] * m.m_Values[2,2]);
		}

		public Matrix Add(Matrix m)
		{
			return Matrix(	m_Values[0,0] + m.m_Values[0,0],
							m_Values[0,1] + m.m_Values[0,1],
							m_Values[0,2] + m.m_Values[0,2],
							m_Values[1,0] + m.m_Values[1,0],
							m_Values[1,1] + m.m_Values[1,1],
							m_Values[1,2] + m.m_Values[1,2],
							m_Values[2,0] + m.m_Values[2,0],
							m_Values[2,1] + m.m_Values[2,1],
							m_Values[2,2] + m.m_Values[2,2]);
		}

		public Matrix Scale(float scale)
		{
			return Matrix(	m_Values[0,0] * scale,
							m_Values[0,1] * scale,
							m_Values[0,2] * scale,
							m_Values[1,0] * scale,
							m_Values[1,1] * scale,
							m_Values[1,2] * scale,
							m_Values[2,0] * scale,
							m_Values[2,1] * scale,
							m_Values[2,2] * scale);
		}

		public float Determinant
		{
			get
			{
				return m_Values[0,0] * (m_Values[1,1] * m_Values[2,2] - m_Values[1,2] * m_Values[2,1])
					 - m_Values[0,1] * (m_Values[1,0] * m_Values[2,2] - m_Values[1,2] * m_Values[2,0])
					 + m_Values[0,2] * (m_Values[1,0] * m_Values[2,1] - m_Values[1,1] * m_Values[2,0]);
			}
		}

		public Vector TransformVector(Vector v)
		{
			return Vector((m_Values[0,0] * v.X + m_Values[0,1] * v.Y + m_Values[0,2] * v.Z),
						  (m_Values[1,0] * v.X + m_Values[1,1] * v.Y + m_Values[1,2] * v.Z),
						  (m_Values[2,0] * v.X + m_Values[2,1] * v.Y + m_Values[2,2] * v.Z));
		}

		public float get(int row, int col)
		{
			return m_Values[row, col];
		}
	}
}
