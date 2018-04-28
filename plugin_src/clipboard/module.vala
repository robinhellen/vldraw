using Diva;
using Gdk;
using Gtk;

using Ldraw.Ui;
using Ldraw.Ui.Clipboard;

namespace Ldraw
{
	public class ClipboardModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<ClipboardHandler>();
			builder.register<Gtk.Clipboard>(() => Gtk.Clipboard.get(Atom.intern("CLIPBOARD", false)));
			builder.register<Menus>().as<MenuItemSource>();
		}
	}
}

public Type register_ldraw_plugin(GLib.Module module) {return typeof(Ldraw.ClipboardModule);}
