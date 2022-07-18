
using Ldraw.Maths;

namespace Ldraw.Options
{
	public interface IOptions : Object
	{
		public abstract OptionDomain get_domain(string domain);
	}
	
	public interface OptionDomain : Object
	{
		public abstract bool initialize_option(string identifier, Value v);
		public abstract Value get_option(string identifier);
		public abstract void set_option(string identifier, Value v);
		
		public signal void option_change(string identifier, Value new_value);
		
		public bool initialize_option_float(string identifier, float f)
		{
			var v = Value(typeof(float));
			v.set_float(f);
			return initialize_option(identifier, v);
		}
	}

	public enum GridSize {Small, Medium, Large;}
}
