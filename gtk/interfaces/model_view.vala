using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;

namespace Ldraw.Ui.Widgets
{
	public interface ModelView : Widget
	{
		public abstract LdrawObject Model { set; protected get;}
		public abstract ViewAngle Angle {set; get;}
	}
}
