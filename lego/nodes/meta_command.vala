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
}
