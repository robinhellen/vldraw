using Gtk;

using Ldraw.Lego;
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

			unowned SList<RadioToolButton>? group = null;
			bar.insert(CreateGridButton(GridSize.Large, "gridLarge", ref group), -1);
			bar.insert(CreateGridButton(GridSize.Medium, "gridMedium", ref group), -1);
			bar.insert(CreateGridButton(GridSize.Small, "gridSmall", ref group), -1);

			bar.insert(new SeparatorToolItem(), -1);
			
			bar.insert(CreateManualPositionToolButton(dialogParent), -1);
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
		
		private ToolButton CreateManualPositionToolButton(Window dialogParent)
		{
			var button = new ToolButton(new Label("Manual"), "Manual");
			button.clicked.connect(() => 
			new ManualRotationDialog(m_ModelContainer, dialogParent).Run());
			return button;
		}
	}
}
