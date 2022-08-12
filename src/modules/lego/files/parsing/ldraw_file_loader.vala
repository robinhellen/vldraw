using Diva;
using Gee;

using Ldraw.Application;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileLoader : Object
	{
		public Collection<ISubFileLocator> locators {construct; private get;}
		public FileReaderFactory reader_factory {construct; private get;}
		public ColourContext colour_context {construct; private get;}
		public ProgressReporter reporter {construct; private get;}

		static construct
		{
			var cls = (ObjectClass)typeof(LdrawFileLoader).class_ref();
			set_collection_injection<ISubFileLocator>(cls, "locators");
		}

		public async LdrawModelFile LoadModelFile(string filepath, ReferenceContext context, bool observable = false)
			throws ParseError
		{			
			var file = File.new_for_path(filepath);
			var filename = yield get_filename(file, filepath);
			var task_name = @"Loading $filename";
			reporter.start_task(task_name);
			
			var fileReader = reader_factory.GetReader(file, context);
			var colours = new CurrentFileColourContext(colour_context);
			if(context == ReferenceContext.Library) {
				string next_filename = filename;
				var result = yield read_file_nodes(fileReader, locators, colours, observable, next_filename, task_name);
				var mainObject = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: result.nodes, FileName: result.filename);
				if(!result.finished) {
					throw new ParseError.InvalidMultipart(@"Part files in library cannot be multipart files.");
				}
				info(@"Loaded $filename as simple Ldraw file.\n");
				var model = (LdrawModel)Object.new(typeof(LdrawModel), MainObject: mainObject, FileName: filename, FilePath: filepath);
				
				reporter.end_task(task_name);			
				return model;
			}
			
			MultipartSubFileLocator locator = new MultipartSubFileLocator();
			var all_locators = new ArrayList<ISubFileLocator>();
			all_locators.insert_all(0, locators);
			all_locators.insert(locators.size, locator);
			
			string next_filename = filename;
			var result = yield read_file_nodes(fileReader, all_locators, colours, observable, next_filename, task_name);
			var mainObject = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: result.nodes, FileName: result.filename);
			if(result.finished) // read all nodes in the file in one go, this is a simple Ldraw file
			{
				info(@"Loaded $filename as simple Ldraw file.\n");
				var model = (LdrawModel)Object.new(typeof(LdrawModel), MainObject: mainObject, FileName: filename, FilePath: filepath);
				
				reporter.end_task(task_name);			
				return model;
			}
			
			var sub_files = new ObservableList<LdrawObject>();
			sub_files.add(mainObject);
			// We encountered 0 NOFILE, this is an MPD file.
			while(!result.finished)
			{
				next_filename = result.next_filename;
				result = yield read_file_nodes(fileReader, all_locators, colours, observable, next_filename, task_name);
				stderr.printf(@"Read sub-file $(result.filename) from multipart.\n");
				var sub_file = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: result.nodes, FileName: result.filename);
				sub_files.add(sub_file);
			}
			locator.ResolveAll(sub_files);
			var modelFile = (LdrawModelFile)Object.new(typeof(MultipartModel), MainObject: mainObject, SubModels: sub_files, FileName: filename, FilePath: filepath);
			foreach(var sm in sub_files) {
				foreach(var pn in sm.NodesOfType<PartNode>()) {
					if(pn.Contents is MultipartSubFileLocator.ProxyLdrawObject) {
						pn.File = modelFile;
					}
				}
			}
			reporter.end_task(task_name);
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
		
		private struct NodeReadResult
		{
			public bool finished;
			public Gee.List<LdrawNode> nodes;
			public string filename;
			public string? next_filename;			
		}		
		
		/// returns true if the file is finished, false on reaching a 0 NOFILE Statement.
		private async NodeReadResult read_file_nodes(LdrawFileReader reader, Collection<ISubFileLocator> locators, CurrentFileColourContext colours, bool observable, string nf, string task_name)
			throws ParseError
		{
			var result = NodeReadResult();
			result.nodes = observable ? (Gee.List<LdrawNode>)new ObservableList<LdrawNode>() : new ArrayList<LdrawNode>();
			result.filename = nf;			
			result.next_filename = null;
			result.finished = true;
			while(true)
			{
				var node = yield reader.next(locators, colours);
				reporter.task_progress(task_name, reader.get_progress());
				if(node == null) {
					return result; 
				}
					
				if(node is MultipartFileEnd) {
					continue;
				}
				
				if(node is MultipartFileStart)
				{
					var fileStart = (MultipartFileStart)node;
					if((result.nodes.is_empty && result.next_filename == null))
					{
						result.filename = fileStart.filename;
						continue;
					}
					result.next_filename = fileStart.filename;
					result.finished = false;
					return result;
				}
				
				UpdateColours(node as ColourMetaCommand, colours);
				result.nodes.add(node);
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
