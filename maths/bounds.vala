namespace Ldraw.Maths
{
	public class Bounds
	{
		public Vector m_Min;
		public Vector m_Max;
		public bool m_Initialized = false;

		public Bounds()
		{
			m_Min = Vector.NullVector;
			m_Max = Vector.NullVector;
		}

		public void Union(Vector v)
		{
			if(!m_Initialized)
			{
				m_Min = m_Max = v;
				m_Initialized = true;
			}
			else
			{
				if(m_Min.X > v.X)
				{
					m_Min.X = v.X;
				}
				else if(m_Max.X > v.X)
				{
					m_Min.X = v.X;
				}

				if(m_Min.Y > v.Y)
				{
					m_Min.Y = v.Y;
				}
				else if(m_Max.Y > v.Y)
				{
					m_Min.Y = v.Y;
				}

				if(m_Min.Z > v.Z)
				{
					m_Min.Z = v.Z;
				}
				else if(m_Max.Z > v.Z)
				{
					m_Min.Z = v.Z;
				}
			}
		}

		public float MaxX {get{return m_Max.X;}}
		public float MaxY {get{return m_Max.Y;}}
		public float MaxZ {get{return m_Max.Z;}}

		public float MinX {get{return m_Min.X;}}
		public float MinY {get{return m_Min.Y;}}
		public float MinZ {get{return m_Min.Z;}}
	}
}
