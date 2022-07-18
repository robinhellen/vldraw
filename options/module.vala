using Diva;

using Ldraw.Options;

namespace Ldraw
{
	public class OptionsModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<RunningOptions>().as<IOptions>().single_instance();
		}
	}
}
