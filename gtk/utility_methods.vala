using Gtk;

namespace Ldraw.Ui
{
    private Widget WithScrolls(Widget widget)
    {
        ScrolledWindow win = new ScrolledWindow(null, null);
        win.add(widget);
        return win;
    }

	private Widget WithFrame(Widget widget)
	{
		Frame frame = new Frame(null);
		frame.add(widget);
		frame.shadow_type = ShadowType.IN;
		return frame;
	}
	
	private void AttachToTable(Table t, Widget w, uint x, uint y)
	{
		t.attach(w, x, x + 1, y, y + 1, AttachOptions.EXPAND, AttachOptions.EXPAND, 5, 5);
	}
}
