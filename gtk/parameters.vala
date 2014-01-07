using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Utils;


namespace Ldraw.Ui.Widgets
{
	public class ParametersDialog : GLib.Object
	{
		Dialog dialog;
		ObservableList<AnimParameterCommand> model;
		LdrawObject object;

		public ParametersDialog(LdrawObject object, Window parent)
		{
			this.object = object;
			var parameters = object.NodesOfType<AnimParameterCommand>();
			model = new ObservableList<AnimParameterCommand>();

			model.add_all(parameters);

			dialog = new Dialog.with_buttons("Model details", parent,
				DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
				Stock.OK, ResponseType.ACCEPT,
				Stock.CANCEL, ResponseType.REJECT);

			var actionArea = (VBox)dialog.get_content_area();
			var paramList = new TreeView.with_model(model);

			// insert the columns with editable text cells.

			InsertColumn(paramList, x => x.Identifier, (x, y) => x.Identifier =y);
			InsertColumn(paramList, x => x.ParameterDescription, (x, y) => x.ParameterDescription = y);
			InsertColumn(paramList, x => x.Min.to_string(), (x, y) => x.Min = (float)double.parse(y));
			InsertColumn(paramList, x => x.Max.to_string(), (x, y) => x.Max = (float)double.parse(y));

			actionArea.pack_start(paramList);
		}

		[CCode(has_target = false)]
		private delegate string CellFunc(AnimParameterCommand cmd);

		[CCode(has_target = false)]
		private delegate void CellAction(AnimParameterCommand cmd, string value);

		private void InsertColumn(TreeView view, CellFunc func, CellAction action)
		{
			var renderer = new CellRendererText();
			renderer.editable = true;
			renderer.edited.connect((path, newValue) => {
				var param = model.get_value_for_path(new TreePath.from_string(path));
				action(param, newValue);
			});
			view.insert_column_with_data_func(-1, "", renderer, (col, cell, model, iter) =>
				{
					AnimParameterCommand node;
					model.get(iter, 0, out node);
					((CellRendererText)cell).text = func(node);
				});
		}

		public void Run()
		{
			dialog.show_all();
			var result = dialog.run();
			if(result == ResponseType.ACCEPT)
			{
				UpdateObjectParameters();
			}
			dialog.destroy();
		}

		private void UpdateObjectParameters()
		{
			var oldParams = object.NodesOfType<AnimParameterCommand>();
			var removedParams = new ArrayList<AnimParameterCommand>();
			foreach(var param in oldParams)
			{
				if(param in model)
					model.remove(param);
				else
					removedParams.add(param);
			}

			foreach(var param in removedParams)
			{
				object.RemoveNode(param);
			}

			foreach(var param in model)
			{
				object.AddHeaderNode(param);
			}
		}
	}
}
