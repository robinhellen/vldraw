using Gee;

using Ldraw.Application;

namespace Ldraw.Colours
{
	private class ColourOptions : Object, InitializeOnStartup
	{		
		public Palette current_palette {get; set;}		
		public Collection<Palette> all_palettes {get; set;}
		
		public async void Initialize(ProgressReporter reporter)
		{
			reporter.start_task("Loading colour palettes");
			create_default_palettes();
			reporter.end_task("Loading colour palettes");
		}
		
		private void create_default_palettes()
		{
			all_palettes = new ArrayList<Palette>();
			var classic_palette = new Palette.builtin("Classic", {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15});
			all_palettes.add(classic_palette);
			current_palette = classic_palette;
			all_palettes.add(new Palette.builtin("Modern", {0,1,2,3,4,5,6,71,72,9,10,11,12,13,14,15}));
		}
	}
	
	private class Palette : Object
	{
		public Palette.builtin(string name, int colour_codes[16])
		{
			Object(name:name, user_editable: false);
			this.colour_codes = colour_codes;
		}
		
		public string name {get; construct set;}
		public bool user_editable {get; construct;}
		public int[] colour_codes {get; set;}
		
		public signal void changed();
	}
}
