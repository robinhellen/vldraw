
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

		public abstract bool Equals(AnimMetaCommand other);
	}

	public class AnimRotateCommand : AnimMetaCommand
	{
		public AnimRotateCommand(string command, string[] arguments)
		{
			base(command, arguments);
			Axis = Vector((float)double.parse(arguments[1]), (float)double.parse(arguments[2]), (float)double.parse(arguments[3]));
			string[] angleExpressionArgs = {};
			for(int i = 4; i < arguments.length; i++)
				angleExpressionArgs += arguments[i];
			Angle = new Expression.Parse(string.joinv(" ", angleExpressionArgs));
		}

		public AnimRotateCommand.Rotation(Vector axis, Expression angle)
		{
			base("!ANIM", new string[] {"ROTATE", axis.X.to_string(), axis.Y.to_string(), axis.Z.to_string(), angle.to_string()});
			Axis = axis;
			Angle = angle;
		}

		public Vector Axis {get; set;}
		public Expression Angle {get; set;}

		public override bool Equals(AnimMetaCommand other)
		{
			return EqualsInner(other as AnimRotateCommand);
		}

		public bool EqualsInner(AnimRotateCommand other)
		{
			if(other == null)
				return false;

			return Axis.Subtract(other.Axis).Magnitude == 0 &&
					Angle.Equals(other.Angle);
		}
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
			ParameterDescription = string.joinv(" ", arguments[(Cyclic ? 5 : 4) : arguments.length]);
			notify.connect(OnNotify);
		}

		public AnimParameterCommand.Blank()
		{
			base("!ANIM", {});
			Identifier = "";
			Min = 0;
			Max = 0;

			Cyclic = false;
			ParameterDescription = "";
			notify.connect(OnNotify);
		}

		public string Identifier {get; set;}
		public float Min {get; set;}
		public float Max {get; set;}

		public bool Cyclic {get; set;}

		public string ParameterDescription {get; set;}

		private void OnNotify(ParamSpec param)
		{
			switch(param.name)
			{
				case "Identifier":
				case "Min":
				case "Max":
				case "Cyclic":
				case "ParameterDescription":
					UpdateProperties();
					break;
			}
		}

		private void UpdateProperties()
		{
			string[] arguments = {"PARAMETER", Identifier, Min.to_string(), Max.to_string()};
			if(Cyclic)
				arguments += "CYCLIC";

			arguments += ParameterDescription;
			Arguments = arguments;
			CommentText = Command + " " + string.joinv(" ", Arguments);
		}

		public override bool Equals(AnimMetaCommand other)
		{
			return EqualsInner(other as AnimParameterCommand);
		}

		public bool EqualsInner(AnimParameterCommand other)
		{
			if(other == null)
				return false;

			return CommentText == other.CommentText;
		}
	}
}
