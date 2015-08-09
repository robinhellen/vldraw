using Diva;
using Gtk;

using Ldraw.Application;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public class WidgetsModule : Module
	{
		public override void Load(ContainerBuilder builder)
		{
            builder.Register<PartsTree>().As<IPartDragSource>();
            builder.Register<SetList>().As<IPartDragSource>().SingleInstance();            
            builder.Register<EditPanes>();
            builder.Register<SubModelsTree>().As<IPartDragSource>();
            builder.Register<ModelList>();
            builder.Register<MainMenu>();
            builder.Register<ColourToolbar>().As<ToolbarProvider>();
            builder.Register<MovementToolbar>().As<ToolbarProvider>();
            
            builder.Register<RecentChooserMenu>().As<RecentChooser>();
            builder.Register<RecentManager>(() => RecentManager.get_default());            
            
            builder.Register<MainWindow>()
					.IgnoreProperty("type")
					.IgnoreProperty("transient-for")
					.IgnoreProperty("attached-to");
					
            builder.Register<LdrawEditorUi>().As<UserInterface>();
            builder.Register<GtkInitialisingArgHandler>().AsDecorator<ArgumentHandler>();
		}
	}
}
