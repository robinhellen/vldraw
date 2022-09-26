using Diva;
using Gee;

using Ldraw.Library;

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
	
	private class TrackerSubFileLocator: OnDemandSubFileLoader {
		public PartsTrackerFiles tracker {construct; private get;}
		
		public override async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context) {
			LdrawFileReference? result = null;
			if(context == ReferenceContext.Model) {
				var partName = reference.substring(0, reference.last_index_of("."));

				LdrawPart part;
				if(yield tracker.TryGetPart(partName, out part)) {
					result = new LdrawFileReference(part, part.MainObject);
				}
			} else if(context == ReferenceContext.Library) {
				result = yield get_library_object_reference_from_string(reference);
			}
			if(result != null) {
				result.source_desc = "Parts Tracker";
				result.ignore_duplicate = true;
			}
			return result;
		}
		
		public async LdrawFileReference? get_library_object_reference_from_string(string reference)
		{
			var dir_parts = reference.split_set("/\\");
			switch(dir_parts[0]) {
				case "s":
					var name = get_object_name(dir_parts[1]);
					LdrawSubPart sp;
					if(yield tracker.TryGetSubPart(name, out sp)) {
						return new LdrawFileReference(sp, sp.MainObject);
					}
					break;
				case "48":
					var name = get_object_name(dir_parts[1]);
					LdrawHiresPrimitive hiresPrim;
					if(yield tracker.TryGetHiresPrimitive(name, out hiresPrim)) {
						return new LdrawFileReference(hiresPrim, hiresPrim.MainObject);
					}
					break;
				case "8":
					var name = get_object_name(dir_parts[1]);
					LdrawLoresPrimitive loresPrim;
					if(yield tracker.TryGetLoresPrimitive(name, out loresPrim)) {
						return new LdrawFileReference(loresPrim, loresPrim.MainObject);
					}
					break;
				default:
					var name = get_object_name(dir_parts[0]);
					LdrawPart p;
					if(yield tracker.TryGetPart(name, out p)) {
						return new LdrawFileReference(p, p.MainObject);
					}
					LdrawPrimitive prim;
					if(yield tracker.TryGetPrimitive(name, out prim)) {
						return new LdrawFileReference(prim, prim.MainObject);
					}
					break;
			}
			return null;
		}

		private string get_object_name(string filename) {
			return filename.substring(0, filename.last_index_of("."));
		}
	}
}

