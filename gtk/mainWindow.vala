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
using Ldraw.Utils.Di;

namespace Ldraw.Ui
{
    public class MainWindow : Window
    {
        private LdrawModelFile m_Model;
        public AnimatedModel EditingObject {get; set;}
        private ComboBox m_SubModels;

        // controls
        ModelList m_ModelList;
        ParameterValues parameters;

        // trees
        PartsTree parts;
        SubModelsTree subModels;
        DocumentObjectLocator documentLocator;

        public IOptions Settings {construct; private get;}
        public LdrawFileLoader Loader {construct; private get;}
        public ILdrawFolders LdrawFolders {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
		public EditPanes View {construct; private get;}
		public LdrawViewPane PartsPreview {construct; private get;}
		public LdrawViewPane SubModelsPreview {construct; private get;}

        public MainWindow.WithModel(LdrawModelFile? model = null,
                                    DependencyResolutionContext context)
            throws OpenGl.GlError
        {
            var folders = context.Resolve<ILdrawFolders>();
            var settings = context.Resolve<IOptions>();
            var loader = context.Resolve<LdrawFileLoader>();
            var undoStack = context.Resolve<UndoStack>();
            var view = context.Resolve<EditPanes>();
            var preview1 = context.Resolve<LdrawViewPane>();
            var preview2 = context.Resolve<LdrawViewPane>();
            GLib.Object(
				Loader: loader, 
				Settings: settings, 
				LdrawFolders: folders, 
				UndoStack: undoStack,
				View: view,
				PartsPreview: preview1,
				SubModelsPreview : preview2
			);

            EditingObject = new AnimatedModel(model.MainObject);

            maximize();

            SetUpControls(context);
            File = model;
            SetUpErrorReporting();
        }
        
        construct
        {
			PartsPreview.Angle = ViewAngle.Ortho;
			PartsPreview.set_size_request(200, 200);
            PartsPreview.DefaultColour = Settings.PreviewColourId;
            Settings.notify["PreviewColourId"].connect(() => PartsPreview.DefaultColour = Settings.PreviewColourId);
			
			SubModelsPreview.Angle = ViewAngle.Ortho;
			SubModelsPreview.set_size_request(200, 200);
            SubModelsPreview.DefaultColour = Settings.PreviewColourId;
            Settings.notify["PreviewColourId"].connect(() => SubModelsPreview.DefaultColour = Settings.PreviewColourId);
		}

        private void SetUpControls(DependencyResolutionContext context)
            throws OpenGl.GlError
        {
            var toolbarProvider = new ToolBarProvider(this, Settings, UndoStack);

            // start with a menubar as that runs across the whole window
            var accelerators = SetUpAccelerators();
            MenuBar menus = CreateMenus(accelerators);
            VBox bigVBox = new VBox(false, 0);
            bigVBox.pack_start(menus, false, false);

            Toolbar tools = toolbarProvider.GetMovementToolbar();
            Toolbar colourTools = toolbarProvider.GetColoursToolbar(this);
            bigVBox.pack_start(colourTools, false, false);
            bigVBox.pack_start(tools, false, false);

            documentLocator = new DocumentObjectLocator();
            documentLocator.Objects = Gee.List.empty<LdrawObject>();			

            var notebook = new Notebook();
            // add a list of available parts on the left
            parts = context.Resolve<PartsTree>();
            var treeDetailBox = new VBox(false, 0);

            parts.DetailView = PartsPreview;

            treeDetailBox.pack_start(parts.Widget);
            treeDetailBox.pack_start(PartsPreview, false);
            notebook.append_page(treeDetailBox, new Label("Parts"));


            var subModelsBox = new VBox(false, 0);

            subModels = new SubModelsTree();
            subModels.DetailView = SubModelsPreview;

            subModelsBox.pack_start(subModels.Widget);
            subModelsBox.pack_start(SubModelsPreview, false);
            notebook.append_page(subModelsBox, new Label("Multipart"));

            parameters = new ParameterValues(EditingObject);
            bind_property("EditingObject", parameters, "Model");
            notebook.append_page(parameters, new Label("Parameters"));

            var setList = context.Resolve<SetList>();
            bind_property("File", setList, "ModelFile");
            notebook.append_page(setList, new Label("Sets"));

            Paned treePaned = new HPaned();
            treePaned.add1(WithFrame(notebook));

            Paned modelPanes = new VPaned();
            VBox viewDetails = new VBox(false, 2);
            m_SubModels = CreateSubModelsDropDown();
            viewDetails.pack_start(m_SubModels, false, false);

            m_ModelList = new ModelList(EditingObject.Model);
            viewDetails.pack_start(m_ModelList.Widget);

            modelPanes.add1(WithFrame(viewDetails));
            modelPanes.add2(WithFrame(View));

            treePaned.add2(modelPanes);

            bigVBox.pack_start(treePaned, true, true);
            add(bigVBox);
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
                    EditingObject = new AnimatedModel(object);
                    View.Model = EditingObject;
                    m_ModelList.Model = object;
                    UndoStack.Clear();
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
            SubModelsPreview.RenderingError.connect(x =>
                            {
                                MessageDialog msg = new MessageDialog(this, DialogFlags.DESTROY_WITH_PARENT, MessageType.ERROR, ButtonsType.CLOSE,
                                            "Error rendering part detail: %s", x);
                                msg.run();

                            });
            PartsPreview.RenderingError.connect(x =>
                            {
                                MessageDialog msg = new MessageDialog(this, DialogFlags.DESTROY_WITH_PARENT, MessageType.ERROR, ButtonsType.CLOSE,
                                            "Error rendering part detail: %s", x);
                                msg.run();

                            });
        }

        // cursor keys - move model in x,z plane
        // Home/End - move model on y axis
        private AccelGroup SetUpAccelerators()
        {
            AccelGroup group = new AccelGroup();
            //group.connect(Gdk.keyval_from_name("Up"), 0, 0, (group, object, keyval, modifier) => {stdout.printf("Up\n"); return false; });

            add_accel_group(group);
            return group;
        }

        private MenuBar CreateMenus(AccelGroup accelerators)
        {
            Gtk.MenuBar menus = new MenuBar();

            Gtk.MenuItem fileMenuItem = new Gtk.MenuItem.with_mnemonic("_File");
            menus.append(fileMenuItem);

            Gtk.Menu fileMenu = new Gtk.Menu();
            fileMenuItem.submenu = fileMenu;
            fileMenu.set_accel_group(accelerators);
            fileMenu.set_accel_path("<Ldraw>/File");

            Gtk.MenuItem fileNew = new Gtk.MenuItem.with_mnemonic("_New");
            fileMenu.append(fileNew);
            fileNew.activate.connect(() => File = new LdrawModel.Empty());
            AccelMap.add_entry(fileNew.get_accel_path(), Gdk.keyval_from_name("N"), Gdk.ModifierType.CONTROL_MASK);

            Gtk.MenuItem fileLoad = new Gtk.MenuItem.with_mnemonic("_Open");
            fileMenu.append(fileLoad);
            fileLoad.activate.connect(FileOpen_OnActivate);

            Gtk.MenuItem fileSave = new Gtk.MenuItem.with_mnemonic("_Save");
            fileSave.activate.connect(FileSave_OnActivate);
            fileMenu.append(fileSave);
            AccelMap.add_entry(fileSave.get_accel_path(), Gdk.keyval_from_name("S"), Gdk.ModifierType.CONTROL_MASK);

            Gtk.MenuItem fileSaveAs = new Gtk.MenuItem.with_mnemonic("Save _As");
            fileSaveAs.activate.connect(FileSaveAs_OnActivate);
            fileMenu.append(fileSaveAs);

            Gtk.MenuItem fileQuit = new Gtk.MenuItem.with_mnemonic("_Quit");
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
                    foreach(var node in EditingObject.Model.Nodes)
                    {
                        node.Selected = true;
                    }
                });
            selectionMenu.append(selectAll);

