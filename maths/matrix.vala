namespace Ldraw.Maths
{
	public struct Matrix
	{
		private float[,] m_Values;

		public Matrix(float a, float b, float c, float d, float e, float f, float g, float h, float i)
		{
			m_Values = {{a, b, c}, {d, e, f}, {g, h, i}};
		}

		// TODO: Work out a way to use these constants properly.
		//public const Matrix NullMatrix = {{{0,0,0},{0,0,0},{0,0,0}}};
		//public const Matrix Identity = {{{1,0,0},{0,1,0},{0,0,1}}};

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
	}
}
