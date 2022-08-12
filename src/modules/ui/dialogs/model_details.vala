using Gtk;

using Ldraw.Lego;

namespace Ldraw.Ui.Dialogs {
	public class ModelDetails : GLib.Object {
		private Dialog dialog;
		private Entry filename_entry;
		private Entry description_entry;
		
		private string _filename = "";
		private string _description = "";
				
		public ModelDetails(Window parent) {
			dialog = new Dialog.with_buttons("Model details", parent,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                "_OK", ResponseType.ACCEPT,
                "_Cancel", ResponseType.REJECT);

            var content = (Box)dialog.get_content_area();
            var grid = new Grid();
				grid.column_homogeneous = false;
				grid.row_homogeneous = false;
            grid.attach(new Label("Filename"), 0, 0);
            grid.attach(new Label("Description"), 0, 1);
            filename_entry = new Entry();
            filename_entry.changed.connect(() => _filename = filename_entry.text);
            description_entry = new Entry();
            description_entry.changed.connect(() => _description = description_entry.text);            
            grid.attach(filename_entry, 1, 0);
            grid.attach(description_entry, 1, 1);
            content.pack_start(grid);
		}	
			
		public ModelDetails.from_model(Window parent, LdrawObject object) {			
			this(parent);
			filename_entry.text = object.FileName;
			description_entry.text = object.Description;
			_filename = object.FileName;
			_description = object.Description;
		}
		
		public string filename {
			get {
				return _filename;
			}
			set {
				_filename = value;
				filename_entry.text = value;
			}
		}
		
		public string description {
			get {
				return _description;
			}
			set {
				_description = value;
				description_entry.text = value;
			}
		}
		
		public bool run() {
			dialog.show_all();
            var response = dialog.run();
            dialog.destroy();
            
            switch(response) {
				case ResponseType.ACCEPT:
					return true;
				case ResponseType.REJECT:
					return false;
				default:
					assert_not_reached();
			}
		}
	}
}
