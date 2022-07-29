using Gdk;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Ui.Widgets
{
	private class PartsTree : GLib.Object, IPartDragSource
	{
		private ScrolledWindow m_Scrolled;
		private TreeView m_Tree;
		private TreeStore store;

		public ILibrary Library {construct; get;}
		public IDatFileCache DatFileCache{construct; get;}

		construct
		{
			m_Tree = new TreeView();
			m_Tree.insert_column_with_attributes(-1, "", new CellRendererText(), text: 1);
			m_Tree.insert_column_with_attributes(-1, "", new CellRendererText(), text: 2);
			m_Tree.headers_visible = false;

			m_Scrolled = new ScrolledWindow(null, null);
			m_Scrolled.add(m_Tree);

			m_Tree.cursor_changed.connect(Tree_OnCursorChanged);

			// set up for drag and drop
			TargetEntry LdrawDragData = {"LdrawFile", 0, 0};
			m_Tree.enable_model_drag_source(Gdk.ModifierType.BUTTON1_MASK, {LdrawDragData}, Gdk.DragAction.COPY);
			m_Tree.drag_data_get.connect(Tree_OnDragDataGet);
			m_Tree.drag_begin.connect_after((context) => {
				var icon = new Pixbuf(Colorspace.RGB, true, 8, 4, 4);
				icon.fill(0);
				drag_set_icon_pixbuf(context, icon, 2, 2);
			});
			
			CreateAndPopulateModel.begin(Library, (obj, res) =>
				m_Tree.model = CreateAndPopulateModel.end(res));
				
			Library.refreshed.connect(refresh);
		}
		
		private async void refresh()
		{
			store.clear();
			
			var categories = new ArrayList<string>();
			categories.add_all(yield Library.GetAllCategories());
			categories.sort();
			foreach(string category in categories)
			{
				yield PopulatePartsForCategory(store, category, Library);
			}
			yield PopulatePartsForCategory(store, null, Library); // add uncategorised items			
		}

		private async TreeModel CreateAndPopulateModel(ILibrary library)
		{
			store = new TreeStore(4, typeof(int), typeof(string), typeof(string), typeof(IPartMetadata));

			var categories = new ArrayList<string>();
			categories.add_all(yield library.GetAllCategories());
			categories.sort();
			foreach(string category in categories)
			{
				yield PopulatePartsForCategory(store, category, library);
			}
			yield PopulatePartsForCategory(store, null, library); // add uncategorised items
			return store;
		}

		private async void PopulatePartsForCategory(TreeStore store, string? category, ILibrary library)
		{
			TreeIter categoryIter;
			store.append(out categoryIter, null);
			store.set(categoryIter, 0, 0, 1, (category != null) ? category : "Uncategorised", -1);

			var parts = yield library.GetPartsByCategory(category);

			foreach(IPartMetadata part in parts)
			{
				TreeIter partIter;
				store.append(out partIter, categoryIter);
				store.set(partIter, 0, 1, 1, part.Description, 2, part.Name, 3, part, -1);
			}
		}

		private void Tree_OnCursorChanged(TreeView tree)
		{
			var current = CurrentPart;
			if(current == null)
				return;

			DatFileCache.TryGetPart.begin(current.Name, (obj, res) => 
			{
				LdrawPart part;
				
				if(DatFileCache.TryGetPart.end(res, out part))
					CurrentChanged(LdrawObjectWithColour(part.MainObject));
			});
		}

		private void Tree_OnDragDataGet(DragContext context, SelectionData data, uint info, uint time)
		{
			IPartMetadata current = CurrentPart;
			string currentName = current.Name;
			data.set(Atom.intern("LdrawFile", false), 8, currentName.data);
		}

		private IPartMetadata? CurrentPart
		{
			get
			{
				TreeIter active;
				TreeSelection sel = m_Tree.get_selection();
				TreeModel model;
				if(!sel.get_selected(out model, out active))
				{
					return null; // no selection
				}

				Value val;
				model.get_value(active, 0, out val);
				int rowType = val.get_int();

				if(rowType == 1)
				{
					Value partVal ;
					model.get_value(active, 3, out partVal);
					GLib.Object partObj = partVal.get_object();
					return partObj as IPartMetadata;
				}
				return null;
			}
		}
				
		public string GetTabName()
		{
			return "Parts";
		}
		
		public Widget GetWidget()
		{
			return m_Scrolled;
		}
		
		public async LdrawObjectWithColour? GetCurrentObject()
		{
			var current = CurrentPart;
			if(current == null)
				return LdrawObjectWithColour(null);

			LdrawPart part;
			if(yield DatFileCache.TryGetPart(current.Name, out part))
				return LdrawObjectWithColour(part.MainObject);
				
			return LdrawObjectWithColour(null);
		}
	}	
}
