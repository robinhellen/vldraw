using Gee;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawFileLoader : Object
	{
		public IDatFileCache Library{construct; private get;}

		public LdrawModelFile LoadModelFile(string filepath)
			throws ParseError
		{
			File file = File.new_for_path(filepath);
			if(!file.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $filepath.");
			}
			var parser = new LdrawParser(new LibrarySubFileLocator(Library));
			var fileReader = new LdrawFileReader(parser);
			var nodes = fileReader.GetNodesFromFile(file);
			MultipartSubFileLocator locator = null;

			ObservableList<LdrawNode> currentObject = new ObservableList<LdrawNode>();
			LdrawObject mainObject = null;
			ObservableList<LdrawObject> subObjs = new ObservableList<LdrawObject>();
			string currentFileName = null;
			foreach(var node in nodes)
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
							currentObject = new ObservableList<LdrawNode>();
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
								locator = new MultipartSubFileLocator(new LibrarySubFileLocator(Library));
								parser.Locator = locator;
							}

							currentObject = new ObservableList<LdrawNode>();
							currentFileName = command.Arguments[0];
							continue;
					}
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
	}
}
