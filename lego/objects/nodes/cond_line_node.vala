using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class CondLineNode : LdrawNode
	{
		private Vector m_A;
		private Vector m_B;
		private Vector m_Control1;
		private Vector m_Control2;

		class construct
		{
			Type = "Conditional Line";
		}

		public CondLineNode(int colour, Vector a, Vector b, Vector control1, Vector control2)
		{
			ColourId = colour;
			m_A = a;
			m_B = b;
			m_Control1 = control1;
			m_Control2 = control2;
		}

		public override string Description { get {return "Conditional Line";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public Vector Control1 { get {return m_Control1;}}

		public Vector Control2 { get {return m_Control2;}}

		public override string FileLine{owned get{return @"5 $ColourId $(m_A.X) $(m_A.Y) $(m_A.Z) $(m_B.X) $(m_B.Y) $(m_B.Z) $(m_Control1.X) $(m_Control1.Y) $(m_Control1.Z) $(m_Control2.X) $(m_Control2.Y) $(m_Control2.Z)";}}

		public override LdrawNode TransformNode(Matrix transform, Vector center)
		{
			var a = transform.TransformVector(m_A).Add(center);
			var b = transform.TransformVector(m_B).Add(center);
			var c = transform.TransformVector(m_Control1).Add(center);
			var d = transform.TransformVector(m_Control2).Add(center);

			return new CondLineNode(ColourId, a, b, c, d);
		}

		public override void Accept(LdrawVisitor visitor)
		{
			visitor.VisitCondLine(this);
		}
	}
}
