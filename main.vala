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
using Ldraw.Utils.Di;

namespace Ldraw
{
    public class LdrawApp
    {
        public static int main(string[] args)
        {
            var builder = new CreatorBuilder();

            // Parts library
            builder.RegisterAsInterface<LdrawLibrary, ILdrawFolders>().AsInterface<ILdrawFolders>();

            // Model file handling
            builder.Register<LdrawFileLoader>();
            builder.Register<LdrawParser>().InstancePerDependency();

            // Peeron communication
            builder.Register<InventoryReader>();
            builder.Register<ColourChart>();

            // UI components
            builder.Register<PartsTree>();
            builder.Register<SetList>();            
            builder.Register<EditPanes>();
            builder.Register<LdrawEditPane>().InstancePerDependency();
            builder.Register<LdrawViewPane>().InstancePerDependency();

            builder.Register<LibrarySubFileLocator>().Keyed<ReferenceLoadStrategy, ISubFileLocator>(ReferenceLoadStrategy.PartsOnly);
            builder.Register<OnDemandSubFileLoader>().Keyed<ReferenceLoadStrategy, ISubFileLocator>(ReferenceLoadStrategy.SubPartsAndPrimitives);

            builder.RegisterAsInterface<OnDemandPartLoader, IDatFileCache>();
            builder.RegisterAsInterface<FileCachedLibrary, ILibrary>().AsInterface<ILibrary>();

			builder.RegisterModule<DragAndDropModule>();
			
            builder.RegisterAsInterface<RunningOptions, IOptions>().AsInterface<IOptions>();

            builder.Register<UndoStack>();
            builder.RegisterInstance<AnimatedModel>(new AnimatedModel(null));

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
