using Gtk;
using Ldraw.Lego;
using Ldraw.Utils;

namespace Ldraw.Ui.Widgets
{
	private class ModelList : GLib.Object
	{
		private TreeView m_ListView;
		private ScrolledWindow m_Widget;
		
		public AnimatedModel Model {construct; private get;}

		construct
		{
			// initialise list
			CreateList();

			m_Widget = new ScrolledWindow(null, null);
			m_Widget.add(m_ListView);
			m_ListView.model = Model.Model.Nodes as ObservableList;
			Model.notify["Model"].connect(() => m_ListView.model = Model.Model.Nodes as ObservableList);
		}

		private void CreateList()
		{
			m_ListView = new TreeView();
			// TODO: set up columns
			CellRendererText renderer = new CellRendererText();
			/*m_ListView.insert_column_with_data_func(-1, "Type", renderer, (col, cell, model, iter) =>
			{
				LdrawNode node;
				model.get(iter, 0, out node);
				((CellRendererText)cell).text = node.Type;
			});
			renderer = new CellRendererText();*/
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_data_func(-1, "Colour", renderer, (col, cell, model, iter) =>
			{
				LdrawNode node;
				model.get(iter, 0, out node);
				((CellRendererText)cell).text = (node.Colour) == null ? "" : node.Colour.Code.to_string();
			});
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_data_func(-1, "Geometry", renderer, (col, cell, model, iter) =>
			{
				LdrawNode node;
				model.get(iter, 0, out node);
				((CellRendererText)cell).text = node.Geometry();
			});
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_data_func(-1, "Name", renderer, (col, cell, model, iter) =>
			{
				LdrawNode node;
				model.get(iter, 0, out node);
				((CellRendererText)cell).text = node.Name;
			});
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_data_func(-1, "Description", renderer, (col, cell, model, iter) =>
			{
				LdrawNode node;
				model.get(iter, 0, out node);
				((CellRendererText)cell).text = node.Description;
			});

			TreeSelection selection = m_ListView.get_selection();
			selection.set_mode(SelectionMode.MULTIPLE);
		}

		public Widget Widget
		{
			get
			{
				return m_Widget;
			}
		}
	}
}
