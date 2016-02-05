
using Ldraw.Lego;

namespace Ldraw.Export
{
	public interface Exporter : Object
	{
		public abstract string Name {get;}

		public abstract string PreferredExtension {get;}
		public abstract ExportOptionSections OptionSections {get;}

		public abstract void Export(LdrawObject model, ExportOptions exportOptions);
	}
}
