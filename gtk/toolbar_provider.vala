using Gtk;
using Ldraw.Maths;
using Ldraw.Options;

namespace Ldraw.Ui
{
	public class ToolBarProvider : GLib.Object
	{
		private IHaveModel m_ModelContainer;
		private IOptions m_Options;

		public ToolBarProvider(IHaveModel modelContainer, IOptions options)
		{
			m_ModelContainer = modelContainer;
			m_Options = options;
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
			bar.insert(CreateGridButton(GridSize.Large, "gridLarge"), -1);
			bar.insert(CreateGridButton(GridSize.Medium, "gridMedium"), -1);
			bar.insert(CreateGridButton(GridSize.Small, "gridSmall"), -1);
			return bar;
		}

		public Toolbar GetColoursToolbar()
		{
			Toolbar bar = new Toolbar();
			bar.insert(new SeparatorToolItem(), -1);
			for(int i = 0; i < 16; i++)
			{
				bar.insert(CreateColourButton(i), -1);
			}
			return bar;
		}

		public Toolbar GetGridToolbar()
		{
			Toolbar bar = new Toolbar();
			return bar;
		}

		private ToolButton CreateGridButton(GridSize size, string iconName)
		{
			string icon = "/home/robin/projects/ldraw_vala/icons/" + iconName + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			button.clicked.connect(() =>
				{
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
					foreach(var node in m_ModelContainer.Model.Selection)
					{
						node.ColourId = colourId;
					}
					m_ModelContainer.Model.VisibleChange();
				});

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
					m_ModelContainer.Model.MoveSelectedNodes(displacement);
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
			Image image = new Image.from_file(fileName);
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
	}
}
