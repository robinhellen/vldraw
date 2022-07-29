using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class StandardsCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			switch(command)
			{
				case "LDRAW_ORG":
				case "!LDRAW_ORG":
					return new LdrawOrgHeader(command, args);
				
				default:
					assert_not_reached();
			}
		}
	}
	
	public class MultipartCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			switch(command)
			{
				case "FILE":
				case "!FILE":
					return new MultipartFileStart(command, args);
				case "NOFILE":
				case "!NOFILE":
					return new MultipartFileEnd(command, args);
				
				default:
					assert_not_reached();
			}
		}
	}
	
	private class MultipartFileStart : MetaCommand
	{
		public string filename {get; set;}
		
		public MultipartFileStart(string command, string[] args)
		{
			base(command, args);
			filename = args[0];
		}
	}
	
	private class MultipartFileEnd : MetaCommand
	{
		public MultipartFileEnd(string command, string[] args)
		{
			base(command, args);
		}
	}
}
