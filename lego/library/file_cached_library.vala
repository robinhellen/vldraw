using Gee;
using GLib.Environment;
using Json;

using Ldraw.Lego;

namespace Ldraw.Lego.Library
{
	public class FileCachedLibrary : GLib.Object, ILibrary
	{
		public IDatFileCache PartFiles {construct; private get;}
		public ILdrawFolders LibraryFolders {construct; private get;}

		private MultiMap<string, IPartMetadata> categories;
		private bool loaded;

		public Set<string> AllCategories
		{
			owned get
			{
				EnsureLoaded();
				return categories.get_keys();
			}
		}

		public Collection<IPartMetadata> GetPartsByCategory(string? category)
		{
			EnsureLoaded();
			return categories[category];
		}

		private void EnsureLoaded()
		{
			if(loaded)
				return;

			var ldrawUserConfigDir = File.new_for_path(get_user_config_dir()).get_child("vldraw");
			if(!ldrawUserConfigDir.query_exists())
				ldrawUserConfigDir.make_directory_with_parents();

			var categoryFile = ldrawUserConfigDir.get_child("categories.ldraw");
			if(!categoryFile.query_exists())
				LoadCategoriesAndSave(categoryFile);
			else
				LoadCategoriesFromCache(categoryFile);

			loaded = true;
		}

		private void LoadCategoriesAndSave(File categoryFile)
		{
			var folder = LibraryFolders.PartsDirectory;
			var children = folder.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			categories = new HashMultiMap<string, LdrawPart>();

			FileInfo current_file;
			while((current_file = children.next_file()) != null)
			{
				if(current_file.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = current_file.get_name();
				stderr.printf(@"loading $name.\n");

				LdrawPart part;
				PartFiles.TryGetPart(name.substring(0, name.last_index_of(".")), out part);

				categories[part.Category] = part;
			}

			Save(categories, categoryFile);
		}

		private void LoadCategoriesFromCache(File categoryFile)
		{
			var parser = new Parser();
			if(parser.load_from_stream(categoryFile.read()))
			{
				categories = new HashMultiMap<string, IPartMetadata>();
				var reader = new Reader(parser.get_root());
				stderr.printf("Loading part metadata from file.\n");
				foreach(string member in reader.list_members())
				{
					if(reader.read_member(member))
					{
						stderr.printf(@"loading category: $member.\n");
						int i = 0;
						while(reader.read_element(i++))
						{
							var metadata = ReadMetaData(reader);
							categories[member] = metadata;
							reader.end_element();
						}
						reader.end_member();
					}
				}
			}
		}

		private PartMetaData ReadMetaData(Reader reader)
		{
			string name = null;
			string description = null;
			string category = null;
			Collection<string> keywords = new ArrayList<string>();

			stderr.printf("reading metadata.\n");
			foreach(string member in reader.list_members())
			{
				stderr.printf(@"reading member: $member.\n");
				reader.read_member(member);
				switch(member)
				{
					case "name":
						name = reader.get_string_value();
						break;
					case "category":
						category = reader.get_string_value();
						break;
					case "description":
						description = reader.get_string_value();
						break;
					case "keywords":
						int i = 0;
						while(reader.read_element(i++))
						{
							keywords.add(reader.get_string_value());
							reader.end_element();
						}
						break;
				}
				reader.end_member();
			}

			return new PartMetaData(name, description, category, keywords);
		}

		private void Save(MultiMap<string, IPartMetadata> categories, File file)
		{
			var builder = new Builder();
			builder.begin_object();
			foreach(var category in categories.get_keys())
			{
				builder.set_member_name(category ?? "other");
				builder.begin_array();
				foreach(var data in categories[category])
				{
					builder.begin_object();

					builder.set_member_name("name");
					builder.add_string_value(data.Name);

					builder.set_member_name("category");
					builder.add_string_value(data.Category);

					builder.set_member_name("description");
					builder.add_string_value(data.Description);

					builder.set_member_name("keywords");
					builder.begin_array();
					foreach(var keyword in data.Keywords)
					{
						builder.add_string_value(keyword);
					}
					builder.end_array();

					builder.end_object();
				}
				builder.end_array();
			}
			builder.end_object();

			var generator = new Generator();
			generator.set_root(builder.get_root());

			var stream = file.append_to(FileCreateFlags.REPLACE_DESTINATION);
			generator.to_stream(stream);
		}
	}

	public class PartMetaData : GLib.Object, IPartMetadata
	{
		private string name;
		private string category;
		private string description;
		private Collection<string> keywords;

		public PartMetaData(string name, string description, string category, Collection<string> keywords)
		{
			this.name = name;
			this.category = category;
			this.description = description;
			this.keywords = keywords;
		}

		public string Name {get{return name;}}
		public string Category {get{return category;}}
		public Collection<string> Keywords {get{return keywords;}}
		public string Description {get{return description;}}
	}
}
