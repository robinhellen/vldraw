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
            builder.register<PovrayVisitor2>()
				.ignore_property("t-type")
				.ignore_property("t-dup-func")
				.ignore_property("t-destroy-func");
			builder.register<DefaultObjectWriter>().as<PovrayObjectWriter>();
		}
	}
}
