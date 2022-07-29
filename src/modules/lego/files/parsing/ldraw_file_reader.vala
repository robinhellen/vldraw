using Gee;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileReader : Object
	{
		private LdrawParser m_Parser;
		private DataInputStream stream;
		private int64 file_size;

		public LdrawFileReader(File file, LdrawParser parser)
			throws ParseError
		{
			m_Parser = parser;
			try
			{
				stream = new DataInputStream(file.read());
				file_size = file.query_info(FileAttribute.STANDARD_SIZE, FileQueryInfoFlags.NONE).get_size();
			}
			catch(Error e)
			{
				throw new ParseError.FilesystemError(@"Error opening file for reading: $(e.message).");
			}
		}
		
		public async LdrawNode? next(ISubFileLocator locator, ColourContext colourContext)
			throws ParseError
		{
			string line;
			try
			{
				line = yield stream.read_line_async();
			}
			catch(Error e)
			{
				throw new ParseError.FilesystemError(@"Error reading file: $(e.message).");
			}
			if(line == null)
				return null;
			
			line = line.strip();
			if(line == "")
				return yield next(locator, colourContext); // ignore blank lines

			return yield m_Parser.ParseLine(line, locator, colourContext);
		}
		
		public double get_progress()
		{
			return ((double)stream.tell()) / file_size;
		}
	}
	
	public class FileReaderFactory : Object
	{
		public LdrawParser Parser {private get; construct;}
		
		public LdrawFileReader GetReader(File file)
			throws ParseError
		{
			return new LdrawFileReader(file, Parser);
		}
	}
}
