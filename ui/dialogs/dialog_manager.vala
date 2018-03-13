using Gtk;

using Ldraw.Lego.Library;

namespace Ldraw.Ui.Dialogs
{
	public class DialogManager : GLib.Object, IDialogManager
	{
		public ILdrawFolders LdrawFolders {construct; get;}
		public RecentManager recent {construct; get;}
		
		public bool GetSaveLocation(out string location, Window parent)
		{
			FileChooserDialog dialog = new FileChooserDialog("Save File As", parent, FileChooserAction.SAVE
                                                , "_Cancel", ResponseType.CANCEL
                                                , "_Save", ResponseType.ACCEPT);

            dialog.set_current_folder_file(LdrawFolders.ModelsDirectory);
            dialog.filter = CreateLdrawFilesFilter();
            
            if(dialog.run() == ResponseType.ACCEPT)
            {
                location = dialog.get_filename();
                recent.add_item(dialog.get_uri());
                dialog.close();
                return true;
            }
            location = "";
            dialog.close();
            return false;
		}
	
		public bool GetLoadLocation(out string location, Window parent)
		{			
            FileChooserDialog dialog = new FileChooserDialog("Open File", parent, FileChooserAction.OPEN
                                                , "_Cancel", ResponseType.CANCEL
                                                , "_Open", ResponseType.ACCEPT);
                                                
            dialog.set_current_folder_file(LdrawFolders.ModelsDirectory);
            dialog.filter = CreateLdrawFilesFilter();
            
            if(dialog.run() == ResponseType.ACCEPT)
            {
                location = dialog.get_filename();
                recent.add_item(dialog.get_uri());
                dialog.close();
                return true;
            }
            location = "";
            dialog.close();
            return false;
		}
		
		private FileFilter CreateLdrawFilesFilter()
		{
            FileFilter filter = new FileFilter();
            filter.add_custom(
								FileFilterFlags.FILENAME, 
								info => (
											info.filename.has_suffix(".ldr") 
										 || info.filename.has_suffix(".dat") 
										 || info.filename.has_suffix(".mpd")
										)
							  );
			return filter;			
		}		
	}
}
