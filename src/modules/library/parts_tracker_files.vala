using Diva;
using Gee;
using GLib.Environment;
using Soup;

using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Library {
	private class PartsTrackerFiles : Object {
		static construct
		{
			var cls = (ObjectClass)typeof(PartsTrackerFiles).class_ref();
			set_lazy_injection<TrackerSubFileLocator>(cls, "locator");
		}
		
		public OnDemandPartLoader inner {construct; private get;}
		
		public LdrawParser parser {construct; protected get;}
		public FileReaderFactory reader_factory {construct; protected get;}
		public Lazy<TrackerSubFileLocator> locator {construct; protected get;}
		public ColourContext colour_context {construct; protected get;}
		public ILdrawFolders.Factory folder_factory {construct; protected get;}
		
		private OnDemandPartLoader downloaded;
		private ILdrawFolders folders;
		
		construct {
			var downloads_folder = File.new_for_path(get_user_config_dir()).get_child("vldraw").get_child("downloaded");
			if(!downloads_folder.query_exists()) {
				try {
					downloads_folder.make_directory_with_parents();
				} catch(Error e) {
					warning(@"Unable to create folder for parts tracker downloads: $(e.message)");
				}
			}
			folders = folder_factory.from_base(downloads_folder);
			downloaded = (OnDemandPartLoader)Object.new(typeof(OnDemandPartLoader), 
				Folders: folders,
				Parser: parser,
				ReaderFactory: reader_factory,
				locator: locator,
				ColourContext: colour_context);
		}
		
		public async bool TryGetPrimitive(string name, out LdrawPrimitive primitive) {
			if(yield inner.TryGetPrimitive(name, out primitive)) {
				return true;
			}
			
			if(yield try_download<LdrawPrimitive>(name, folders.PrimitivesDirectory)) {
				return yield downloaded.TryGetPrimitive(name, out primitive);
			}
			
			return false;
		}

		public async bool TryGetLoresPrimitive(string name, out LdrawLoresPrimitive primitive) {
			if(yield inner.TryGetLoresPrimitive(name, out primitive)) {
				return true;
			}
			
			if(yield try_download<LdrawLoresPrimitive>(name, folders.LoresPrimitivesDirectory)) {
				return yield downloaded.TryGetLoresPrimitive(name, out primitive);
			}
			
			return false;
		}

		public async bool TryGetHiresPrimitive(string name, out LdrawHiresPrimitive primitive) {
			if(yield inner.TryGetHiresPrimitive(name, out primitive)) {
				return true;
			}
			
			if(yield try_download<LdrawHiresPrimitive>(name, folders.HiresPrimitivesDirectory)) {
				return yield downloaded.TryGetHiresPrimitive(name, out primitive);
			}
			
			return false;
		}

		public virtual async bool TryGetPart(string name, out LdrawPart part){
			if(yield inner.TryGetPart(name, out part)) {
				return true;
			}
			
			if(yield try_download<LdrawPart>(name, folders.PartsDirectory)) {
				return yield downloaded.TryGetPart(name, out part);
			}
			
			return false;
		}

		public async bool TryGetSubPart(string name, out LdrawSubPart part) {
			if(yield inner.TryGetSubPart(name, out part)) {
				return true;
			}
			
			if(yield try_download<LdrawSubPart>(name, folders.SubPartsDirectory)) {
				return yield downloaded.TryGetSubPart(name, out part);
			}
			
			return false;
		}
		
		private async bool try_download<T>(string name, File folder) {
			var url_path_seg = get_segment_for(typeof(T));
			var file_name = @"$name.dat";
			if(folder.get_child(file_name).query_exists()) {
				return true;
			}
			var url = @"https://www.ldraw.org/library/unofficial/$url_path_seg/$file_name";
			var session = new Session();
			var request = session.request_http("GET", url);
			var res_stream = yield request.send_async(null);
			var msg = request.get_message();
			if(msg.status_code != 200) {
				warning(@"Could not retrieve $name from tracker: $(msg.status_code)");
				return false;
			}
			var outs = yield folder.get_child(file_name).replace_async(null, false, FileCreateFlags.NONE);
			yield outs.splice_async(res_stream, OutputStreamSpliceFlags.NONE);
			
			return true;
		}
		
		private string get_segment_for(Type t) {
			if(t == typeof(LdrawPart))
				return "parts";
			if(t == typeof(LdrawSubPart))
				return "parts/s";
			if(t == typeof(LdrawPrimitive))
				return "p";
			if(t == typeof(LdrawHiresPrimitive))
				return "p/48";
			if(t == typeof(LdrawLoresPrimitive))
				return "p/8";
			assert_not_reached();
		}
	}
}
