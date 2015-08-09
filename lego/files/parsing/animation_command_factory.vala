using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class AnimationCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			if(command != "!ANIM")
				assert_not_reached();
				
			switch(args[0])
			{
				case "ROTATE":
					return new AnimRotateCommand(command, args);
				case "PARAMETER":
					return new AnimParameterCommand(command, args);
					
				default:
					assert_not_reached();
			}
			
		}
	}
}

