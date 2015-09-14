using Diva;

using Ldraw.Application;

namespace Ldraw.Lego.Library
{
	public class LibraryModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<StandardColourContext>()
				.single_instance()
				.as<ColourContext>()
				.as<InitializeOnStartup>();
			builder.register<ColourMetaCommandFactory>()
				.keyed<CommandFactory, string>("COLOUR");
		}
	}
}
