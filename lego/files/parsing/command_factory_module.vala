using Diva;

namespace Ldraw.Lego
{
	public class CommandFactoryModule : Object
	{
		public void Load(ContainerBuilder builder)
		{
			builder.Register<StandardsCommandFactory>()
						.Keyed<CommandFactory, string>("FILE")
						.Keyed<CommandFactory, string>("NOFILE")
						.Keyed<CommandFactory, string>("LDRAW_ORG");
			builder.Register<AnimationCommandFactory>()
						.Keyed<CommandFactory, string>("ANIM");
		}
	}
}
