using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui
{
	public class ManualRotationDialog : Object
	{
		private AnimatedModel model;
		private Dialog dialog;
		private Vector rotationAxis;
		private float rotationAngle;
		
		public ManualRotationDialog(AnimatedModel model, Window parent)
		{
			this.model = model;

			dialog = new Dialog.with_buttons("Rotate parts", parent,
				DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
				"_Apply", ResponseType.ACCEPT,
				"_Cancel", ResponseType.REJECT);				
			
			var contentArea = dialog.get_content_area();		
			
			var rotationControlsBox = new Box(Orientation.VERTICAL, 0);

			var rotationAngleEntry = new Entry();
			rotationAngleEntry.set_width_chars(8);
			rotationAngleEntry.set_max_width_chars(8);
			rotationAngleEntry.notify["text"].connect(() =>
				{
					double parsed;
					if(double.try_parse(rotationAngleEntry.text, out parsed))
						rotationAngle = (float)parsed;
				});
			var rotationAxisX = new Entry();
			rotationAxisX.set_width_chars(5);
			rotationAxisX.set_max_width_chars(5);
			rotationAxisX.notify["text"].connect(() =>
				{
					rotationAxis = Vector((float)double.parse(rotationAxisX.text), rotationAxis.Y, rotationAxis.Z);
				});

			var rotationAxisY = new Entry();
			rotationAxisY.set_width_chars(5);
			rotationAxisY.set_max_width_chars(5);
			rotationAxisY.notify["text"].connect(() =>
				{
					rotationAxis = Vector(rotationAxis.X, (float)double.parse(rotationAxisY.text), rotationAxis.Z);
				});

			var rotationAxisZ = new Entry();
			rotationAxisZ.set_width_chars(5);
			rotationAxisZ.set_max_width_chars(5);
			rotationAxisZ.notify["text"].connect(() =>
				{
					rotationAxis = Vector(rotationAxis.X, rotationAxis.Y, (float)double.parse(rotationAxisZ.text));
				});
				
			var angleHBox = new Box(Orientation.HORIZONTAL, 0);
			angleHBox.pack_start(new Label("Angle: "), false, false);
			angleHBox.pack_start(rotationAngleEntry, false, false);

			var rotationAxisHBox = new Box(Orientation.HORIZONTAL, 0);
			rotationAxisHBox.homogeneous = false;
			rotationAxisHBox.pack_start(new Label("Axis: ("), false, false);
			rotationAxisHBox.pack_start(rotationAxisX, false, false);
			rotationAxisHBox.pack_start(new Label(", "), false, false);
			rotationAxisHBox.pack_start(rotationAxisY, false, false);
			rotationAxisHBox.pack_start(new Label(", "), false, false);
			rotationAxisHBox.pack_start(rotationAxisZ, false, false);
			rotationAxisHBox.pack_start(new Label(")"), false, false);

			rotationControlsBox.pack_start(rotationAxisHBox, false, false);
			rotationControlsBox.pack_start(angleHBox, false, false);
			
			contentArea.add(rotationControlsBox);																	
		}
		
		public void Run(UndoStack stack)
		{
			dialog.show_all();
			var result = dialog.run();
			if(result == ResponseType.ACCEPT)
			{
				UpdateTransforms(stack);
			}
			dialog.destroy();
		}
		
		private void UpdateTransforms(UndoStack stack)
		{
			stack.ExecuteCommand(new TransformNodesCommand.Rotation(model.Selection, rotationAxis, rotationAngle));
		}
	}
}
