using Gtk;
using Ldraw.Ui.Widgets;
using Ldraw.Lego;

namespace Ldraw.Ui
{
	public class MainWindow : Window
	{
		private LdrawFile m_Model;

		// controls
		LdrawViewPane m_View;
		LdrawViewPane m_PartDetail;
		ModelList m_ModelList;
		Settings m_Settings;

		public MainWindow(Settings settings)
		{
			this.WithModel(settings, null);
		}

		public MainWindow.WithModel(Settings settings, LdrawFile? model)
		{
			m_Model = model;
			m_Settings = settings;

			maximize();

			SetUpControls();
			SetUpErrorReporting();
			SetUpAccelerators();
		}

		private void SetUpControls()
		{
			// start with a menubar as that runs across the whole window
			MenuBar menus = CreateMenus();
			VBox bigVBox = new VBox(false, 0);
			bigVBox.pack_start(menus, false, false);
			Toolbar tools = CreateMovementToolbar();
			bigVBox.pack_start(tools, false, false);

			try
			{
				m_View = new LdrawEditPane.WithModel(ViewAngle.Front, m_Model, m_Settings);
			}
			catch(OpenGl.GlError e)
			{
				stdout.printf(e.message);
			}


			// add a list of available parts on the left
			try
			{
				m_PartDetail = new LdrawViewPane.WithModel(ViewAngle.Ortho, new LdrawModel.Empty());
			}
			catch(OpenGl.GlError e)
			{
				stdout.printf(e.message);
			}
			m_PartDetail.set_size_request(200, 200);

			PartsTree tree = new PartsTree();
			tree.DetailView = m_PartDetail;

			Box treeDetailBox = new VBox(false, 0);
			treeDetailBox.pack_start(tree.Widget);
			treeDetailBox.pack_start(m_PartDetail, false);

			Paned treePaned = new HPaned();
			treePaned.add1(WithFrame(treeDetailBox));

			Paned modelPanes = new VPaned();
			m_ModelList = new ModelList(m_Model);
			modelPanes.add1(WithFrame(m_ModelList.Widget));
			modelPanes.add2(WithFrame(WithScrolls(m_View)));

			treePaned.add2(modelPanes);

			bigVBox.pack_start(treePaned, true, true);
			add(bigVBox);
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
			MenuBar menus = new MenuBar();

			MenuItem fileMenuItem = new MenuItem.with_mnemonic("_File");
			menus.append(fileMenuItem);

			Menu fileMenu = new Menu();
			fileMenuItem.submenu = fileMenu;

			MenuItem fileNew = new MenuItem.with_mnemonic("_New");
			fileMenu.append(fileNew);
			fileNew.activate.connect(() => Model = new LdrawModel.Empty());
			MenuItem fileLoad = new MenuItem.with_mnemonic("_Open");
			fileMenu.append(fileLoad);
			fileLoad.activate.connect(FileOpen_OnActivate);
			MenuItem fileQuit = new MenuItem.with_mnemonic("_Quit");
			fileMenu.append(fileQuit);
			fileQuit.activate.connect(() => main_quit());

			return menus;
		}

		private Toolbar CreateMovementToolbar()
		{
			Toolbar bar = new Toolbar();
			ToolButton upButton = new ToolButton(new Image.from_file("/home/robin/projects/ldraw_vala/icons/minusY.xpm"), "up");
			ToolButton downButton = new ToolButton(new Image.from_file("/home/robin/projects/ldraw_vala/icons/plusY.xpm"), "up");
			ToolButton leftButton = new ToolButton(new Image.from_file("/home/robin/projects/ldraw_vala/icons/minusX.xpm"), "up");
			ToolButton rightButton = new ToolButton(new Image.from_file("/home/robin/projects/ldraw_vala/icons/plusX.xpm"), "up");
			ToolButton inButton = new ToolButton(new Image.from_file("/home/robin/projects/ldraw_vala/icons/minusZ.xpm"), "up");
			ToolButton outButton = new ToolButton(new Image.from_file("/home/robin/projects/ldraw_vala/icons/plusZ.xpm"), "up");

			bar.insert(upButton, -1);
			bar.insert(downButton, -1);
			bar.insert(leftButton, -1);
			bar.insert(rightButton, -1);
			bar.insert(inButton, -1);
			bar.insert(outButton, -1);

			return bar;
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

			string modelsFolder = "/home/robin/ldraw/MODELS";
			dialog.set_current_folder(modelsFolder);

			if(dialog.run() == ResponseType.ACCEPT)
			{
				string fileToOpen = dialog.get_filename();
				if(fileToOpen.has_suffix(".mpd"))
				{
					// TODO: Implement MPD files
				}
				else
				{
					File file = File.new_for_path(fileToOpen);
					try
					{
						LdrawModel opened = new LdrawModel.FromFile(file);
						Model = opened;
					}
					catch(ParseError e)
					{
						// TODO: print an error message
						dialog.close();
						return;
					}
				}
			}
			dialog.close();
		}

		private LdrawFile Model
		{
			set
			{
				m_Model = value;
				m_View.Model = value;
				m_ModelList.Model = value;
			}
		}
	}
}
