using Diva;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Ui.Commands;
using Ldraw.Ui.Widgets;
using Ldraw.Utils;

namespace Ldraw.Ui
{
	private class MainMenu : GLib.Object
	{
		static construct
		{
			var cls = (ObjectClass)typeof(MainMenu).class_ref();
			set_collection_injection<Refactoring>(cls, "Refactorings");
			set_collection_injection<MenuItemSource>(cls, "ItemSources");
		}

		public AnimatedModel Model {construct; private get;}
        public LdrawFileLoader Loader {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
        public IDialogManager Dialogs {construct; private get;}
        public Collection<Refactoring> Refactorings {construct; private get;}
        public Collection<MenuItemSource> ItemSources {construct; private get;}

        public RecentChooserMenu RecentMenu {construct; private get;}

        construct
        {
            RecentMenu.filter = new RecentFilter();
            RecentMenu.filter.add_pattern("*.dat");
            RecentMenu.filter.add_pattern("*.ldr");
            RecentMenu.filter.add_pattern("*.mpd");
            RecentMenu.item_activated.connect(() =>
            {
				var item = RecentMenu.get_current_item();
				var file = GLib.File.new_for_uri(item.get_uri());
				LoadFile(file.get_path());
			});
		}

        public MenuBar CreateMenus(AccelGroup accelerators, Window parent)
        {
            var menus = new MenuBar();

			var fileMenu = CreateMenu(menus, "_File", accelerators, "<Ldraw>/File");

			var fileNew = AddMenuItem(fileMenu, "_New", () => Model.Load(new LdrawModel.Empty().MainObject));
			AddSeparator(fileMenu);
			AddMenuItem(fileMenu, "_Open", () => FileOpen_OnActivate(parent));
            AddSubMenu(fileMenu, "_Recent", RecentMenu);
			AddSeparator(fileMenu);
			var fileSave = AddMenuItem(fileMenu, "_Save", () => FileSave_OnActivate(parent));
            AddMenuItem(fileMenu, "Save _As", () => FileSaveAs_OnActivate(parent));
			AddSeparator(fileMenu);
			AddExtraMenuItems(fileMenu, TopMenu.File, parent);
            var fileQuit = AddMenuItem(fileMenu, "_Quit", () => main_quit());

			var editMenu = CreateMenu(menus, "_Edit", accelerators, "<Ldraw>/Edit");

            var editUndo = AddMenuItem(editMenu, "_Undo", () => UndoStack.UndoSingle());
            UndoStack.notify["HasUndoItems"].connect(() => editUndo.sensitive = UndoStack.HasUndoItems);
            editUndo.sensitive = UndoStack.HasUndoItems;
            var editRedo = AddMenuItem(editMenu, "_Redo", () => UndoStack.RedoSingle());
            UndoStack.notify["HasRedoItems"].connect(() => editRedo.sensitive = UndoStack.HasRedoItems);
            editRedo.sensitive = UndoStack.HasRedoItems;
			AddExtraMenuItems(editMenu, TopMenu.Edit, parent);

			var modelMenu = CreateMenu(menus, "_Model", accelerators);

			AddMenuItem(modelMenu, "_Properties", () => {});
			AddMenuItem(modelMenu, "Parts _List", () => ShowPartsList(parent));
			AddMenuItem(modelMenu, "_Add sub-model", () => ModelAddSubModel_OnActivate(parent));

			AddExtraMenuItems(modelMenu, TopMenu.Model, parent);

			var selectionMenu = CreateMenu(menus, "_Selection", accelerators);
			AddMenuItem(selectionMenu, "Select _All", () =>
                {
					Model.Selection.add_all(Model.Model.Nodes);
                });
			AddMenuItem(selectionMenu, "_Clear", () => Model.ClearSelection());

			AddExtraMenuItems(selectionMenu, TopMenu.Selection, parent);

			AddRefactorMenu(menus, accelerators, parent);

			AddCtrlShortcut(fileNew, "N");
			AddCtrlShortcut(fileSave, "S");
            AddCtrlShortcut(fileQuit, "Q");
            AddCtrlShortcut(editRedo, "Y");
            AddCtrlShortcut(editUndo, "Z");

            return menus;
        }

        private void AddRefactorMenu(MenuBar parent, AccelGroup accelerators, Window parentWindow)
        {
			if(Refactorings.is_empty)
				return;

			var refactorMenu = CreateMenu(parent, "Refactor", accelerators);
			foreach(var r in Refactorings)
			{
				AddMenuItem(refactorMenu, r.GetLabel(), GetExecuteAction(r, parentWindow));
			}
		}

		private void AddExtraMenuItems(Gtk.Menu parent, TopMenu menu, Window dialogParent)
		{
			foreach(var source in ItemSources)
			{
				var extras = source.GetItemsForMenu(menu, dialogParent);
				if(extras.is_empty)
					continue;

				AddSeparator(parent);
				foreach(var extra in extras)
				{
					parent.append(extra);
				}
			}
		}

		private Action GetExecuteAction(Refactoring r, Window parent)
		{
			return () =>
			{
				Command c;
				if(!r.PrepareToExecute(Model, parent, out c))
					return;

				UndoStack.ExecuteCommand(c);
			};
		}

        private Gtk.Menu CreateMenu(MenuBar parent, string title, AccelGroup accelerators, string? accelPath = null)
        {
            var menuItem = new Gtk.MenuItem.with_mnemonic(title);
            parent.append(menuItem);

            var menu = new Gtk.Menu();
            menuItem.submenu = menu;
            menu.set_accel_group(accelerators);
            if(accelPath != null)
				menu.set_accel_path(accelPath);

			return menu;
		}

		private Gtk.Menu AddSubMenu(Gtk.Menu parent, string title, Gtk.Menu? child = null)
		{
			var menuItem = new Gtk.MenuItem.with_mnemonic(title);
            parent.append(menuItem);

            child = child ?? new Gtk.Menu();
            menuItem.submenu = child;
            return child;
		}

		private delegate void Action();

		private Gtk.MenuItem AddMenuItem(Gtk.Menu menu, string title, owned Action onActivate)
		{
			var item = new Gtk.MenuItem.with_mnemonic(title);
			menu.append(item);
			item.activate.connect(() => onActivate());
			return item;
		}

		private void AddSeparator(Gtk.Menu menu)
		{
			menu.append(new SeparatorMenuItem());
		}

		private void AddCtrlShortcut(Gtk.MenuItem menu, string key)
		{
			AccelMap.add_entry(menu.get_accel_path(), Gdk.keyval_from_name(key), Gdk.ModifierType.CONTROL_MASK);
		}

        // Actions
        private void FileOpen_OnActivate(Window parent)
        {
			string fileToOpen;
			if(Dialogs.GetLoadLocation(out fileToOpen, parent))
			{
				LoadFile(fileToOpen);
			}
		}

        private void LoadFile(string fileName)
        {
			Loader.LoadModelFile.begin(fileName, ReferenceLoadStrategy.PartsOnly, true, (obj, res) =>
			{
				try
				{
					Model.Load(Loader.LoadModelFile.end(res).MainObject);
				}
				catch(ParseError e)
				{
					// TODO: print an error message
					stdout.printf(e.message);
				}

			});
		}

        private void FileSave_OnActivate(Window parent)
        {
			var file = Model.Model.File as LdrawModelFile;
            if(file.FilePath != null)
            {
                file.Save();
            }
            else
            {
                FileSaveAs_OnActivate(parent);
            }
        }

        private void FileSaveAs_OnActivate(Window parent)
        {
			string chosenFileName;
			if(Dialogs.GetSaveLocation(out chosenFileName, parent))
			{
                try
                {
					var f = Model.Model.File as LdrawModelFile;
                    f.FilePath = chosenFileName;
                    f.Save();
                    var file = File.new_for_path(chosenFileName);
                    f.FileName = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
                }
                catch(Error e)
                {
                    // TODO: print an error message
                    stdout.printf(e.message);
                    return;
                }
            }
        }

        private void ModelAddSubModel_OnActivate(Window parent)
        {
            var dialog = new Dialog.with_buttons("Model details", parent,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                "_OK", ResponseType.ACCEPT,
                "_Cancel", ResponseType.REJECT);

            var content = (Box) dialog.get_content_area();
            var grid = new Grid();
				grid.column_homogeneous = false;
				grid.row_homogeneous = false;
            grid.attach(new Label("Filename"), 0, 0);
            grid.attach(new Label("Sub-model name"), 0, 1);
            grid.attach(new Label("Description"), 0, 2);
            var filenameEntry = new Entry();
            var nameEntry = new Entry();
            var descriptionEntry = new Entry();
            grid.attach(filenameEntry, 1, 0);
            grid.attach(nameEntry, 1, 1);
            grid.attach(descriptionEntry, 1, 2);
            content.pack_start(grid);

            dialog.show_all();

            var response = dialog.run();

            var mpdModel = Model.Model.File as MultipartModel;

            var newFileName = filenameEntry.text;
            if(newFileName == null || newFileName.length == 0)
            {
                if(mpdModel == null)
                    newFileName = Model.Model.File.FileName + " (1)";
                else
                    newFileName = Model.Model.File.FileName + @" ($(mpdModel.SubModels.size))";
            }
            dialog.destroy();
            if(response != ResponseType.ACCEPT)
                return;

            if(mpdModel == null)
            {
                var subObjs = new ObservableList<LdrawObject>();
                subObjs.add(Model.Model);
                mpdModel = (MultipartModel)GLib.Object.new(typeof(MultipartModel),
                            MainObject: Model.Model,
                            SubModels: subObjs,
                            FileName: Model.Model.File.FileName,
                            FilePath: (Model.Model.File as LdrawModelFile).FilePath);

				Model.Load(mpdModel.MainObject);
            }
            var nodes = new ObservableList<LdrawNode>();
            var newObject = (LdrawObject)GLib.Object.new(
						typeof(LdrawObject),
						Nodes: nodes,
						FileName: newFileName,
						File: mpdModel
					);
            mpdModel.SubModels.add(newObject);
            Model.Load(newObject);
        }

        private void ShowPartsList(Window parent)
        {
            var dialog = new Dialog.with_buttons("Model details", parent,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                "_OK", ResponseType.ACCEPT);

            var content = (Box) dialog.get_content_area();
            var parts = new PartGroup.FromModel(Model.Model.File as LdrawModelFile);
            var list = new ObservableList<PartGroupItem>();
            list.add_all(parts.Items);
            var view = new SimpleList<PartGroupItem>.with_model(list);
            view.insert_text_column_with_data_func(-1, "Colour",
                    item => item.Colour.Name);
            view.insert_text_column_with_data_func(-1, "Part Name",
                    item => item.Part.Name);
            view.insert_text_column_with_data_func(-1, "Quantity",
                    item => item.Quantity.to_string());

            content.pack_start(WithScrolls(view));

            dialog.show_all();

            dialog.run();

            dialog.destroy();
        }
	}
}
