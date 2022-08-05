using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui;
using Ldraw.Ui.GtkGl;
using Ldraw.Ui.Commands;

namespace Ldraw.Plugins.Movement
{
	private class MovementToolbar : GLib.Object, ToolbarProvider, PositionAdjuster
	{
		public AnimatedModel m_ModelContainer {construct; private get;}
		public GridSetting grid {construct; private get;}

		public int ButtonSize {get; set; default = 16;}
		
		const string resource_base = "/org/ldraw/rkh/vldraw/icons/";

		public Toolbar CreateToolbar(Window dialogParent, CommandExecutor executor)
		{
			Toolbar bar = new Toolbar();

			bar.insert(new SeparatorToolItem(), -1);
			bar.insert(CreateTranslateButton(Axis.X, true, executor), -1);
			bar.insert(CreateTranslateButton(Axis.X, false, executor), -1);
			bar.insert(CreateTranslateButton(Axis.Y, true, executor), -1);
			bar.insert(CreateTranslateButton(Axis.Y, false, executor), -1);
			bar.insert(CreateTranslateButton(Axis.Z, true, executor), -1);
			bar.insert(CreateTranslateButton(Axis.Z, false, executor), -1);

			bar.insert(new SeparatorToolItem(), -1);
			bar.insert(CreateRotateButton(Axis.X, true, executor), -1);
			bar.insert(CreateRotateButton(Axis.X, false, executor), -1);
			bar.insert(CreateRotateButton(Axis.Y, true, executor), -1);
			bar.insert(CreateRotateButton(Axis.Y, false, executor), -1);
			bar.insert(CreateRotateButton(Axis.Z, true, executor), -1);
			bar.insert(CreateRotateButton(Axis.Z, false, executor), -1);

			bar.insert(new SeparatorToolItem(), -1);

			unowned SList<RadioButton>? group = null;
			bar.insert(CreateGridButton(GridSize.Large,  ref group), -1);
			bar.insert(CreateGridButton(GridSize.Medium, ref group), -1);
			bar.insert(CreateGridButton(GridSize.Small,  ref group), -1);

			bar.insert(new SeparatorToolItem(), -1);
			
			bar.insert(CreateManualPositionToolButton(dialogParent, executor), -1);
			return bar;
		}

		private ToolButton CreateGridButton(GridSize size, ref unowned SList<RadioButton>? group)
		{
			string resource_name;
			switch(size)
			{
				case GridSize.Large:
					resource_name = "gridLarge.svg";
					break;
				case GridSize.Medium:
					resource_name = "gridMedium.svg";
					break;
				case GridSize.Small:
					resource_name = "gridSmall.svg";
					break;
				default:
					assert_not_reached();
			}
			
			var image = new Image.from_resource(resource_base + resource_name);
			var button = new RadioToolButton(group);
			button.set_icon_widget(image);
			group = button.get_group();
			button.active = size == GridSize.Medium; // TODO: get this from somewhere else

			button.toggled.connect(() =>
				{
					if(button.active)
						grid.set_size(size);
				});
			
			return button;
		}

		private ToolButton CreateTranslateButton(Axis axis, bool positive, CommandExecutor executor)
		{
			string icon = resource_base + (positive ? "plus" : "minus") + axis.to_string() + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			button.clicked.connect(() =>
				{
					Vector displacement = Vector(
												axis == Axis.X ? grid.X : 0.0f,
												axis == Axis.Y ? grid.Y : 0.0f,
												axis == Axis.Z ? grid.Z : 0.0f
											);

					if(!positive)
						displacement = displacement.Scale(-1.0f);

					executor(new MoveNodesCommand(m_ModelContainer.Selection, displacement));
				});

			return button;
		}

		private ToolButton CreateRotateButton(Axis axis, bool positive, CommandExecutor executor)
		{
			string icon = resource_base + "rotate" + (positive ? "Plus" : "Minus") + axis.to_string() + ".xpm";
			var button = CreateButtonFromImageFile(icon);

			Vector rotationAxis = Vector(axis == Axis.X ? 1.0f : 0.0f, axis == Axis.Y ? 1.0f : 0.0f, axis == Axis.Z ? 1.0f : 0.0f);
			if(!positive)
			{
				rotationAxis = rotationAxis.Scale(-1.0f);
			}

			button.clicked.connect(() =>
				{
					executor(new TransformNodesCommand.Rotation(m_ModelContainer.Selection, rotationAxis, 22.5f));
				});

			return button;
		}

		private ToolButton CreateButtonFromImageFile(string fileName)
		{
			var image = new Image.from_resource(fileName);
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
		
		private ToolButton CreateManualPositionToolButton(Window dialogParent, CommandExecutor executor)
		{
			var button = new ToolButton(new Label("Manual"), "Manual");
			button.clicked.connect(() => 
			new ManualRotationDialog(m_ModelContainer, dialogParent).Run(executor));
			button.set_homogeneous(false);
			return button;
		}

		private float snap_to(float raw, float step)
		{
			return step * Math.roundf(raw / step);
		}
		
		public float adjust_x(float x)
		{
			return snap_to(x, grid.X);
		}
		
		public float adjust_y(float y)
		{
			return snap_to(y, grid.Y);
		}
		
		public float adjust_z(float z)
		{
			return snap_to(z, grid.Z);
		}
	}
}
