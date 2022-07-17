using Gee;
using GLib.Environment;
using Json;

using Ldraw.Application;
using Ldraw.Lego;

namespace Ldraw.Lego.Library
{
	private class FileCachedLibrary : GLib.Object, ILibrary, InitializeOnStartup
	{
		public IDatFileCache PartFiles {construct; private get;}
		public ILdrawFolders LibraryFolders {construct; private get;}

		private MultiMap<string, IPartMetadata> categories;
		private bool loaded;
				
		public async bool Initialize(ProgressReporter reporter)
		{
			yield EnsureLoaded(reporter);
			return true;
		}
		
		public async void refresh(ProgressReporter reporter)
		{
			var task_name = @"Reloading library parts.";
			reporter.start_task(task_name);
			var ldrawUserConfigDir = File.new_for_path(get_user_config_dir()).get_child("vldraw");
			if(!ldrawUserConfigDir.query_exists())
				ldrawUserConfigDir.make_directory_with_parents();

			var categoryFile = ldrawUserConfigDir.get_child("categories.ldraw");
			yield LoadCategoriesAndSave(categoryFile, reporter, task_name);
			reporter.end_task(task_name);
			refreshed();
		}

		public async Set<string> GetAllCategories()
		{
			var keys = categories.get_keys();
			var filtered = new HashSet<string>();
			foreach(var key in keys)
			{
				switch(key[0])
				{
					case '=':
					case '_':
						break;
					default:
						filtered.add(key);
						break;
				}
			}
			return filtered;
		}

		public async Collection<IPartMetadata> GetPartsByCategory(string? category)
		{
			var parts = categories[category];
			var categoryParts = new LinkedList<IPartMetadata>();
			foreach(var part in parts)
			{
				categoryParts.add(part);
			}
			
			categoryParts.sort((a, b) => strcmp(a.Description, b.Description));
			
			return categoryParts;
		}

		private async void EnsureLoaded(ProgressReporter reporter)
		{
			if(loaded)
				return;

			var ldrawUserConfigDir = File.new_for_path(get_user_config_dir()).get_child("vldraw");
			if(!ldrawUserConfigDir.query_exists())
				ldrawUserConfigDir.make_directory_with_parents();

			var categoryFile = ldrawUserConfigDir.get_child("categories.ldraw");
			if(!categoryFile.query_exists())
			{
				var task_name = "Scanning part library.";
				reporter.start_task(task_name);
				yield LoadCategoriesAndSave(categoryFile, reporter, task_name);
				reporter.end_task(task_name);
			}
			else
				LoadCategoriesFromCache(categoryFile);

			loaded = true;
		}

		private async void LoadCategoriesAndSave(File categoryFile, ProgressReporter reporter, string task_name)
		{
			var folder = LibraryFolders.PartsDirectory;
			double count = 0;
			var children = folder.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			while(children.next_file() != null)
				count++;
			
			children = folder.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			categories = new HashMultiMap<string, LdrawPart>();

			FileInfo current_file;
			double progress = 0;
			while((current_file = children.next_file()) != null)
			{
				reporter.task_progress(task_name, progress / count);
				if(current_file.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = current_file.get_name();

				LdrawPart part;
				yield PartFiles.TryGetPart(name.substring(0, name.last_index_of(".")), out part);

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
				foreach(string member in reader.list_members())
				{
					if(reader.read_member(member))
					{
						var elements = reader.count_elements();
						for(int i = 0; i < elements; i++)
						{
							reader.read_element(i);
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

			foreach(string member in reader.list_members())
			{
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
						var elements = reader.count_elements();
						for(int i = 0; i < elements; i++)
						{
							reader.read_element(i);
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
			generator.pretty = true;
			generator.set_root(builder.get_root());
			try
			{
				var stream = file.append_to(FileCreateFlags.REPLACE_DESTINATION);
				generator.to_stream(stream);
			}
			catch(Error e)
			{
				log("vldraw-library", LogLevelFlags.LEVEL_ERROR, @"Unable to save cache of LDraw library metadata to $(file.get_path()).");
			}
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
