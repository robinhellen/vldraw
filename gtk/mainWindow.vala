using Diva;
using Gee;
using Gtk;

using Ldraw.Ui.Widgets;
using Ldraw.Export;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Options;
using Ldraw.Peeron;
using Ldraw.Ui.Commands;
using Ldraw.Ui.DragAndDrop;
using Ldraw.Utils;

namespace Ldraw.Ui
{
    private class MainWindow : Window
    {
		static construct
		{
			var cls = (ObjectClass)typeof(MainWindow).class_ref();
			SetCollectionInjection<IPartDragSource>(cls, "PartSourcesConstruct");
		}
		
        private LdrawModelFile m_Model;
        private ComboBox m_SubModels;

        // controls
        public ModelList ModelList {construct; private get;}
        ParameterValues parameters;

        // trees
        public IOptions Settings {construct; private get;}
        public LdrawFileLoader Loader {construct; private get;}
        public ILdrawFolders LdrawFolders {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
		public EditPanes View {construct; private get;}
		public LdrawViewPane PartsPreview {construct; private get;}
		public AnimatedModel EditingObject {construct; get;}
		public SetList SetList {construct; get;}
        //public DocumentObjectLocator DocumentLocator {construct; get;}
        public RecentChooserMenu RecentMenu {construct; private get;}
        public IDialogManager Dialogs {construct; private get;}
        
        public Collection<IPartDragSource> PartSourcesConstruct {construct {PartSources = new ArrayList<IPartDragSource>(); PartSources.add_all(value);}}
        private Gee.List<IPartDragSource> PartSources {set; get;}
        
        construct
        {
            SetUpControls();
            SetUpErrorReporting();
			PartsPreview.Angle = ViewAngle.Ortho;
			PartsPreview.set_size_request(200, 200);
            PartsPreview.DefaultColour = LdrawColour.GetColour(Settings.PreviewColourId);
            Settings.notify["PreviewColourId"].connect(() => PartsPreview.DefaultColour = LdrawColour.GetColour(Settings.PreviewColourId));
                        
            bind_property("File", SetList, "ModelFile");
            
            maximize();
		}

        private void SetUpControls()
            throws OpenGl.GlError
        {
            var toolbarProvider = new ToolBarProvider(EditingObject, Settings, UndoStack);

            // start with a menubar as that runs across the whole window
            var accelerators = SetUpAccelerators();
            MenuBar menus = CreateMenus(accelerators);
            VBox bigVBox = new VBox(false, 0);
            bigVBox.pack_start(menus, false, false);

            Toolbar tools = toolbarProvider.GetMovementToolbar();
            Toolbar colourTools = toolbarProvider.GetColoursToolbar(this);
            bigVBox.pack_start(colourTools, false, false);
            bigVBox.pack_start(tools, false, false);

            /*parameters = new ParameterValues(EditingObject);
            bind_property("EditingObject", parameters, "Model");
            notebook.append_page(parameters, new Label("Parameters"));*/
            
            var notebook = ShowPartDropSources();

            Paned treePaned = new HPaned();
            treePaned.add1(WithFrame(notebook));

            Paned modelPanes = new VPaned();
            VBox viewDetails = new VBox(false, 2);
            m_SubModels = CreateSubModelsDropDown();
            viewDetails.pack_start(m_SubModels, false, false);

            viewDetails.pack_start(ModelList.Widget);

            modelPanes.add1(WithFrame(viewDetails));
            modelPanes.add2(WithFrame(View));

            treePaned.add2(modelPanes);

            bigVBox.pack_start(treePaned, true, true);
            add(bigVBox);
        }
        
        public Widget ShowPartDropSources()
        {
			var box = new VBox(false, 0);
			var notebook = new Notebook();
			box.pack_start(notebook);
			box.pack_start(PartsPreview, false);
			
			ulong currentSignalHandler = 0;
			uint currentPage = 0;
			
			foreach(var source in PartSources)
			{
				notebook.append_page(source.GetWidget(), new Label(source.GetTabName()));
			}
			
			notebook.switch_page.connect((_, i) => 
			{
				if(currentSignalHandler != 0)
					PartSources[(int)currentPage].disconnect(currentSignalHandler);
				currentSignalHandler = PartSources[(int)i].CurrentChanged.connect(newObject => PartsPreview.Model = newObject);
				currentPage = i;
				var source = PartSources[(int)currentPage];
				source.GetCurrentObject.begin((obj, res) => 
					{
						PartsPreview.Model = source.GetCurrentObject.end(res) ?? new LdrawObject("", null);
					});
			});
			return box;
		}

        private ComboBox CreateSubModelsDropDown()
        {
            var cb = new ComboBox();
            var filenameRenderer = new CellRendererText();
            cb.pack_start(filenameRenderer, true);
            cb.set_cell_data_func(filenameRenderer, (layout, renderer, model, iter) =>
                {
                    LdrawObject object;
                    model.get(iter, 0, out object, -1);
                    ((CellRendererText)renderer).text = object.FileName;
                });
            cb.changed.connect(cb =>
                {
                    var tModel = cb.get_model();
                    TreeIter tIter;
                    cb.get_active_iter(out tIter);
                    LdrawObject object;
                    tModel.get(tIter, 0, out object, -1);
                    EditingObject.Load(object);
                    UndoStack.Clear();
                });
                
			EditingObject.notify["Model"].connect(() => 
				{
					var mpd = EditingObject.Model.File as MultipartModel;
					ObservableList<LdrawObject> subModels;
					if(mpd == null)
					{
						subModels = new ObservableList<LdrawObject>();
					}
					else
					{
						subModels = mpd.SubModels;
					}
					cb.model = subModels;
					cb.visible = (subModels.size > 0);
				});
            return cb;
        }

        private void SetUpErrorReporting()
        {
            View.RenderingError.connect(x =>
                            {
                                MessageDialog msg = new MessageDialog(this, DialogFlags.DESTROY_WITH_PARENT, MessageType.ERROR, ButtonsType.CLOSE,
                                            "Error rendering main model: %s", x);
                                msg.run();

                            });
            PartsPreview.RenderingError.connect(x =>
                            {
                                MessageDialog msg = new MessageDialog(this, DialogFlags.DESTROY_WITH_PARENT, MessageType.ERROR, ButtonsType.CLOSE,
                                            "Error rendering part detail: %s", x);
                                msg.run();

                            });
        }

        private AccelGroup SetUpAccelerators()
        {
            AccelGroup group = new AccelGroup();
            
            add_accel_group(group);
            return group;
        }

        private MenuBar CreateMenus(AccelGroup accelerators)
        {
            var menus = new MenuBar();

            var fileMenuItem = new Gtk.MenuItem.with_mnemonic("_File");
            menus.append(fileMenuItem);

            var fileMenu = new Gtk.Menu();
            fileMenuItem.submenu = fileMenu;
            fileMenu.set_accel_group(accelerators);
            fileMenu.set_accel_path("<Ldraw>/File");

            var fileNew = new Gtk.MenuItem.with_mnemonic("_New");
            fileMenu.append(fileNew);
            fileNew.activate.connect(() => File = new LdrawModel.Empty());
            AccelMap.add_entry(fileNew.get_accel_path(), Gdk.keyval_from_name("N"), Gdk.ModifierType.CONTROL_MASK);

            var fileLoad = new Gtk.MenuItem.with_mnemonic("_Open");
            fileMenu.append(fileLoad);
            fileLoad.activate.connect(FileOpen_OnActivate);
            
            var fileRecent = new Gtk.MenuItem.with_mnemonic("_Recent");
            fileMenu.append(fileRecent);
            fileRecent.set_submenu(RecentMenu);
            RecentMenu.filter = new RecentFilter();
            RecentMenu.filter.add_pattern("*.dat");
            RecentMenu.filter.add_pattern("*.ldr");
            RecentMenu.filter.add_pattern("*.mpd");
            RecentMenu.item_activated.connect(() => 
            {
				var item = RecentMenu.get_current_item();
				var file = GLib.File.new_for_uri(item.get_uri());
				LoadFile(file.get_path());
				}
				);

            var fileSave = new Gtk.MenuItem.with_mnemonic("_Save");
            fileSave.activate.connect(FileSave_OnActivate);
            fileMenu.append(fileSave);
            AccelMap.add_entry(fileSave.get_accel_path(), Gdk.keyval_from_name("S"), Gdk.ModifierType.CONTROL_MASK);

            var fileSaveAs = new Gtk.MenuItem.with_mnemonic("Save _As");
            fileSaveAs.activate.connect(FileSaveAs_OnActivate);
            fileMenu.append(fileSaveAs);

            var fileQuit = new Gtk.MenuItem.with_mnemonic("_Quit");
            fileMenu.append(fileQuit);
            fileQuit.activate.connect(() => main_quit());
            AccelMap.add_entry(fileQuit.get_accel_path(), Gdk.keyval_from_name("Q"), Gdk.ModifierType.CONTROL_MASK);

            var editMenuItem = new Gtk.MenuItem.with_mnemonic("_Edit");
            menus.append(editMenuItem);

            var editMenu = new Gtk.Menu();
            editMenuItem.submenu = editMenu;
            editMenu.set_accel_group(accelerators);
            editMenu.set_accel_path("<Ldraw>/Edit");

            var editUndo = new Gtk.MenuItem.with_mnemonic("_Undo");
            editUndo.activate.connect(() => UndoStack.UndoSingle());
            UndoStack.notify["HasUndoItems"].connect(() => editUndo.sensitive = UndoStack.HasUndoItems);
            editUndo.sensitive = UndoStack.HasUndoItems;
            editMenu.append(editUndo);
            AccelMap.add_entry(editUndo.get_accel_path(), Gdk.keyval_from_name("Z"), Gdk.ModifierType.CONTROL_MASK);

            var editRedo = new Gtk.MenuItem.with_mnemonic("_Redo");
            editRedo.activate.connect(() => UndoStack.RedoSingle());
            UndoStack.notify["HasRedoItems"].connect(() => editRedo.sensitive = UndoStack.HasRedoItems);
            editRedo.sensitive = UndoStack.HasRedoItems;
            editMenu.append(editRedo);
            AccelMap.add_entry(editRedo.get_accel_path(), Gdk.keyval_from_name("Y"), Gdk.ModifierType.CONTROL_MASK);

            var modelMenuItem = new Gtk.MenuItem.with_mnemonic("_Model");
            menus.append(modelMenuItem);

            var modelMenu = new Gtk.Menu();
            modelMenuItem.submenu = modelMenu;

            var modelProperties = new Gtk.MenuItem.with_mnemonic("_Properties");
            modelMenu.append(modelProperties);

            var modelPartsList = new Gtk.MenuItem.with_mnemonic("Parts _List");
            modelPartsList.activate.connect(ShowPartsList);
            modelMenu.append(modelPartsList);

            var modelAddSubModel = new Gtk.MenuItem.with_mnemonic("_Add sub-model");
            modelAddSubModel.activate.connect(ModelAddSubModel_OnActivate);
            modelMenu.append(modelAddSubModel);

            var modelParameters = new Gtk.MenuItem.with_mnemonic("_Parameters");
            modelParameters.activate.connect(() =>
            {
                var dlg = new ParametersDialog(EditingObject.Model, this);
                dlg.Run();
            });
            modelMenu.append(modelParameters);

            var modelExport = new Gtk.MenuItem.with_mnemonic("_Export");
            modelMenu.append(modelExport);

            var modelExportMenu = new Gtk.Menu();
            modelExport.submenu = modelExportMenu;

            var exportJpg = new Gtk.MenuItem.with_mnemonic("Image file (_Jpeg)");
            exportJpg.activate.connect(() => ExportJpg());
            modelExportMenu.append(exportJpg);

            var exportPov = new Gtk.MenuItem.with_mnemonic("Povray");
            exportPov.activate.connect(() => ExportPov());
            modelExportMenu.append(exportPov);

            var selectionMenuItem = new Gtk.MenuItem.with_mnemonic("_Selection");
            menus.append(selectionMenuItem);

            var selectionMenu = new Gtk.Menu();
            selectionMenuItem.submenu = selectionMenu;

            var selectAll = new Gtk.MenuItem.with_mnemonic("Select _All");
            selectAll.activate.connect(() =>
                {
					EditingObject.Selection.add_all(EditingObject.Model.Nodes);
                });
            selectionMenu.append(selectAll);

            var clearSelection = new Gtk.MenuItem.with_mnemonic("_Clear");
            clearSelection.activate.connect(() => EditingObject.ClearSelection());
            selectionMenu.append(clearSelection);

            var selectionAnimation = new Gtk.MenuItem.with_mnemonic("_Animation");
            selectionAnimation.activate.connect(() =>
                {
                    var dlg = new AnimationDialog(EditingObject, this);
                    dlg.Run();
                });
            selectionMenu.append(selectionAnimation);


            return menus;
        }

        private void FileOpen_OnActivate()
        {
			string fileToOpen;
			if(Dialogs.GetLoadLocation(out fileToOpen, this))
			{
				LoadFile(fileToOpen);
			}
		}
        
        private void LoadFile(string fileName)
        {
			Loader.LoadModelFile.begin(fileName, ReferenceLoadStrategy.PartsOnly, (obj, res) =>
			{
				try
				{
					File = Loader.LoadModelFile.end(res);
				}
				catch(ParseError e)
				{
					// TODO: print an error message
					stdout.printf(e.message);
				}
				
			});
		}

        private void FileSave_OnActivate()
        {
            if(File.FilePath != null)
            {
                File.Save();
            }
            else
            {
                FileSaveAs_OnActivate();
            }
        }

        private void FileSaveAs_OnActivate()
        {
			string chosenFileName;
			if(Dialogs.GetSaveLocation(out chosenFileName, this))
			{
                try
                {
                    File.FilePath = chosenFileName;
                    File.Save();
                    var file = GLib.File.new_for_path(chosenFileName);
                    File.FileName = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
                    title = @"vldraw - $(File.FileName)";
                }
                catch(Error e)
                {
                    // TODO: print an error message
                    stdout.printf(e.message);
                    return;
                }
            }
        }

        private void ModelAddSubModel_OnActivate()
        {
            var dialog = new Dialog.with_buttons("Model details", this,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                Stock.OK, ResponseType.ACCEPT,
                Stock.CANCEL, ResponseType.REJECT);

            var content = (Box) dialog.get_content_area();
            var table = new Table(3, 2, false);
            AttachToTable(table, new Label("Filename"), 0, 0);
            AttachToTable(table, new Label("Sub-model name"), 0, 1);
            AttachToTable(table, new Label("Description"), 0, 2);
            var filenameEntry = new Entry();
            var nameEntry = new Entry();
            var descriptionEntry = new Entry();
            AttachToTable(table, filenameEntry, 1, 0);
            AttachToTable(table, nameEntry, 1, 1);
            AttachToTable(table, descriptionEntry, 1, 2);
            content.pack_start(table);

            dialog.show_all();

            var response = dialog.run();

            var mpdModel = File as MultipartModel;

            var newFileName = filenameEntry.text;
            if(newFileName == null || newFileName.length == 0)
            {
                if(mpdModel == null)
                    newFileName = File.FileName + " (1)";
                else
                    newFileName = File.FileName + @" ($(mpdModel.SubModels.size))";
            }
            dialog.destroy();
            if(response != ResponseType.ACCEPT)
                return;

            if(mpdModel == null)
            {
                var subObjs = new ObservableList<LdrawObject>();
                subObjs.add(File.MainObject);
                mpdModel = (MultipartModel)GLib.Object.new(typeof(MultipartModel),
                            MainObject: File.MainObject,
                            SubModels: subObjs,
                            FileName: File.FileName,
                            FilePath: File.FilePath);

                File = mpdModel;
                File.MainObject.File = mpdModel;
            }
            var nodes = new ObservableList<LdrawNode>();
            var newObject = (LdrawObject)GLib.Object.new(
						typeof(LdrawObject), 
						Nodes: nodes, 
						FileName: newFileName,
						File: mpdModel
					);
            mpdModel.SubModels.add(newObject);
            EditingObject.Load(newObject);
        }

        protected LdrawModelFile File
        {
            public get
            {
                return m_Model;
            }
            set
            {
                m_Model = value;
				EditingObject.Load(value.MainObject);

                var titleFileName = value.FileName ?? "untitled";

                title = @"vldraw - $titleFileName";
                UndoStack.Clear();
            }
        }

        private void ExportJpg()
        {
            var exporter = new Exporter();
            exporter.ExportJpg(File.MainObject, File.FileName + ".jpg");
        }

        private void ExportPov()
        {
            var exporter = new Exporter();
            exporter.ExportPovray(File.MainObject, File.FileName + ".pov");
        }

        private void ShowPartsList()
        {
            var dialog = new Dialog.with_buttons("Model details", this,
                DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
                Stock.OK, ResponseType.ACCEPT);

            var content = (Box) dialog.get_content_area();
            var parts = new PartGroup.FromModel(File);
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

        public LdrawObject Model
        {
            get{return EditingObject.Model;}
            protected set{}
        }
    }
    
    public interface IDialogManager : GLib.Object
    {		
		public abstract bool GetSaveLocation(out string location, Window parent);
		public abstract bool GetLoadLocation(out string location, Window parent);
	}
	
	public interface IPartDragSource : GLib.Object
	{
		public abstract string GetTabName();
		public abstract Widget GetWidget();
		public async abstract LdrawObject? GetCurrentObject();
		public signal void CurrentChanged(LdrawObject newCurrent);
	}
}
