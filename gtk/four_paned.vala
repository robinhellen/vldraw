using Gtk;

using Ldraw.Lego;
using Ldraw.Options;

namespace Ldraw.Ui.Widgets
{
	public class FourPaned : HPaned
	{
		private Paned left;
		private Paned right;

		public FourPaned()
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

	public class EditPanes : FourPaned
	{
		private LdrawEditPane top_left;
		private LdrawEditPane bottom_left;
		private LdrawEditPane top_right;
		private LdrawEditPane bottom_right;

		public EditPanes(IOptions settings)
			throws OpenGl.GlError
		{
			base();

			top_left 	= new LdrawEditPane(ViewAngle.Front, settings);
			bottom_left = new LdrawEditPane(ViewAngle.Top, settings);

			top_right 	 = new LdrawEditPane(ViewAngle.Right, settings);
			bottom_right = new LdrawEditPane(ViewAngle.Ortho, settings);

			add_top_left(WithScrolls(top_left));
			add_bottom_left(WithScrolls(bottom_left));
			add_top_right(WithScrolls(top_right));
			add_bottom_right(WithScrolls(bottom_right));

			top_left.RenderingError.connect(x => RenderingError(x));
			bottom_left.RenderingError.connect(x => RenderingError(x));

			top_right.RenderingError.connect(x => RenderingError(x));
			bottom_right.RenderingError.connect(x => RenderingError(x));
		}

		public LdrawObject Model
		{
			set
			{
				top_left.Model = value;
				bottom_left.Model = value;
				top_right.Model = value;
				bottom_right.Model = value;
			}
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
