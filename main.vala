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
            builder.Register<LdrawLibrary>().As<ILdrawFolders>();

            // Model file handling
            builder.Register<LdrawFileLoader>();
            builder.Register<LdrawParser>();
            builder.Register<FileReaderFactory>();
            new CommandFactoryModule().Load(builder);

            // Peeron communication
            builder.Register<InventoryReader>();
            builder.Register<ColourChart>();

            // UI components            
            builder.Register<DialogManager>().As<IDialogManager>();

            builder.Register<LibrarySubFileLocator>().Keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.Register<OnDemandSubFileLoader>().Keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);

            builder.Register<OnDemandPartLoader>().As<IDatFileCache>().SingleInstance();
            builder.Register<FileCachedLibrary>().As<ILibrary>();
			
			new DragAndDropModule().Load(builder);
			new WidgetsModule().Load(builder);
			new GtkGlModule().Load(builder);
			new MoveOriginModule().Load(builder);
			//builder.RegisterModule<DragAndDropModule>();
			
            builder.Register<RunningOptions>().As<IOptions>();

            builder.Register<UndoStack>().SingleInstance();
            var animatedModel = new AnimatedModel(null);
            builder.Register<AnimatedModel>(_ => animatedModel);
            builder.Register<FileLoadingArgHandler>().As<ArgumentHandler>();
            builder.Register<Ldraw.Application.Application>();
            
            // OpenGl stuff
            builder.Register<GlRenderer>().As<Renderer>();
            builder.Register<FromFlatRenderer>().As<IRenderModel>();
            
            builder.Register<StandardColourContext>().As<ColourContext>();
            
            new StepsModule().Load(builder);
            
            var container = builder.Build();

            // load up the colours
            LdrawColour.ReadAllColours(container.Resolve<ILdrawFolders>());
			var application = container.Resolve<Ldraw.Application.Application>();
			
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