            var clearSelection = new Gtk.MenuItem.with_mnemonic("_Clear");
            clearSelection.activate.connect(() => EditingObject.Model.ClearSelection());
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

        private Widget WithFrame(Widget widget)
        {
            Frame frame = new Frame(null);
            frame.add(widget);
            frame.shadow_type = ShadowType.IN;
            return frame;
        }

        private void FileOpen_OnActivate()
        {
            FileChooserDialog dialog = new FileChooserDialog("Open File", this, FileChooserAction.OPEN
                                                , Stock.CANCEL, ResponseType.CANCEL
                                                , Stock.OPEN, ResponseType.ACCEPT);

            FileFilter filter = new FileFilter();
            filter.add_custom(FileFilterFlags.FILENAME, info => (info.filename.has_suffix(".ldr") || info.filename.has_suffix(".dat") || info.filename.has_suffix(".mpd")));

            dialog.set_current_folder_file(LdrawFolders.ModelsDirectory);

            if(dialog.run() == ResponseType.ACCEPT)
            {
                string fileToOpen = dialog.get_filename();
                try
                {
                    LdrawModelFile opened = Loader.LoadModelFile(fileToOpen, ReferenceLoadStrategy.PartsOnly);
                    File = opened;
                }
                catch(ParseError e)
                {
                    // TODO: print an error message
                    stdout.printf(e.message);
                    dialog.close();
                    return;
                }
            }
            dialog.close();
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
            FileChooserDialog dialog = new FileChooserDialog("Save File As", this, FileChooserAction.SAVE
                                                , Stock.CANCEL, ResponseType.CANCEL
                                                , Stock.SAVE, ResponseType.ACCEPT);

            FileFilter filter = new FileFilter();
            filter.add_custom(FileFilterFlags.FILENAME, info => (info.filename.has_suffix(".ldr") || info.filename.has_suffix(".dat") || info.filename.has_suffix(".mpd")));

            dialog.set_current_folder_file(LdrawFolders.ModelsDirectory);

            if(dialog.run() == ResponseType.ACCEPT)
            {
                string saveTo = dialog.get_filename();
                try
                {
                    File.FilePath = saveTo;
                    File.Save();
                    var file = GLib.File.new_for_path(saveTo);
                    File.FileName = file.query_info(FileAttribute.STANDARD_NAME, FileQueryInfoFlags.NONE).get_name();
                    title = @"vldraw - $(File.FileName)";
                }
                catch(Error e)
                {
                    // TODO: print an error message
                    stdout.printf(e.message);
                    dialog.close();
                    return;
                }
            }
            dialog.close();
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
            EditingObject = new AnimatedModel(newObject);
        }

