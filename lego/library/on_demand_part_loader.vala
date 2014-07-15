using Gee;



namespace Ldraw.Lego.Library
{
	public class OnDemandPartLoader : Object, IDatFileCache
	{
		public ILdrawFolders Folders {construct; private get;}
		public LdrawParser Parser {construct; private get;}

		private Map<string, LdrawPrimitive> primitivesCache = new HashMap<string, LdrawPrimitive>();
		private Map<string, LdrawHiresPrimitive> hiresPrimitivesCache = new HashMap<string, LdrawHiresPrimitive>();
		private Map<string, LdrawPart> partsCache = new HashMap<string, LdrawPart>();
		private Map<string, LdrawSubPart> subpartsCache = new HashMap<string, LdrawSubPart>();


		public bool TryGetPrimitive(string name, out LdrawPrimitive primitive)
		{
			return TryGetFile(name, primitivesCache, Folders.PrimitivesDirectory, out primitive);
		}

		public bool TryGetHiresPrimitive(string name, out LdrawHiresPrimitive primitive)
		{
			return TryGetFile(name, hiresPrimitivesCache, Folders.HiresPrimitivesDirectory, out primitive);
		}

		public bool TryGetPart(string name, out LdrawPart part)
		{
			return TryGetFile(name, partsCache, Folders.PartsDirectory, out part);
		}

		public bool TryGetSubPart(string name, out LdrawSubPart part)
		{
			return TryGetFile(name, subpartsCache, Folders.SubPartsDirectory, out part);
		}

		private bool TryGetFile<T>(string name, Map<string, T> cache, File folder, out T result)
		{
			if(InCache(name, cache, out result))
				return true;

			if(!FolderHasFile(folder, name))
				return false;

			result = LoadFile(name, folder);
			return true;
		}

		private bool InCache<T>(string name, Map<string, T> cache, out T result)
		{
			if(cache.has_key(name))
			{
				result = cache[name];
				return true;
			}
			result = null;
			return false;
		}

		private bool FolderHasFile(File folder, string name)
		{
			var fileName = name + ".dat";
			var attempt = folder.get_child(fileName);
			return attempt.query_exists();
		}

		private T LoadFile<T>(string name, File folder)
		{
			var reader = new LdrawFileReader(Parser);

			string filename = name + ".dat";
			var nodeIter = reader.GetNodesFromFile(folder.get_child(filename), ReferenceLoadStrategy.SubPartsAndPrimitives);
			var nodes = new ArrayList<LdrawNode>();
			foreach(var node in nodeIter)
			{
				nodes.add(node);
			}
			var object = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: nodes, FileName: filename);
			return (T)Object.new(typeof(T), MainObject: object, FileName: filename);
		}
	}

	public class OnDemandSubFileLoader : ISubFileLocator, Object
	{
		public IDatFileCache Cache {construct; private get;}

		public OnDemandSubFileLoader(IDatFileCache cache)
		{
			Object(Cache: cache);
		}

		public LdrawObject? GetObjectFromReference(string reference)
			throws ParseError
		{
			var dir_parts = reference.split_set("/\\");
			switch(dir_parts[0])
			{
				case "s":
					var name = GetObjectName(dir_parts[1]);
					LdrawSubPart sp;
					if(Cache.TryGetSubPart(name, out sp))
					{
						return sp.MainObject;
					}
					break;
				case "48":
					var name = GetObjectName(dir_parts[1]);
					LdrawHiresPrimitive hiresPrim;
					if(Cache.TryGetHiresPrimitive(name, out hiresPrim))
					{
						return hiresPrim.MainObject;
					}
					break;
				default:
					var name = GetObjectName(dir_parts[0]);
					LdrawPrimitive prim;
					if(Cache.TryGetPrimitive(name, out prim))
					{
						return prim.MainObject;
					}

					LdrawPart p;
					if(Cache.TryGetPart(name, out p))
					{
						return p.MainObject;
					}
					break;
			}
			throw new ParseError.MissingFile(@"Could not locate part or primitive for $reference");
		}

		private string GetObjectName(string filename)
		{
			return filename.substring(0, filename.last_index_of("."));
		}
	}
}
