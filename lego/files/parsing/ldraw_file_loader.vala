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
			File file = File.new_for_path(filepath);
			if(!file.query_exists() || file.query_file_type(FileQueryInfoFlags.NONE) != FileType.REGULAR)
			{
				throw new ParseError.MissingFile(@"Unable to find part file $filepath.");
			}
			var fileReader = ReaderFactory.GetReader(file);
			MultipartSubFileLocator locator = null;
			var colours = new CurrentFileColourContext(ColourContext);

			Gee.List<LdrawNode> currentObject = observable ? (Gee.List<LdrawNode>)new ObservableList<LdrawNode>() : new ArrayList<LdrawNode>();
			LdrawObject mainObject = null;
			ObservableList<LdrawObject> subObjs = new ObservableList<LdrawObject>();
			string currentFileName = null;
			LdrawNode node;
			while((node = yield fileReader.next((ISubFileLocator)locator ?? Locators[strategy], colours)) != null)
			{
				if(node is MetaCommand)
				{
					MetaCommand command = (MetaCommand)node;
					switch(command.Command)
					{
						case "NOFILE":
							if(currentFileName == null)
								throw new ParseError.InvalidMultipart("Each file in an MPD document must start with a 0 FILE line.");

							LdrawObject foo = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: currentObject, FileName: currentFileName);
							if(mainObject == null)
							{
								mainObject = foo;
							}
							subObjs.add(foo);
							currentObject = observable ? (Gee.List<LdrawNode>)new ObservableList<LdrawNode>() : new ArrayList<LdrawNode>();
							currentFileName = null;
							continue;
						case "FILE":
							if(!currentObject.is_empty && currentFileName == null)
							{
								throw new ParseError.InvalidMultipart("There may not be any LDraw commands between MPD files.");
							}
							if(currentFileName != null)
							{
								LdrawObject foo = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: currentObject, FileName: currentFileName);
								if(mainObject == null)
								{
									mainObject = foo;
								}
								subObjs.add(foo);
							}
							if(locator == null)
							{
								locator = new MultipartSubFileLocator(Locators[strategy]);
							}

							currentObject = observable ? (Gee.List<LdrawNode>)new ObservableList<LdrawNode>() : new ArrayList<LdrawNode>();
							currentFileName = command.Arguments[0];
							continue;
					}
					UpdateColours(command as ColourMetaCommand, colours);
				}
				currentObject.add(node);
			}

			string filename;
			try
			{
				filename = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
			}
			catch(Error e)
			{
				throw new ParseError.CorruptFile(@"Unable to load from filepath: $(e.message)");
			}

			if(mainObject == null)
			{
				mainObject = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: currentObject, FileName: filename);
				var model = (LdrawModel)Object.new(typeof(LdrawModel), MainObject: mainObject, FileName: filename, FilePath: filepath);
				mainObject.File = model;
				return model;
			}
			else
			{
				if(currentFileName != null)
				{
					LdrawObject foo = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: currentObject, FileName: currentFileName);
					if(mainObject == null)
					{
						mainObject = foo;
					}
					else
						subObjs.add(foo);
				}
				var modelFile = (LdrawModelFile)Object.new(typeof(MultipartModel), MainObject: mainObject, SubModels: subObjs, FileName: filename, FilePath: filepath);
				foreach(var o in subObjs)
				{
					o.File = modelFile;
				}
				locator.ResolveAll(subObjs);
				return modelFile;
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
