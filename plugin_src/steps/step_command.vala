
using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Steps
{
	private class StepCommand : MetaCommand
	{
		public StepCommand()
		{
			base("STEP", {});
		}
	}
	
	private class StepCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			if(command == "STEP")
				return new StepCommand();
				
			assert_not_reached();
		}
	}
}
