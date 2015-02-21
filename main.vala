using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Options;
using Ldraw.Peeron;
using Ldraw.Refactoring;
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

            var container = builder.Build();

            // load up the colours
            LdrawColour.ReadAllColours(container.Resolve<ILdrawFolders>());
            // initialize Gtk and OpenGL
            init(ref args);
            Gdk.gl_init(ref args);
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

            try
            {
                Window win = new MainWindow.WithModel(
                                model,
                                container
                            );
                win.destroy.connect(() => main_quit());
                win.show_all();
            }
            catch(OpenGl.GlError e)
            {
                stderr.printf(@"Unable to initialize OpenGl displays: $(e.message).\n");
                return -1;
            }

            Gtk.main();

            return 0;
        }
    }
}
