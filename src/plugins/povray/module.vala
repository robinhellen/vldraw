using Diva;

using Ldraw.Export;
using Ldraw.Povray;

namespace Ldraw
{
	public class PovrayModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<PovrayExporter>().as<Exporter>();
            builder.register<PovrayVisitor2>()
				.ignore_property("t-type")
				.ignore_property("t-dup-func")
				.ignore_property("t-destroy-func");
			builder.register<DefaultObjectWriter>().as<PovrayObjectWriter>();
			
			builder.register<PartBuildExporter>().as<Exporter>();
			builder.register<StepBuildExporter>().as<Exporter>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.PovrayModule);}
