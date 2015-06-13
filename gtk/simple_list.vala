using Gtk;

using Ldraw.Utils;

namespace Ldraw.Ui
{
	private class SimpleList<T> : TreeView
	{
		public SimpleList()
		{}

		public SimpleList.with_model(ObservableList<T> model)
		{
			GLib.Object(model: model);
		}

		public int insert_text_column_with_data_func(int position, string title, owned TextDataFunc<T> datafunc)
		{
			return insert_column_with_data_func(position, title, new CellRendererText(),
					(col, cell, model, iter) =>
					{
						T item;
						model.get(iter, 0, out item);
						((CellRendererText)cell).text = datafunc(item);
					});
		}
	}

	public delegate string TextDataFunc<T>(T obj);
}
