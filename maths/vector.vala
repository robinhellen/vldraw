namespace Ldraw.Maths
{
	public struct Vector
	{
		private float m_Values[3];
		//public const Vector NullVector = {{0.0f, 0.0f, 0.0f}};

		public Vector(float x, float y, float z)
		{
			m_Values = {x, y, z};
		}

		public Vector Add(Vector v)
		{
			return Vector(m_Values[0] + v.m_Values[0],
						  m_Values[1] + v.m_Values[1],
						  m_Values[2] + v.m_Values[2]);
		}

		public Vector Subtract(Vector v)
		{
			return Vector(m_Values[0] - v.m_Values[0],
						  m_Values[1] - v.m_Values[1],
						  m_Values[2] - v.m_Values[2]);
		}

		public Vector Cross(Vector v)
		{
			return Vector(m_Values[1] * v.m_Values[2] - m_Values[2] * v.m_Values[1],
						  m_Values[2] - v.m_Values[0] - m_Values[0] * v.m_Values[2],
						  m_Values[0] - v.m_Values[1] - m_Values[1] * v.m_Values[0]);
		}

		public float Dot(Vector v)
		{
			return (m_Values[0] * v.m_Values[0]) +
					(m_Values[1] * v.m_Values[1]) +
					(m_Values[2] * v.m_Values[2]);
		}

		public float Magnitude
		{
			get
			{
				return Dot(this);
			}
		}

		public Vector Normalized()
		{
			return Scale(1.0f / Magnitude);
		}

		public Vector Scale(float scale)
		{
			return Vector(	m_Values[0] * scale,
							m_Values[1] * scale,
							m_Values[2] * scale);
		}
	}
}
