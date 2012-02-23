using Gee;

namespace Ldraw.Lego
{
	public abstract class LdrawFile : Object
	{
		private LinkedList<LdrawNode> m_Nodes;
		private const string c_LdrawDirectory = "/home/robin/ldraw";
		private string m_FileName;

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
		}

		public void BuildFromFile(LdrawBuilder builder)
		{
			foreach(LdrawNode node in m_Nodes)
			{
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
			foreach(LdrawNode node in m_Nodes)
			{
				node.Selected = false;
			}
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
	}

	public errordomain ParseError
	{
		UnknownLineType,
		CorruptFile,
		MissingFile,
		InvalidComment,
	}
}
