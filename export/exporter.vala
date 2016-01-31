
using Ldraw.Lego;

namespace Ldraw.Export
{
	public interface Exporter : Object
	{
		public abstract string Name {get;}
		public abstract void Export(LdrawObject model, string filename);
	}
}
