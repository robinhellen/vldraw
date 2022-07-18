using Gee;

using Ldraw.Maths;

namespace Ldraw.Options
{
    private class RunningOptions : Object, IOptions
    {
		private Map<string, JsonStoredOptionDomain> domains = new HashMap<string, JsonStoredOptionDomain>();
		
		public OptionDomain get_domain(string domain)
		{
			if(!domains.has_key(domain))
				domains[domain] = new JsonStoredOptionDomain(this);
				
			return domains[domain];
		}
		
		public Collection<string> get_all_domains()
		{
			return domains.keys;
		}
    }
    
    private class JsonStoredOptionDomain : Object, OptionDomain
    {
		private RunningOptions parent;
		private Map<string, Value?> options = new HashMap<string, Value?>();
		private Map<string, OptionDef?> option_definitions = new HashMap<string, OptionDef?>();
		
		public JsonStoredOptionDomain(RunningOptions parent)
		{
			this.parent = parent;
		}
		
		public bool initialize_option(OptionDef definition, Value value)
		{
			if(option_definitions.has_key(definition.id))
			{
				error(@"Duplicate definition for $(definition.id)");
			}
			option_definitions[definition.id] = definition;
			if(options.has_key(definition.id))
				return true;
				
			options[definition.id] = value;
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
		}	
		
		public Collection<OptionDef?> get_all_options()
		{
			return option_definitions.values;
		}	
	}
}
