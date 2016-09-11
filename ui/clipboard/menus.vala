using Gee;
using Gtk;

using Ldraw.Ui;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui.Clipboard
{
	private class Menus : Object, MenuItemSource
	{
		public ClipboardHandler Handler { construct; private get; }
		public AnimatedModel Model {construct; private get;}
		public UndoStack UndoStack {construct; private get;}

		public Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent)
		{
			if(menu != TopMenu.Edit)
				return Collection.empty<Gtk.MenuItem>();

			var items = new ArrayList<Gtk.MenuItem>();
			var copy = new Gtk.MenuItem.with_mnemonic("_Copy");
			var cut = new Gtk.MenuItem.with_mnemonic("Cu_t");
			var paste = new Gtk.MenuItem.with_mnemonic("_Paste");
			items.add(cut);
			items.add(copy);
			items.add(paste);
			cut.sensitive = copy.sensitive = !Model.Selection.is_empty;
			Model.view_changed.connect(() => cut.sensitive = copy.sensitive = !Model.Selection.is_empty);
			cut.activate.connect(() => Cut());
			copy.activate.connect(() => Copy());
			paste.activate.connect(() => Paste.begin());
			return items;
		}

		private void Cut()
		{
			Handler.PutSelectionOnClipboard();
			UndoStack.ExecuteCommand(new DeleteNodesCommand(Model.Model, Model.Selection));
		}

		private void Copy()
		{
			Handler.PutSelectionOnClipboard();
		}

		private async void Paste()
		{
			var pasted = yield Handler.GetNodesFromClipboard();
			if(pasted == null)
				return;

			UndoStack.ExecuteCommand(new AddNodesCommand(Model.Model, pasted, null));
		}
	}
}
