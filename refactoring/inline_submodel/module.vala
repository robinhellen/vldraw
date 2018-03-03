using Diva;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class InlineSubmodelModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<InlineSubmodelRefactoring>().as<Refactoring>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.Refactor.InlineSubmodelModule);}
