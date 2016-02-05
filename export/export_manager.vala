
using Gtk;

using Ldraw.Lego;

namespace Ldraw.Export
{
	private class ExportManager : Object
	{
		public void Export(Exporter exporter, Window dialogParent, LdrawObject model)
		{
			var options = new ExportOptions();

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
			var extraBox = new Box(Orientation.VERTICAL, 0);
			if(ExportOptionSections.CameraPosition in exporter.OptionSections)
			{
				extraBox.pack_start(GetCameraControls(options));
			}
			dialog.set_extra_widget(extraBox);
			dialog.show_all();

            if(dialog.run() != ResponseType.ACCEPT)
            {
                dialog.close();
                return;
            }
            options.Filename = dialog.get_filename();
            dialog.close();

            exporter.Export(model.File.MainObject, options);
        }

        private string SwitchExtension(string filename, string newExtension)
        {
			var nameOnly = filename.substring(0, filename.last_index_of_char('.'));
			return @"$nameOnly.$newExtension";
		}

		private Widget GetCameraControls(ExportOptions options)
		{
			var cameraOptions = new ExportCameraOptions();
			options.CameraOptions = cameraOptions;

			var grid = new Grid();

			grid.attach(new Label("Latitude") , 0, 0);
			var latEntry = new Entry();
			latEntry.text = "0";
			latEntry.notify["text"].connect(() =>
				{
					cameraOptions.Latitude = (float)double.parse(latEntry.text);
				});

			grid.attach(new Label("Longitude"), 0, 1);
			var longEntry = new Entry();
			longEntry.text = "0";
			longEntry.notify["text"].connect(() =>
				{
					cameraOptions.Longitude = (float)double.parse(longEntry.text);
				});
			grid.attach(latEntry, 1, 1);

			return grid;
		}
	}
}
