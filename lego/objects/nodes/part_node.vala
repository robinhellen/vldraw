using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class PartNode : LdrawNode
	{
		private LdrawObject m_Contents;
		private string m_Text;

		class construct
		{
			Type = "Part";
		}

		public PartNode(Vector center, Matrix transform, LdrawObject contents, int colour)
		{
			Center = center;
			Transform = transform;
			m_Contents = contents;
			ColourId = colour;

			m_Text = contents.FileName;
		}

		public LdrawObject Contents
		{
			get
			{
				return m_Contents;
			}
		}

		public override string Description
		{
			get
			{
				return m_Contents.FileName;
			}
		}

		public override string FileLine{owned get{return @"1 $ColourId $(Center.X) $(Center.Y) $(Center.Z) $(Transform[0,0]) $(Transform[0,1]) $(Transform[0,2]) $(Transform[1,0]) $(Transform[1,1]) $(Transform[1,2]) $(Transform[2,0]) $(Transform[2,1]) $(Transform[2,2]) $m_Text";}}

		public Matrix Transform
		{
			get; set;
		}

		public Vector Center
		{
			get; set;
		}

		public override string Name { get {return m_Contents.FileName;} }

		public override string Geometry() { return @"$(Center)"; }

		public void Move(Vector shift)
		{
			Center = Center.Add(shift);
		}

		public void TransformPart(Matrix transform)
		{
			Transform = transform.TransformMatrix(Transform);
		}

		public override LdrawNode TransformNode(Matrix transform, Vector center)
		{
			var newTransform = transform.TransformMatrix(Transform);
			var newCenter = transform.TransformVector(Center).Add(center);

			return new PartNode(newCenter, newTransform, m_Contents, ColourId);
		}

		public override void Accept(LdrawVisitor visitor)
		{
			visitor.VisitSubModel(this);
		}
	}
}
