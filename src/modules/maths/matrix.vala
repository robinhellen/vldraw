using GLib.Math;

namespace Ldraw.Maths
{
	public struct Matrix
	{
		public float m_Values[9];

		public Matrix(float a, float b, float c, float d, float e, float f, float g, float h, float i)
		{
			m_Values = {a, b, c, d, e, f, g, h, i};
		}

		public Matrix.ForRotation(Vector axis, float angle)
		{
			if(axis.Magnitude == 0)
			{
				m_Values = NullMatrix.m_Values;
				return;
			}
			axis = axis.Normalized();
			angle = (float)(angle * (2 * PI / 360));
			m_Values = {
				cosf(angle) + axis.X * axis.X * (1 - cosf(angle))		,axis.X*axis.Y*(1 - cosf(angle)) - axis.Z*sinf(angle)	,axis.X*axis.Z*(1 - cosf(angle)) + axis.Y*sinf(angle),
				axis.X*axis.Y*(1 - cosf(angle)) + axis.Z*sinf(angle)	,cosf(angle) + axis.Y * axis.Y * (1 - cosf(angle))		,axis.Y*axis.Z*(1 - cosf(angle)) - axis.X*sinf(angle),
				axis.X*axis.Z*(1 - cosf(angle)) - axis.Y*sinf(angle)	,axis.Y*axis.Z*(1 - cosf(angle)) + axis.X*sinf(angle)	,cosf(angle) + axis.Z * axis.Z * (1 - cosf(angle))
				};
		}

		// TODO: Work out a way to use these constants properly.
		public const Matrix NullMatrix = {{0,0,0,0,0,0,0,0,0}};
		public const Matrix Identity = {{1,0,0,0,1,0,0,0,1}};

		public Matrix TransformMatrix(Matrix m)
		{
			return Matrix(	m_Values[0] * m.m_Values[0] + m_Values[1] * m.m_Values[3] + m_Values[2] * m.m_Values[6],
							m_Values[0] * m.m_Values[1] + m_Values[1] * m.m_Values[4] + m_Values[2] * m.m_Values[7],
							m_Values[0] * m.m_Values[2] + m_Values[1] * m.m_Values[5] + m_Values[2] * m.m_Values[8],
							m_Values[3] * m.m_Values[0] + m_Values[4] * m.m_Values[3] + m_Values[5] * m.m_Values[6],
							m_Values[3] * m.m_Values[1] + m_Values[4] * m.m_Values[4] + m_Values[5] * m.m_Values[7],
							m_Values[3] * m.m_Values[2] + m_Values[4] * m.m_Values[5] + m_Values[5] * m.m_Values[8],
							m_Values[6] * m.m_Values[0] + m_Values[7] * m.m_Values[3] + m_Values[8] * m.m_Values[6],
							m_Values[6] * m.m_Values[1] + m_Values[7] * m.m_Values[4] + m_Values[8] * m.m_Values[7],
							m_Values[6] * m.m_Values[2] + m_Values[7] * m.m_Values[5] + m_Values[8] * m.m_Values[8]);
		}

		public Matrix Add(Matrix m)
		{
			return Matrix(	m_Values[0] + m.m_Values[0],
							m_Values[1] + m.m_Values[1],
							m_Values[2] + m.m_Values[2],
							m_Values[3] + m.m_Values[3],
							m_Values[4] + m.m_Values[4],
							m_Values[5] + m.m_Values[5],
							m_Values[6] + m.m_Values[6],
							m_Values[7] + m.m_Values[7],
							m_Values[8] + m.m_Values[8]);
		}

		public Matrix Scale(float scale)
		{
			return Matrix(	m_Values[0] * scale,
							m_Values[1] * scale,
							m_Values[2] * scale,
							m_Values[3] * scale,
							m_Values[4] * scale,
							m_Values[5] * scale,
							m_Values[6] * scale,
							m_Values[7] * scale,
							m_Values[8] * scale);
		}

		public float Determinant
		{
			get
			{
				return m_Values[0] * (m_Values[4] * m_Values[8] - m_Values[5] * m_Values[7])
					 - m_Values[1] * (m_Values[3] * m_Values[8] - m_Values[5] * m_Values[6])
					 + m_Values[2] * (m_Values[3] * m_Values[7] - m_Values[4] * m_Values[6]);
			}
		}

		public Vector TransformVector(Vector v)
		{
			return Vector((m_Values[0] * v.X + m_Values[1] * v.Y + m_Values[2] * v.Z),
						  (m_Values[3] * v.X + m_Values[4] * v.Y + m_Values[5] * v.Z),
						  (m_Values[6] * v.X + m_Values[7] * v.Y + m_Values[8] * v.Z));
		}

		public float get(int row, int col)
		{
			return m_Values[row * 3 + col];
		}

		public string to_string()
		{
			return @"($(m_Values[0]),\t$(m_Values[1]),\t$(m_Values[2]))\n($(m_Values[3]),\t$(m_Values[4]),\t$(m_Values[5]))\n($(m_Values[6]),\t$(m_Values[7]),\t$(m_Values[8]))";
		}
	}
}
