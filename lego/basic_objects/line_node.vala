using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class LineNode : LdrawNode
	{
		private Vector m_A;
		private Vector m_B;

		public LineNode(Colour colour, Vector a, Vector b)
		{
			Colour = colour;
			m_A = a;
			m_B = b;
		}

		public override string Description { get {return "Line";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public override string FileLine{owned get{return @"2 $(Colour.Code) $(m_A.X) $(m_A.Y) $(m_A.Z) $(m_B.X) $(m_B.Y) $(m_B.Z)";}}

		public override LdrawNode TransformNode(Matrix transform, Vector center)
		{
			var a = transform.TransformVector(m_A).Add(center);
			var b = transform.TransformVector(m_B).Add(center);

			return new LineNode(Colour, a, b);
		}

		public override void Accept(LdrawVisitor visitor)
		{
			visitor.VisitLine(this);
		}

		public override async void AcceptAsync(AsyncLdrawVisitor visitor)
		{
			yield visitor.VisitLine(this);
		}
	}
}
