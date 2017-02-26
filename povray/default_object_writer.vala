

using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Povray
{
	private class DefaultObjectWriter : PovrayObjectWriter, Object
	{
		public void WriteDefinitionForObject(LdrawObject object, OutputStream stream, UnionWriter unionWriter)
		{
			var visitor = new PovrayVisitor(stream, unionWriter);
			visitor.Visit(object);
		}
	}
}
