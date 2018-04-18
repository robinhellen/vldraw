using Diva;

namespace Ldraw.Lego
{
	public class CommandFactoryModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<StandardsCommandFactory>()
						.keyed<CommandFactory, string>("LDRAW_ORG");
			builder.register<MultipartCommandFactory>()
						.keyed<CommandFactory, string>("FILE")
						.keyed<CommandFactory, string>("NOFILE");
		}
	}
}
