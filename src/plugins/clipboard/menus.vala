using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Options;
using Ldraw.Ui;
using Ldraw.Ui.Commands;

namespace Ldraw.Ui.Clipboard
{
	private class Menus : Object, MenuItemSource
	{
		public ClipboardHandler Handler { construct; private get; }
		public AnimatedModel Model {construct; private get;}
		public IOptions Options {construct; private get;}

		public Collection<Gtk.MenuItem> GetItemsForMenu(TopMenu menu, Window dialogParent, CommandExecutor executor)
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
			cut.activate.connect(() => Cut(executor));
			copy.activate.connect(() => Copy());
			paste.activate.connect(() => Paste.begin(executor));
			AddCtrlShortcut(cut, "X");
			AddCtrlShortcut(copy, "C");
			AddCtrlShortcut(paste, "V");
			return items;
		}

		private void Cut(CommandExecutor executor)
		{
			Handler.PutSelectionOnClipboard();
			executor(new DeleteNodesCommand(Model.Model, Model.Selection));
		}

		private void Copy()
		{
			Handler.PutSelectionOnClipboard();
		}

		private async void Paste(CommandExecutor executor)
		{
			var pasted = yield Handler.GetNodesFromClipboard();
			if(pasted == null)
				return;

			foreach(var node in pasted)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;

				partNode.Move(Vector(30, 20, 30));
			}

			executor(new AddNodesCommand(Model.Model, pasted, null));
			var s = new HashSet<LdrawNode>();
			s.add_all(pasted);
			Model.Select(s, false);
		}

		private void AddCtrlShortcut(Gtk.MenuItem menu, string key)
		{
			menu.notify["parent"].connect_after(() => {
				AccelMap.add_entry(menu.get_accel_path(), Gdk.keyval_from_name(key), Gdk.ModifierType.CONTROL_MASK);
			});
		}
	}
}
