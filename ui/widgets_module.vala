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
            builder.register<MovementToolbar>().as<ToolbarProvider>();
            
            builder.register<RecentChooserMenu>().as<RecentChooser>()
				.ignore_property("anchor-hints")
				.ignore_property("rect-anchor-dx")
				.ignore_property("rect-anchor-dy")
				.ignore_property("menu-type-hint");
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
