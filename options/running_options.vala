using Gee;
using GLib.Environment;
using Json;

using Ldraw.Maths;

namespace Ldraw.Options
{
    private class RunningOptions : GLib.Object, IOptions
    {
		private Map<string, JsonStoredOptionDomain> domains;
		private Json.Node storage;
		private string file_path;
		
		construct {
			domains = new HashMap<string, JsonStoredOptionDomain>();
			storage = new Json.Node(NodeType.OBJECT);
			storage.set_object(new Json.Object());		
			
			var ldraw_config_dir = File.new_for_path(get_user_config_dir()).get_child("vldraw");
			if(!ldraw_config_dir.query_exists()) {
				try {
					ldraw_config_dir.make_directory_with_parents();
				} catch(Error e) {
					warning(@"Unable to create options folder: $(e.message)");
				}
			}

			var options_file = ldraw_config_dir.get_child("options.json");
			file_path = options_file.get_path();
			if(options_file.query_exists()) {
				var parser = new Parser();
				try {
					if(parser.load_from_stream(options_file.read())) {
						storage = parser.get_root();
						foreach(var domain in storage.get_object().get_members()) {
							domains[domain] = new JsonStoredOptionDomain(this, storage.get_object().get_object_member(domain));
						}
					}
				} catch(Error e) {
					warning(@"Unable to read options file: $(e.message)");					
				}
			}
		}
		
		public OptionDomain get_domain(string domain)
		{
			if(!domains.has_key(domain))
			{
				var domain_object = new Json.Object();
				domains[domain] = new JsonStoredOptionDomain(this, domain_object);
				storage.get_object().set_object_member(domain, domain_object);
			}
				
			return domains[domain];
		}
		
		public Collection<string> get_all_domains()
		{
			return domains.keys;
		}
		
		public void save()
		{
			var generator = new Generator();
			generator.pretty = true;
			generator.root = storage;
			try {
				generator.to_file(file_path);
			} catch(Error e) {
				warning(@"Unable to save options: $(e.message)");
			}
		}
    }
    
    private class JsonStoredOptionDomain : GLib.Object, OptionDomain
    {
		private RunningOptions parent;
		private Json.Object stored_object;
		private Map<string, Value?> options = new HashMap<string, Value?>();
		private Map<string, OptionDef?> option_definitions = new HashMap<string, OptionDef?>();
		
		public JsonStoredOptionDomain(RunningOptions parent, Json.Object stored_object)
		{
			this.parent = parent;
			this.stored_object = stored_object;
			
			foreach(var option in stored_object.get_members())
			{
				var n = stored_object.get_member(option);
				var v = n.get_value();
				options[option] = v;
			}
		}
		
		public bool initialize_option(OptionDef definition, Value value)
		{
			if(option_definitions.has_key(definition.id))
			{
				error(@"Duplicate definition for $(definition.id)");
			}
			option_definitions[definition.id] = definition;
			if(options.has_key(definition.id))
			{
				var new_val = Value(value.type());
				options[definition.id].transform(ref new_val);
				options[definition.id] = new_val;				
				return true;
			}
			
			var n = new Json.Node(NodeType.VALUE);
			n.set_value(value);
			stored_object.set_member(definition.id, n);
			
			options[definition.id] = value;
			parent.save();
			return false;
		}
		
		public Value get_option(string identifier)
		{
			return options[identifier];
		}
		
		public void set_option(string identifier, Value v)
		{
			if(!options.has_key(identifier))
				assert_not_reached();
				
			options[identifier] = v;
			parent.save();
		}	
		
		public Collection<OptionDef?> get_all_options()
		{
			return option_definitions.values;
		}	
	}
}
