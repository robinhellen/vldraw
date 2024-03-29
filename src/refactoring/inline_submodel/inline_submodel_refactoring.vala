using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Refactor;
using Ldraw.Ui.Widgets;

namespace Ldraw.Ui
{
	private class InlineSubmodelRefactoring : GLib.Object, Refactoring
	{
		public ModelView View {construct; private get;}
		public ColourContext Colours {construct; private get;}
		
		public string GetLabel() {return "Inline submodel";}
		
		public bool CanExecute(AnimatedModel model) {return true;} // always available
		
		public bool PrepareToExecute(AnimatedModel model, Window dialogParent, out Command? command)
		{
			var file = model.File;
			PartNode node;
			if(!can_inline(model, file, out node))
			{
				command = null;
				warning("Selection not suitable to inline.\n");
				return false;
			}
			var dialog = new InlineSubmodelDialog(dialogParent, model, node, file as MultipartModel);
			if(!dialog.Run(out command))
			{
				return false;
			}
			return true;
		}
		
		private bool can_inline(AnimatedModel model, LdrawFile file, out PartNode node)
		{
			node = null;
			var selection = model.Selection;
			if(selection.size != 1)
				return false;
			if(!(file is MultipartModel))
				return false;
			
			var selected_node = selection.to_array()[0];
			var part_node = selected_node as PartNode;
			if(part_node == null)
				return false;
				
			if(part_node.File != file)
				return false;
			node = part_node;
			return true;
		}
		
		private class InlineSubmodelDialog : GLib.Object
		{
			Dialog dialog;
			
			private bool inline_all;
			private bool remove_definition;
			
			private AnimatedModel model;
			private PartNode reference;
			private MultipartModel multi_model;
			
			public InlineSubmodelDialog(Window parent, AnimatedModel model, PartNode reference, MultipartModel multi)
			{
				this.model = model;
				this.reference = reference;
				multi_model = multi;
				dialog = new Dialog.with_buttons("Model details", parent,
					DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
					"_OK", ResponseType.ACCEPT,
					"_Cancel", ResponseType.REJECT);
				dialog.set_default_response(ResponseType.ACCEPT);
				var content = (Box) dialog.get_content_area();
				var box = new Box(Orientation.HORIZONTAL, 5);
				var vbox = new Box(Orientation.VERTICAL, 0);
				
				var inline_all_check = new CheckButton.with_label("Inline all uses");
				inline_all_check.toggled.connect(() => inline_all = inline_all_check.active);
				vbox.pack_start(inline_all_check);
				
				var remove_definition_check = new CheckButton.with_label("Remove definition");
				remove_definition_check.toggled.connect(() => remove_definition = remove_definition_check.active);
				vbox.pack_start(remove_definition_check);
				
			
				box.pack_start(vbox, false);
				
				content.pack_start(box, true, true, 5);
			}
			
			public bool Run(out Command? command) {
				dialog.show_all();

				var response = dialog.run();
				dialog.destroy();
				if(response != ResponseType.ACCEPT) {
					command = null;
					return false;
				}
				
				if(inline_all) {
					command = new InlineSubModelCommand.all(reference.Contents, multi_model, remove_definition);
				} else {
					command = new InlineSubModelCommand.from_reference(model.Model, reference, multi_model, remove_definition);	
				}				
				return true;
			}
		}
		
	}
}
