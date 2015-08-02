using Diva;

using Ldraw.Application;

namespace Ldraw.Lego.Library
{
	public class LibraryModule : Object
	{
		public void Load(ContainerBuilder builder)
		{
            builder.Register<StandardColourContext>()
				.SingleInstance()
				.As<ColourContext>()
				.As<InitializeOnStartup>();
			builder.Register<ColourMetaCommandFactory>()
				.Keyed<CommandFactory, string>("COLOUR");
		}
	}
}
