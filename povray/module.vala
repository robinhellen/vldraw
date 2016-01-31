using Diva;

using Ldraw.Export;
using Ldraw.Povray;

namespace Ldraw
{
	public class PovrayModule : Module
	{
		public override void load(ContainerBuilder builder)
		{            
            builder.register<PovrayExporter>().as<Exporter>();
		}
	}
}
