using Gtk;

using Ldraw.Ui;

namespace Ldraw.Steps
{
	private class HideToolbar : Object, ToolbarProvider
	{
		public HideModel Model {construct; private get;}
		
		public Toolbar CreateToolbar(Window dialogParent)
		{			
			Toolbar bar = new Toolbar();
			
			AddButtonFromStock(bar, "go-first", () => Model.hide_selection());
			AddButtonFromStock(bar, "go-previous", () => Model.unhide_selection());
			AddButtonFromStock(bar, "clear", () => Model.unhide_all());
			
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
