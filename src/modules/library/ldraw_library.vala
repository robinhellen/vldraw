using Gee;

using Ldraw;
using Ldraw.Options;

namespace Ldraw.Lego.Library
{
	public class LdrawLibrary : Object, ILdrawFolders
	{
		private File library_dir;
		private File parts_dir;
		private File sub_parts_dir;
		private File primitives_dir;
		private File hires_primitives_dir;
		private File lores_primitives_dir;
		private File models_dir;
		
		private OptionDomain library_options;
		const string opt_id = "library_base";
		
        public IOptions settings {
			construct {
				var homeFolder = File.new_for_path(Environment.get_home_dir());
				library_dir = homeFolder.get_child("ldraw");
				library_options = value.get_domain("library-options");
				library_options.initialize_option_string(OptionDef(opt_id, typeof(string), "Library base folder", ""), library_dir.get_path());
			}
		}

		construct {
			library_dir = File.new_for_path(library_options.get_option(opt_id).get_string());
			parts_dir = library_dir.get_child("parts");
			sub_parts_dir = parts_dir.get_child("s");
			primitives_dir = library_dir.get_child("p");
			hires_primitives_dir = primitives_dir.get_child("48");
			lores_primitives_dir = primitives_dir.get_child("8");

			models_dir = library_dir.get_child("models");
			if(!models_dir.query_exists()) {
				models_dir = library_dir.get_child("MODELS");
			}
		}

		public File LibraryDirectory {
			get {
				return library_dir;
			}
		}

		public File PartsDirectory {
			get {
				return parts_dir;
			}
		}

		public File SubPartsDirectory {
			get {
				return sub_parts_dir;
			}
		}

		public File PrimitivesDirectory {
			get {
				return primitives_dir;
			}
		}

		public File HiresPrimitivesDirectory {
			get {
				return hires_primitives_dir;
			}
		}

		public File LoresPrimitivesDirectory {
			get {
				return lores_primitives_dir;
			}
		}

		public File ModelsDirectory {
			get{
				return models_dir;
			}
		}
	}
	
	public class FoldersFactory : Object, ILdrawFolders.Factory {
		public ILdrawFolders default_folders {construct; private get;}
		
		public ILdrawFolders get_default() {
			return default_folders;
		}
		
		public ILdrawFolders from_base(File base_folder) {
			return new BasedFolders(base_folder);
		}
		
		public class BasedFolders : Object, ILdrawFolders
		{
			private File library_dir;
			private File parts_dir;
			private File sub_parts_dir;
			private File primitives_dir;
			private File hires_primitives_dir;
			private File lores_primitives_dir;
			private File models_dir;
			
			public File base_dir {construct; private get;}

			construct {
				library_dir = base_dir;
				parts_dir = library_dir.get_child("parts");
				sub_parts_dir = parts_dir.get_child("s");
				primitives_dir = library_dir.get_child("p");
				hires_primitives_dir = primitives_dir.get_child("48");
				lores_primitives_dir = primitives_dir.get_child("8");

				models_dir = library_dir.get_child("models");
				if(!models_dir.query_exists()) {
					models_dir = library_dir.get_child("MODELS");
				}
				
				File[] dirs = {library_dir, parts_dir, sub_parts_dir, primitives_dir, hires_primitives_dir, lores_primitives_dir};
				foreach(File dir in dirs) {					
					try {
						if(!dir.query_exists()) {
							dir.make_directory_with_parents();
						}
					} catch(Error e) {
						warning(@"Unable to create folder for parts");
					}
				}
			}
			
			public BasedFolders(File base_dir) {
				Object(base_dir: base_dir);
			}

			public File LibraryDirectory {
				get {
					return library_dir;
				}
			}

			public File PartsDirectory {
				get {
					return parts_dir;
				}
			}

			public File SubPartsDirectory {
				get {
					return sub_parts_dir;
				}
			}

			public File PrimitivesDirectory {
				get {
					return primitives_dir;
				}
			}

			public File HiresPrimitivesDirectory {
				get {
					return hires_primitives_dir;
				}
			}

			public File LoresPrimitivesDirectory {
				get {
					return lores_primitives_dir;
				}
			}

			public File ModelsDirectory {
				get{
					return models_dir;
				}
			}
		}
	}

	public errordomain InitializationError
	{
		LoadingParts,
		LoadingColours,
	}
}
