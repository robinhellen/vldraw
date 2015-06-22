using Gtk;

using Ldraw.Maths;
using Ldraw.Refactor;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	private class MoveOriginRefactoring : GLib.Object, Refactoring
	{
		public ModelView View {construct; private get;}
		
		public string GetLabel() {return "Move Origin";}
		
		public bool CanExecute(AnimatedModel model) {return true;} // always available
		
		public bool PrepareToExecute(AnimatedModel model, Window dialogParent, out Command? command)
		{
			var dialog = new MoveOriginDialog(dialogParent, model, View);
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
			Widget view;
			public float x {get; set;}
			public float y {get; set;}
			public float z {get; set;}
			
			public MoveOriginDialog(Window parent, AnimatedModel model, ModelView view)
			{
				dialog = new Dialog.with_buttons("Model details", parent,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					Stock.OK, ResponseType.ACCEPT,
					Stock.CANCEL, ResponseType.REJECT);
				dialog.set_default_response(ResponseType.ACCEPT);
				var content = (Box) dialog.get_content_area();
				var box = new HBox(false, 5);
				var vbox = new VBox(false, 0);
				var table = new Table(3, 2, false);
				AttachToTable(table, new Label("X"), 0, 0);
				AttachToTable(table, new Label("Y"), 0, 1);
				AttachToTable(table, new Label("Z"), 0, 2);
				var xSpin = new SpinButton.with_range(-5000.0, 5000.0, 5.0);
				var ySpin = new SpinButton.with_range(-5000.0, 5000.0, 5.0);
				var zSpin = new SpinButton.with_range(-5000.0, 5000.0, 5.0);
				AttachToTable(table, xSpin, 1, 0);
				AttachToTable(table, ySpin, 1, 1);
				AttachToTable(table, zSpin, 1, 2);
				
				xSpin.notify["value"].connect(() => x = (float)xSpin.value);
				ySpin.notify["value"].connect(() => y = (float)ySpin.value);
				zSpin.notify["value"].connect(() => z = (float)zSpin.value);
				xSpin.value = ySpin.value = zSpin.value = 0.0;
				
				vbox.pack_start(table, false, false, 75);
				box.pack_start(vbox, false);
				view_container = (Container)WithFrame(view);
				this.view = view;
				box.pack_start(view_container, true, true, 10);
				
				content.pack_start(box, true, true, 5);
				view.Model = model.Model;
				view.Angle = ViewAngle.Ortho;
				view.Overlay = new MoveOriginOverlay(this);
				view.set_size_request(300, 300);
			}
			
			public bool Run(out Vector? shift)
			{
				dialog.show_all();

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
		
		private class MoveOriginOverlay : GLib.Object, Overlay
		{
			private MoveOriginDialog dialog;
			
			public MoveOriginOverlay(MoveOriginDialog dialog)
			{
				this.dialog = dialog;
				dialog.notify["x"].connect(() => Changed());
				dialog.notify["y"].connect(() => Changed());
				dialog.notify["z"].connect(() => Changed());
			}
			
			private void Draw(DrawingContext ctx)
			{
				var axisLength= 1000F;
				Vector newOrigin = Vector(dialog.x, dialog.y, dialog.z);
				ctx.DrawLine(newOrigin, newOrigin.Add(Vector(axisLength, 0F, 0F)));
				ctx.DrawLine(newOrigin, newOrigin.Add(Vector(0F, -axisLength, 0F)));	
				ctx.DrawLine(newOrigin, newOrigin.Add(Vector(0F, 0F, axisLength)));
			}
		}
	}
}
