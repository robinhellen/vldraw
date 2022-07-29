using Diva;
using Gee;

namespace Ldraw.Application
{
	public class Application : Object
	{
		static construct
		{
			var cls = (ObjectClass)typeof(Application).class_ref();
			set_collection_injection<InitializeOnStartup>(cls, "StartupInitializers");
		}
		
		public ArgumentHandler ArgHandler {construct; private get;}
		public UserInterface Ui {construct; private get;}
		public Collection<InitializeOnStartup> StartupInitializers {construct; private get;}
		
		public void Run(string[] args)
		{
			var loop = new MainLoop();
			run_initializers.begin(() => loop.quit());
			loop.run();
			
			if(!ArgHandler.HandleArgs(args))
				return;
			
			Ui.Start();
		}
		
		private async void run_initializers()
		{
			var reporter = new ConsoleReporter();
			foreach(var init in StartupInitializers)
			{
				var result = yield init.Initialize(reporter);
				if(!result)
				{
					assert_not_reached();
				}
			}			
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
		public abstract async bool Initialize(ProgressReporter reporter);
	}
	
	public interface ProgressReporter : Object
	{
		public abstract void start_task(string task_name);
		public abstract void task_progress(string task_name, double progress);
		public abstract void end_task(string task_name);
		public abstract void task_error(string task_name, string error_message);
	}
	
	private class ConsoleReporter : Object, ProgressReporter
	{
		private const double step = 0.1;
		public Map<string, double?> tasks = new HashMap<string, double?>();
		
		public void start_task(string task_name) {
			stdout.printf(@"starting $task_name\n");
			tasks[task_name] = step;
		}
		
		public void task_progress(string task_name, double progress) {
			if(!tasks.has_key(task_name)) {
				stdout.printf(@"Progress on unknown task: $task_name\n");
				return;
			}
			double next = tasks[task_name];
			while(progress > next) {
				stdout.printf(@"$task_name: $((int)(next * 100))%\n");
				next += step;
			}
			tasks[task_name] = next;
		}
		
		public void end_task(string task_name){		
			stdout.printf(@"finished $task_name\n");
			tasks.unset(task_name);
		}
		
		public void task_error(string task_name, string error_message) {
			log("vldraw", LogLevelFlags.LEVEL_ERROR, error_message);
		}
	}
}
