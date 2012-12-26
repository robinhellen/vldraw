using Gtk;
using Ldraw.Lego;
using Ldraw.Utils;

namespace Ldraw.Ui.Widgets
{
	public class ModelList : GLib.Object
	{
		private LdrawObject m_Model;
		private TreeView m_ListView;
		private ScrolledWindow m_Widget;

		public ModelList(LdrawObject model)
		{
			m_Model = model;
			//m_Model.VisibleChange.connect(Model_OnVisibleChange);
			// initialise list
			CreateList();

			m_Widget = new ScrolledWindow(null, null);
			m_Widget.add(m_ListView);
		}

		private void CreateList()
		{
			TreeModel model = m_Model.Nodes as ObservableList;

			m_ListView = new TreeView.with_model(model);
			// TODO: set up columns
			CellRendererText renderer = new CellRendererText();
			/*renderer.size_points = 6.0;
			m_ListView.insert_column_with_data_func(-1, "Type", renderer, (col, cell, model, iter) =>
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
				((CellRendererText)cell).text = node.ColourId.to_string();
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
			selection.changed.connect_after(List_OnCursorChanged);
		}

		public LdrawObject Model
		{
			set
			{
				m_Model = value;
				m_ListView.model = m_Model.Nodes as ObservableList;
				m_Model.ClearSelection();
				//m_Model.VisibleChange.connect(Model_OnVisibleChange);
			}
		}

		public Widget Widget
		{
			get
			{
				return m_Widget;
			}
		}

		private void List_OnCursorChanged(TreeSelection selection)
		{
			m_Model.ClearSelection();
			selection.selected_foreach((model, path, iter) =>
					{
						Value val;
						model.get_value(iter, 0, out val);
						GLib.Object valObj = val.get_object();
						LdrawNode node = valObj as LdrawNode;
						node.Selected = true;
					});
		}
	}
}
