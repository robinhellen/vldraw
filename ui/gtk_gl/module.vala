using Diva;

using Ldraw.Ui.GtkGl;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public class GtkGlModule
	{
		public void Load(ContainerBuilder builder)
		{
            builder.Register<LdrawEditPane>().As<ModelEditor>();
            builder.Register<LdrawViewPane>().As<ModelView>();
            builder.Register<DropBoundsOverlay>(); 
		}
	}
}
