using Diva;

using Ldraw.Animation;
using Ldraw.Lego;

namespace Ldraw
{
	public class AnimationModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<AnimationCommandFactory>()
						.keyed<CommandFactory, string>("ANIM");			
		}
	}
}
