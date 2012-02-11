using Ldraw.Maths;

namespace Ldraw.Lego
{
	public abstract class LdrawNode : Object
	{
		private bool m_Selected = false;

		public abstract int ColourId {get;}

		public bool Selected { get {return m_Selected;}}

		public virtual string Geometry { get {return "";}}

		public abstract string Description { get; }
	}

	public class PartNode : LdrawNode
	{
		private Vector m_Center;
		private Matrix m_Transform;
		private int m_Colour;
		private LdrawFile? m_Contents;
		private string m_Text;

		public override int ColourId
		{
			get
			{
				return m_Colour;
			}
		}

		public LdrawFile Contents
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
				return m_Contents.Description;
			}
		}
	}

	public class LineNode
	{
		private int m_Colour;
		private Vector m_A;
		private Vector m_B;

		public LineNode(int colour, Vector a, Vector b)
		{
			m_Colour = colour;
			m_A = a;
			m_B = b;
		}

		public LineNode.FromLine(string line)
		requires(!("\n" in line))
		requires(line[0] == '2')
		{
			var tokens = line.split(" ");
			m_A = Vector((float)double.parse(tokens[2]), (float)double.parse(tokens[3]), (float)double.parse(tokens[4]));
			m_B = Vector((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]));
			m_Colour = int.parse(tokens[1]);
		}
	}
}
