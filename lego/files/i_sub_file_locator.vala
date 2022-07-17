using Diva;
using Gee;

using Ldraw.Lego.Library;

namespace Ldraw.Lego
{
	public interface LdrawFileReference : Object
	{
		public abstract LdrawObject object {get; construct set;}
		public abstract LdrawFile file {get; construct set;}
	}
	
	private class LibraryFileReference : Object, LdrawFileReference
	{
		public LibraryFileReference(LdrawFile file, LdrawObject obj)
		{
			Object(object: obj, file: file);
		}
		
		public LdrawObject object {get; construct set;}
		public LdrawFile file {get; construct set;}		
	}
	
	public interface ISubFileLocator : Object
	{
		public abstract async LdrawFileReference? GetObjectFromReference(string reference)
			throws ParseError;
	}

	public class LibrarySubFileLocator : Object, ISubFileLocator
	{
		public IDatFileCache Library {construct; private get;}

		public async LdrawFileReference? GetObjectFromReference(string reference)
			throws ParseError
		{
			var partName = reference.substring(0, reference.last_index_of("."));

			LdrawPart part;
			if(yield Library.TryGetPart(partName, out part))
			{
				return new LibraryFileReference(part, part.MainObject);
			}
			return null;
		}
	}
	
	public class ModelsSubFileLocator : Object, ISubFileLocator
	{
		static construct
		{
			var cls = (ObjectClass)typeof(ModelsSubFileLocator).class_ref();
			set_lazy_injection<LdrawFileLoader>(cls, "loader");
		}
		
		public LibrarySubFileLocator library_locator {construct; private get;}
		public Lazy<LdrawFileLoader> loader {construct; private get;}
		public ILdrawFolders folders {construct; private get;}
		
		private Map<string, LdrawFileReference> loaded_models = 
			new HashMap<string, LdrawFileReference>(
				s => str_hash(s), 
				(a, b) => str_equal(a, b)
			);
		
		public async LdrawFileReference? GetObjectFromReference(string reference)
			throws ParseError
		{
			if(reference.has_prefix("models/"))
			{
				var model_filename = reference.substring(7);
				if(loaded_models.has_key(model_filename))
				{
					return loaded_models[model_filename]; // TODO: clean cache when loading a new file.
				}			
				var model_file = folders.ModelsDirectory.get_child(model_filename);
				var full_filename = model_file.get_path();
				var f = yield loader.value.LoadModelFile(full_filename, ReferenceLoadStrategy.PartsOnly, false);
				var file_ref = new LibraryFileReference(f, f.MainObject);
				loaded_models[model_filename] = file_ref;
				return file_ref;
			}	
			
			return yield library_locator.GetObjectFromReference(reference);
		}
	}

	public class MultipartSubFileLocator : Object, ISubFileLocator
	{
		private ISubFileLocator m_Locator;
		private Collection<ProxyLdrawObject> m_Proxies;

		public MultipartSubFileLocator(ISubFileLocator baseLocator)
		{
			m_Locator = baseLocator;
			m_Proxies = new ArrayList<ProxyLdrawObject>();
		}

		public async LdrawFileReference? GetObjectFromReference(string reference)
			throws ParseError
		{
			var baseVal = yield m_Locator.GetObjectFromReference(reference);
			if(baseVal == null)
			{
				var proxy = new ProxyLdrawObject(reference);
				m_Proxies.add(proxy);
				var proxy_ref = new MpdProxyRef(proxy);
				return proxy_ref;
			}
			return baseVal;
		}

		public void ResolveAll(Collection<LdrawObject> possibilities)
		{
			foreach(var proxy in m_Proxies)
			{
				proxy.Resolve(possibilities);
			}
		}
		
		private class MpdProxyRef : Object, LdrawFileReference
		{
			public MpdProxyRef(ProxyLdrawObject proxy)
			{
				Object(object: proxy);
			}
			
			public LdrawObject object {get; construct set;}
			public LdrawFile file {get; construct set;}
		}

		public class ProxyLdrawObject : LdrawObject
		{
			public ProxyLdrawObject(string filename)
			{
				base("");
				FileName = filename;
			}

			public void Resolve(Collection<LdrawObject> possibilities)
			{
				foreach(LdrawObject object in possibilities)
				{
					if(object.FileName.casefold() == FileName.casefold())
					{
						Nodes = object.Nodes;
						Description = object.Description;
						//File = object.File;
						return;
					}
				}
				stderr.printf(@"Unable to resolve $(FileName).\n");
			}
		}
	}

	[Flags]
	public enum LibraryObjectTypes
	{
		Part = 1,
		SubPart = 2,
		Primitive = 4,
		HiResPrimitive = 8,
	}

	public enum ReferenceLoadStrategy
	{
		PartsOnly,
		SubPartsAndPrimitives,
	}
}
