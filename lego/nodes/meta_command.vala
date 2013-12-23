
using Ldraw.Expressions;
using Ldraw.Maths;

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

	public abstract class AnimMetaCommand : MetaCommand
	{
		public AnimMetaCommand(string command, string[] arguments)
		{
			base(command, arguments);
			AnimCommand = arguments[0];
		}

		public string AnimCommand {get; set;}
	}

	public class AnimRotateCommand : AnimMetaCommand
	{
		public AnimRotateCommand(string command, string[] arguments)
		{
			base(command, arguments);
			Axis = Vector((float)double.parse(arguments[1]), (float)double.parse(arguments[2]), (float)double.parse(arguments[3]));
			Angle = new Expression.Parse(string.joinv(" ", arguments[4:-1]));
		}

		public Vector Axis {get; set;}
		public Expression Angle {get; set;}
	}

	public class AnimParameterCommand : AnimMetaCommand
	{
		public AnimParameterCommand(string command, string[] arguments)
		{
			base(command, arguments);
			Identifier = arguments[1];
			Min = (float)double.parse(arguments[2]);
			Max = (float)double.parse(arguments[3]);

			Cyclic = arguments[4] == "CYCLIC";
			ParameterDescription = string.join(" ", arguments[Cyclic ? 5: 4 :arguments.length]);
		}

		public string Identifier {get; set;}
		public float Min {get; set;}
		public float Max {get; set;}

		public bool Cyclic {get; set;}

		public string ParameterDescription {get; set;}
	}
}
