using Gtk;

using Ldraw.Application;

namespace Ldraw.Ui
{		
	private class GtkInitialisingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public ArgumentHandler Inner {construct; private get;}
		
		public bool HandleArgs(string[] args)
		{
            // initialize Gtk and OpenGL
            init(ref args);
            Gdk.gl_init(ref args);
            return Inner.HandleArgs(args);		
		}
	}
}
