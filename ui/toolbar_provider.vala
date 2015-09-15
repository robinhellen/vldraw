using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui
{
	private class MovementToolbar : GLib.Object, ToolbarProvider
	{
		public AnimatedModel m_ModelContainer {construct; private get;}
		public IOptions m_Options {construct; private get;}
		public UndoStack undoStack {construct; private get;}

		public int ButtonSize {get; set; default = 16;}

		public Toolbar CreateToolbar(Gtk.Window dialogParent)
		{
			Toolbar bar = new Toolbar();

			bar.insert(new SeparatorToolItem(), -1);
			bar.insert(CreateTranslateButton(Axis.X, true), -1);
			bar.insert(CreateTranslateButton(Axis.X, false), -1);
			bar.insert(CreateTranslateButton(Axis.Y, true), -1);
			bar.insert(CreateTranslateButton(Axis.Y, false), -1);
			bar.insert(CreateTranslateButton(Axis.Z, true), -1);
			bar.insert(CreateTranslateButton(Axis.Z, false), -1);

			bar.insert(new SeparatorToolItem(), -1);
			bar.insert(CreateRotateButton(Axis.X, true), -1);
			bar.insert(CreateRotateButton(Axis.X, false), -1);
			bar.insert(CreateRotateButton(Axis.Y, true), -1);
			bar.insert(CreateRotateButton(Axis.Y, false), -1);
			bar.insert(CreateRotateButton(Axis.Z, true), -1);
			bar.insert(CreateRotateButton(Axis.Z, false), -1);

			bar.insert(new SeparatorToolItem(), -1);

			unowned SList<RadioToolButton>? group = null;
			bar.insert(CreateGridButton(GridSize.Large, "gridLarge", ref group), -1);
			bar.insert(CreateGridButton(GridSize.Medium, "gridMedium", ref group), -1);
			bar.insert(CreateGridButton(GridSize.Small, "gridSmall", ref group), -1);
			return bar;
		}

		private ToolButton CreateGridButton(GridSize size, string iconName, ref unowned SList<RadioToolButton>? group)
		{
			string icon = "/home/robin/git/vldraw/icons/" + iconName + ".xpm";
			var button = CreateToggleButtonFromImageFile(icon, ref group);
			button.active = size == m_Options.Grid;

			button.toggled.connect(() =>
				{
					if(button.active)
						m_Options.Grid = size;
				});
			return button;
		}

		private ToolButton CreateTranslateButton(Axis axis, bool positive)
		{
			string icon = "/home/robin/git/vldraw/icons/" + (positive ? "plus" : "minus") + axis.to_string() + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			button.clicked.connect(() =>
				{
					Vector displacement = Vector(
												axis == Axis.X ? m_Options.CurrentGrid.X : 0.0f,
												axis == Axis.Y ? m_Options.CurrentGrid.Y : 0.0f,
												axis == Axis.Z ? m_Options.CurrentGrid.Z : 0.0f
											);

					if(!positive)
						displacement = displacement.Scale(-1.0f);

					undoStack.ExecuteCommand(new MoveNodesCommand(m_ModelContainer.Selection, displacement));
				});

			return button;
		}

		private ToolButton CreateRotateButton(Axis axis, bool positive)
		{
			string icon = "/home/robin/git/vldraw/icons/rotate" + (positive ? "Plus" : "Minus") + axis.to_string() + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			Vector rotationAxis = Vector(axis == Axis.X ? 1.0f : 0.0f, axis == Axis.Y ? 1.0f : 0.0f, axis == Axis.Z ? 1.0f : 0.0f);
			if(!positive)
			{
				rotationAxis = rotationAxis.Scale(-1.0f);
			}

			button.clicked.connect(() =>
				{
					foreach(var node in m_ModelContainer.Selection)
					{
						var partNode = node as PartNode;
						if(partNode == null)
							continue;
						partNode.TransformPart(Matrix.ForRotation(rotationAxis, 22.5f));
					}
				});

			return button;
		}

		private ToolButton CreateButtonFromImageFile(string fileName)
		{
			var image = new Image.from_file(fileName);
			image.pixbuf = image.pixbuf.scale_simple(ButtonSize, ButtonSize, Gdk.InterpType.BILINEAR);
			return new ToolButton(image, null);
		}

		private RadioToolButton CreateToggleButtonFromImageFile(string fileName, ref unowned SList<RadioToolButton>? group)
		{
			var image = new Image.from_file(fileName);
			image.pixbuf = image.pixbuf.scale_simple(ButtonSize, ButtonSize, Gdk.InterpType.BILINEAR);
			var button = new RadioToolButton(group);
			button.set_icon_widget(image);
			group = button.get_group();
			return button;
		}

		private enum Axis
		{
			X, Y, Z;

			public string to_string()
			{
				switch(this)
				{
					case X:
						return "X";
					case Y:
						return "Y";
					case Z:
						return "Z";
					default:
						return "Unknown axis.";
				}
			}
		}
	}
	
	private class ColourToolbar : GLib.Object, ToolbarProvider
	{
		public AnimatedModel m_ModelContainer {construct; private get;}
		public IOptions m_Options {construct; private get;}
		public UndoStack undoStack {construct; private get;}
		public ColourContext ColourContext {construct; private get; }

		public int ButtonSize {get; set; default = 16;}

		public Toolbar CreateToolbar(Gtk.Window window)
		{
			Toolbar bar = new Toolbar();
			bar.insert(new SeparatorToolItem(), -1);
			var falseVal = Value(typeof(bool));
			falseVal.set_boolean(false);
			for(int i = 0; i < 16; i++)
			{
				var button = CreateColourButton(i);
				bar.insert(button, -1);
				bar.child_set_property(button, "homogeneous", falseVal);
			}

			var moreButton = new ToolButton(null, "More");
			moreButton.clicked.connect(() =>
				{
					var dialog = new Dialog.with_buttons("Select colour", window,
						DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
						Stock.OK,		ResponseType.ACCEPT,
						Stock.CANCEL,	ResponseType.REJECT
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
							  | (255 - colour.Alpha);
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
			var grid = new Table(4, 8, true);
			this.colourContext = colourContext;
			for(int i = 0; i < 32; i++)
			{
				var button = new Button();
				int x = i;
				button.clicked.connect(() =>
					{
						ChosenColour = colourContext.GetColourById(32 * page + x);
					});

				grid.attach_defaults(button, i % 8, i % 8 + 1, i / 8, i / 8 + 1);

				buttons[i] = button;

			}

			var nextPageButton = new Button.from_stock(Stock.GO_FORWARD);
			var prevPageButton = new Button.from_stock(Stock.GO_BACK);
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
									  | (255 - colour.Alpha);
					data.fill(fillColour);

					var image = new Image.from_pixbuf(data);

					button.sensitive = true;
					button.add(image);
					button.set_tooltip_text(colour.Name);
				}
				else
				{
					button.sensitive = false;
					button.add(new Image.from_stock(Stock.STOP, IconSize.BUTTON));
					button.set_tooltip_text("Not defined");
				}
			}
			show_all();
			queue_draw();
		}

		public Colour ChosenColour {get; private set;}
	}
}
