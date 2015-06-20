using Gtk;

using Ldraw.Maths;
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
				command = null;
				return false;
			/*command = new MoveOriginCommand(model, shift);
			return true;*/
		}
		
		private class MoveOriginDialog : GLib.Object
		{
			Dialog dialog;
			Container view_container;
			Widget view;
			double x;
			double y;
			double z;
			
			public MoveOriginDialog(Window parent, AnimatedModel model, ModelView view)
			{
				dialog = new Dialog.with_buttons("Model details", parent,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					Stock.OK, ResponseType.ACCEPT,
					Stock.CANCEL, ResponseType.REJECT);
				var content = (Box) dialog.get_content_area();
				var box = new HBox(false, 5);
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
				
				xSpin.notify["value"].connect(() => x = xSpin.value);
				ySpin.notify["value"].connect(() => y = ySpin.value);
				zSpin.notify["value"].connect(() => z = zSpin.value);
				xSpin.value = ySpin.value = zSpin.value = 0.0;
				
				box.pack_start(table);
				view_container = (Container)WithFrame(view);
				this.view = view;
				box.pack_start(view_container);
				
				content.pack_start(box, true, true, 5);
				view.Model = model.Model;
			}
			
			public bool Run(out Vector? shift)
			{
				dialog.show_all();

				var response = dialog.run();
				view_container.remove(view);
				dialog.destroy();
				if(response != ResponseType.ACCEPT)
				;
				{
					shift = null;
					return false;
				}
			}
		}
	}
}
