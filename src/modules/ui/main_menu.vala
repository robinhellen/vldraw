using Diva;
using Gee;
using Gtk;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Ui.Commands;
using Ldraw.Ui.Dialogs;
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
			set_lazy_injection<ProgressReporter>(cls, "reporter");
		}

		public AnimatedModel Model {construct; private get;}
        public LdrawFileLoader Loader {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
        public IDialogManager Dialogs {construct; private get;}
        public Collection<Refactoring> Refactorings {construct; private get;}
        public Collection<MenuItemSource> ItemSources {construct; private get;}
        public ILibrary library {construct; private get;}
        public Lazy<ProgressReporter> reporter {construct; private get;}

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
			RecentMenu.sort_type = RecentSortType.MRU;
			RecentMenu.show_numbers = false;
			RecentMenu.show_icons = false;
		}

        public MenuBar CreateMenus(AccelGroup accelerators, Window parent)
        {
            var menus = new MenuBar();

			var fileMenu = CreateMenu(menus, "_File", accelerators, "<Ldraw>/File");

			var fileNew = AddMenuItem(fileMenu, "_New", () => {
				Model.Load(new LdrawModel.Empty());
				UndoStack.mark_save();
			});
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

			AddMenuItem(modelMenu, "_Parts _List", () => ShowPartsList(parent));
			AddMenuItem(modelMenu, "_Add sub-model", () => ModelAddSubModel_OnActivate(parent));
			var model_details = AddMenuItem(modelMenu, "_Details", () => edit_model_details(parent));
			var model_submodels = AddMenuItem(modelMenu, "_Sub-models", () => show_submodels(parent));

			AddExtraMenuItems(modelMenu, TopMenu.Model, parent);

			var selectionMenu = CreateMenu(menus, "_Selection", accelerators);
			AddMenuItem(selectionMenu, "Select _All", () =>
                {
					Model.Selection.add_all(Model.Model.Nodes);
                });
			AddMenuItem(selectionMenu, "_Clear", () => Model.ClearSelection());

			AddExtraMenuItems(selectionMenu, TopMenu.Selection, parent);

			AddRefactorMenu(menus, accelerators, parent);
			
			var library_menu = CreateMenu(menus, "_Library", accelerators);
			AddMenuItem(library_menu, "_Refresh", () => library.refresh.begin(reporter.value));

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
				var extras = source.GetItemsForMenu(menu, dialogParent, cmd => UndoStack.ExecuteCommand(cmd));
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
			if(Dialogs.GetLoadLocation(out fileToOpen, parent, RecentMenu.get_recent_manager()))
			{
				LoadFile(fileToOpen);
				UndoStack.mark_save();
			}
		}

        private void LoadFile(string fileName)
        {
			Loader.LoadModelFile.begin(fileName, ReferenceContext.Model, true, (obj, res) =>
			{
				try
				{
					Model.Load(Loader.LoadModelFile.end(res));
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
			var file = Model.File as LdrawModelFile;
            if(file.FilePath != null)
            {
                file.Save();
				UndoStack.mark_save();
            }
            else
            {
                FileSaveAs_OnActivate(parent);
            }
        }

        private void FileSaveAs_OnActivate(Window parent)
        {
			string chosenFileName;
			if(Dialogs.GetSaveLocation(out chosenFileName, parent, RecentMenu.get_recent_manager()))
			{
                try
                {
					var f = Model.File as LdrawModelFile;
                    f.FilePath = chosenFileName;
                    f.Save();
                    var file = File.new_for_path(chosenFileName);
                    f.FileName = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
                    UndoStack.mark_save();
                    Model.Model.FileName = file.get_basename();
                }
                catch(Error e)
                {
                    // TODO: print an error message
                    stdout.printf(e.message);
                    return;
                }
            }
        }
        
        private void edit_model_details(Window parent) {
			var dialog = new ModelDetails.from_model(parent, Model.Model);
			if(!dialog.run())
				return;
				
			Model.Model.FileName = dialog.filename;
			Model.Model.Description = dialog.description;
		}
		
		private void show_submodels(Window parent) {
			var mpd = Model.File as MultipartModel;
			if(mpd == null) return;
			var dialog = new SubModels(parent, mpd);
			dialog.run();
		}

        private void ModelAddSubModel_OnActivate(Window parent)
        {
            var mpdModel = Model.File as MultipartModel;
            var base_filename = Model.File.FileName[0:-4];
            string new_submodel_filename;
            if(mpdModel == null)
            {
				new_submodel_filename = base_filename + "s1.ldr";
			}
			else
			{
				new_submodel_filename = base_filename + @"s$(mpdModel.SubModels.size).ldr"; // TODO check for duplicates
			}
			
			var dialog = new ModelDetails(parent);
            dialog.filename = new_submodel_filename;

            if(!dialog.run())
				return;


            var new_filename = dialog.filename;

            if(mpdModel == null)
            {
                var subObjs = new ObservableList<LdrawObject>();
                subObjs.add(Model.Model);
                var new_path = ((LdrawModelFile)(Model.File)).FilePath;
                if(new_path == null) new_path = "";
                if(new_path.has_suffix(".ldr") || new_path.has_suffix(".dat"))
					new_path = new_path[:-4];
				new_path += ".mpd";
                mpdModel = (MultipartModel)GLib.Object.new(typeof(MultipartModel),
                            MainObject: Model.Model,
                            SubModels: subObjs,
                            FileName: Model.File.FileName,
                            FilePath: new_path);
				Model.Load(mpdModel);
            }
            var nodes = new ObservableList<LdrawNode>();
            var newObject = (LdrawObject)GLib.Object.new(
						typeof(LdrawObject),
						Nodes: nodes,
						FileName: new_filename,
						Description: dialog.description
					);
            mpdModel.SubModels.add(newObject);
            Model.Switch(newObject);
        }

        private void ShowPartsList(Window parent)
        {
            var dialog = new Dialog.with_buttons("Model details", parent,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                "_OK", ResponseType.ACCEPT);

            var content = (Box) dialog.get_content_area();
            var parts = new PartGroup.FromModel(Model.File as LdrawModelFile);
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
