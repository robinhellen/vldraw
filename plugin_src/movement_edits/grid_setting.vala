

using Ldraw.Options;

namespace Ldraw.Plugins.Movement
{
	private class GridSetting : Object
	{		
		public IOptions m_Options {
			construct {
				option_domain = value.get_domain("movement-grid");
				option_domain.initialize_option_float("grid-small-x", 1f);
				option_domain.initialize_option_float("grid-small-y", 1f);
				option_domain.initialize_option_float("grid-small-z", 1f);
				option_domain.initialize_option_float("grid-medium-x", 5f);
				option_domain.initialize_option_float("grid-medium-y", 4f);
				option_domain.initialize_option_float("grid-medium-z", 5f);
				option_domain.initialize_option_float("grid-large-x", 20f);
				option_domain.initialize_option_float("grid-large-y", 8f);
				option_domain.initialize_option_float("grid-large-z", 20f);
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
