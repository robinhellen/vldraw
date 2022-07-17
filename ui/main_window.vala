using Diva;
using Gee;
using Gtk;

using Ldraw.Ui.Widgets;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Options;
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
			set_collection_injection<IPartDragSource>(cls, "PartSourcesConstruct");
			set_collection_injection<ToolbarProvider>(cls, "ToolbarProviders");
		}

        private ComboBox m_SubModels;

        // DI injected components
        // Controls
        public ModelList ModelList {construct; private get;}
		public EditPanes View {construct; private get;}
		public ModelView PartsPreview {construct; private get;}
		public AnimatedModel EditingObject {construct; get;}

        public Collection<IPartDragSource> PartSourcesConstruct {construct {PartSources = new ArrayList<IPartDragSource>(); PartSources.add_all(value);}}
        private Gee.List<IPartDragSource> PartSources {set; get;}

        // utility objects
        public IOptions Settings {construct; private get;}
        public ILdrawFolders LdrawFolders {construct; private get;}
		public UndoStack UndoStack {construct; private get;}
        public MainMenu MainMenu {construct; private get;}
        public Collection<ToolbarProvider> ToolbarProviders {construct; private get;}
        public ColourContext ColourContext {construct; private get;}

        construct
        {
            SetUpControls();
            SetUpErrorReporting();
			PartsPreview.Angle = ViewAngle.Ortho;
			PartsPreview.set_size_request(200, 200);
            PartsPreview.DefaultColour = ColourContext.GetColourById(Settings.PreviewColourId);
            Settings.notify["PreviewColourId"].connect(() => PartsPreview.DefaultColour = ColourContext.GetColourById(Settings.PreviewColourId));

            maximize();
		}

        private void SetUpControls()
        {
            var bigVBox = new Box(Orientation.VERTICAL, 0);
            // start with a menubar as that runs across the whole window
            var accelerators = SetUpAccelerators();
            MenuBar menus = MainMenu.CreateMenus(accelerators, this);
            bigVBox.pack_start(menus, false, false);

            var toolbars = new FlowBox();
            toolbars.orientation = Orientation.HORIZONTAL;
            toolbars.homogeneous = false;
            foreach(var provider in ToolbarProviders)
            {
				toolbars.add(provider.CreateToolbar(this));
			}
            bigVBox.pack_start(toolbars, false, false);

            var notebook = ShowPartDropSources();

            Paned treePaned = new Paned(Orientation.HORIZONTAL);
            treePaned.add1(WithFrame(notebook));

            Paned modelPanes = new Paned(Orientation.VERTICAL);
            var viewDetails = new Box(Orientation.VERTICAL, 2);
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
			var box = new Box(Orientation.VERTICAL, 0);
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
				currentSignalHandler = PartSources[(int)i].CurrentChanged.connect(newObject =>
					{
						PartsPreview.Model = newObject.Object ?? new LdrawObject("");
						PartsPreview.DefaultColour = newObject.Colour ?? ColourContext.GetColourById(Settings.PreviewColourId);
					});
				currentPage = i;
				var source = PartSources[(int)currentPage];
				source.GetCurrentObject.begin((obj, res) =>
					{
						var objWithColour = source.GetCurrentObject.end(res);
						if(objWithColour != null && objWithColour.Object != null)
						{
							PartsPreview.Model = objWithColour.Object;
							PartsPreview.DefaultColour = objWithColour.Colour ?? ColourContext.GetColourById(Settings.PreviewColourId);
						}
						else
						{
							PartsPreview.Model = new LdrawObject("");
							PartsPreview.DefaultColour = ColourContext.GetColourById(Settings.PreviewColourId);
						}
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
                    EditingObject.Switch(object);
                    UndoStack.Clear();
                });

			EditingObject.notify["Model"].connect(() =>
				{
					var mpd = EditingObject.File as MultipartModel;
					ObservableList<LdrawObject> subModels;
					if(mpd == null)
					{
						subModels = new ObservableList<LdrawObject>();
						cb.visible = false;
						return;
					}
					subModels = mpd.SubModels;
					if(cb.model != mpd.SubModels)
					{
						cb.model = subModels;
						cb.visible = (subModels.size > 0);
					}
					var active_model = EditingObject.Model;
					var i = subModels.index_of(active_model);
					TreeIter iter;
					if(subModels.iter_nth_child(out iter, null, i))
						cb.set_active_iter(iter);					
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
    }
}
