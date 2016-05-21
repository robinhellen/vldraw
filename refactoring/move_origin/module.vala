using Diva;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class MoveOriginModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<MoveOriginRefactoring>().as<Refactoring>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.Refactor.MoveOriginModule);}
