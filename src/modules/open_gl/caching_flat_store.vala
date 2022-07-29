using Gee;

using Ldraw.Lego;

namespace Ldraw.OpenGl
{
	private class CachingFlatStore : Object, FlatStore
	{
		Map<LdrawObject, FlattenedNodes> cache = new HashMap<LdrawObject, FlattenedNodes>(); 
		
		public new FlattenedNodes @get(LdrawObject part)
		{
			Prepare(part);
			return cache[part];
		}
		
		public void Prepare(LdrawObject part)
		{
			if(cache.has_key(part))
				return;
			var flats = FlattenedNodes.FlatForObject(part);
			cache[part] = flats;
			part.VisibleChange.connect(() => cache.unset(part));
				
		}
	}
}

