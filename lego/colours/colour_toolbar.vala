using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Ui.Commands;
using Ldraw.Ui;

namespace Ldraw.Colours
{	
	private class ColourToolbar : GLib.Object, ToolbarProvider
	{
		public AnimatedModel m_ModelContainer {construct; private get;}
		public UndoStack undoStack {construct; private get;}
		public ColourContext ColourContext {construct; private get; }
		public ColourOptions colour_options {construct; private get;}

		public int ButtonSize {get; set; default = 16;}
		
		private Map<Colour, Image> button_images = new HashMap<Colour, Image>();

		public Toolbar CreateToolbar(Window window)
		{
			Toolbar bar = new Toolbar();
			bar.insert(new SeparatorToolItem(), -1);
			var falseVal = Value(typeof(bool));
			falseVal.set_boolean(false);
			for(int i = 0; i < 16; i++)
			{
				var colour_index = i;
				var button = CreateColourButton(colour_index);
				bar.insert(button, -1);
				bar.child_set_property(button, "homogeneous", falseVal);
			}

			var moreButton = new ToolButton(null, "More");
			moreButton.clicked.connect(() =>
				{
					var dialog = new Dialog.with_buttons("Select colour", window,
						DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
						"_OK",		ResponseType.ACCEPT,
						"_Cancel",	ResponseType.REJECT
					);

					var chooser = new ColourChooser(ColourContext);

					((Container)dialog.get_content_area()).add(chooser);

					dialog.show_all();
					var result = dialog.run();
					if(result != ResponseType.ACCEPT)
					{
						dialog.destroy();
						return;
					}

					undoStack.ExecuteCommand(new ChangeColourCommand(m_ModelContainer.Selection, chooser.ChosenColour));
					dialog.destroy();
				});
			moreButton.set_tooltip_text("More colours");
			bar.insert(moreButton, -1);
			bar.child_set_property(moreButton, "homogeneous", falseVal);
			
			var palette_chooser = new MenuToolButton(new Image.from_stock("gtk-color-picker", IconSize.BUTTON), "Palettes");
			palette_chooser.set_menu(create_palette_menu());
			bar.insert(palette_chooser, -1);

			return bar;
		}

		private ToolButton CreateColourButton(int colour_index)
		{
			var colour_id = colour_options.current_palette.colour_codes[colour_index];
			var colour = ColourContext.GetColourById(colour_id);
			var button_image = get_image_for_colour(colour);			
			var button = new ToolButton(button_image, null);
			button.clicked.connect(() =>
				{
					var c_id = colour_options.current_palette.colour_codes[colour_index];
					var c = ColourContext.GetColourById(c_id);
					undoStack.ExecuteCommand(new ChangeColourCommand(m_ModelContainer.Selection, c));
				});
			button.set_tooltip_text(colour.Name);
			colour_options.notify["current-palette"].connect(() => {
				var c_id = colour_options.current_palette.colour_codes[colour_index];
				var c = ColourContext.GetColourById(c_id);
				button.set_tooltip_text(c.Name);
				button.set_icon_widget(get_image_for_colour(c));
				button.show_all();
			});
			return button;
		}
		
		private Image get_image_for_colour(Colour colour)
		{
			if(button_images.has_key(colour))
			{
				return button_images[colour];
			}
			Gdk.Pixbuf image = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, ButtonSize, ButtonSize);
			Gdk.Pixbuf swatch = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, ButtonSize - 2, ButtonSize - 2);			
			
			uint32 fillColour = (colour.Red << 24)
							  | (colour.Green << 16)
							  | (colour.Blue << 8)
							  | (colour.Alpha);

			swatch.fill(fillColour);
			image.fill((uint32) 255);
			swatch.copy_area(0,0,ButtonSize - 2, ButtonSize - 2, image, 1, 1);
			
			var ret = new Image.from_pixbuf(image);
			button_images[colour] = ret;
			return ret;
		}
	
		private Gtk.Menu create_palette_menu()
		{
			var menu = new Gtk.Menu();
			colour_options.all_palettes.fold<RadioMenuItem?>((palette, last) => append_menu_item_for_palette(menu, palette, last), null);			
			return menu;
		}
		
		private RadioMenuItem append_menu_item_for_palette(Gtk.Menu menu, Palette palette, RadioMenuItem? last)
		{
			var item = new RadioMenuItem.with_mnemonic(null, palette.name);
			item.join_group(last);
			item.activate.connect(() => {colour_options.current_palette = palette;});
			item.show();
			menu.append(item);
			return item;
		}
	}

	private class ColourChooser : VBox
	{
		private int page = 0;
		private Button[] buttons = new Button[32];
		
		private ColourContext colourContext;

		public ColourChooser(ColourContext colourContext)
		{
			var grid = new Grid();
			grid.row_homogeneous = true;
			grid.column_homogeneous = true;
			this.colourContext = colourContext;
			for(int i = 0; i < 32; i++)
			{
				var button = new Button();
				int x = i;
				button.clicked.connect(() =>
					{
						ChosenColour = colourContext.GetColourById(32 * page + x);
					});

				grid.attach(button, i % 8, i / 8);

				buttons[i] = button;

			}

			var nextPageButton = new Button.from_icon_name("go-next");
			var prevPageButton = new Button.from_icon_name("go-previous");
			prevPageButton.sensitive = false;

			nextPageButton.clicked.connect(() =>
				{
					page++;
					if(page >= 16)
						nextPageButton.sensitive = false;

					prevPageButton.sensitive = true;

					UpdateButtonColours();
				});
			prevPageButton.clicked.connect(() =>
				{
					page--;
					if(page <= 0)
						prevPageButton.sensitive = false;

					nextPageButton.sensitive = true;

					UpdateButtonColours();
				});

			pack_start(grid, false, true, 10);
			var button_box = new Box(Orientation.VERTICAL, 10);
			button_box.pack_start(prevPageButton, true, false);
			button_box.pack_start(nextPageButton, true, false);
			pack_end(button_box, false);
			UpdateButtonColours();
		}

		private void UpdateButtonColours()
		{
			for(int i = 0; i < 32; i++)
			{
				var colourId = page * 32 + i;
				var button = buttons[i];
				foreach(var child in button.get_children())
				{
					child.destroy();
				}

				var colour = colourContext.GetColourById(colourId);
				if(colour != null)
				{
					Gdk.Pixbuf data = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 16, 16);

					uint32 fillColour = (colour.Red << 24)
									  | (colour.Green << 16)
									  | (colour.Blue << 8)
									  | (colour.Alpha);
					data.fill(fillColour);

					var image = new Image.from_pixbuf(data);

					button.sensitive = true;
					button.add(image);
					button.set_tooltip_text(colour.Name);
				}
				else
				{
					button.sensitive = false;
					button.add(new Image.from_icon_name("process-stop", IconSize.BUTTON));
					button.set_tooltip_text("Not defined");
				}
			}
			show_all();
			queue_draw();
		}

		public Colour ChosenColour {get; private set;}
	}
}
