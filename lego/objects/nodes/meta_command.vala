

namespace Ldraw.Lego.Nodes
{
	public class MetaCommand : Comment
	{
		public MetaCommand(string command, string[] args)
		{
			base(command + " " + string.joinv(" ", args));
			Command = command;
			Arguments = args;
		}

		public string Command {get; set;}
		public string[] Arguments {get; set;}
	}

	public class LdrawOrgHeader : MetaCommand
	{
		public LdrawOrgHeader(string command, string[] args)
		{
			base(command, args);
			ObjType = args[0];
			string [] qualifiers = {};
			var i = 1;
			while(args[i] != "ORIGINAL" && args[i] != "UPDATE")
			{
				qualifiers += args[i];
				i++;
			}
			Qualifiers = qualifiers;
			Update = args[i];
			Date = args[i+1];
		}

		public string ObjType {get; set;}
		public string[] Qualifiers {get; set;}
		public string Update {get; set;}
		public string Date {get; set;}
	}
}
