using Diva;
using Gee;

using Ldraw.Application;
using Ldraw.Lego;

namespace Ldraw.Lego.Library
{
	private class StandardColourContext : Object, ColourContext, InitializeOnStartup
	{
		const string reporting_task_name = "Loading colour definitions.";
		
		public LdrawParser Parser {construct; private get;}
		public FileReaderFactory ReaderFactory {construct; private get;}
		public ILdrawFolders Folders {construct; private get;}
		
		private Map<int, Colour> allColours;
		
		public async void Initialize(ProgressReporter reporter)
		{
			reporter.start_task(reporting_task_name);
			yield LoadAllColours(reporter);
			allColours[16] = Colour.MainColour;
			allColours[24] = Colour.ComplementColour;
			reporter.end_task(reporting_task_name);
		}
		
		public async void LoadAllColours(ProgressReporter reporter)
		{
			allColours = new HashMap<int, Colour>();
			
			File file = Folders.LibraryDirectory.get_child("LDConfig.ldr");
			var fileReader = ReaderFactory.GetReader(file);
			LdrawNode node;
			while((node = yield fileReader.next(null, null)) != null)
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
	}
}
