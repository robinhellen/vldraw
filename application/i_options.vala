using Gee;

namespace Ldraw.Options
{
	public struct OptionDef
	{
		public OptionDef(string id, Type type, string display_name, string description = "")
		{
			this.id = id;
			this.type = type;
			this.display_name = display_name;
			this.description = description;
		}
		
		string id;
		Type type;
		string display_name;
		string description;
	}
	
	public interface IOptions : Object
	{
		public abstract OptionDomain get_domain(string domain);
		public abstract Collection<string> get_all_domains();
	}
	
	public interface OptionDomain : Object
	{
		public abstract bool initialize_option(OptionDef definition, Value initial_value);
		public abstract Value get_option(string identifier);
		public abstract void set_option(string identifier, Value v);
		
		public signal void option_change(string identifier, Value new_value);
		
		public abstract Collection<OptionDef?> get_all_options();
		
		public bool initialize_option_int(OptionDef definition, int i)
			requires(definition.type == typeof(int))
		{
			var v = Value(typeof(int));
			v.set_int(i);
			return initialize_option(definition, v);
		}
		
		public bool initialize_option_float(OptionDef definition, float f)
			requires(definition.type == typeof(float))
		{
			var v = Value(typeof(float));
			v.set_float(f);
			return initialize_option(definition, v);
		}
		
		public bool initialize_option_string(OptionDef definition, string s)
			requires(definition.type == typeof(string))
		{
			var v = Value(typeof(string));
			v.set_string(s);
			return initialize_option(definition, v);
		}
	}
}
