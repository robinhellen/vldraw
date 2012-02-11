namespace Ldraw.Maths
{
	public struct Vector
	{
		private float m_Values[3];
		public const Vector NullVector = {{0.0f, 0.0f, 0.0f}};
		
		public Vector(float x, float y, float z)
		{
			m_Values[0] = x;
			m_Values[1] = y;
			m_Values[2] = z;
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
	}
}
