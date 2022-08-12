using Gtk;

using Ldraw.Lego;

namespace Ldraw.Ui.Dialogs {
	public class SubModels {
		private Dialog dialog;
		
		public SubModels(Window parent, MultipartModel model) {			
			dialog = new Dialog.with_buttons("Sub-models", parent,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                "_Done", ResponseType.ACCEPT);
			var content = (Box)(dialog.get_content_area());
			var tree_view = new TreeView.with_model(model.SubModels);
			tree_view.reorderable = true;
			var win = new ScrolledWindow(null, null);
			win.add(tree_view);
			content.pack_start(win);
			tree_view.insert_column_with_data_func(-1, "", new CellRendererText(), (col, cell, model, iter) =>
				{
					LdrawObject node;
					model.get(iter, 0, out node);
					((CellRendererText)cell).text = node.FileName;
				});
			tree_view.insert_column_with_data_func(-1, "", new CellRendererText(), (col, cell, model, iter) =>
				{
					LdrawObject node;
					model.get(iter, 0, out node);
					((CellRendererText)cell).text = node.Description;
				});
		}
		
		public void run() {
			dialog.show_all();
			dialog.run();
			dialog.destroy();
		}
	}
}
