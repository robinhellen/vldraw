using Gtk;

using Ldraw.Ui;

namespace Ldraw.Steps
{
	private class StepToolbar : Object, ToolbarProvider
	{
		public StepModel Model {construct; private get;}
		
		public Toolbar CreateToolbar(Window dialogParent)
		{			
			Toolbar bar = new Toolbar();
			
			AddButtonFromStock(bar, Stock.GOTO_FIRST, () => Model.First(), "HasPrevSteps");
			AddButtonFromStock(bar, Stock.GO_BACK, () => Model.Previous(), "HasPrevSteps");
			AddButtonFromStock(bar, Stock.GO_FORWARD, () => Model.Next(), "HasNextSteps");
			AddButtonFromStock(bar, Stock.GOTO_LAST, () => Model.Last(), "HasNextSteps");
			
			bar.insert(new SeparatorToolItem(), -1);
			
			AddButtonFromStock(bar, Stock.ADD, () => Model.AddStep());
			return bar;
		}
		
		private void AddButtonFromStock(Toolbar bar, string stockId, Action onClicked, string? enabledOnModelProperty = null)
		{
			var button = new ToolButton.from_stock(stockId);
			button.clicked.connect(() => onClicked() );
			if(enabledOnModelProperty != null)
				Model.bind_property(enabledOnModelProperty, button, "sensitive", BindingFlags.DEFAULT | BindingFlags.SYNC_CREATE);
			bar.insert(button, -1);
		}
		
		private delegate void Action();
	}
}
