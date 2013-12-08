using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui
{
	public class ToolBarProvider : GLib.Object
	{
		private unowned MainWindow m_ModelContainer;
		private IOptions m_Options;
		private UndoStack undoStack;

		public ToolBarProvider(MainWindow modelContainer, IOptions options, UndoStack undoStack)
		{
			m_ModelContainer = modelContainer;
			m_Options = options;
			this.undoStack = undoStack;
		}

		public int ButtonSize {get; set; default = 16;}

		public Toolbar GetMovementToolbar()
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

		public Toolbar GetColoursToolbar(Gtk.Window window)
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

					var chooser = new ColourChooser();

					((Container)dialog.get_content_area()).add(chooser);

					dialog.show_all();
					var result = dialog.run();
					if(result != ResponseType.ACCEPT)
					{
						dialog.destroy();
						return;
					}

					undoStack.ExecuteCommand(new ChangeColourCommand(m_ModelContainer.Model.Selection, chooser.ChosenColour));
					dialog.destroy();
				});
			moreButton.set_tooltip_text("More colours");
			bar.insert(moreButton, -1);
			bar.child_set_property(moreButton, "homogeneous", falseVal);

			return bar;
		}

		private ToolButton CreateGridButton(GridSize size, string iconName, ref unowned SList<RadioToolButton>? group)
		{
			string icon = "/home/robin/projects/ldraw_vala/icons/" + iconName + ".xpm";
			var button = CreateToggleButtonFromImageFile(icon, ref group);
			button.active = size == m_Options.Grid;

			button.toggled.connect(() =>
				{
					if(button.active)
						m_Options.Grid = size;
				});
			return button;
		}

		private ToolButton CreateColourButton(int colourId)
		{
			Gdk.Pixbuf data = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, ButtonSize, ButtonSize);

			float red, green, blue, alpha;
			Ldraw.Lego.LdrawColour.SurfaceColour(colourId, out red, out green, out blue, out alpha);

			uint32 fillColour = ((int)(red * 255) << 24)
							  | ((int)(green * 255) << 16)
							  | ((int)(blue * 255) << 8)
							  | ((int)(alpha * 255));
			data.fill(fillColour);

			var button = new ToolButton(new Image.from_pixbuf(data), null);
			button.clicked.connect(() =>
				{
					undoStack.ExecuteCommand(new ChangeColourCommand(m_ModelContainer.Model.Selection, colourId));
				});
			button.set_tooltip_text(LdrawColour.GetName(colourId));
			return button;
		}

		private ToolButton CreateTranslateButton(Axis axis, bool positive)
		{
			string icon = "/home/robin/projects/ldraw_vala/icons/" + (positive ? "plus" : "minus") + axis.to_string() + ".xpm";
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

					undoStack.ExecuteCommand(new MoveNodesCommand(m_ModelContainer.Model.Selection, displacement));
				});

			return button;
		}

		private ToolButton CreateRotateButton(Axis axis, bool positive)
		{
			string icon = "/home/robin/projects/ldraw_vala/icons/rotate" + (positive ? "Plus" : "Minus") + axis.to_string() + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			Vector rotationAxis = Vector(axis == Axis.X ? 1.0f : 0.0f, axis == Axis.Y ? 1.0f : 0.0f, axis == Axis.Z ? 1.0f : 0.0f);
			if(!positive)
			{
				rotationAxis = rotationAxis.Scale(-1.0f);
			}

			button.clicked.connect(() =>
				{
					m_ModelContainer.Model.TransformSelectedNodes(Matrix.ForRotation(rotationAxis, 22.5f));
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

	public class ColourChooser : VBox
	{
		private int page = 0;
		private Button[] buttons = new Button[32];

		public ColourChooser()
		{
			var grid = new Table(4, 8, true);
			for(int i = 0; i < 32; i++)
			{
				var button = new Button();
				int x = i;
				button.clicked.connect(() =>
					{
						ChosenColour = 32 * page + x;
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
			var button_box = new VBox(true, 10);
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
				button.remove(button.child);

				var colourName = LdrawColour.GetName(colourId);
				if(colourName != null)
				{
					Gdk.Pixbuf data = new Gdk.Pixbuf(Gdk.Colorspace.RGB, true, 8, 16, 16);

					float red, green, blue, alpha;
					Ldraw.Lego.LdrawColour.SurfaceColour(colourId, out red, out green, out blue, out alpha);

					uint32 fillColour = ((int)(red * 255) << 24)
									  | ((int)(green * 255) << 16)
									  | ((int)(blue * 255) << 8)
									  | ((int)(alpha * 255));
					data.fill(fillColour);

					var image = new Image.from_pixbuf(data);

					button.sensitive = true;
					button.add(image);
					button.set_tooltip_text(colourName);
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

		public int ChosenColour {get; private set;}
	}
}
