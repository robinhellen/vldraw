using Gtk;

using Ldraw.Lego.Library;

namespace Ldraw.Ui.Dialogs
{
	public class DialogManager : GLib.Object, IDialogManager
	{
		public ILdrawFolders LdrawFolders {construct; get;}
		
		public bool GetSaveLocation(out string location, Window parent)
		{
			FileChooserDialog dialog = new FileChooserDialog("Save File As", parent, FileChooserAction.SAVE
                                                , Stock.CANCEL, ResponseType.CANCEL
                                                , Stock.SAVE, ResponseType.ACCEPT);

            FileFilter filter = new FileFilter();
            filter.add_custom(
								FileFilterFlags.FILENAME, 
								info => (
											info.filename.has_suffix(".ldr") 
										 || info.filename.has_suffix(".dat") 
										 || info.filename.has_suffix(".mpd")
										)
							  );

            dialog.set_current_folder_file(LdrawFolders.ModelsDirectory);

            if(dialog.run() == ResponseType.ACCEPT)
            {
                location = dialog.get_filename();
                dialog.close();
                return true;
            }
            dialog.close();
            return false;
		}
	
		public bool GetLoadLocation(out string location, Window parent)
		{			
            FileChooserDialog dialog = new FileChooserDialog("Open File", parent, FileChooserAction.OPEN
                                                , Stock.CANCEL, ResponseType.CANCEL
                                                , Stock.OPEN, ResponseType.ACCEPT);

            FileFilter filter = new FileFilter();
            filter.add_custom(FileFilterFlags.FILENAME, info => (info.filename.has_suffix(".ldr") || info.filename.has_suffix(".dat") || info.filename.has_suffix(".mpd")));

            dialog.set_current_folder_file(LdrawFolders.ModelsDirectory);
            if(dialog.run() == ResponseType.ACCEPT)
            {
                location = dialog.get_filename();
                dialog.close();
                return true;
            }
            location = "";
            dialog.close();
            return false;
		}		
	}
}
