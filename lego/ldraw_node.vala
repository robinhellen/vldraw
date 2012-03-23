using Ldraw.Maths;

namespace Ldraw.Lego
{
	public abstract class LdrawNode : Object
	{
		private bool m_Selected = false;

		public abstract int ColourId {get;}

		public bool Selected { get {return m_Selected;} set{m_Selected = value;}}

		public virtual string Geometry { get {return "";}}

		public abstract string Description { get; }

		public virtual string Name { get {return "";} }

		public abstract string Type { get; }

		protected static string[] Tokenize(string line)
		{
			var allTokens = line.split_set(" \t");
			string[] tokens = {};

			foreach(string token in allTokens)
			{
				if(token != "")
				{
					tokens += token;
				}
			}
			return tokens;
		}
	}

	public class PartNode : LdrawNode
	{
		private Vector m_Center;
		private Matrix m_Transform;
		private int m_Colour;
		private LdrawFile m_Contents;
		private string m_Text;

		public delegate LdrawFile SubFileLocator(string reference) throws ParseError;

		public PartNode(Vector center, Matrix transform, LdrawFile contents, int colour)
		{
			m_Center = center;
			m_Transform = transform;
			m_Contents = contents;
			m_Colour = colour;

			m_Text = contents.FileName;
		}

		public PartNode.FromLine(string line, SubFileLocator locator)
			throws ParseError
			requires(!("\n" in line))
			requires(line[0] == '1')
		{
			var tokens = Tokenize(line);

			m_Center = Vector((float)double.parse(tokens[2]), (float)double.parse(tokens[3]), (float)double.parse(tokens[4]));
			m_Transform = Matrix((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]),
								(float)double.parse(tokens[8]), (float)double.parse(tokens[9]), (float)double.parse(tokens[10]),
								(float)double.parse(tokens[11]), (float)double.parse(tokens[12]), (float)double.parse(tokens[13]));

			m_Colour = int.parse(tokens[1]);
			m_Text = tokens[14].strip().down();

			// generate contents
			m_Contents = locator(m_Text);
		}

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

		public Matrix Transform
		{
			get
			{
				return m_Transform;
			}
		}

		public Vector Center
		{
			get
			{
				return m_Center;
			}
		}

		public override string Name { get {return m_Contents.FileName;} }

		public override string Type { get {return "Part";} }
		
		public void Move(Vector shift)
		{
			m_Center.Add(shift);
		}
	}

	public class LineNode : LdrawNode
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
			var tokens = Tokenize(line);
			m_A = Vector((float)double.parse(tokens[2]), (float)double.parse(tokens[3]), (float)double.parse(tokens[4]));
			m_B = Vector((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]));
			m_Colour = int.parse(tokens[1]);
		}

		public override int ColourId { get {return m_Colour; } }

		public override string Description { get {return "Line";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public override string Type { get {return "Line";} }
	}

	public class TriangleNode : LdrawNode
	{
		private int m_Colour;
		private Vector m_A;
		private Vector m_B;
		private Vector m_C;

		public TriangleNode(int colour, Vector a, Vector b, Vector c)
		{
			m_Colour = colour;
			m_A = a;
			m_B = b;
			m_C = c;
		}

		public TriangleNode.FromLine(string line)
			requires(!("\n" in line))
			requires(line[0] == '3')
		{
			var tokens = Tokenize(line);
			m_A = Vector((float)double.parse(tokens[2]), (float)double.parse(tokens[3]), (float)double.parse(tokens[4]));
			m_B = Vector((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]));
			m_C = Vector((float)double.parse(tokens[8]), (float)double.parse(tokens[9]), (float)double.parse(tokens[10]));
			m_Colour = int.parse(tokens[1]);
		}

		public override int ColourId { get {return m_Colour; } }

		public override string Description { get {return "Triangle";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public Vector C { get {return m_C;}}

		public override string Type { get {return "Triangle";} }
	}

	public class QuadNode : LdrawNode
	{
		private int m_Colour;
		private Vector m_A;
		private Vector m_B;
		private Vector m_C;
		private Vector m_D;

		public QuadNode(int colour, Vector a, Vector b, Vector c, Vector d)
		{
			m_Colour = colour;
			m_A = a;
			m_B = b;
			m_C = c;
			m_D = d;
		}

		public QuadNode.FromLine(string line)
			requires(!("\n" in line))
			requires(line[0] == '4')
		{
			var tokens = Tokenize(line);
			m_A = Vector((float)double.parse(tokens[2]), (float)double.parse(tokens[3]), (float)double.parse(tokens[4]));
			m_B = Vector((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]));
			m_C = Vector((float)double.parse(tokens[8]), (float)double.parse(tokens[9]), (float)double.parse(tokens[10]));
			m_D = Vector((float)double.parse(tokens[11]), (float)double.parse(tokens[12]), (float)double.parse(tokens[13]));
			m_Colour = int.parse(tokens[1]);
		}

		public override int ColourId { get {return m_Colour; } }

		public override string Description { get {return "Quad";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public Vector C { get {return m_C;}}

		public Vector D { get {return m_D;}}

		public override string Type { get {return "Quad";} }
	}

	public class CondLineNode : LdrawNode
	{
		private int m_Colour;
		private Vector m_A;
		private Vector m_B;
		private Vector m_Control1;
		private Vector m_Control2;

		public CondLineNode(int colour, Vector a, Vector b, Vector control1, Vector control2)
		{
			m_Colour = colour;
			m_A = a;
			m_B = b;
			m_Control1 = control1;
			m_Control2 = control2;
		}

		public CondLineNode.FromLine(string line)
			requires(!("\n" in line))
			requires(line[0] == '5')
		{
			var tokens = Tokenize(line);
			m_A = Vector((float)double.parse(tokens[2]), (float)double.parse(tokens[3]), (float)double.parse(tokens[4]));
			m_B = Vector((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]));
			m_Control1 = Vector((float)double.parse(tokens[8]), (float)double.parse(tokens[9]), (float)double.parse(tokens[10]));
			m_Control2 = Vector((float)double.parse(tokens[11]), (float)double.parse(tokens[12]), (float)double.parse(tokens[13]));
			m_Colour = int.parse(tokens[1]);
		}

		public override int ColourId { get {return m_Colour; } }

		public override string Description { get {return "Conditional Line";}}

		public Vector A { get {return m_A;}}

		public Vector B { get {return m_B;}}

		public Vector Control1 { get {return m_Control1;}}

		public Vector Control2 { get {return m_Control2;}}

		public override string Type { get {return "Conditional Line";} }
	}

	public class Comment : LdrawNode
	{
		private string m_CommentText;

		public Comment(string comment)
		{
			m_CommentText = comment;
		}

		public Comment.FromLine(string line)
			requires(!("\n" in line))
			requires(line[0] == '0')
		{
			if(line.has_prefix("0 //"))
				m_CommentText = line.substring(4);
			else
				m_CommentText = line.substring(2);
		}

		public override int ColourId {get {return 0;}}

		public override string Description {get {return m_CommentText; } }

		public override string Type { get {return "Comment";} }
	}
}
