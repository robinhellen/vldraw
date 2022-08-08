using Diva;
using Gee;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Colours
{
	private class StandardColourContext : Object, ColourContext, InitializeOnStartup
	{
		const string reporting_task_name = "Loading colour definitions.";
		
		public LdrawParser Parser {construct; private get;}
		public FileReaderFactory ReaderFactory {construct; private get;}
		public ILdrawFolders Folders {construct; private get;}
		
		private Map<int, Colour> allColours;
		
		public async bool Initialize(ProgressReporter reporter)
		{
			reporter.start_task(reporting_task_name);
			try
			{
				yield LoadAllColours(reporter);
			}
			catch(ParseError e)
			{
				reporter.task_error(reporting_task_name, @"Unable to load colour definitions $(e.message)");
				return false;
			}
			allColours[16] = Colour.MainColour;
			allColours[24] = Colour.ComplementColour;
			reporter.end_task(reporting_task_name);
			return true;
		}
		
		public async void LoadAllColours(ProgressReporter reporter)
			throws ParseError
		{
			allColours = new HashMap<int, Colour>();
			
			File file = Folders.LibraryDirectory.get_child("LDConfig.ldr");
			var fileReader = ReaderFactory.GetReader(file, ReferenceContext.Library);
			var locator = new NullLocator();
			var locators = new ArrayList<ISubFileLocator>();
			locators.add(locator);
			LdrawNode node;
			while((node = yield fileReader.next(locators, this)) != null)
			{
				var progress = fileReader.get_progress();
				ColourMetaCommand colourCommand = node as ColourMetaCommand;
				if(colourCommand == null)
					continue; // TODO: Log an error if the node isn't a !COLOUR command
				var colour = colourCommand.CommandColour;
				allColours[colour.Code] = colour;
				reporter.task_progress(reporting_task_name, progress);
			}
		}
		
		public Colour GetColourById(int colourId)
		{
			return allColours[colourId];
		}
		
		private class NullLocator : Object, ISubFileLocator
		{			
			public async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context)
				throws ParseError
			{
				throw new ParseError.CorruptFile("Colour definitions files should not load parts.");
			}
		}
	}
}
