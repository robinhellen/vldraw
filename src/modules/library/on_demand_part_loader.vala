using Diva;
using Gee;

namespace Ldraw.Lego.Library
{
	public class OnDemandPartLoader : Object, IDatFileCache
	{
		static construct
		{
			var cls = (ObjectClass)typeof(OnDemandPartLoader).class_ref();
			set_lazy_injection<OnDemandSubFileLoader>(cls, "locator");
		}
		
		public ILdrawFolders Folders {construct; protected get;}
		public LdrawParser Parser {construct; protected get;}
		public FileReaderFactory ReaderFactory {construct; protected get;}
		public Lazy<OnDemandSubFileLoader> locator {construct; protected get;}
		public ColourContext ColourContext {construct; protected get;}

		private Map<string, LdrawPrimitive> primitivesCache = new HashMap<string, LdrawPrimitive>();
		private Map<string, LdrawHiresPrimitive> hiresPrimitivesCache = new HashMap<string, LdrawHiresPrimitive>();
		private Map<string, LdrawLoresPrimitive> loresPrimitivesCache = new HashMap<string, LdrawLoresPrimitive>();
		private Map<string, LdrawPart> partsCache = new HashMap<string, LdrawPart>();
		private Map<string, LdrawSubPart> subpartsCache = new HashMap<string, LdrawSubPart>();

		public async bool TryGetPrimitive(string name, out LdrawPrimitive primitive)
		{
			return yield TryGetFile(name, primitivesCache, Folders.PrimitivesDirectory, out primitive);
		}

		public async bool TryGetLoresPrimitive(string name, out LdrawLoresPrimitive primitive)
		{
			return yield TryGetFile(name, loresPrimitivesCache, Folders.LoresPrimitivesDirectory, out primitive);
		}

		public async bool TryGetHiresPrimitive(string name, out LdrawHiresPrimitive primitive)
		{
			return yield TryGetFile(name, hiresPrimitivesCache, Folders.HiresPrimitivesDirectory, out primitive);
		}

		public virtual async bool TryGetPart(string name, out LdrawPart part)
		{
			return yield TryGetFile(name, partsCache, Folders.PartsDirectory, out part);
		}

		public async bool TryGetSubPart(string name, out LdrawSubPart part)
		{
			return yield TryGetFile(name, subpartsCache, Folders.SubPartsDirectory, out part);
		}

		public async bool TryGetFile<T>(string name, Map<string, T> cache, File folder, out T result)
		{
			if(InCache(name, cache, out result))
			{
				return true;
			}

			if(!FolderHasFile(folder, name))
				return false;
			
			try
			{
				result = yield LoadFile(name, folder);
			}
			catch(ParseError e)
			{
				warning(@"Failed to load part '$name' from '$(folder.get_path())': $(e.message)");
				return false;
			}
			cache[name] = result;
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

		private async T LoadFile<T>(string name, File folder)
			throws ParseError
		{
			string filename = name + ".dat";
			var reader = ReaderFactory.GetReader(folder.get_child(filename), ReferenceContext.Library);

			var nodes = new ArrayList<LdrawNode>();
			
			LdrawNode node;
			var locators = new ArrayList<ISubFileLocator>();
			locators.add(locator.value);
			while((node = yield reader.next(locators, ColourContext)) != null)
			{
				nodes.add(node);
			}
			var object = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: nodes, FileName: filename);
			var file = (T)Object.new(typeof(T), MainObject: object, FileName: filename);
			return file;
		}
	}

	public class OnDemandSubFileLoader : ISubFileLocator, Object
	{
		public OnDemandPartLoader Cache {construct; private get;}

		public virtual async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context)
		{
			if(context != ReferenceContext.Library)
				return null;
			var dir_parts = reference.split_set("/\\");
			switch(dir_parts[0])
			{
				case "s":
					var name = GetObjectName(dir_parts[1]);
					LdrawSubPart sp;
					if(yield Cache.TryGetSubPart(name, out sp))
					{
						return new LdrawFileReference(sp, sp.MainObject);
					}
					break;
				case "48":
					var name = GetObjectName(dir_parts[1]);
					LdrawHiresPrimitive hiresPrim;
					if(yield Cache.TryGetHiresPrimitive(name, out hiresPrim))
					{
						return new LdrawFileReference(hiresPrim, hiresPrim.MainObject);
					}
					break;
				case "8":
					var name = GetObjectName(dir_parts[1]);
					LdrawLoresPrimitive loresPrim;
					if(yield Cache.TryGetLoresPrimitive(name, out loresPrim))
					{
						return new LdrawFileReference(loresPrim, loresPrim.MainObject);
					}
					break;
				default:
					var name = GetObjectName(dir_parts[0]);
					LdrawPrimitive prim;
					if(yield Cache.TryGetPrimitive(name, out prim))
					{
						return new LdrawFileReference(prim, prim.MainObject);
					}

					LdrawPart p;
					if(yield Cache.TryGetPart(name, out p))
					{
						return new LdrawFileReference(p, p.MainObject);
					}
					break;
			}
			return null;
		}

		private string GetObjectName(string filename)
		{
			return filename.substring(0, filename.last_index_of("."));
		}
	}
}
