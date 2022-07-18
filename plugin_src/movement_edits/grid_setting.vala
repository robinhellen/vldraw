

using Ldraw.Options;

namespace Ldraw.Plugins.Movement
{
	public enum GridSize {Small, Medium, Large;}
	
	private class GridSetting : Object
	{		
		public IOptions m_Options {
			construct {
				option_domain = value.get_domain("movement-grid");
				option_domain.initialize_option_float(OptionDef("grid-small-x", typeof(float), "Small grid X"), 1f);
				option_domain.initialize_option_float(OptionDef("grid-small-y", typeof(float), "Small grid Y"), 1f);
				option_domain.initialize_option_float(OptionDef("grid-small-z", typeof(float), "Small grid Z"), 1f);
				option_domain.initialize_option_float(OptionDef("grid-medium-x", typeof(float), "Medium grid X"), 5f);
				option_domain.initialize_option_float(OptionDef("grid-medium-y", typeof(float), "Medium grid Y"), 4f);
				option_domain.initialize_option_float(OptionDef("grid-medium-z", typeof(float), "Medium grid Z"), 5f);
				option_domain.initialize_option_float(OptionDef("grid-large-x", typeof(float), "Large grid X"), 20f);
				option_domain.initialize_option_float(OptionDef("grid-large-y", typeof(float), "Large grid Y"), 8f);
				option_domain.initialize_option_float(OptionDef("grid-large-z", typeof(float), "Large grid Z"), 20f);
				X = option_domain.get_option("grid-medium-x").get_float();
				Y = option_domain.get_option("grid-medium-y").get_float();
				Z = option_domain.get_option("grid-medium-z").get_float();
			}
		}	
		
		public float X;
		public float Y;
		public float Z;
		
		private OptionDomain option_domain;		
		private GridSize size = GridSize.Medium;
		
		public void set_size(GridSize size)
		{
			this.size = size;
			switch(size)
			{
				case GridSize.Large:
					X = option_domain.get_option("grid-large-x").get_float();
					Y = option_domain.get_option("grid-large-y").get_float();
					Z = option_domain.get_option("grid-large-z").get_float();
					break;
				case GridSize.Medium:
					X = option_domain.get_option("grid-medium-x").get_float();
					Y = option_domain.get_option("grid-medium-y").get_float();
					Z = option_domain.get_option("grid-medium-z").get_float();
					break;
				case GridSize.Small:
					X = option_domain.get_option("grid-small-x").get_float();
					Y = option_domain.get_option("grid-small-y").get_float();
					Z = option_domain.get_option("grid-small-z").get_float();
					break;
			}
			stderr.printf(@"Updated grid setting: ($X, $Y, $Z)\n");
		}
	}
}
