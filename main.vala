using Gee;
using Gtk;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Colours;
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

            // Parts library
            builder.register<LdrawLibrary>().as<ILdrawFolders>();

            // Model file handling
            builder.register<LdrawFileLoader>();
            builder.register<LdrawParser>();
            builder.register<FileReaderFactory>();
            builder.register_module<CommandFactoryModule>();

            // UI components
            builder.register<DialogManager>().as<IDialogManager>();
//~             builder.register<LibrarySubFileLocator>();

//~             builder.register<ModelsSubFileLocator>().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.register<LibrarySubFileLocator>().single_instance().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.register<OnDemandSubFileLoader>().single_instance().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);

            builder.register<OnDemandPartLoader>().as<IDatFileCache>().single_instance();
            builder.register<FileCachedLibrary>().as<ILibrary>().single_instance();

			builder.register_module<DragAndDropModule>();
			builder.register_module<WidgetsModule>();
			builder.register_module<ColoursModule>();
			builder.register_module<GtkGlModule>();
			builder.register_module<OpenGlModule>();
			builder.register_module<ExportModule>();

            builder.register<RunningOptions>().as<IOptions>().single_instance();

            builder.register<UndoStack>().single_instance();
            var animatedModel = new AnimatedModel(null);
            builder.register<AnimatedModel>(_ => animatedModel);
            builder.register<FileLoadingArgHandler>().as<ArgumentHandler>();
            builder.register<Ldraw.Application.Application>();

			var pluginLoader = new PluginLoader();
			pluginLoader.LoadPlugins(builder);

            builder.register_module<LibraryModule>();

            var container = builder.build();

            // load up the colours
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
