using Gdk;
using Gtk;
using Ldraw.Lego;
using Ldraw.Utils;

namespace Ldraw.Ui.Widgets
{
	public class SubModelsTree
	{
		private TreeView m_Tree;
		private ScrolledWindow m_Scrolled;

		private LdrawViewPane m_Detail;
		private ObservableList<LdrawObject> models;

		public SubModelsTree()
		{
			models = new ObservableList<LdrawObject>();
			m_Tree = new TreeView.with_model(models);
			m_Tree.insert_column_with_data_func(-1, "", new CellRendererText(), (col, cell, model, iter) =>
				{
					LdrawObject node;
					model.get(iter, 0, out node);
					((CellRendererText)cell).text = node.FileName;
				});
			m_Tree.headers_visible = false;

			m_Scrolled = new ScrolledWindow(null, null);
			m_Scrolled.add(m_Tree);

			m_Tree.cursor_changed.connect(Tree_OnCursorChanged);

			// set up for drag and drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			m_Tree.enable_model_drag_source(ModifierType.BUTTON1_MASK, {LdrawDragData}, DragAction.COPY);

			//m_Tree.drag_begin.connect_after(Tree_OnDragBegin);
			m_Tree.drag_data_get.connect(Tree_OnDragDataGet);
		}

		public ScrolledWindow Widget
		{
			get
			{
				return m_Scrolled;
			}
		}

		public LdrawViewPane DetailView
		{
			set
			{
				m_Detail = value;
			}
		}

		public ObservableList<LdrawObject> Models
		{
			set
			{
				models.clear();
				models.add_all(value);
			}
		}

		private void Tree_OnCursorChanged(TreeView tree)
		{
			if(m_Detail == null)
			{
				return;
			}

			var current = Current;
			if(current == null)
				return;

			m_Detail.Model = current;
		}

		private void Tree_OnDragBegin(DragContext context)
		{
			drag_set_icon_default(context);
		}

		private void Tree_OnDragDataGet(DragContext context, SelectionData data, uint info, uint time)
		{
			string currentName = "Document::" + Current.FileName;
			data.set(Atom.intern("LdrawFile", false), 8, currentName.data);
		}

		private LdrawObject? Current
		{
			owned get
			{
				TreeIter active;
				TreeSelection sel = m_Tree.get_selection();
				TreeModel model;
				if(!sel.get_selected(out model, out active))
				{
					return null; // no selection
				}

				LdrawObject node;
				model.get(active, 0, out node);
				return node;
			}
		}
	}
}
