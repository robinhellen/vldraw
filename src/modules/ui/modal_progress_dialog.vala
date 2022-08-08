using Diva;
using Gee;
using Gtk;

using Ldraw.Application;

namespace Ldraw.Ui
{
	private class ModalProgressDialog : Object, ProgressReporter
	{
		static construct {
			var cls = (ObjectClass)typeof(ModalProgressDialog).class_ref();
			set_lazy_injection<MainWindow>(cls, "parent");
		}
		
		private Dialog dialog = null;
		private Collection<string> active_tasks = new ArrayList<string>();
		private Map<string, ProgressBar> widgets = new HashMap<string, ProgressBar>();
		
		public Lazy<MainWindow> parent {private get; construct;}
		
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
			var widget = widgets[task_name];
			widget.destroy();
			widgets.unset(task_name);
			active_tasks.remove(task_name);
			if(active_tasks.size == 0)
			{
				dialog.destroy();
				dialog = null;
			}
		}
		
		public void task_error(string task_name, string error_message)
		{
			end_task(task_name);
		}
		
		private Dialog create_progress_dialog()
		{
			var dialog = new Dialog();
			dialog.set_title("Operation Progress");
			dialog.set_transient_for(parent.value);
			dialog.set_modal(true);
			
			return dialog;
		}
	}
}
