using Gdk;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Maths;
using Ldraw.Povray;
using Ldraw.Ui;

namespace Ldraw.Export
{	
	public class Exporter : Object
	{
		public void ExportPovray(LdrawObject model, string filename)
		{
			var visitor = new PovrayVisitor(filename);

			visitor.Visit(model);

			visitor.Finalise(model);
			visitor.Finish();
		}
	}
}
