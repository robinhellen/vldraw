using Diva;

using Ldraw.Ui;

namespace Ldraw.Animation
{
	public class TmpModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<AnimationMenuSource>().as<MenuItemSource>();
		}
	}
}
