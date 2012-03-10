using Gtk;
using Ldraw.Lego;
using Ldraw.Ui;

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
			LdrawModel model = null;
			try
			{
				model = new LdrawModel("/home/robin/ldraw/models/car.dat");
				stdout.printf(@"$(model.FileName)");
			}
			catch(Error e)
			{
				stdout.printf(e.message);
			}

			Window win = new MainWindow.WithModel(model);
			win.destroy.connect(() => main_quit());
			win.show_all();

			Gtk.main();

			return 0;
		}
	}
}
