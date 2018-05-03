using Diva;

using Ldraw.Ui;
using Ldraw.Ui.Widgets;

namespace Ldraw.Plugins.Movement
{
	public class MovementEditModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<MovementInteraction>().as<EditorInteraction>();
            builder.register<MovementToolbar>().as<ToolbarProvider>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.Plugins.Movement.MovementEditModule);}
