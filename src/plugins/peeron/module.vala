using Diva;

using Ldraw.Peeron;
using Ldraw.Ui;

namespace Ldraw
{
	public class PeeronModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<SetList>().as<IPartDragSource>();

            builder.register<PeeronInventoryReader>().as<InventoryReader>();
            builder.register<RebrickableInventoryReader>().as<InventoryReader>();
            builder.register<ColourChart>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.PeeronModule);}
