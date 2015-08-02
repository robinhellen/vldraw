using Diva;
using Gee;

namespace Ldraw.Application
{
	public class Application : Object
	{
		static construct
		{
			var cls = (ObjectClass)typeof(Application).class_ref();
			SetCollectionInjection<InitializeOnStartup>(cls, "StartupInitializers");
		}
		
		public ArgumentHandler ArgHandler {construct; private get;}
		public UserInterface Ui {construct; private get;}
		public Collection<InitializeOnStartup> StartupInitializers {construct; private get;}
		
		public void Run(string[] args)
		{
			foreach(var init in StartupInitializers)
			{
				init.Initialize();
			}
			
			if(!ArgHandler.HandleArgs(args))
				return;
			
			Ui.Start();
		}
	}
	
	public interface ArgumentHandler : Object
	{
		public abstract bool HandleArgs(string[] args);
	}
	
	public interface UserInterface : Object
	{
		public abstract void Start();
	}
	
	public interface InitializeOnStartup : Object
	{
		public abstract void Initialize();
	}
}
