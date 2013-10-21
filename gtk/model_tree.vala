using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Ui.Widgets
{
	public class ModelTree : Window
	{
		public ModelTree(LdrawObject m)
		{
			var view = new TreeView.with_model(InitializeTreeStore(m));
			view.insert_column_with_data_func(-1, "", new CellRendererText(), (col, cell, model, iter) =>
				{
					LdrawObject obj;
					model.get(iter, 0, out obj, -1);

					((CellRendererText) cell).text = obj.FileName;
				});
			add(view);
		}

		private TreeStore InitializeTreeStore(LdrawObject m)
		{
			var store = new TreeStore(1, typeof(LdrawObject));

			TreeIter i;
			store.append(out i, null);
			BuildTree(store, i, m);


			return store;
		}

		private void BuildTree(TreeStore s, TreeIter i, LdrawObject o)
		{
			s.set(i, 0, o, -1);
			foreach(var node in o.Nodes)
			{
				var p = node as PartNode;
				if(p == null)
					continue;

				var inner = p.Contents;
				TreeIter innerIter;
				s.append(out innerIter, i);
				BuildTree(s, innerIter, inner);
			}
		}
	}
}

