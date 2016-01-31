using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.Refactor;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	private class MoveOriginRefactoring : GLib.Object, Refactoring
	{
		public ModelView View {construct; private get;}
		public ColourContext Colours {construct; private get;}
		
		public string GetLabel() {return "Move Origin";}
		
		public bool CanExecute(AnimatedModel model) {return true;} // always available
		
		public bool PrepareToExecute(AnimatedModel model, Window dialogParent, out Command? command)
		{
			var dialog = new MoveOriginDialog(dialogParent, model, View, Colours);
			Vector? shift;
			if(!dialog.Run(out shift))
			{
				command = null;
				return false;
			}
			command = new MoveOriginCommand(shift, model);
			return true;
		}
		
		private class MoveOriginDialog : GLib.Object
		{
			Dialog dialog;
			Container view_container;
			ModelView view;
			public float x {get; set;}
			public float y {get; set;}
			public float z {get; set;}
			
			public MoveOriginDialog(Window parent, AnimatedModel model, ModelView view, ColourContext colours)
			{
				dialog = new Dialog.with_buttons("Model details", parent,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					"_OK", ResponseType.ACCEPT,
					"_Cancel", ResponseType.REJECT);
				dialog.set_default_response(ResponseType.ACCEPT);
				var content = (Box) dialog.get_content_area();
				var box = new Box(Orientation.HORIZONTAL, 5);
				var vbox = new Box(Orientation.VERTICAL, 0);
				var grid = new Grid();
				grid.column_homogeneous = false;
				grid.attach(new Label("X"), 0, 0);
				grid.attach(new Label("Y"), 0, 1);
				grid.attach(new Label("Z"), 0, 2);
				var xSpin = new SpinButton.with_range(-5000.0, 5000.0, 5.0);
				var ySpin = new SpinButton.with_range(-5000.0, 5000.0, 5.0);
				var zSpin = new SpinButton.with_range(-5000.0, 5000.0, 5.0);
				grid.attach(xSpin, 1, 0);
				grid.attach(ySpin, 1, 1);
				grid.attach(zSpin, 1, 2);
				
				xSpin.notify["value"].connect(() => x = (float)xSpin.value);
				ySpin.notify["value"].connect(() => y = (float)ySpin.value);
				zSpin.notify["value"].connect(() => z = (float)zSpin.value);
				xSpin.value = ySpin.value = zSpin.value = 0.0;
				
				vbox.pack_start(grid, false, false, 75);
				box.pack_start(vbox, false);
				view_container = (Container)WithFrame(view);
				this.view = view;
				box.pack_start(view_container, true, true, 10);
				
				content.pack_start(box, true, true, 5);
				view.Model = model.Model;
				view.Overlay = new MoveOriginOverlay(this, colours);
				view.set_size_request(300, 300);
				view.Angle = ViewAngle.Ortho;
			}
			
			public bool Run(out Vector? shift)
			{
				dialog.show_all();
				view.Angle = ViewAngle.Ortho;

				var response = dialog.run();
				view_container.remove(view);
				dialog.destroy();
				if(response != ResponseType.ACCEPT)
				{
					shift = null;
					return false;
				}
				shift = Vector(x, y, z);
				return true;
			}
		}
		
		private class MoveOriginOverlay : GLib.Object, Ldraw.Ui.Widgets.Overlay
		{
			private MoveOriginDialog dialog;
			private ColourContext colours;
			
			public MoveOriginOverlay(MoveOriginDialog dialog, ColourContext colours)
			{
				this.dialog = dialog;
				this.colours = colours;
				dialog.notify["x"].connect(() => Changed());
				dialog.notify["y"].connect(() => Changed());
				dialog.notify["z"].connect(() => Changed());
			}
			
			private void Draw(DrawingContext ctx)
			{
				var axisLength= 1000F;
				Vector newOrigin = Vector(dialog.x, dialog.y, dialog.z);
				ctx.DrawLine(newOrigin.Add(Vector(-axisLength, 0F, 0F)), newOrigin.Add(Vector(axisLength, 0F, 0F)), colours.GetColourById(1));
				ctx.DrawLine(newOrigin.Add(Vector(0F, axisLength, 0F)), newOrigin.Add(Vector(0F, -axisLength, 0F)), colours.GetColourById(2));	
				ctx.DrawLine(newOrigin.Add(Vector(0F, 0F, -axisLength)), newOrigin.Add(Vector(0F, 0F, axisLength)), colours.GetColourById(3));
			}
		}
	}
}
