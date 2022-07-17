using Diva;

using Ldraw.Application;
using Ldraw.Lego.Library;
using Ldraw.Ui;
using Ldraw.Lego;

namespace Ldraw.Colours
{
	public class ColoursModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<StandardColourContext>()
				.single_instance()
				.as<ColourContext>()
				.as<InitializeOnStartup>();
            builder.register<ColourToolbar>().as<ToolbarProvider>();
            builder.register<ColourOptions>()
				.single_instance()
				.as<InitializeOnStartup>();
		}
	}
}

