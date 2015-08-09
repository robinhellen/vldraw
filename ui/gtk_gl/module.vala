using Diva;

using Ldraw.Ui.GtkGl;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public class GtkGlModule : Module
	{
		public override void Load(ContainerBuilder builder)
		{
            builder.Register<LdrawEditPane>().As<ModelEditor>();
            builder.Register<LdrawViewPane>().As<ModelView>();
            builder.Register<DropBoundsOverlay>(); 
		}
	}
}
