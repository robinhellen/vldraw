
using Ldraw.Animation;
using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw
{
	private class AnimationCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			if(command != "!ANIM")
				assert_not_reached();
				
			switch(args[0])
			{
				case "ROTATE":
					return new RotateCommand(command, args);
				case "PARAMETER":
					return new ParameterCommand(command, args);
					
				default:
					assert_not_reached();
			}
			
		}
	}
}

