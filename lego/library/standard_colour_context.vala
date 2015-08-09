using Diva;
using Gee;

using Ldraw.Application;
using Ldraw.Lego;

namespace Ldraw.Lego.Library
{
	private class StandardColourContext : Object, ColourContext, InitializeOnStartup
	{
		public LdrawParser Parser {construct; private get;}
		public FileReaderFactory ReaderFactory {construct; private get;}
		public ILdrawFolders Folders {construct; private get;}
		
		private Map<int, Colour> allColours;
		
		public void Initialize()
		{
			var loop = new MainLoop();
			LoadAllColours.begin(() => loop.quit());
			allColours[16] = Colour.MainColour;
			allColours[24] = Colour.ComplementColour;
			loop.run();
		}
		
		public async void LoadAllColours()
		{
			allColours = new HashMap<int, Colour>();
			
			File file = Folders.LibraryDirectory.get_child("LDConfig.ldr");
			var fileReader = ReaderFactory.GetReader(file);
			LdrawNode node;
			while((node = yield fileReader.next(null, null)) != null)
			{
				ColourMetaCommand colourCommand = node as ColourMetaCommand;
				if(colourCommand == null)
					continue; // TODO: Log an error if the node isn't a !COLOUR command
				var colour = colourCommand.CommandColour;
				allColours[colour.Code] = colour;
			}
		}
		
		public Colour GetColourById(int colourId)
		{
			return allColours[colourId];
		}
	}
}
