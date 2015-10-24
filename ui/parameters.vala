using Gee;
using Gtk;

using Ldraw.Animation;
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Utils;


namespace Ldraw.Ui.Widgets
{
	private class ParametersDialog : GLib.Object
	{
		Dialog dialog;
		ObservableList<ParameterCommand> model;
		LdrawObject object;

		public ParametersDialog(LdrawObject object, Window parent)
		{
			this.object = object;
			var parameters = object.NodesOfType<ParameterCommand>();
			model = new ObservableList<ParameterCommand>();

			model.add_all(parameters);

			dialog = new Dialog.with_buttons("Model details", parent,
				DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
				"_OK", ResponseType.ACCEPT,
				"_Cancel", ResponseType.REJECT);

			var actionArea = (VBox)dialog.get_content_area();
			var paramList = new TreeView.with_model(model);

			// insert the columns with editable text cells.

			InsertColumn("Name", paramList, x => x.Identifier, (x, y) => x.Identifier =y);
			InsertColumn("Description", paramList, x => x.ParameterDescription, (x, y) => x.ParameterDescription = y);
			InsertColumn("Min", paramList, x => x.Min.to_string(), (x, y) => x.Min = (float)double.parse(y));
			InsertColumn("Max", paramList, x => x.Max.to_string(), (x, y) => x.Max = (float)double.parse(y));

			var boolCell = new CellRendererToggle();
			boolCell.activatable = true;
			paramList.insert_column_with_data_func(-1, "Cyclic", boolCell, (col, cell, model, iter) =>
				{
					ParameterCommand node;
					model.get(iter, 0, out node);
					((CellRendererToggle)cell).active = node.Cyclic;
				});
			boolCell.toggled.connect((renderer, path) => {
				var node = model.get_value_for_path(new TreePath.from_string(path));
				node.Cyclic = renderer.active;
			});

			actionArea.pack_start(paramList);
			var buttonBox = new HButtonBox();

			var addNewButton = new Button.with_label("New");
			addNewButton.clicked.connect(() =>
			{
				model.add(new ParameterCommand.Blank());
			});
			buttonBox.add(addNewButton);

			actionArea.pack_start(buttonBox);
		}

		[CCode(has_target = false)]
		private delegate string CellFunc(ParameterCommand cmd);

		[CCode(has_target = false)]
		private delegate void CellAction(ParameterCommand cmd, string value);

		private void InsertColumn(string title, TreeView view, CellFunc func, CellAction action)
		{
			var renderer = new CellRendererText();
			renderer.editable = true;
			renderer.edited.connect((path, newValue) =>
				{
					var param = model.get_value_for_path(new TreePath.from_string(path));
					action(param, newValue);
				});
			view.insert_column_with_data_func(-1, title, renderer, (col, cell, model, iter) =>
				{
					ParameterCommand node;
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
			var oldParams = object.NodesOfType<ParameterCommand>();
			var removedParams = new ArrayList<ParameterCommand>();
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
