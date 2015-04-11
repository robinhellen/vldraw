using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Options;
using Ldraw.Peeron;
using Ldraw.Ui;
using Ldraw.Ui.DragAndDrop;
using Ldraw.Ui.Commands;
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

            // Peeron communication
            builder.Register<InventoryReader>();
            builder.Register<ColourChart>();

            // UI components
            builder.Register<PartsTree>();
            builder.Register<SetList>();            
            builder.Register<EditPanes>();
            builder.Register<LdrawEditPane>();
            builder.Register<LdrawViewPane>();

            builder.Register<LibrarySubFileLocator>().Keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.Register<OnDemandSubFileLoader>().Keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);

            builder.Register<OnDemandPartLoader>().As<IDatFileCache>();
            builder.Register<FileCachedLibrary>().As<ILibrary>();
			
			new DragAndDropModule().Load(builder);
			//builder.RegisterModule<DragAndDropModule>();
			
            builder.Register<RunningOptions>().As<IOptions>();

            builder.Register<UndoStack>();
            var animatedModel = new AnimatedModel(null);
            builder.Register<AnimatedModel>(_ => animatedModel);

            var container = builder.Build();

            // load up the colours
            LdrawColour.ReadAllColours(container.Resolve<ILdrawFolders>());
            LdrawModelFile model = null;
            var loader = container.Resolve<LdrawFileLoader>();
            try
            {
                model = loader.LoadModelFile("/home/robin/ldraw/models/car.dat", ReferenceLoadStrategy.PartsOnly);
            }
            catch(Error e)
            {
                stdout.printf(e.message);
                return 1;
            }

			var ui = GLib.Object.new(typeof(LdrawEditorUi), Window: new Lazy<MainWindow>(() =>
				new MainWindow.WithModel(
								model,
								container
							)
			));
			var argH = GLib.Object.new(typeof(GtkInitialisingArgHandler));
			var application = (Ldraw.Application.Application) GLib.Object.new(typeof(Ldraw.Application.Application), Ui: ui, ArgHandler: argH);
			
			application.Run(args);
			
            return 0;
        }
    }
    
    public class LdrawEditorUi : GLib.Object, Ldraw.Application.UserInterface
    {
		public Lazy<MainWindow> Window {construct; private get;}
		
		public void Start()
		{			
			Window.value.destroy.connect(() => main_quit());
			Window.value.show_all();
			
			Gtk.main();
		}
	}
	
	public class GtkInitialisingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public bool HandleArgs(string[] args)
		{
            // initialize Gtk and OpenGL
            init(ref args);
            Gdk.gl_init(ref args);
            return true;		
		}
	}
}
