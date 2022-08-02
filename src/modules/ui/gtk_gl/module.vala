using Diva;

using Ldraw.Ui.GtkGl;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public class GtkGlModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<LdrawEditPane>()
				.as<ModelEditor>()
				.ignore_property("hadjustment")
				.ignore_property("vadjustment");
            builder.register<LdrawViewPane>().as<ModelView>().keyed<ModelView, string>("new");
            builder.register<DropBoundsOverlay>(); 
		}
	}
}
