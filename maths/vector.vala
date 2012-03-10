namespace Ldraw.Maths
{
	public struct Vector
	{
		private float m_Values[3];

		public static Vector? s_NullVector = null;

		public static Vector NullVector
		{
			get
			{
				if(s_NullVector == null)
				{
					s_NullVector = Vector(0,0,0);
				}
				return s_NullVector;
			}
		}

		public Vector(float x, float y, float z)
		{
			m_Values = {x, y, z};
		}

		public float X {get {return m_Values[0];} set {m_Values[0] = value;}}
		public float Y {get {return m_Values[1];} set {m_Values[1] = value;}}
		public float Z {get {return m_Values[2];} set {m_Values[2] = value;}}

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
						  m_Values[2] * v.m_Values[0] - m_Values[0] * v.m_Values[2],
						  m_Values[0] * v.m_Values[1] - m_Values[1] * v.m_Values[0]);
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
				return Math.sqrtf(Dot(this));
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

		public string to_string()
		{
			return @"( $(m_Values[0]), $(m_Values[1]), $(m_Values[2]) )";
		}
	}
}
