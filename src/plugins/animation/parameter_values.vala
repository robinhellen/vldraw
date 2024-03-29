using Gee;
using GLib.Math;
using Gtk;

using Ldraw.Lego.Nodes;
using Ldraw.Ui;
using Ldraw.Utils;

namespace Ldraw.Animation
{
	private class ParameterValues : TreeView
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
				var observable = new ObservableList<ParameterCommand>();
				observable.add_all(value.Model.NodesOfType<ParameterCommand>());
				this.model = observable;
				ldrawModel.Model.VisibleChange.connect(() =>
				{
					var newObservable = new ObservableList<ParameterCommand>();
					newObservable.add_all(ldrawModel.Model.NodesOfType<ParameterCommand>());
					this.model = newObservable;
				});
			}
		}
		public RenderAdjuster adjuster {construct; private get;}

		public ParameterValues(AnimatedModel ldrawModel)
		{
			Model = ldrawModel;

			insert_column_with_data_func(-1, "Name", new CellRendererText(), (col, cell, model, iter) =>
				{
					ParameterCommand node;
					model.get(iter, 0, out node);
					((CellRendererText)cell).text = node.Identifier;
				});

			var spinRenderer = new CellRendererSpin();
			spinRenderer.editable = true;
			spinRenderer.edited.connect((renderer, path, text) =>
				{
					var val = (float)double.parse(text);
					var o = model as ObservableList<ParameterCommand>;
					var c = o.get_value_for_path(new TreePath.from_string(path));
					adjuster.parameters[c.Identifier] = val;
					Model.view_changed();
				});
			spinRenderer.editing_started.connect((renderer, editable, path) =>
				{
					var o = model as ObservableList<ParameterCommand>;
					var c = o.get_value_for_path(new TreePath.from_string(path));
					var spin = editable as SpinButton;
					if(spin == null)
					{
						stderr.printf("The editor for CellRendererSpin is not a SpinButton.\n");
						return;
					}
					spin.set_digits(2 - ((int) log10f(c.Max - c.Min)));
					spin.set_increments((c.Max - c.Min) / 100, (c.Max - c.Min) / 10);
					spin.set_range(c.Min, c.Max);
					spin.set_value(adjuster.parameters[c.Identifier] ?? 0);
				});
			insert_column_with_data_func(-1, "Value", spinRenderer, (col, cell, model, iter) =>
				{
					ParameterCommand node;
					model.get(iter, 0, out node);
					var renderer = ((CellRendererSpin)cell);

					var defaultValue = 0.0F;
					if(node.Min > 0)
						defaultValue = node.Min;
					if(node.Max < 0)
						defaultValue = node.Max;
					renderer.text = (adjuster.parameters[node.Identifier] ?? defaultValue).to_string();
					renderer.adjustment = new Adjustment(0, 0, 0, 0, 0, 0);
				});
		}
	}
}
