using Gee;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileReader : Object
	{
		private LdrawParser parser;
		private DataInputStream stream;
		private int64 file_size;
		private ReferenceContext ref_context;

		public LdrawFileReader(File file, LdrawParser parser, ReferenceContext ref_context)
			throws ParseError
		{
			this.parser = parser;
			this.ref_context = ref_context;
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
		
		public async LdrawNode? next(Collection<ISubFileLocator> locators, ColourContext colourContext)
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
				return yield next(locators, colourContext); // ignore blank lines

			return yield parser.ParseLine(line, locators, colourContext, ref_context);
		}
		
		public double get_progress()
		{
			return ((double)stream.tell()) / file_size;
		}
	}
	
	public class FileReaderFactory : Object
	{
		public LdrawParser parser {private get; construct;}
		
		public LdrawFileReader GetReader(File file, ReferenceContext context)
			throws ParseError
		{
			return new LdrawFileReader(file, parser, context);
		}
	}
}
