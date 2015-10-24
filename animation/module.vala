using Diva;

using Ldraw.Animation;
using Ldraw.Lego;
using Ldraw.Ui;

namespace Ldraw
{
	public class AnimationModule : Module
	{
		public override void load(ContainerBuilder builder)
		{      			
			builder.register<AnimationCommandFactory>()
					.keyed<CommandFactory, string>("ANIM");
			builder.register<AnimationMenuSource>().as<MenuItemSource>();
		}
	}
}
