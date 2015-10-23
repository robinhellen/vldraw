using Gtk;

namespace Ldraw.Ui
{
    public Widget WithScrolls(Widget widget)
    {
        ScrolledWindow win = new ScrolledWindow(null, null);
        win.add(widget);
        return win;
    }

	public Widget WithFrame(Widget widget)
	{
		Frame frame = new Frame(null);
		frame.add(widget);
		frame.shadow_type = ShadowType.IN;
		return frame;
	}
}
