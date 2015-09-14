using Gtk;

using Ldraw.Application;

namespace Ldraw.Ui
{		
	private class GtkInitialisingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public ArgumentHandler Inner {construct; private get;}
		
		public bool HandleArgs(string[] args)
		{
            // initialize Gtk
            init(ref args);
            return Inner.HandleArgs(args);		
		}
	}
}
