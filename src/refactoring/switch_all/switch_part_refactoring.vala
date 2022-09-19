using Diva;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Options;
using Ldraw.Refactor;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	private class SwitchPartRefactoring : GLib.Object, Refactoring
	{
		static construct
		{
			var cls = (ObjectClass)typeof(SwitchPartRefactoring).class_ref();
			set_indexed_injection<string, ModelView>(cls, "views");
			set_collection_injection<ISubFileLocator>(cls, "locators");
		}
		
		public Index<ModelView, string> views {construct; private get;}
		public ColourContext colour_context {construct; private get;}
		public Collection<ISubFileLocator> locators {construct; private get;}
        public IOptions settings 
        {
			construct {
				preview_options = value.get_domain("preview-options");
			}
		}
		
        const string opt_id = "colour-id";
        private OptionDomain preview_options;
		
		public string GetLabel() {return "Switch Part";}
		
		public bool CanExecute(AnimatedModel model) {return true;}
		
		public bool PrepareToExecute(AnimatedModel model, Window dialogParent, out Command? command)
		{
			var v = preview_options.get_option(opt_id);
			var default_colour = colour_context.GetColourById(v.get_int());
			var dialog = new SwitchPartDialog(dialogParent, model, views["new"], views["new"], locators, default_colour);
			LdrawPart old;
			LdrawPart new_part;
			SwitchMode mode;
			if(!dialog.Run(out old, out new_part, out mode))
			{
				command = null;
				return false;
			}
			command = new SwitchPartCommand(old, new_part, mode, model);
			return true;
		}
		
		private class SwitchPartDialog : GLib.Object
		{
			private Dialog dialog;
			private Container view_container;
			private ModelView from_view;
			private ModelView to_view;
			private Collection<ISubFileLocator> locators;
						
			private SwitchMode mode = SwitchMode.CurrentSubModel;
			private LdrawPart from;
			private LdrawPart to;
			
			public SwitchPartDialog(Window parent, AnimatedModel model, ModelView original_view, ModelView new_view, Collection<ISubFileLocator> locators, Colour default_colour)
			{
				from_view = original_view;
				to_view = new_view;
				this.locators = locators;
				
				dialog = new Dialog.with_buttons("Model details", parent,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					"_OK", ResponseType.ACCEPT,
					"_Cancel", ResponseType.REJECT);
				dialog.set_default_response(ResponseType.ACCEPT);
				dialog.set_response_sensitive(ResponseType.ACCEPT, false);
				var content = (Box) dialog.get_content_area();
				var box = new Box(Orientation.HORIZONTAL, 5);
				var vbox = new Box(Orientation.VERTICAL, 0);
				var grid = new Grid();
				grid.column_homogeneous = false;
				grid.row_homogeneous = false;
				grid.row_spacing = 3;
				grid.attach(new Label("From"), 0, 0);
				grid.attach(original_view, 1, 0);
				original_view.set_size_request(150, 150);
				original_view.Angle = ViewAngle.Ortho;
				original_view.DefaultColour = default_colour;
				var o_txt = new Entry();
				o_txt.changed.connect(from_changed);
				o_txt.vexpand = false;
				grid.attach(o_txt, 2, 0);
				grid.attach(new Label("To"), 0, 1);
				grid.attach(new_view, 1, 1);
				new_view.set_size_request(150, 150);
				new_view.Angle = ViewAngle.Ortho;
				new_view.DefaultColour = default_colour;
				var n_txt = new Entry();
				n_txt.changed.connect(to_changed);
				n_txt.vexpand = false;
				grid.attach(n_txt, 2, 1);
				
				grid.attach(new Label("Change All:"), 0, 2);
				var cur_model_radio = new RadioButton.with_label(null, "in current model");
				cur_model_radio.set_active(true);
				cur_model_radio.toggled.connect(() => {if(cur_model_radio.get_active()) mode = SwitchMode.CurrentSubModel;});
				grid.attach(cur_model_radio, 1, 2, 2);
				var selection_radio = new RadioButton.with_label_from_widget(cur_model_radio, "in selection");
				selection_radio.toggled.connect(() => {if(selection_radio.get_active()) mode = SwitchMode.Selection;});
				grid.attach(selection_radio, 1, 3, 2);
				if(model.Selection.is_empty) {
					selection_radio.sensitive = false;
				} else {
					selection_radio.set_active(true);
					LdrawPart p = null;
					foreach(var node in model.Selection)
					{
						var pn = node as PartNode;
						if(pn == null) continue;
						
						p = pn.File as LdrawPart;
						if(p != null){
							from = p;
							new_view.Angle = ViewAngle.Ortho;
							break;
						}	
					}
				}
				var all_radio = new RadioButton.with_label_from_widget(cur_model_radio, "in file");
				all_radio.toggled.connect(() => {if(all_radio.get_active()) mode = SwitchMode.WholeModel;});
				grid.attach(all_radio, 1, 4, 2);
				if(!(model.File is MultipartModel)) {
					all_radio.sensitive = false;
				}	
				
				vbox.pack_start(grid, false, false, 75);
				box.pack_start(vbox, false);
				
				content.pack_start(box, true, true, 5);
				view_container = grid;
			}
			
			private async void from_changed(Editable entry) {
				var part_id = entry.get_chars();
				if(part_id.contains(".")) {
					part_id += ".dat";
				}
				var sfr = yield get_single_sub_file(locators, part_id, ReferenceContext.Model);
				if(sfr != null) {
					from_view.Model = sfr.object;
				} else {
					from_view.Model = new LdrawObject("");
				}
				from = sfr == null ? null : sfr.file as LdrawPart;
				dialog.set_response_sensitive(ResponseType.ACCEPT, from != null && to != null);
			}
			
			private async void to_changed(Editable entry) {
				var part_id = entry.get_chars();
				if(part_id.contains(".")) {
					part_id += ".dat";
				}
				var sfr = yield get_single_sub_file(locators, part_id, ReferenceContext.Model);
				if(sfr != null) {
					to_view.Model = sfr.object;
				} else {
					to_view.Model = new LdrawObject("");
				}
				to = sfr == null ? null : sfr.file as LdrawPart;
				dialog.set_response_sensitive(ResponseType.ACCEPT, from != null && to != null);
			}
			
			public bool Run(out LdrawPart? original, out LdrawPart? new_part, out SwitchMode mode)
			{
				dialog.show_all();
				if(from != null) {
					from_view.Model = from.MainObject;
				}

				var response = dialog.run();
				dialog.destroy();
				if(response != ResponseType.ACCEPT)
				{
					original = null;
					new_part = null;
					mode = SwitchMode.Selection;
					return false;
				}
				original = from;
				new_part = to;
				mode = this.mode;
				return true;
			}
		}
	}
}
