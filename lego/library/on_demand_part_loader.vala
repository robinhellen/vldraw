using Diva;
using Gee;



namespace Ldraw.Lego.Library
{
	public class OnDemandPartLoader : Object, IDatFileCache
	{
		public ILdrawFolders Folders {construct; private get;}
		public LdrawParser Parser {construct; private get;}
		public FileReaderFactory ReaderFactory {construct; private get;}
		public Index<ISubFileLocator, ReferenceLoadStrategy> Locators {construct; private get;}
		public ColourContext ColourContext {construct; private get;}

		static construct
		{
			var cls = (ObjectClass)typeof(OnDemandPartLoader).class_ref();
			set_indexed_injection<ReferenceLoadStrategy, ISubFileLocator>(cls, "Locators");
		}

		private Map<string, LdrawPrimitive> primitivesCache = new HashMap<string, LdrawPrimitive>();
		private Map<string, LdrawHiresPrimitive> hiresPrimitivesCache = new HashMap<string, LdrawHiresPrimitive>();
		private Map<string, LdrawPart> partsCache = new HashMap<string, LdrawPart>();
		private Map<string, LdrawSubPart> subpartsCache = new HashMap<string, LdrawSubPart>();

		public async bool TryGetPrimitive(string name, out LdrawPrimitive primitive)
		{
			return yield TryGetFile(name, primitivesCache, Folders.PrimitivesDirectory, out primitive);
		}

		public async bool TryGetHiresPrimitive(string name, out LdrawHiresPrimitive primitive)
		{
			return yield TryGetFile(name, hiresPrimitivesCache, Folders.HiresPrimitivesDirectory, out primitive);
		}

		public async bool TryGetPart(string name, out LdrawPart part)
		{
			return yield TryGetFile(name, partsCache, Folders.PartsDirectory, out part);
		}

		public async bool TryGetSubPart(string name, out LdrawSubPart part)
		{
			return yield TryGetFile(name, subpartsCache, Folders.SubPartsDirectory, out part);
		}

		private async bool TryGetFile<T>(string name, Map<string, T> cache, File folder, out T result)
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
				log("vldraw-ondemandpathloader", LogLevelFlags.LEVEL_WARNING, @"Failed to load part '$name' from '$(folder.get_path())'.");
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
			var reader = ReaderFactory.GetReader(folder.get_child(filename));

			var nodes = new ArrayList<LdrawNode>();
			
			LdrawNode node;
			var locator = Locators[ReferenceLoadStrategy.SubPartsAndPrimitives];
			while((node = yield reader.next(locator, ColourContext)) != null)
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
		public IDatFileCache Cache {construct; private get;}

		public OnDemandSubFileLoader(IDatFileCache cache)
		{
			Object(Cache: cache);
		}

		public async LdrawFileReference? GetObjectFromReference(string reference)
			throws ParseError
		{
			var dir_parts = reference.split_set("/\\");
			switch(dir_parts[0])
			{
				case "s":
					var name = GetObjectName(dir_parts[1]);
					LdrawSubPart sp;
					if(yield Cache.TryGetSubPart(name, out sp))
					{
						return new LibraryFileReference(sp, sp.MainObject);
					}
					break;
				case "48":
					var name = GetObjectName(dir_parts[1]);
					LdrawHiresPrimitive hiresPrim;
					if(yield Cache.TryGetHiresPrimitive(name, out hiresPrim))
					{
						return new LibraryFileReference(hiresPrim, hiresPrim.MainObject);
					}
					break;
				default:
					var name = GetObjectName(dir_parts[0]);
					LdrawPrimitive prim;
					if(yield Cache.TryGetPrimitive(name, out prim))
					{
						return new LibraryFileReference(prim, prim.MainObject);
					}

					LdrawPart p;
					if(yield Cache.TryGetPart(name, out p))
					{
						return new LibraryFileReference(p, p.MainObject);
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
