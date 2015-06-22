using Gtk;

using Ldraw.Lego;
using Ldraw.Options;
using Ldraw.Ui.DragAndDrop;

namespace Ldraw.Ui.Widgets
{
	private class FourPaned : HPaned
	{
		private Paned left;
		private Paned right;

		construct
		{
			left = new VPaned();
			right = new VPaned();

			add1(left);
			add2(right);

			left.notify["position"].connect(() => right.set_position(left.position));
			right.notify["position"].connect(() => left.set_position(right.position));
		}

		public void add_top_left(Widget w)
		{
			left.add1(w);
		}

		public void add_bottom_left(Widget w)
		{
			left.add2(w);
		}

		public void add_top_right(Widget w)
		{
			right.add1(w);
		}

		public void add_bottom_right(Widget w)
		{
			right.add2(w);
		}
	}

	private class EditPanes : FourPaned
	{
		public LdrawEditPane TopLeft {construct; private get;}
		public LdrawEditPane BottomLeft {construct; private get;}
		public LdrawEditPane TopRight {construct; private get;}
		public LdrawEditPane BottomRight {construct; private get;}
		
		construct
		{
			add_top_left(WithScrolls(TopLeft));
			add_bottom_left(WithScrolls(BottomLeft));
			add_top_right(WithScrolls(TopRight));
			add_bottom_right(WithScrolls(BottomRight));

			TopLeft.RenderingError.connect(x => RenderingError(x));
			BottomLeft.RenderingError.connect(x => RenderingError(x));

			TopRight.RenderingError.connect(x => RenderingError(x));
			BottomRight.RenderingError.connect(x => RenderingError(x));
			
			TopLeft.Angle = ViewAngle.Front;
			TopRight.Angle = ViewAngle.Right;
			
			BottomLeft.Angle = ViewAngle.Top;
			BottomRight.Angle = ViewAngle.Ortho;
		}

		public signal void RenderingError(string description);

		private Widget WithScrolls(Widget widget)
		{
			ScrolledWindow win = new ScrolledWindow(null, null);
			win.add(widget);
			return win;
		}
	}
}
