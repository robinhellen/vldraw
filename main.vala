using Gee;
using Gtk;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.OpenGl;
using Ldraw.Options;
using Ldraw.Peeron;
using Ldraw.Refactor;
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

            // Peeron communication
            builder.register<InventoryReader>();
            builder.register<ColourChart>();

            // UI components            
            builder.register<DialogManager>().as<IDialogManager>();

            builder.register<LibrarySubFileLocator>().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.register<OnDemandSubFileLoader>().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);

            builder.register<OnDemandPartLoader>().as<IDatFileCache>().single_instance();
            builder.register<FileCachedLibrary>().as<ILibrary>();
			
			builder.register_module<DragAndDropModule>();
			builder.register_module<WidgetsModule>();
			builder.register_module<GtkGlModule>();
			builder.register_module<MoveOriginModule>();
			builder.register_module<OpenGlModule>();
			builder.register_module<AnimationModule>();
			
            builder.register<RunningOptions>().as<IOptions>().single_instance();

            builder.register<UndoStack>().single_instance();
            var animatedModel = new AnimatedModel(null);
            builder.register<AnimatedModel>(_ => animatedModel);
            builder.register<FileLoadingArgHandler>().as<ArgumentHandler>();
            builder.register<Ldraw.Application.Application>();
            
            // OpenGl stuff
            builder.register<GlRenderer>().as<Renderer>();
            
            builder.register_module<StepsModule>();
            builder.register_module<LibraryModule>();
            
            var container = builder.build();

            // load up the colours
			var application = container.resolve<Ldraw.Application.Application>();
			
			application.Run(args);
			
            return 0;
        }
    }
	
	public class FileLoadingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public AnimatedModel Model {construct; private get;}
		public LdrawFileLoader Loader {construct; private get;}
		
		public bool HandleArgs(string[] args)
		{
			Model.Model = new LdrawModel.Empty().MainObject;
			if(args.length == 1)
			{
				return true;
			}
				
			var filename = args[1];
			Loader.LoadModelFile.begin(filename, ReferenceLoadStrategy.PartsOnly, (obj, res) =>
				{
					try
					{
						Model.Model = Loader.LoadModelFile.end(res).MainObject;
					}
					catch(Error e)
					{
						stdout.printf(e.message);
						Model.Model = new LdrawModel.Empty().MainObject;
					}			
				});
			return true;            
		}
	}
}
