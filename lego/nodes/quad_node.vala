using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class QuadNode : LdrawNode
	{
		private Vector m_A;
		private Vector m_B;
		private Vector m_C;
		private Vector m_D;

		class construct
		{
			Type = "Quad";
		}

		public QuadNode(int colour, Vector a, Vector b, Vector c, Vector d)
		{
			ColourId = colour;
			m_A = a;
			m_B = b;
			m_C = c;
			m_D = d;
		}

		public override string Description { get {return "Quad";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public Vector C { get {return m_C;}}

		public Vector D { get {return m_D;}}

		public override string FileLine{owned get{return @"3 $ColourId $(m_A.X) $(m_A.Y) $(m_A.Z) $(m_B.X) $(m_B.Y) $(m_B.Z) $(m_C.X) $(m_C.Y) $(m_C.Z) $(m_D.X) $(m_D.Y) $(m_D.Z)";}}
	}
}
