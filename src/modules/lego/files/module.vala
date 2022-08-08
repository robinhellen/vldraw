using Diva;

using Ldraw.Lego.Library;

namespace Ldraw.Lego
{
	public class LegoModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<LdrawFileLoader>();
            builder.register<FileReaderFactory>();
            builder.register<LdrawParser>();
			builder.register<ColourMetaCommandFactory>().keyed<CommandFactory, string>("COLOUR");	
        }
	}
}
