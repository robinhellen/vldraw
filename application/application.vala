

namespace Ldraw.Application
{
	public class Application : Object
	{
		public ArgumentHandler ArgHandler {construct; private get;}
		public UserInterface Ui {construct; private get;}
		
		public void Run(string[] args)
		{
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
}
