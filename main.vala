using Gtk;
using Ldraw.Lego;
using Ldraw.Ui;
using Ldraw.Options;

namespace Ldraw
{
	public class LdrawApp
	{
		public static int main(string[] args)
		{
			// initialize Gtk and OpenGL
			Gtk.init(ref args);
			Gdk.gl_init(ref args);

			LdrawLibrary lib = LdrawLibrary.Instance;
			try
			{
				lib.Initialize();
			}
			catch(Error e)
			{
				stdout.printf(e.message);
			}
			LdrawModelFile model = null;
			var loader = new LdrawFileLoader();
			try
			{
				model = loader.LoadModelFile("/home/robin/ldraw/models/Technic (old)/8825.mpd");
			}
			catch(Error e)
			{
				stdout.printf(e.message);
				return 1;
			}

			Window win = new MainWindow.WithModel(new RunningOptions(new DefaultOptions()), loader, model);
			win.destroy.connect(() => main_quit());
			win.show_all();

			Gtk.main();

			return 0;
		}
	}
}
