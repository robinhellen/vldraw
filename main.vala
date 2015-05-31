using Gee;
using Gtk;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Options;
using Ldraw.Peeron;
using Ldraw.Ui;
using Ldraw.Ui.Commands;
using Ldraw.Ui.Dialogs;
using Ldraw.Ui.DragAndDrop;
using Ldraw.Ui.Widgets;
using Diva;

namespace Ldraw
{
    public class LdrawApp
    {
        public static int main(string[] args)
        {
            var builder = new ContainerBuilder();

            // Parts library
            builder.Register<LdrawLibrary>().As<ILdrawFolders>();

            // Model file handling
            builder.Register<LdrawFileLoader>();
            builder.Register<LdrawParser>();

            // Peeron communication
            builder.Register<InventoryReader>();
            builder.Register<ColourChart>();

            // UI components
            builder.Register<PartsTree>();
            builder.Register<SetList>();            
            builder.Register<EditPanes>();
            builder.Register<LdrawEditPane>();
            builder.Register<LdrawViewPane>();

            builder.Register<LibrarySubFileLocator>().Keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.Register<OnDemandSubFileLoader>().Keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);

            builder.Register<OnDemandPartLoader>().As<IDatFileCache>();
            builder.Register<FileCachedLibrary>().As<ILibrary>();
			
			new DragAndDropModule().Load(builder);
			//builder.RegisterModule<DragAndDropModule>();
			
            builder.Register<RunningOptions>().As<IOptions>();
            builder.Register<MainWindow>()
					.IgnoreProperty("type")
					.IgnoreProperty("transient-for")
					.IgnoreProperty("attached-to");

            builder.Register<UndoStack>();
            var animatedModel = new AnimatedModel(null);
            builder.Register<AnimatedModel>(_ => animatedModel);
            builder.Register<LdrawEditorUi>().As<Ldraw.Application.UserInterface>();
            builder.Register<FileLoadingArgHandler>().As<ArgumentHandler>();
            builder.Register<GtkInitialisingArgHandler>().AsDecorator<ArgumentHandler>();
            builder.Register<Ldraw.Application.Application>();
            
            builder.Register<RecentChooserMenu>().As<RecentChooser>();
            builder.Register<RecentManager>(() => RecentManager.get_default());
            
            builder.Register<DialogManager>().As<IDialogManager>();

            var container = builder.Build();

            // load up the colours
            LdrawColour.ReadAllColours(container.Resolve<ILdrawFolders>());
			var application = container.Resolve<Ldraw.Application.Application>();
			
			application.Run(args);
			
            return 0;
        }
    }
    
    public class LdrawEditorUi : GLib.Object, Ldraw.Application.UserInterface
    {
		public Lazy<MainWindow> Window {construct; private get;}
		
		static construct
		{
			var cls = (ObjectClass)typeof(LdrawEditorUi).class_ref();
			SetLazyInjection<MainWindow>(cls, "Window");
		}
		
		public void Start()
		{			
			Window.value.destroy.connect(() => main_quit());
			Window.value.show_all();
			
			Gtk.main();
		}
	}
	
	public class GtkInitialisingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public ArgumentHandler Inner {construct; private get;}
		
		public bool HandleArgs(string[] args)
		{
            // initialize Gtk and OpenGL
            init(ref args);
            Gdk.gl_init(ref args);
            return Inner.HandleArgs(args);		
		}
	}
	
	public class FileLoadingArgHandler : GLib.Object, Ldraw.Application.ArgumentHandler
	{
		public AnimatedModel Model {construct; private get;}
		public LdrawFileLoader Loader {construct; private get;}
		
		public bool HandleArgs(string[] args)
		{
			if(args.length == 1)
			{
				Model.Model = new LdrawModel.Empty().MainObject;
				return true;
			}
				
			var filename = args[1];
            try
            {
                Model.Model = Loader.LoadModelFile(filename, ReferenceLoadStrategy.PartsOnly).MainObject;
                return true;
            }
            catch(Error e)
            {
                stdout.printf(e.message);
                Model.Model = new LdrawModel.Empty().MainObject;
                return false;
            }			
		}
	}
}
