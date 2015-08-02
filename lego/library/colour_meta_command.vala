using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego.Library
{
	private class ColourMetaCommand : MetaCommand
	{
		public ColourMetaCommand(string command, string[] argTokens)
		{
			base(command, argTokens);
			CommandColour = new Lego.Colour(argTokens);
		}
		
		public Colour CommandColour {get; private set;}
	}
	
	private class ColourMetaCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			if(command != "!COLOUR")
				assert_not_reached();
			
			return new ColourMetaCommand(command, args);
		}
	}
}
