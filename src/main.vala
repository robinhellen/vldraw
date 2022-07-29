using Gee;
using Gtk;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Colours;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.OpenGl;
using Ldraw.Options;
using Ldraw.Ui;
using Ldraw.Ui.Commands;
using Ldraw.Ui.Dialogs;
using Ldraw.Ui.DragAndDrop;
using Ldraw.Ui.Widgets;
using Diva;

namespace Ldraw
{
    public class LdrawApp
    {
        public static int main(string[] args)
        {
            var builder = new ContainerBuilder();
            
            builder.register_module<CommandFactoryModule>();
			builder.register_module<DragAndDropModule>();
			builder.register_module<WidgetsModule>();
			builder.register_module<DialogsModule>();
			builder.register_module<ColoursModule>();
			builder.register_module<GtkGlModule>();
			builder.register_module<OpenGlModule>();
			builder.register_module<OptionsModule>();
			builder.register_module<ExportModule>();
			builder.register_module<LegoModule>();
            builder.register_module<LibraryModule>();            
            builder.register_module<ApplicationModule>();            
            
            builder.register<FileLoadingArgHandler>().as<ArgumentHandler>();

			var pluginLoader = new PluginLoader();
			pluginLoader.LoadPlugins(builder);

            var container = builder.build();

            try
            {
				var application = container.resolve<Ldraw.Application.Application>();
				application.Run(args);
				return 0;
			}
			catch(ResolveError e)
			{
				stderr.printf(@"DI configuration error: $(e.message)\n");
				return -1;
			}
        }
    }

	public class FileLoadingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public AnimatedModel Model {construct; private get;}
		public LdrawFileLoader Loader {construct; private get;}

		public bool HandleArgs(string[] args)
		{
			Model.Load(new LdrawModel.Empty());
			if(args.length == 1)
			{
				return true;
			}

			var filename = args[1];
			Loader.LoadModelFile.begin(filename, ReferenceLoadStrategy.PartsOnly, true, (obj, res) =>
				{
					try
					{
						Model.Load(Loader.LoadModelFile.end(res));
					}
					catch(Error e)
					{
						stdout.printf(e.message);
						Model.Load(new LdrawModel.Empty());
					}
				});
			return true;
		}
	}
}
