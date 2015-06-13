using Diva;
using Gtk;

using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public class WidgetsModule
	{
		public void Load(ContainerBuilder builder)
		{
            builder.Register<PartsTree>().As<IPartDragSource>();
            builder.Register<SetList>().As<IPartDragSource>();            
            builder.Register<EditPanes>();
            builder.Register<LdrawEditPane>();
            builder.Register<LdrawViewPane>();
            builder.Register<SubModelsTree>().As<IPartDragSource>();
            
            builder.Register<RecentChooserMenu>().As<RecentChooser>();
            builder.Register<RecentManager>(() => RecentManager.get_default());            
            
            builder.Register<MainWindow>()
					.IgnoreProperty("type")
					.IgnoreProperty("transient-for")
					.IgnoreProperty("attached-to");
		}
	}
}