        private void AttachToTable(Table t, Widget w, uint x, uint y)
        {
            t.attach(w, x, x + 1, y, y + 1, AttachOptions.EXPAND, AttachOptions.EXPAND, 5, 5);
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
                m_ModelList.Model = value.MainObject;
                var mpd = value as MultipartModel;
                if(mpd != null)
                {
                    m_SubModels.model = mpd.SubModels;
                    m_SubModels.active = 0;
                    m_SubModels.visible = true;
                    EditingObject = new AnimatedModel(mpd.MainObject);
                    subModels.Models = mpd.SubModels;
                    documentLocator.Objects = mpd.SubModels;
                }
                else
                {
                    m_SubModels.visible = false;
                    EditingObject = new AnimatedModel(value.MainObject);
                    subModels.Models = new ObservableList<LdrawObject>();
                    documentLocator.Objects = Gee.List.empty<LdrawObject>();
                }
                View.Model = EditingObject;

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

    public class AnimatedModel : GLib.Object
    {
        public AnimatedModel(LdrawObject model)
        {
            var map = new HashMap<string, float?>();
            GLib.Object(Model: model, CurrentParameters: map);
        }

        public LdrawObject Model {get; construct;}
        public Map<string, float?> CurrentParameters {get; construct; }

        public void UpdateParameter(string Identifier, float value)
        {
            CurrentParameters[Identifier] = value;
            ParametersUpdated();
        }

        public signal void ParametersUpdated();
    }

    private Widget WithScrolls(Widget widget)
    {
        ScrolledWindow win = new ScrolledWindow(null, null);
        win.add(widget);
        return win;
    }
}
