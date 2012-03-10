using Gtk;
using Ldraw.Lego;

namespace Ldraw.Ui.Widgets
{
	private TreeView m_Tree;
	private ScrolledWindow m_Scrolled;

	private LdrawViewPane m_Detail;

	public class PartsTree
	{
		public PartsTree()
		{

			m_Tree = new TreeView.with_model(CreateAndPopulateModel());
			m_Tree.insert_column_with_attributes(-1, "", new CellRendererText(), text: 1);
			m_Tree.insert_column_with_attributes(-1, "", new CellRendererText(), text: 2);

			m_Scrolled = new ScrolledWindow(null, null);
			m_Scrolled.add(m_Tree);

			m_Tree.cursor_changed.connect(Tree_OnCursorChanged);
		}

		public TreeModel CreateAndPopulateModel()
		{
			TreeStore store = new TreeStore(4, typeof(int), typeof(string), typeof(string), typeof(LdrawPart));


			return store;
		}

		public ScrolledWindow Widget
		{
			get
			{
				return m_Scrolled;
			}
		}

		private void Tree_OnCursorChanged(TreeView tree)
		{
			if(m_Detail == null)
			{
				return;
			}

			TreeIter active;
			TreeSelection sel = m_Tree.get_selection();
			TreeModel model;
			if(!sel.get_selected(out model, out active))
			{
				return; // no selection
			}

			Value val;
			model.get_value(active, 0, out val);
			int rowType = val.get_int();
			if(rowType == 0)
			{
				return;
			}
			if(rowType == 1)
			{
				Value partVal ;
				model.get_value(active, 3, out partVal);
				GLib.Object partObj = partVal.get_object();
				LdrawPart part = partObj as LdrawPart;
				m_Detail.Model = part;
			}
		}
	}
}
