using Diva;
using Gtk;

using Ldraw.Application;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	public class WidgetsModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<PartsTree>().as<IPartDragSource>();          
            builder.register<EditPanes>();
            builder.register<SubModelsTree>().as<IPartDragSource>();
            builder.register<ModelList>();
            builder.register<MainMenu>();
            builder.register<ColourToolbar>().as<ToolbarProvider>();
            builder.register<MovementToolbar>().as<ToolbarProvider>();
            
            builder.register<RecentChooserMenu>().as<RecentChooser>();
            builder.register<RecentManager>(() => RecentManager.get_default());            
            
            builder.register<MainWindow>()
					.ignore_property("type")
					.ignore_property("transient-for")
					.ignore_property("attached-to");
					
            builder.register<LdrawEditorUi>().as<UserInterface>();
            builder.register<GtkInitialisingArgHandler>().as_decorator<ArgumentHandler>();
		}
	}
}
