using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class StandardsCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			switch(command)
			{
				case "FILE":
				case "NOFILE":
					return new MetaCommand(command, args);
				case "LDRAW_ORG":
				case "!LDRAW_ORG":
					return new LdrawOrgHeader(command, args);
				
				default:
					assert_not_reached();
			}
		}
	}
}
