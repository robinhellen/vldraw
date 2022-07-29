using Diva;


namespace Ldraw.Application
{
	public class ApplicationModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<Ldraw.Application.Application>();
		}
	}
}
