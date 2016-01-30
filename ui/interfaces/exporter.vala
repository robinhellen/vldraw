
using Ldraw.Lego;

namespace Ldraw.Ui.Widgets
{
	public interface Exporter : Object
	{
		public abstract string Name {get;}
		public abstract void Export(LdrawObject model, string filename);
	}
}
