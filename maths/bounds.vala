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

		public Bounds.Clone(Bounds b)
		{
			m_Min = b.m_Min;
			m_Max = b.m_Max;
			m_Initialized = b.m_Initialized;
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
				else if(m_Max.X < v.X)
				{
					m_Max.X = v.X;
				}

				if(m_Min.Y > v.Y)
				{
					m_Min.Y = v.Y;
				}
				else if(m_Max.Y < v.Y)
				{
					m_Max.Y = v.Y;
				}

				if(m_Min.Z > v.Z)
				{
					m_Min.Z = v.Z;
				}
				else if(m_Max.Z < v.Z)
				{
					m_Max.Z = v.Z;
				}
			}
		}

		public void IncludeBounds(Bounds b, Matrix transform, Vector center)
		{
			Union(transform.TransformVector(b.m_Min).Add(center));
			Union(transform.TransformVector(b.m_Max).Add(center));
		}

		public float MaxX {get{return m_Max.X;}}
		public float MaxY {get{return m_Max.Y;}}
		public float MaxZ {get{return m_Max.Z;}}

		public float MinX {get{return m_Min.X;}}
		public float MinY {get{return m_Min.Y;}}
		public float MinZ {get{return m_Min.Z;}}

		public Vector Center()
		{
			return m_Max.Add(m_Min).Scale(0.5f);
		}

		public float Radius
		{
			get
			{
				return Center().Subtract(m_Min).Magnitude;
			}
		}

		public Bounds Scale(float scale)
		{
			Bounds b = new Bounds();
			Vector center = Center();
			Vector diagonal = m_Min.Subtract(center);
			Vector scaledDiagonal = diagonal.Scale(scale);
			b.m_Min = center.Add(scaledDiagonal);
			b.m_Max = center.Subtract(scaledDiagonal);
			b.m_Initialized = true;
			return b;
		}

		public Bounds Transform(Matrix m, Vector pos)
		{
			Bounds b = new Bounds();
			b.m_Min = m.TransformVector(m_Min).Add(pos);
			b.m_Max = m.TransformVector(m_Max).Add(pos);
			b.m_Initialized = true;
			return b;
		}

		public string to_string()
		{
			return @"Bounding box: $m_Min, $m_Max";
		}
	}
}
