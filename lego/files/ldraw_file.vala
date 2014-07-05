using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawFile : Object
	{
		public LdrawFile()
		{
			MainObject = new LdrawObject("", this);
		}

		public LdrawFile.FromFile(File file, LdrawParser parser)
			throws ParseError
		{
			MainObject = new LdrawObject("", this);
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

					LdrawNode nodeForLine = parser.ParseLine(line, ReferenceLoadStrategy.PartsOnly);
					if(nodeForLine is Comment)
						if(HandleCommentLine(line))
							continue;
					MainObject.AddNode(nodeForLine);
				}
				MainObject.FileName = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
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

		// return true to indicate that all processing on this line is done,
		// false to create a node for this comment.
		public virtual bool HandleCommentLine(string line)
			throws ParseError
		{
			return false;
		}

		public LdrawObject MainObject {get; construct set;}
	}

	public abstract class LdrawModelFile : LdrawFile
	{
		public abstract void Save();

		public string FileName { get; construct set; }

		public string FilePath {get; construct set;}
	}
}
