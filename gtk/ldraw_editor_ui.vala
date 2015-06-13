using Diva;
using Gee;
using Gtk;

using Ldraw.Application;

namespace Ldraw.Ui
{    
    private class LdrawEditorUi : GLib.Object, UserInterface
    {
		public Lazy<MainWindow> Window {construct; private get;}
		
		static construct
		{
			var cls = (ObjectClass)typeof(LdrawEditorUi).class_ref();
			SetLazyInjection<MainWindow>(cls, "Window");
		}
		
		public void Start()
		{			
			Window.value.destroy.connect(() => main_quit());
			Window.value.show_all();
			
			Gtk.main();
		}
	}
}
