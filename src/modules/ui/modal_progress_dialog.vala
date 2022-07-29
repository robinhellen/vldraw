using Gee;
using Gtk;

using Ldraw.Application;

namespace Ldraw.Ui
{
	private class ModalProgressDialog : Object, ProgressReporter
	{
		private Dialog dialog = null;
		private Collection<string> active_tasks = new ArrayList<string>();
		private Map<string, ProgressBar> widgets = new HashMap<string, ProgressBar>();
		
		public MainWindow parent {private get; construct;}
		
		public void start_task(string task_name)
		{
			if(dialog == null)
				dialog = create_progress_dialog();
				
			var bar = new ProgressBar();
			widgets[task_name] = bar;
			bar.text = task_name;
			bar.show_text = true;
			
			var ca = dialog.get_content_area();
			ca.pack_start(bar);
			dialog.show_all();
				
			active_tasks.add(task_name);
		}
		
		public void task_progress(string task_name, double progress)
		{
			widgets[task_name].set_fraction(progress);
		}
		
		public void end_task(string task_name)
		{
			active_tasks.remove(task_name);
			if(active_tasks.size == 0)
			{
				dialog.destroy();
				dialog = null;
			}
		}
		
		public void task_error(string task_name, string error_message)
		{
		}
		
		private Dialog create_progress_dialog()
		{
			var dialog = new Dialog();
			dialog.set_title("Operation Progress");
			dialog.set_transient_for(parent);
			dialog.set_modal(true);
			
			return dialog;
		}
	}
}
