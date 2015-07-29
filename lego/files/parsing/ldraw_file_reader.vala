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
		
		public async LdrawNode? next(ISubFileLocator locator, ColourContext colourContext)
			throws ParseError, IOError, Error
		{
			string line;
			line = yield stream.read_line_async();
			if(line == null)
				return null;
			
			line = line.strip();
			if(line == "")
				return yield next(locator, colourContext); // ignore blank lines

			return yield m_Parser.ParseLine(line, locator, colourContext);
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
