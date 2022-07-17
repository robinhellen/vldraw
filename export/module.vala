using Diva;

using Ldraw.Ui;
using Ldraw.Ui.Widgets;
using Ldraw.Export;

namespace Ldraw
{
	public class ExportModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<ExportMenuSource>().as<MenuItemSource>();
            builder.register<ExportManager>();
		}
	}
}
