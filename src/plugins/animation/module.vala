using Diva;

using Ldraw.Animation;
using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Ui;

namespace Ldraw
{
	public class AnimationModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<AnimationCommandFactory>()
					.keyed<CommandFactory, string>("ANIM");
			builder.register<AnimationMenuSource>().as<MenuItemSource>();
			builder.register<RenderAdjuster>().as<NodeAdjuster>().single_instance();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.AnimationModule);}
