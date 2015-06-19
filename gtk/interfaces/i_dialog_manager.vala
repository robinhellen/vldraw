using Gtk;

namespace Ldraw.Ui
{
    public interface IDialogManager : GLib.Object
    {		
		public abstract bool GetSaveLocation(out string location, Window parent);
		public abstract bool GetLoadLocation(out string location, Window parent);
	}
}
