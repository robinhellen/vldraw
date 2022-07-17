using Ldraw.Lego.Nodes;

namespace Ldraw.Animation
{
	private abstract class AnimationCommand : MetaCommand
	{
		protected AnimationCommand(string command, string[] arguments)
		{
			base(command, arguments);
			AnimCommand = arguments[0];
		}

		public string AnimCommand {get; set;}

		public abstract bool Equals(AnimationCommand other);
	}
}
