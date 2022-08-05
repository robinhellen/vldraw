using Gtk;

using Ldraw.Ui;

namespace Ldraw.Steps
{
	private class HideToolbar : Object, ToolbarProvider
	{
		public HideModel Model {construct; private get;}
		
		public Toolbar CreateToolbar(Window dialogParent, CommandExecutor executor)
		{			
			Toolbar bar = new Toolbar();
			
			AddButtonFromStock(bar, "view-conceal", () => Model.hide_selection());
			AddButtonFromStock(bar, "view-reveal", () => Model.unhide_selection());
			AddButtonFromStock(bar, "view-restore", () => Model.unhide_all());
			
			bar.insert(new SeparatorToolItem(), -1);
			return bar;
		}
		
		private void AddButtonFromStock(Toolbar bar, string stockId, Action onClicked)
		{
			var icon = new Image.from_icon_name(stockId, IconSize.BUTTON);
			var button = new ToolButton(icon, null);
			button.clicked.connect(() => onClicked() );
			bar.insert(button, -1);
		}
		
		private delegate void Action();
	}
}
