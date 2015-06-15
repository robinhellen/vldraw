using Gee;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileReader : Object
	{
		private LdrawParser m_Parser;
		private DataInputStream stream;

		public LdrawFileReader(File file, LdrawParser parser)
		{
			m_Parser = parser;
			stream = new DataInputStream(file.read());
		}
		
		public LdrawNode? next(ISubFileLocator locator)
			throws ParseError, IOError, Error
		{
			string line;
			line = stream.read_line();
			if(line == null)
				return null;
			
			line = line.strip();
			if(line == "")
				return next(locator); // ignore blank lines

			return m_Parser.ParseLine(line, locator);
		}
	}
	
	public class FileReaderFactory : Object
	{
		public LdrawParser Parser {private get; construct;}
		
		public LdrawFileReader GetReader(File file)
		{
			return new LdrawFileReader(file, Parser);
		}
	}
}
