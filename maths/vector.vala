using GLib.Math;

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

		public Vector.Min(Vector a, Vector b)
		{
			m_Values = {fminf(a.X, b.X), fminf(a.Y, b.Y), fminf(a.Z, b.Z)};
		}

		public Vector.Max(Vector a, Vector b)
		{
			m_Values = {fmaxf(a.X, b.X), fmaxf(a.Y, b.Y), fmaxf(a.Z, b.Z)};
		}

		public float X {get {return m_Values[0];}}
		public float Y {get {return m_Values[1];}}
		public float Z {get {return m_Values[2];}}

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
		
		[CCode(array_length = false)]
		public unowned float[] value_vector()
		{
			return m_Values;
		}
	}
}
