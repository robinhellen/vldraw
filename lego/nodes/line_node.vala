using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class LineNode : LdrawNode
	{
		private Vector m_A;
		private Vector m_B;

		class construct
		{
			Type = "Comment";
		}

		public LineNode(int colour, Vector a, Vector b)
		{
			ColourId = colour;
			m_A = a;
			m_B = b;
		}

		public override string Description { get {return "Line";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public override string FileLine{owned get{return @"2 $ColourId $(m_A.X) $(m_A.Y) $(m_A.Z) $(m_B.X) $(m_B.Y) $(m_B.Z)";}}
	}
}
