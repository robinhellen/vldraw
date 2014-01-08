using Gee;
using GLib.Math;
using Gtk;

using Ldraw.Lego.Nodes;
using Ldraw.Utils;

namespace Ldraw.Ui.Widgets
{
	public class ParameterValues : TreeView
	{
		private AnimatedModel ldrawModel;

		public AnimatedModel Model
		{
			get
			{
				return ldrawModel;
			}
			set
			{
				ldrawModel = value;
				var observable = new ObservableList<AnimParameterCommand>();
				observable.add_all(value.Model.NodesOfType<AnimParameterCommand>());
				this.model = observable;
				ldrawModel.Model.VisibleChange.connect(() =>
				{
					var newObservable = new ObservableList<AnimParameterCommand>();
					newObservable.add_all(ldrawModel.Model.NodesOfType<AnimParameterCommand>());
					this.model = newObservable;
				});
			}
		}

		public ParameterValues(AnimatedModel ldrawModel)
		{
			Model = ldrawModel;

			insert_column_with_data_func(-1, "Name", new CellRendererText(), (col, cell, model, iter) =>
				{
					AnimParameterCommand node;
					model.get(iter, 0, out node);
					((CellRendererText)cell).text = node.Identifier;
				});

			var spinRenderer = new CellRendererSpin();
			spinRenderer.edited.connect((renderer, path, text) =>
				{
					var val = (float)double.parse(text);
					var o = model as ObservableList<AnimParameterCommand>;
					var c = o.get_value_for_path(new TreePath.from_string(path));
					Model.UpdateParameter(c.Identifier, val);
				});
			insert_column_with_data_func(-1, "Value", spinRenderer, (col, cell, model, iter) =>
				{
					AnimParameterCommand node;
					model.get(iter, 0, out node);

					var spin = ((CellRendererSpin)cell).adjustment ?? (((CellRendererSpin)cell).adjustment = new Adjustment(0, 0, 0, 0, 0, 0));
					((CellRendererSpin)cell).text = (Model.CurrentParameters[node.Identifier] ?? 0).to_string();
					((CellRendererSpin)cell).editable = true;
					((CellRendererSpin)cell).digits = 2 - ((int) log10f(node.Max - node.Min)) ;
					spin.lower = node.Min;
					spin.upper = node.Max;
					spin.page_increment = (node.Max - node.Min) / 10;
					spin.step_increment = (node.Max - node.Min) / 100;
					spin.value = Model.CurrentParameters[node.Identifier] ?? 0;
					spin.value_changed.connect(adj => Model.UpdateParameter(node.Identifier, (float)adj.value));
				});
		}
	}
}
