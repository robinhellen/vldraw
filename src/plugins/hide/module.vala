using Diva;

using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Steps;
using Ldraw.Ui;

namespace Ldraw
{
	public class HideModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<HideModel>().single_instance();
			builder.register<HideToolbar>().as<ToolbarProvider>();
			builder.register<HideNodesStrategy>().as<RenderNodeStrategy>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.HideModule);}
