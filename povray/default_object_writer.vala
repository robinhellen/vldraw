

using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Povray
{
	private class DefaultObjectWriter : PovrayObjectWriter, Object
	{
		public void WriteDefinitionForObject(LdrawObject object, OutputStream stream)
		{
			var visitor = new PovrayVisitor(stream);
			visitor.Visit(object);
		}
	}
}
