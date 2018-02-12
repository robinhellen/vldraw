using Gtk;

using Ldraw.Lego;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui
{	
	private class ColourToolbar : GLib.Object, ToolbarProvider
	{
		public AnimatedModel m_ModelContainer {construct; private get;}
		public UndoStack undoStack {construct; private get;}
		public ColourContext ColourContext {construct; private get; }

		public int ButtonSize {get; set; default = 16;}
		
		private bool use_new_greys = true;

		public Toolbar CreateToolbar(Window window)
		{
			Toolbar bar = new Toolbar();
			bar.insert(new SeparatorToolItem(), -1);
			var falseVal = Value(typeof(bool));
			falseVal.set_boolean(false);
			for(int i = 0; i < 16; i++)
			{
				var colour_index = i;
				if(use_new_greys && (i ==7 || i == 8))
					colour_index += 64;
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

			return bar;
		}

		private ToolButton CreateColourButton(int colourId)
		{
			Gdk.Pixbuf image = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, ButtonSize, ButtonSize);
			Gdk.Pixbuf swatch = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, ButtonSize - 2, ButtonSize - 2);
			
			var colour = ColourContext.GetColourById(colourId);
			
			uint32 fillColour = (colour.Red << 24)
							  | (colour.Green << 16)
							  | (colour.Blue << 8)
							  | (colour.Alpha);

			swatch.fill(fillColour);
			image.fill((uint32) 255);
			swatch.copy_area(0,0,ButtonSize - 2, ButtonSize - 2, image, 1, 1);
			
			var button = new ToolButton(new Image.from_pixbuf(image), null);
			button.clicked.connect(() =>
				{
					undoStack.ExecuteCommand(new ChangeColourCommand(m_ModelContainer.Selection, colour));
				});
			button.set_tooltip_text(colour.Name);
			return button;
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
