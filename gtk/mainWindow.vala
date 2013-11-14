using Gtk;
using Ldraw.Ui.Widgets;
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Options;
using Ldraw.Utils;

namespace Ldraw.Ui
{
	public class MainWindow : Window, IHaveModel
	{
		private LdrawModelFile m_Model;
		private LdrawObject EditingObject {get; set;}
		private ComboBox m_SubModels;

		// controls
		EditPanes m_View;
		LdrawViewPane m_PartDetail;
		ModelList m_ModelList;
		LdrawFileLoader m_Loader;
		IOptions m_Settings;

		public MainWindow.WithModel(IOptions settings, LdrawFileLoader loader, LdrawModelFile? model = null)
		{
			EditingObject = model.MainObject;
			m_Settings = settings;
			m_Loader = loader;

			maximize();

			SetUpControls();
			File = model;
			SetUpErrorReporting();
			SetUpAccelerators();
		}

		private void SetUpControls()
		{
			var toolbarProvider = new ToolBarProvider(this, m_Settings);

			// start with a menubar as that runs across the whole window
			MenuBar menus = CreateMenus();
			VBox bigVBox = new VBox(false, 0);
			bigVBox.pack_start(menus, false, false);

			Toolbar tools = toolbarProvider.GetMovementToolbar();
			Toolbar colourTools = toolbarProvider.GetColoursToolbar();
			bigVBox.pack_start(colourTools, false, false);
			bigVBox.pack_start(tools, false, false);

			try
			{
				m_View = new EditPanes(m_Settings);
			}
			catch(OpenGl.GlError e)
			{
				stdout.printf(e.message);
			}

			// add a list of available parts on the left
			try
			{
				m_PartDetail = new LdrawViewPane.WithModel(ViewAngle.Ortho, new LdrawModel.Empty().MainObject);
			}
			catch(OpenGl.GlError e)
			{
				stdout.printf(e.message);
			}
			m_PartDetail.set_size_request(200, 200);
			m_PartDetail.DefaultColour = m_Settings.PreviewColourId;
			m_Settings.notify["PreviewColourId"].connect(() => m_PartDetail.DefaultColour = m_Settings.PreviewColourId);
			PartsTree tree = new PartsTree();
			tree.DetailView = m_PartDetail;

			Box treeDetailBox = new VBox(false, 0);
			treeDetailBox.pack_start(tree.Widget);
			treeDetailBox.pack_start(m_PartDetail, false);

			Paned treePaned = new HPaned();
			treePaned.add1(WithFrame(treeDetailBox));

			Paned modelPanes = new VPaned();
			VBox viewDetails = new VBox(false, 2);
			m_SubModels = CreateSubModelsDropDown();
			viewDetails.pack_start(m_SubModels, false, false);

			m_ModelList = new ModelList(EditingObject);
			viewDetails.pack_start(m_ModelList.Widget);

			modelPanes.add1(WithFrame(viewDetails));
			modelPanes.add2(WithFrame(m_View));

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
					EditingObject = object;
					m_View.Model = object;
					m_ModelList.Model = object;
				});
			return cb;
		}

		private void SetUpErrorReporting()
		{
			m_View.RenderingError.connect(x =>
							{
								MessageDialog msg = new MessageDialog(this, DialogFlags.DESTROY_WITH_PARENT, MessageType.ERROR, ButtonsType.CLOSE,
											"Error rendering main model: %s", x);
								msg.run();

							});
			m_Detail.RenderingError.connect(x =>
							{
								MessageDialog msg = new MessageDialog(this, DialogFlags.DESTROY_WITH_PARENT, MessageType.ERROR, ButtonsType.CLOSE,
											"Error rendering part detail: %s", x);
								msg.run();

							});
		}

		// cursor keys - move model in x,z plane
		// Home/End - move model on y axis
		private void SetUpAccelerators()
		{
			AccelGroup group = new AccelGroup();
			group.connect(Gdk.keyval_from_name("Up"), 0, 0, (group, object, keyval, modifier) => {stdout.printf("Up\n"); return false; });

			add_accel_group(group);
		}

		private MenuBar CreateMenus()
		{
			Gtk.MenuBar menus = new MenuBar();

			Gtk.MenuItem fileMenuItem = new Gtk.MenuItem.with_mnemonic("_File");
			menus.append(fileMenuItem);

			Gtk.Menu fileMenu = new Gtk.Menu();
			fileMenuItem.submenu = fileMenu;

			Gtk.MenuItem fileNew = new Gtk.MenuItem.with_mnemonic("_New");
			fileMenu.append(fileNew);
			fileNew.activate.connect(() => File = new LdrawModel.Empty());
			Gtk.MenuItem fileLoad = new Gtk.MenuItem.with_mnemonic("_Open");
			fileMenu.append(fileLoad);
			fileLoad.activate.connect(FileOpen_OnActivate);

			Gtk.MenuItem fileSave = new Gtk.MenuItem.with_mnemonic("_Save");
			fileSave.activate.connect(FileSave_OnActivate);
			fileMenu.append(fileSave);

			Gtk.MenuItem fileQuit = new Gtk.MenuItem.with_mnemonic("_Quit");
			fileMenu.append(fileQuit);
			fileQuit.activate.connect(() => main_quit());

			var modelMenuItem = new Gtk.MenuItem.with_mnemonic("_Model");
			menus.append(modelMenuItem);

			var modelMenu = new Gtk.Menu();
			modelMenuItem.submenu = modelMenu;

			var modelProperties = new Gtk.MenuItem.with_mnemonic("_Properties");
			modelMenu.append(modelProperties);

			var modelAddSubModel = new Gtk.MenuItem.with_mnemonic("_Add sub-model");
			modelAddSubModel.activate.connect(ModelAddSubModel_OnActivate);
			modelMenu.append(modelAddSubModel);

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

			string modelsFolder = "/home/robin/ldraw/MODELS";
			dialog.set_current_folder(modelsFolder);

			if(dialog.run() == ResponseType.ACCEPT)
			{
				string fileToOpen = dialog.get_filename();
				try
				{
					LdrawModelFile opened = m_Loader.LoadModelFile(fileToOpen);
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
			stderr.printf("Save button clicked.\n");
			if(File.FilePath != null)
			{
				stderr.printf("Saving file.\n");
				File.Save();
			}
			else
			{
				stderr.printf("Filename not set, calling save as.\n");
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

			string modelsFolder = "/home/robin/ldraw/models";
			dialog.set_current_folder(modelsFolder);

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
				STOCK_OK, ResponseType.ACCEPT,
				STOCK_CANCEL, ResponseType.REJECT);

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

			var newFileName = filenameEntry.text;
			stderr.printf(@"Adding submodel with filename: $newFileName.\n");
			dialog.destroy();
			if(response != ResponseType.ACCEPT)
				return;

			var mpdModel = File as MultipartModel;
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
			}
			var nodes = new ObservableList<LdrawNode>();
			var mainObject = (LdrawObject)GLib.Object.new(typeof(LdrawObject), Nodes: nodes, FileName: newFileName);
			var model = (LdrawModel)GLib.Object.new(typeof(LdrawModel), MainObject: mainObject, FileName: newFileName);
			mpdModel.SubModels.add(mainObject);
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
				m_View.Model = value.MainObject;
				m_ModelList.Model = value.MainObject;
				if(value is MultipartModel)
				{
					m_SubModels.model = ((MultipartModel)value).SubModels;
					m_SubModels.active = 0;
					m_SubModels.visible = true;
				}
				else
				{
					m_SubModels.visible = false;
				}

				var titleFileName = value.FileName ?? "untitled";

				title = @"vldraw - $titleFileName";
			}
		}

		public LdrawObject Model
		{
			get{return m_Model.MainObject;}
			protected set{}
		}
	}
}
