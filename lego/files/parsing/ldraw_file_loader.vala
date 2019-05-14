using Gee;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Utils;
using Diva;

namespace Ldraw.Lego
{
	public class LdrawFileLoader : Object
	{
		public IDatFileCache Library {construct; private get;}
		public LdrawParser Parser {construct; private get;}
		public Index<ISubFileLocator, ReferenceLoadStrategy> Locators {construct; private get;}
		public FileReaderFactory ReaderFactory {construct; private get;}
		public ColourContext ColourContext {construct; private get;}

		static construct
		{
			var cls = (ObjectClass)typeof(LdrawFileLoader).class_ref();
			set_indexed_injection<ReferenceLoadStrategy, ISubFileLocator>(cls, "Locators");
		}

		public async LdrawModelFile LoadModelFile(string filepath, ReferenceLoadStrategy strategy, bool observable = false)
			throws ParseError
		{			
			var file = File.new_for_path(filepath);
			var filename = yield get_filename(file, filepath);
			
			var fileReader = ReaderFactory.GetReader(file);
			MultipartSubFileLocator locator = new MultipartSubFileLocator(Locators[strategy]);
			var colours = new CurrentFileColourContext(ColourContext);
			
			Gee.List<LdrawNode> file_nodes;
			string next_filename;
			string current_filename;
			var result = yield read_file_nodes(fileReader, locator, colours, observable, out file_nodes, out next_filename);
			stderr.printf(@"Read $(file_nodes.size) from file: $result.\n");
			var mainObject = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: file_nodes, FileName: filename);
			if(result) // read all nodes in the file in one go, this is a simple Ldraw file
			{
				stderr.printf(@"Loaded $filename as simple Ldraw file.\n");
				var model = (LdrawModel)Object.new(typeof(LdrawModel), MainObject: mainObject, FileName: filename, FilePath: filepath);
				//mainObject.File = model;
				return model;
			}
			
//~ 			stderr.printf(@"Loading $filename as multipart Ldraw file. First file is $current_filename\n");
			var sub_files = new ObservableList<LdrawObject>();
			sub_files.add(mainObject);
			// We encountered 0 NOFILE, this is an MPD file.
			current_filename = next_filename;
			while(!(yield read_file_nodes(fileReader, locator, colours, observable, out file_nodes, out next_filename)))
			{
				stderr.printf(@"Read sub-file $current_filename from multipart.\n");
				var sub_file = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: file_nodes, FileName: current_filename);
				sub_files.add(sub_file);
				current_filename = next_filename;
			}
			locator.ResolveAll(sub_files);
			var modelFile = (LdrawModelFile)Object.new(typeof(MultipartModel), MainObject: mainObject, SubModels: sub_files, FileName: filename, FilePath: filepath);
			return modelFile;		
		}
		
		private async string get_filename(File file, string filepath)
			throws ParseError
		{			
			if(!file.query_exists() || file.query_file_type(FileQueryInfoFlags.NONE) != FileType.REGULAR)
			{
				throw new ParseError.MissingFile(@"Unable to find file $filepath.");
			}
			try
			{
				return file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
			}
			catch(Error e)
			{
				throw new ParseError.CorruptFile(@"Unable to load from filepath: $(e.message)");
			}
		}
		
		/// returns true if the file is finished, false on reaching a 0 NOFILE Statement.
		private async bool read_file_nodes(LdrawFileReader reader, MultipartSubFileLocator locator, CurrentFileColourContext colours, bool observable, out Gee.List<LdrawNode> nodes, out string? next_filename)
			throws ParseError
		{
			nodes = observable ? (Gee.List<LdrawNode>)new ObservableList<LdrawNode>() : new ArrayList<LdrawNode>();
			next_filename = null;
			while(true)
			{
				var node = yield reader.next(locator, colours);
				if(node == null) {
					stderr.printf("Reached end of file.\n");
					return true; }
					
				if(node is MultipartFileEnd) {
					stderr.printf("Multipart file ended.\n");
//~ 					return false;
				}
				
				if(node is MultipartFileStart)
				{
					stderr.printf("Multipart file started.\n");
					var fileStart = (MultipartFileStart)node;
					if((nodes.is_empty && next_filename == null))
					{
						continue;
					}
					next_filename = fileStart.filename;
					return false;
				}
				
				UpdateColours(node as ColourMetaCommand, colours);
				nodes.add(node);
			}
		}
		
		private void UpdateColours(ColourMetaCommand? command, CurrentFileColourContext context)
		{
			if(command == null)
				return;
			context.RegisterColour(command.CommandColour);
		}
	}
	
	private class CurrentFileColourContext : Object, ColourContext
	{
		ColourContext base_context;
		
		private Map<int, Colour> overrideColours = new HashMap<int, Colour>();
		
		public CurrentFileColourContext(ColourContext base_context)
		{
			this.base_context = base_context;
		}
		
		public Colour GetColourById(int colourId)
		{
			return overrideColours[colourId] ?? base_context.GetColourById(colourId);
		}
		
		public void RegisterColour(Colour colour)
		{
			overrideColours[colour.Code] = colour;
		}
	}
}
