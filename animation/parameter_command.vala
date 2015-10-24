
using Ldraw.Expressions;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Animation
{
	public class ParameterCommand : AnimationCommand
	{
		public ParameterCommand(string command, string[] arguments)
		{
			base(command, arguments);
			Identifier = arguments[1];
			Min = (float)double.parse(arguments[2]);
			Max = (float)double.parse(arguments[3]);

			Cyclic = arguments[4] == "CYCLIC";
			ParameterDescription = string.joinv(" ", arguments[(Cyclic ? 5 : 4) : arguments.length]);
			notify.connect(OnNotify);
		}

		public ParameterCommand.Blank()
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

		public override bool Equals(AnimationCommand other)
		{
			return EqualsInner(other as ParameterCommand);
		}

		public bool EqualsInner(ParameterCommand other)
		{
			if(other == null)
				return false;

			return CommentText == other.CommentText;
		}
	}
}
