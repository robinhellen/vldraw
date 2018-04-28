

using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.Povray
{
	private class DefaultObjectWriter : PovrayObjectWriter, Object
	{
		public async void WriteDefinitionForObject(LdrawObject object, OutputStream stream, UnionWriter unionWriter)
		{
			var visitor = new PovrayVisitor(stream, unionWriter);
			yield visitor.Visit(object);
		}
	}
}
