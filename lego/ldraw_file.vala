using Gee;
using Ldraw.Maths;

namespace Ldraw.Lego
{
	public abstract class LdrawFile : Object
	{
		private LinkedList<LdrawNode> m_Nodes;
		private const string c_LdrawDirectory = "/home/robin/ldraw";
		private string m_FileName;
		private Bounds m_BoundingBox = null;
		private bool m_ChangingSelection = false;

		protected LdrawFile()
		{
			m_Nodes = new LinkedList<LdrawNode>();
		}

		public LdrawFile.FromFileName(string filename)
			throws ParseError
		{
			// TODO: find the file and send it on to parse
			string correctedFileName = filename.replace("\\", "/");
			File file = File.new_for_path(@"$c_LdrawDirectory/$correctedFileName");
			this.FromFile(file);
			m_FileName = filename;
		}

		public LdrawFile.FromFile(File file)
			throws ParseError
		{
			this();
			// actually open and parse the file
			try
			{
				DataInputStream inStream = new DataInputStream(file.read());
				string line;
				int lineNo = 0;
				while((line = inStream.read_line(null)) != null)
				{
					line = line.strip();
					lineNo++;
					if(line == "")
						continue; // ignore blank lines

					LdrawNode nodeForLine;
					switch(line[0])
					{
						case '0':
							// may be a meta command
							if(HandleCommentLine(line))
							{
								continue;
							}
							nodeForLine = new Comment(line);
							break;
						case '1':
							nodeForLine =  new PartNode.FromLine(line, LoadPartFromReference);
							break;
						case '2':
							nodeForLine =  new LineNode.FromLine(line);
							break;
						case '3':
							nodeForLine =  new TriangleNode.FromLine(line);
							break;
						case '4':
							nodeForLine =  new QuadNode.FromLine(line);
							break;
						case '5':
							nodeForLine =  new CondLineNode.FromLine(line);
							break;
						default:
							throw new ParseError.UnknownLineType(@"Unable to parse line $lineNo.");
					}
					m_Nodes.add(nodeForLine);
					nodeForLine.notify["Selected"].connect(Nodes_OnSelectChanged);
				}
				m_FileName = file.query_info(FILE_ATTRIBUTE_STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
			}
			catch(IOError e)
			{
				string innerMessage = e.message;
				throw new ParseError.CorruptFile(@"Unable to read the file.\n$innerMessage");
			}
			catch(Error e)
			{
				string innerMessage = e.message;
				throw new ParseError.CorruptFile(@"Unable to read the file.\n$innerMessage");
			}
		}

		public abstract string Description {get;}

		public string FileName
		{
			get
			{
				return m_FileName;
			}
			protected set
			{
				m_FileName = value;
			}
		}

		public void BuildFromFile(LdrawBuilder builder)
		{
			foreach(LdrawNode node in m_Nodes)
			{
				builder.BuildNode(node);

				if(node is LineNode)
					builder.BuildLine((LineNode) node);
				else if(node is TriangleNode)
					builder.BuildTriangle((TriangleNode) node);
				else if(node is QuadNode)
					builder.BuildQuad((QuadNode) node);
				else if(node is CondLineNode)
					builder.BuildCondLine((CondLineNode) node);
				else if(node is PartNode)
					builder.BuildSubModel((PartNode) node);
				else if(node is Comment)
					builder.BuildComment((Comment) node);
			}
		}

		public void ClearSelection()
		{
			m_ChangingSelection = true;
			foreach(LdrawNode node in m_Nodes)
			{
				node.Selected = false;
			}
			m_ChangingSelection = false;
		}

		// return true to indicate that all processing on this line is done,
		// false to create a node for this comment.
		public virtual bool HandleCommentLine(string line)
			throws ParseError
		{
			return false;
		}

		public abstract LdrawFile LoadPartFromReference(string reference)
			throws ParseError;

		public Bounds BoundingBox
		{
			get
			{
				if(m_BoundingBox == null)
				{
					m_BoundingBox = CalculateBounds();
				}
				return m_BoundingBox;
			}
		}

		public PartNode? LastSubFile
		{
			get
			{
				weak PartNode lastSubFile = null;
				foreach(LdrawNode node in m_Nodes)
				{
					if(!(node is PartNode))
					{
						continue;
					}
					lastSubFile = node as PartNode;
				}
				return lastSubFile;
			}
		}

		public PartNode? LastSelected
		{
			get
			{
				weak PartNode lastSubFile = null;
				foreach(LdrawNode node in m_Nodes)
				{
					if(!(node is PartNode) || !node.Selected)
					{
						continue;
					}
					lastSubFile = node as PartNode;
				}
				return lastSubFile;
			}
		}

		public void AddNode(LdrawNode newNode, LdrawNode? after = null)
		{
			if(after == null)
			{
				m_Nodes.add(newNode);
			}
			else
			{
				m_Nodes.insert(m_Nodes.index_of(after) + 1, newNode);
			}
			VisibleChange();
		}

		protected Bounds CalculateBounds()
		{
			Bounds bounds = new Bounds();
			foreach(LdrawNode node in m_Nodes)
			{
				if(node is PartNode)
				{
					PartNode part = (PartNode)node;
					bounds.IncludeBounds(part.Contents.BoundingBox, part.Transform, part.Center);
				}
				else if(node is LineNode)
				{
					bounds.Union(((LineNode)node).A);
					bounds.Union(((LineNode)node).B);
				}
				else if(node is TriangleNode)
				{
					bounds.Union(((TriangleNode)node).A);
					bounds.Union(((TriangleNode)node).B);
					bounds.Union(((TriangleNode)node).C);
				}
				else if(node is QuadNode)
				{
					bounds.Union(((QuadNode)node).A);
					bounds.Union(((QuadNode)node).B);
					bounds.Union(((QuadNode)node).C);
					bounds.Union(((QuadNode)node).D);
				}
				else if(node is CondLineNode)
				{
					bounds.Union(((CondLineNode)node).A);
					bounds.Union(((CondLineNode)node).B);
				}
			}
			return bounds;
		}

		private void Nodes_OnSelectChanged(ParamSpec pspec)
		{
			if(m_ChangingSelection)
				return;

			VisibleChange();
		}

		public signal void VisibleChange();
	}

	public errordomain ParseError
	{
		UnknownLineType,
		CorruptFile,
		MissingFile,
		InvalidComment,
	}
}
