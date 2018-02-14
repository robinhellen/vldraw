using Diva;

namespace Ldraw.Lego.Library
{
	public class LibraryModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<ColourMetaCommandFactory>()
				.keyed<CommandFactory, string>("COLOUR");
		}
	}
}
