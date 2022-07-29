
using Ldraw.Expressions;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Animation
{
	private class RotateCommand : AnimationCommand
	{
		public RotateCommand(string command, string[] arguments)
		{
			base(command, arguments);
			Axis = Vector((float)double.parse(arguments[1]), (float)double.parse(arguments[2]), (float)double.parse(arguments[3]));
			string[] angleExpressionArgs = {};
			for(int i = 4; i < arguments.length; i++)
				angleExpressionArgs += arguments[i];
			Angle = new Expression.Parse(string.joinv(" ", angleExpressionArgs));
		}
 
		public RotateCommand.Rotation(Vector axis, Expression angle)
		{
			base("!ANIM", new string[] {"ROTATE", axis.X.to_string(), axis.Y.to_string(), axis.Z.to_string(), angle.to_string()});
			Axis = axis;
			Angle = angle;
		}

		public Vector Axis {get; set;}
		public Expression Angle {get; set;}

		public override bool Equals(AnimationCommand other)
		{
			return EqualsInner(other as RotateCommand);
		}

		public bool EqualsInner(RotateCommand other)
		{
			if(other == null)
				return false;

			return Axis.Subtract(other.Axis).Magnitude == 0 &&
					Angle.Equals(other.Angle);
		}
	}
}
