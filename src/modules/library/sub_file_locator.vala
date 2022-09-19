using Diva;
using Gee;

namespace Ldraw.Lego.Library
{
	private class SubFileLocator : Object, ISubFileLocator
	{
		public IDatFileCache library {construct; private get;}

		public async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context)
		{
			if(context != ReferenceContext.Model) {
				return null;
			}
			var partName = reference.substring(0, reference.last_index_of("."));

			LdrawPart part;
			if(yield library.TryGetPart(partName, out part))
			{
				return new LdrawFileReference(part, part.MainObject);
			}
			return null;
		}
	}
}

