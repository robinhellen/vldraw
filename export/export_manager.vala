
using Gtk;

using Ldraw.Lego;

namespace Ldraw.Export
{
	private class ExportManager : Object
	{
		public void Export(Exporter exporter, Window dialogParent, LdrawObject model)
		{
			FileChooserDialog dialog = new FileChooserDialog("Export", dialogParent, FileChooserAction.SAVE
                                                , "_Cancel", ResponseType.CANCEL
                                                , "_Export", ResponseType.ACCEPT);
			dialog.do_overwrite_confirmation = true;
			var filter = new FileFilter();
			filter.add_pattern("*." + exporter.PreferredExtension);
			if(model.File.FileName != null)
			{
				var basename = File.new_for_path(model.File.FileName).get_basename();
				var newName = SwitchExtension(basename, exporter.PreferredExtension);
				dialog.set_current_name(newName);
			}

            if(dialog.run() != ResponseType.ACCEPT)
            {
                dialog.close();
                return;
            }
            var filename = dialog.get_filename();
            dialog.close();

            exporter.Export(model.File.MainObject, filename);
        }

        private string SwitchExtension(string filename, string newExtension)
        {
			var nameOnly = filename.substring(0, filename.last_index_of_char('.'));
			return @"$nameOnly.$newExtension";
		}
	}
}
