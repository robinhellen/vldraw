using Gtk;
using Ldraw.Lego;

namespace Ldraw.Ui.Widgets
{
	public class ModelList : GLib.Object
	{
		private LdrawFile m_Model;
		private TreeView m_ListView;
		private ScrolledWindow m_Widget;

		public ModelList(LdrawFile model)
		{
			m_Model = model;
			m_Model.VisibleChange.connect(() => UpdateList());
			// initialise list
			CreateList();

			m_Widget = new ScrolledWindow(null, null);
			m_Widget.add(m_ListView);
		}

		private void CreateList()
		{
			ListStore model = new ListStore(6,
					typeof(LdrawNode),  // the node
					typeof(string), 	// type
					typeof(int),		// colourId (for now)
					typeof(string),		// geometry
					typeof(string),		// name
					typeof(string)		// description
			);
			// TODO: populate model
			ListBuilder builder = new ListBuilder(model);
			m_Model.BuildFromFile(builder);

			m_ListView = new TreeView.with_model(model);
			// TODO: set up columns
			CellRendererText renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_attributes(-1, "Type", renderer, text: 1);
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_attributes(-1, "Colour", renderer, text: 2);
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_attributes(-1, "Geometry", renderer, text: 3);
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_attributes(-1, "Name", renderer, text: 4);
			renderer = new CellRendererText();
			renderer.size_points = 6.0;
			m_ListView.insert_column_with_attributes(-1, "Description", renderer, text: 5);

			//TreeSelection selection = m_ListView.get_selection();
			//selection.set_mode(SelectionMode.SINGLE);
			m_ListView.cursor_changed.connect(List_OnCursorChanged);
		}

		private void UpdateList()
		{
			ListStore newModel = new ListStore(6,
					typeof(LdrawNode),  // the node
					typeof(string), 	// type
					typeof(int),		// colourId (for now)
					typeof(string),		// geometry
					typeof(string),		// name
					typeof(string)		// description
			);
			// TODO: populate model
			ListBuilder builder = new ListBuilder(newModel);
			m_Model.BuildFromFile(builder);

			m_ListView.set_model(newModel);
		}

		public LdrawFile Model
		{
			set
			{
				m_Model = value;
				UpdateList();
				m_Model.ClearSelection();
				m_Model.VisibleChange.connect(() => UpdateList());
			}
		}

		public Widget Widget
		{
			get
			{
				return m_Widget;
			}
		}

		private void List_OnCursorChanged(TreeView tree)
		{
			stdout.printf("selection changed.\n");
			TreeSelection selection = tree.get_selection();
			TreeModel model;
			TreeIter iter;
			m_Model.ClearSelection();
			if(selection.get_selected(out model, out iter))
			{
				Value val;
				model.get_value(iter, 0, out val);
				GLib.Object valObj = val.get_object();
				LdrawNode node = valObj as LdrawNode;
				node.Selected = true;
			}
		}

		private class ListBuilder : LdrawBuilder
		{
			private ListStore m_Store;

			public ListBuilder(ListStore store)
			{
				m_Store = store;
			}

			public override void BuildNode(LdrawNode node)
			{
				TreeIter iter;
				m_Store.append(out iter);
				m_Store.set(iter,
					0, node,
					1, "",
					2, node.ColourId,
					3, node.Geometry,
					4, node.Name,
					5, node.Description);
			}
		}
	}
}
