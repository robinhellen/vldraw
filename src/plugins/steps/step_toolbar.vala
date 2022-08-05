using Gtk;

using Ldraw.Ui;

namespace Ldraw.Steps
{
	private class StepToolbar : Object, ToolbarProvider
	{
		public StepModel Model {construct; private get;}
		
		public Toolbar CreateToolbar(Window dialogParent, CommandExecutor executor)
		{			
			Toolbar bar = new Toolbar();
			
			AddButtonFromStock(bar, "go-first", () => Model.First(), "HasPrevSteps");
			AddButtonFromStock(bar, "go-previous", () => Model.Previous(), "HasPrevSteps");
			AddButtonFromStock(bar, "go-next", () => Model.Next(), "HasNextSteps");
			AddButtonFromStock(bar, "go-last", () => Model.Last(), "HasNextSteps");
			
			bar.insert(new SeparatorToolItem(), -1);
			
			AddButtonFromStock(bar, "list-add", () => Model.AddStep());
			return bar;
		}
		
		private void AddButtonFromStock(Toolbar bar, string stockId, Action onClicked, string? enabledOnModelProperty = null)
		{
			var icon = new Image.from_icon_name(stockId, IconSize.BUTTON);
			var button = new ToolButton(icon, null);
			button.clicked.connect(() => onClicked() );
			if(enabledOnModelProperty != null)
				Model.bind_property(enabledOnModelProperty, button, "sensitive", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
			bar.insert(button, -1);
		}
		
		private delegate void Action();
	}
}
