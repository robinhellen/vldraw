using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawFile : Object
	{
		private const string c_LdrawDirectory = "/home/robin/ldraw";
		private string m_FileName;

		public LdrawFile()
		{
			MainObject = new LdrawObject("");
		}

		public LdrawFile.FromFile(File file, LdrawParser parser)
			throws ParseError
		{
			MainObject = new LdrawObject("");
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

					LdrawNode nodeForLine = parser.ParseLine(line);
					if(nodeForLine is Comment)
						if(HandleCommentLine(line))
							continue;
					MainObject.AddNode(nodeForLine);
				}
				m_FileName = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
				MainObject.FileName = m_FileName;
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

		public string FilePath {get; set;}

		// return true to indicate that all processing on this line is done,
		// false to create a node for this comment.
		public virtual bool HandleCommentLine(string line)
			throws ParseError
		{
			return false;
		}

		public LdrawObject MainObject {get; set;}
	}

	public abstract class LdrawModelFile : LdrawFile
	{
		public abstract void Save();
	}
}
