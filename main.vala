using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Options;
using Ldraw.Peeron;
using Ldraw.Ui;
using Ldraw.Ui.Widgets;
using Ldraw.Utils.Di;

namespace Ldraw
{
	public class LdrawApp
	{
		public static int main(string[] args)
		{
			LdrawLibrary lib = new LdrawLibrary();

			var builder = new CreatorBuilder();

			// Parts library
			builder.RegisterInstance<ILibrary>(lib);
			builder.RegisterInstance<IDatFileCache>(lib);

			// Peeron communication
			builder.Register<InventoryReader>();
			builder.Register<ColourChart>();

			// UI components
			builder.Register<PartsTree>();
			builder.Register<SetList>();

			builder.Register<LibraryObjectLocator>();

			var container = builder.Build();


			// initialize Gtk and OpenGL
			init(ref args);
			Gdk.gl_init(ref args);

			try
			{
				lib.Initialize(new TextProgress());
			}
			catch(Error e)
			{
				stdout.printf(e.message);
			}
			LdrawModelFile model = null;
			var loader = new LdrawFileLoader(lib);
			try
			{
				model = loader.LoadModelFile("/home/robin/ldraw/models/Technic (old)/8825.mpd");
			}
			catch(Error e)
			{
				stdout.printf(e.message);
				return 1;
			}

			try
			{
				Window win = new MainWindow.WithModel(new RunningOptions(new DefaultOptions()), loader, model, container);
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

	public class TextProgress : GLib.Object, IReportProgress
	{
		private Map<string, int> last_values = new HashMap<string, int>();

		public void Report(string event, float progress)
		{
			var last_value = last_values[event];
			var currentD = (progress * 100);
			var current = (int)currentD;
			if(last_value == current)
				return;

			stdout.printf(@"$event: $current%\n");
			last_values[event] = current;
		}
	}
}
