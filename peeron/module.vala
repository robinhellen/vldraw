using Diva;

using Ldraw.Peeron;
using Ldraw.Ui;

namespace Ldraw
{
	public class PeeronModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<SetList>().as<IPartDragSource>();
			
            builder.register<InventoryReader>();
            builder.register<ColourChart>();
		}
	}
}
