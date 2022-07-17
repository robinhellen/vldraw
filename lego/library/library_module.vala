using Diva;

using Ldraw.Application;

namespace Ldraw.Lego.Library
{
	public class LibraryModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<ColourMetaCommandFactory>()
				.keyed<CommandFactory, string>("COLOUR");				
            builder.register<FileCachedLibrary>().as<ILibrary>().as<InitializeOnStartup>().single_instance();
		}
	}
}
