using Diva;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class SwitchAllModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<SwitchPartRefactoring>().as<Refactoring>();
            builder.register<SwitchColourRefactoring>().as<Refactoring>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.Refactor.SwitchAllModule);}
