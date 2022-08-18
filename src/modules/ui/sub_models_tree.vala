using Gdk;
using Gtk;
using Ldraw.Lego;
using Ldraw.Utils;

namespace Ldraw.Ui.Widgets
{
	private class SubModelsTree : GLib.Object, IPartDragSource
	{
		private TreeView m_Tree;
		private ScrolledWindow m_Scrolled;
		
		public AnimatedModel Model {construct; private get;}

		construct
		{
			Model.notify["Model"].connect(ModelChanged);
			var models = new ObservableList<LdrawObject>();
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
			TargetEntry LdrawDragData = {"LdrawFile", TargetFlags.SAME_APP, 0};
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

		private async void Tree_OnCursorChanged(TreeView tree)
		{
			var current = yield GetCurrentObject();
			if(current == null)
				return;
			
			CurrentChanged(current);
		}

		private void Tree_OnDragDataGet(DragContext context, SelectionData data, uint info, uint time)
		{
			string currentName = "Document::" + (GetCurrentObjectSync()).FileName;
			data.set(Atom.intern("LdrawFile", false), 8, currentName.data);
		}
		
		private void ModelChanged()		
		{
			var mpdFile = Model.File as MultipartModel;
			if(mpdFile == null) {
				m_Tree.model = new ObservableList<LdrawObject>();
			}
			else {
				m_Tree.model = mpdFile.SubModels;
			}
		}

		public async LdrawObjectWithColour? GetCurrentObject()
		{
			return LdrawObjectWithColour(GetCurrentObjectSync(), null);
		}
		
		public LdrawObject? GetCurrentObjectSync()
		{
			TreeIter active;
			TreeSelection sel = m_Tree.get_selection();
			TreeModel model;
			if(!sel.get_selected(out model, out active))
			{
				return null; // no selection
			}

			weak LdrawObject node;
			model.get(active, 0, out node);
			return node;
		}
				
		public string GetTabName()
		{
			return "Multipart";
		}
		
		public Widget GetWidget()
		{
			return m_Scrolled;
		}
	}
}
