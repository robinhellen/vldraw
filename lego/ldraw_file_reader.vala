using Gee;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileReader : Object
	{
		private LdrawParser m_Parser;

		public LdrawFileReader(LdrawParser parser)
		{
			m_Parser = parser;
		}

		public Generator<LdrawNode> GetNodesFromFile(File file)
			throws ParseError
		{
			return new NodeGenerator(file, m_Parser);
		}

		private class NodeGenerator : Generator<LdrawNode>
		{
			private File m_File;
			private LdrawParser m_Parser;

			public NodeGenerator(File file, LdrawParser parser)
			{
				stdout.printf("constructing node generator.\n");
				m_File = file;
				m_Parser = parser;
				helper();
				stdout.printf("constructed node generator.\n");
			}

			protected override async void generate()
			{
				stdout.printf("generate called.\n");
				try
				{
					DataInputStream inStream = new DataInputStream(m_File.read());
					string line;
					int lineNo = 0;
					while((line = inStream.read_line(null)) != null)
					{
						line = line.strip();
						lineNo++;
						if(line == "")
							continue; // ignore blank lines

						LdrawNode nodeForLine = m_Parser.ParseLine(line);
						if(nodeForLine != null)
							yield feed(nodeForLine);
					}
				}
				catch(IOError e)
				{
				}
				catch(Error e)
				{
				}
			}
		}
	}
}
