using Gtk;

using Ldraw.Lego;
using Ldraw.Options;
using Ldraw.Ui.DragAndDrop;

namespace Ldraw.Ui.Widgets
{
	private class FourPaned : Paned
	{
		private Paned left;
		private Paned right;
		private bool left_exposed = false;
		private bool right_exposed = false;

		construct
		{
			orientation = Orientation.HORIZONTAL;
			left = new Paned(Orientation.VERTICAL);
			right = new Paned(Orientation.VERTICAL);

			add1(left);
			add2(right);
			
			left.draw.connect_after(e => {{left_exposed = true; return false;}});
			right.draw.connect_after(e => {{right_exposed = true; return false;}});
				
			right.notify["position"].connect(() => update_sizes(right, left));
			left.notify["position"].connect(() => update_sizes(left, right));
		}

		public void add_top_left(Widget w)
		{
			left.pack1(w, true, true);
		}

		public void add_bottom_left(Widget w)
		{
			left.pack2(w, true, true);
		}

		public void add_top_right(Widget w)
		{
			right.pack1(w, true, true);
		}

		public void add_bottom_right(Widget w)
		{
			right.pack2(w, true, true);
		}
		
		public override void map()
		{
			left.map.connect_after(_ => {	
				Allocation a;
				left.get_allocation(out a);			
				left.position = a.height / 2;
			});
			right.map.connect_after(_ => {
				Allocation a;
				right.get_allocation(out a);
				right.position = a.height / 2;
			});
			base.map();
			Allocation a;
			get_allocation(out a);
			position = a.width / 2;
		}
				
		bool in_update_size = false;
		
		private void update_sizes(Paned notified, Paned update)
		{
			if(in_update_size)
				return;
			if(!(right_exposed && left_exposed))
				return;
				
			in_update_size = true;
			update.set_position(notified.position);
			in_update_size = false;
		}
	}

	private class EditPanes : FourPaned
	{
		public ModelEditor TopLeft {construct; private get;}
		public ModelEditor BottomLeft {construct; private get;}
		public ModelEditor TopRight {construct; private get;}
		public ModelEditor BottomRight {construct; private get;}
		
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
	}
}
