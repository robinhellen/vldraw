using Gtk;

using Ldraw.Colours;
using Ldraw.Lego;
using Ldraw.Refactor;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	private class SwitchColourRefactoring : GLib.Object, Refactoring
	{
		public ColourContext Colours {construct; private get;}
		
		public string GetLabel() {return "Switch Colour";}
		
		public bool CanExecute(AnimatedModel model) {return true;}
		
		public bool PrepareToExecute(AnimatedModel model, Window dialogParent, out Command? command)
		{
			var dialog = new SwitchColourDialog(dialogParent, model, Colours);
			Colour original;
			Colour new_colour;
			SwitchMode mode;
			if(!dialog.Run(out original, out new_colour, out mode))
			{
				command = null;
				return false;
			}
			command = new SwitchColourCommand(original, new_colour, mode, model);
			return true;
		}
		
		private class SwitchColourDialog : GLib.Object
		{
			Dialog dialog;
			private Colour original;
			private Colour new_colour;
			private SwitchMode mode = SwitchMode.CurrentSubModel;
			private ColourContext colour_context;
			
			private Button original_button;
			private Button new_button;
			
			public SwitchColourDialog(Window parent, AnimatedModel model, ColourContext colours)
			{
				this.colour_context = colours;
				dialog = new Dialog.with_buttons("Model details", parent,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					"_OK", ResponseType.ACCEPT,
					"_Cancel", ResponseType.REJECT);
				dialog.set_default_response(ResponseType.ACCEPT);
				var content = (Box) dialog.get_content_area();
				var grid = new Grid();
				grid.column_homogeneous = false;
				grid.attach(new Label("From"), 0, 0);
				original_button = new Button();
				original = colour_context.GetColourById(0);
				original_button.set_image(get_image_for_colour(original));
				original_button.clicked.connect(() => {
					var col = button_handler(dialog);
					if(col == null) return;
					update_colour_button(original_button, col);
					original = col;
				});
				grid.attach(original_button, 1, 0);
				grid.attach(new Label("To"), 0, 1);
				new_button = new Button();
				new_colour = colour_context.GetColourById(0);
				new_button.set_image(get_image_for_colour(new_colour));
				new_button.clicked.connect(() => {
					var col = button_handler(dialog);
					if(col == null) return;
					update_colour_button(new_button, col);
					new_colour = col;
				});
				grid.attach(new_button, 1, 1);				
				
				grid.attach(new Label("Change All:"), 0, 2);
				var cur_model_radio = new RadioButton.with_label(null, "in current model");
				cur_model_radio.set_active(true);
				cur_model_radio.toggled.connect(() => {if(cur_model_radio.get_active()) mode = SwitchMode.CurrentSubModel;});
				grid.attach(cur_model_radio, 1, 2);
				var selection_radio = new RadioButton.with_label_from_widget(cur_model_radio, "in selection");
				selection_radio.toggled.connect(() => {if(selection_radio.get_active()) mode = SwitchMode.Selection;});
				grid.attach(selection_radio, 1, 3);
				if(model.Selection.is_empty) {
					selection_radio.sensitive = false;
				} else {
					selection_radio.set_active(true);
					Colour c = null;
					foreach(var node in model.Selection)
					{
						c = node.Colour;
						if(c != null) {
							original = c;
							update_colour_button(original_button, original);
							break;
						}	
					}
				}
				var all_radio = new RadioButton.with_label_from_widget(cur_model_radio, "in file");
				all_radio.toggled.connect(() => {if(all_radio.get_active()) mode = SwitchMode.WholeModel;});
				grid.attach(all_radio, 1, 4);
				if(!(model.File is MultipartModel)) {
					all_radio.sensitive = false;
				}				
				
				content.pack_start(grid, true, true, 5);
			}
			
			public bool Run(out Colour original, out Colour new_colour, out SwitchMode mode)
			{
				dialog.show_all();

				var response = dialog.run();
				dialog.destroy();
				if(response != ResponseType.ACCEPT)
				{
					original = null;
					new_colour = null;
					mode = SwitchMode.Selection;
					return false;
				}
				original = this.original;
				new_colour = this.new_colour;
				mode = this.mode;
				return true;
			}
		
			private void update_colour_button(Button button, Colour c)
			{
				button.set_tooltip_text(c.Name);
				button.set_image(get_image_for_colour(c));
				button.show_all();
			}
			
			private Image get_image_for_colour(Colour colour)
			{
				Gdk.Pixbuf image = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 16, 16);
				Gdk.Pixbuf swatch = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 16 - 2, 16 - 2);			
				
				uint32 fillColour = (colour.Red << 24)
								  | (colour.Green << 16)
								  | (colour.Blue << 8)
								  | (colour.Alpha);

				swatch.fill(fillColour);
				image.fill((uint32) 255);
				swatch.copy_area(0,0,16 - 2, 16 - 2, image, 1, 1);
				
				var ret = new Image.from_pixbuf(image);
				return ret;
			}
		
			private Colour? button_handler(Window window)
			{
				var dialog = new Dialog.with_buttons("Select colour", window,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					"_OK",		ResponseType.ACCEPT,
					"_Cancel",	ResponseType.REJECT
				);

				var chooser = new ColourChooser(colour_context);

				((Container)dialog.get_content_area()).add(chooser);

				dialog.show_all();
				var result = dialog.run();
				if(result != ResponseType.ACCEPT)
				{
					dialog.destroy();
					return null;
				}
				
				var colour = chooser.ChosenColour;
				dialog.destroy();
				return colour;
			}
		}
	}
}
