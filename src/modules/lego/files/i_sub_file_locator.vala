using Diva;
using Gee;

using Ldraw.Lego.Library;

namespace Ldraw.Lego
{
	public class LdrawFileReference : Object
	{
		public LdrawFileReference(LdrawFile? file, LdrawObject obj)
		{
			Object(object: obj, file: file, source_desc: "unknown", ignore_duplicate: false);
		}
		
		public LdrawObject object {get; construct set;}
		public LdrawFile? file {get; construct set;}
		public string source_desc {get; construct set; default = "";}
		public bool ignore_duplicate {get; construct set; default = false;}
	}

	public enum ReferenceContext
	{
		Library,
		Model;
		
		public string to_string() {
			switch(this) {
				case Library:
					return "LIBRARY";
				case Model:
					return "MODEL";
				default:
					assert_not_reached();
			}
		}
	}
	
	public interface ISubFileLocator : Object
	{
		public abstract async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context);
	}
	
	public async LdrawFileReference? get_single_sub_file(Collection<ISubFileLocator> locators, string reference, ReferenceContext context) {
		LdrawFileReference? sub_file = null;
		foreach(var locator in locators) {
			var located = yield locator.GetObjectFromReference(reference, context);
			if(located == null) {
				continue;
			}
			if(sub_file == null) {
				sub_file = located;
			} else if(located.ignore_duplicate || sub_file.ignore_duplicate) {
				if(sub_file.ignore_duplicate) {
					sub_file = located;
				}
			} else {
				warning(@"Additional possibility found for $reference from $(located.source_desc). Using $(sub_file.source_desc)");
			}
		}
		return sub_file;
	}
	
	public class ModelsSubFileLocator : Object, ISubFileLocator
	{
		static construct
		{
			var cls = (ObjectClass)typeof(ModelsSubFileLocator).class_ref();
			set_lazy_injection<LdrawFileLoader>(cls, "loader");
		}
		
		public Lazy<LdrawFileLoader> loader {construct; private get;}
		public ILdrawFolders folders {construct; private get;}
		
		private Map<string, LdrawFileReference> loaded_models = 
			new HashMap<string, LdrawFileReference>(
				s => str_hash(s), 
				(a, b) => str_equal(a, b)
			);
		
		public async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context)
		{
			if(context != ReferenceContext.Model) {
				return null;
			}
			if(loaded_models.has_key(reference))
			{
				return loaded_models[reference]; // TODO: clean cache when loading a new file.
			}			
			var model_file = folders.ModelsDirectory.get_child(reference);
			if(!model_file.query_exists()) {
				return null;
			}
			var full_filename = model_file.get_path();
			try {
				var f = yield loader.value.LoadModelFile(full_filename, ReferenceContext.Model, false);
				var file_ref = new LdrawFileReference(f, f.MainObject);
				loaded_models[reference] = file_ref;
				return file_ref;
			} catch (ParseError e) {
				return null;
			}
		}
	}

	public class MultipartSubFileLocator : Object, ISubFileLocator
	{
		private Collection<ProxyLdrawObject> proxies = new ArrayList<ProxyLdrawObject>();

		public async LdrawFileReference? GetObjectFromReference(string reference, ReferenceContext context)
		{
			if(context != ReferenceContext.Model) {
				return null;
			}
			var proxy = new ProxyLdrawObject(reference);
			proxies.add(proxy);
			var proxy_ref = new LdrawFileReference(null, proxy);
			return proxy_ref;
		}

		public void ResolveAll(Collection<LdrawObject> possibilities)
		{
			foreach(var proxy in proxies)
			{
				proxy.Resolve(possibilities);
			}
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
						return;
					}
				}
				warning(@"Unable to resolve $(FileName).\n");
			}
		}
	}
}
