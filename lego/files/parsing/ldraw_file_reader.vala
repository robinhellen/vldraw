using Gee;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileReader : Object
	{
		private LdrawParser m_Parser;
		private File file;
		private ReferenceLoadStrategy strategy;
		private DataInputStream stream;

		public LdrawFileReader(File file, ReferenceLoadStrategy strategy, LdrawParser parser)
		{
			m_Parser = parser;
			this.file = file;
			this.strategy = strategy;
			stream = new DataInputStream(file.read());
		}
		
		public LdrawNode? next()
			throws ParseError, IOError, Error
		{
			string line;
			line = stream.read_line();
			if(line == null)
				return null;
			
			line = line.strip();
			if(line == "")
				return next(); // ignore blank lines

			return m_Parser.ParseLine(line, strategy);
		}
	}
	
	public class FileReaderFactory : Object
	{
		public LdrawParser Parser {private get; construct;}
		
		public LdrawFileReader GetReader(File file, ReferenceLoadStrategy strategy)
		{
			return new LdrawFileReader(file, strategy, Parser);
		}
	}
}
