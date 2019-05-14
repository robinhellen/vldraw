using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui;
using Ldraw.Ui.Commands;

namespace Ldraw.Plugins.Movement
{
	private class MovementToolbar : GLib.Object, ToolbarProvider
	{
		public AnimatedModel m_ModelContainer {construct; private get;}
		public IOptions m_Options {construct; private get;}
		public UndoStack undoStack {construct; private get;}

		public int ButtonSize {get; set; default = 16;}
		
		const string icon_location = "/home/robin/git/vldraw/icons/";

		public Toolbar CreateToolbar(Window dialogParent)
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

			unowned SList<RadioButton>? group = null;
			bar.insert(CreateGridButton(GridSize.Large,  ref group), -1);
			bar.insert(CreateGridButton(GridSize.Medium, ref group), -1);
			bar.insert(CreateGridButton(GridSize.Small,  ref group), -1);

			bar.insert(new SeparatorToolItem(), -1);
			
			bar.insert(CreateManualPositionToolButton(dialogParent), -1);
			return bar;
		}

		private ToolButton CreateGridButton(GridSize size, ref unowned SList<RadioButton>? group)
		{
			string inner_lines = "";
			switch(size)
			{
				case GridSize.Large:
					inner_lines = @"<line x1=\"0\"  y1=\"10\" x2=\"20\" y2=\"10\" stroke=\"black\" />
	<line x1=\"10\" y1=\"0\"  x2=\"10\" y2=\"20\" stroke=\"black\" />";
					break;
				case GridSize.Medium:
					inner_lines = @"<line x1=\"0\"  y1=\"6.66\" x2=\"20\" y2=\"6.66\" stroke=\"black\" />
	<line x1=\"6.66\" y1=\"0\"  x2=\"6.66\" y2=\"20\" stroke=\"black\" />
	<line x1=\"0\"  y1=\"13.33\" x2=\"20\" y2=\"13.33\" stroke=\"black\" />
	<line x1=\"13.33\" y1=\"0\"  x2=\"13.33\" y2=\"20\" stroke=\"black\" />";
					break;
				case GridSize.Small:
					inner_lines = @"<line x1=\"0\"  y1=\"10\" x2=\"20\" y2=\"10\" stroke=\"black\" />
	<line x1=\"10\" y1=\"0\"  x2=\"10\" y2=\"20\" stroke=\"black\" />
	<line x1=\"0\"  y1=\"5\" x2=\"20\" y2=\"5\" stroke=\"black\" />
	<line x1=\"5\" y1=\"0\"  x2=\"5\" y2=\"20\" stroke=\"black\" />
	<line x1=\"0\"  y1=\"15\" x2=\"20\" y2=\"15\" stroke=\"black\" />
	<line x1=\"15\" y1=\"0\"  x2=\"15\" y2=\"20\" stroke=\"black\" />";
					break;
			}
			string grid_svg = @"<?xml version=\"1.0\" encoding=\"UTF-8\" ?>
<svg  xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\" width=\"$ButtonSize\" height=\"$ButtonSize\" viewBox=\"-1 -1 22 22\" >
	<line x1=\"0\"  y1=\"0\"  x2=\"0\"  y2=\"20\" stroke=\"black\" />
	<line x1=\"20\" y1=\"0\"  x2=\"20\" y2=\"20\" stroke=\"black\" />
	<line x1=\"0\"  y1=\"0\"  x2=\"20\" y2=\"0\"  stroke=\"black\" />
	<line x1=\"0\"  y1=\"20\" x2=\"20\" y2=\"20\" stroke=\"black\" />
	$inner_lines
</svg>";
			Gdk.PixbufLoader loader;
			try{
				loader = new Gdk.PixbufLoader.with_type("svg");
				loader.write(grid_svg.data);
				loader.close();
			}
			catch(Error e)
			{
				stderr.printf(@"Unable to create image from SVG string: $(e.message).\n");
				throw e;
			}
			var pixbuf = loader.get_pixbuf();
			
			var image = new Image.from_pixbuf(pixbuf);
			var button = new RadioToolButton(group);
			button.set_icon_widget(image);
			group = button.get_group();
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
			string icon = icon_location + (positive ? "plus" : "minus") + axis.to_string() + ".xpm";
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
			string icon = icon_location + "rotate" + (positive ? "Plus" : "Minus") + axis.to_string() + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			Vector rotationAxis = Vector(axis == Axis.X ? 1.0f : 0.0f, axis == Axis.Y ? 1.0f : 0.0f, axis == Axis.Z ? 1.0f : 0.0f);
			if(!positive)
			{
				rotationAxis = rotationAxis.Scale(-1.0f);
			}

			button.clicked.connect(() =>
				{
					undoStack.ExecuteCommand(new TransformNodesCommand.Rotation(m_ModelContainer.Selection, rotationAxis, 22.5f));
				});

			return button;
		}

		private ToolButton CreateButtonFromImageFile(string fileName)
		{
			var image = new Image.from_file(fileName);
			image.pixbuf = image.pixbuf.scale_simple(ButtonSize, ButtonSize, Gdk.InterpType.BILINEAR);
			return new ToolButton(image, null);
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
		
		private ToolButton CreateManualPositionToolButton(Window dialogParent)
		{
			var button = new ToolButton(new Label("Manual"), "Manual");
			button.clicked.connect(() => 
			new ManualRotationDialog(m_ModelContainer, dialogParent).Run(undoStack));
			button.set_homogeneous(false);
			return button;
		}
	}
}
