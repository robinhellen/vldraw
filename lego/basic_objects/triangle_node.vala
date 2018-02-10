using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class TriangleNode : LdrawNode
	{
		private Vector m_A;
		private Vector m_B;
		private Vector m_C;

		public TriangleNode(Colour colour, Vector a, Vector b, Vector c)
		{
			Colour = colour;
			m_A = a;
			m_B = b;
			m_C = c;
		}

		public override string Description { get {return "Triangle";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public Vector C { get {return m_C;}}

		public override string FileLine{owned get{return @"3 $(Colour.Code) $(m_A.X) $(m_A.Y) $(m_A.Z) $(m_B.X) $(m_B.Y) $(m_B.Z) $(m_C.X) $(m_C.Y) $(m_C.Z)";}}

		public override LdrawNode TransformNode(Matrix transform, Vector center)
		{
			var a = transform.TransformVector(m_A).Add(center);
			var b = transform.TransformVector(m_B).Add(center);
			var c = transform.TransformVector(m_C).Add(center);

			return new TriangleNode(Colour, a, b, c);
		}

		public override bool Accept(LdrawVisitor visitor)
		{
			return visitor.VisitTriangle(this);
		}

		public override async void AcceptAsync(AsyncLdrawVisitor visitor)
		{
			yield visitor.VisitTriangle(this);
		}
	}
}
