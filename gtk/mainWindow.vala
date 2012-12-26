using Gtk;
using Ldraw.Ui.Widgets;
using Ldraw.Lego;
using Ldraw.Options;

namespace Ldraw.Ui
{
	public class MainWindow : Window, IHaveModel
	{
		private LdrawModelFile m_Model;
		private LdrawObject EditingObject {get; set;}
		private ComboBox m_SubModels;

		// controls
		LdrawViewPane m_View;
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
			bigVBox.pack_start(tools, false, false);
			Toolbar colourTools = toolbarProvider.GetColoursToolbar();
			bigVBox.pack_start(colourTools, false, false);
			bigVBox.pack_start(toolbarProvider.GetGridToolbar(), false, false);

			try
			{
				m_View = new LdrawEditPane(ViewAngle.Front, m_Settings);
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
			modelPanes.add2(WithFrame(WithScrolls(m_View)));

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

			return menus;
		}

		private Widget WithFrame(Widget widget)
		{
			Frame frame = new Frame(null);
			frame.add(widget);
			frame.shadow_type = ShadowType.IN;
			return frame;
		}

		private Widget WithScrolls(Widget widget)
		{
			ScrolledWindow win = new ScrolledWindow(null, null);
			win.add(widget);
			return win;
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
			if(File.FilePath != null)
				File.Save();
			FileSaveAs_OnActivate();
		}

		private void FileSaveAs_OnActivate()
		{
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
			}
		}

		public LdrawObject Model
		{
			get{return m_Model.MainObject;}
			protected set{}
		}
	}
}
