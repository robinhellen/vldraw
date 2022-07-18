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
    }
    
    private class JsonStoredOptionDomain : Object, OptionDomain
    {
		private RunningOptions parent;
		private Map<string, Value?> options = new HashMap<string, Value?>();
		
		public JsonStoredOptionDomain(RunningOptions parent)
		{
			this.parent = parent;
		}
		
		public bool initialize_option(string identifier, Value value)
		{
			if(options.has_key(identifier))
				return true;
				
			options[identifier] = value;
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
	}
}
