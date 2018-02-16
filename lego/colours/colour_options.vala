using Gee;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Ui;

namespace Ldraw.Colours
{
	private class ColourOptions : Object, InitializeOnStartup
	{		
		public Palette current_palette {get; set;}		
		public Collection<Palette> all_palettes {get; set;}
		public AnimatedModel model {get; construct;}
		
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
			all_palettes.add(new ModelFavouritesPalette(model));
		}
	}
	
	private class Palette : Object
	{
		public Palette.builtin(string name, int[] colour_codes)
		{
			Object(name:name, user_editable: false);
			this.colour_codes = colour_codes;
		}
		
		public string name {get; construct set;}
		public bool user_editable {get; construct;}
		public int[] colour_codes {get; set;}
		
		public signal void changed();
	}
	
	private class ModelFavouritesPalette : Palette
	{
		private int[] base_colours = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};
		
		public ModelFavouritesPalette(AnimatedModel model)
		{
			Object(name:"Model colours", user_editable: false);
			model.view_changed.connect(() => update_palette(model));
			colour_codes = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};			
		}
		
		private void update_palette(AnimatedModel model)
		{
			if(model.Model == null || !(model.Model.File is LdrawModelFile))
			{
				colour_codes = base_colours;
				return;
			}
			var pg = new PartGroup.FromModel(model.Model.File as LdrawModelFile);
			var counts = new HashMap<int, int>();
			foreach(var pgi in pg.Items)
			{
				var colour_id = pgi.Colour.Code;
				if(counts.has_key(colour_id))
				{
					counts[colour_id] = counts[colour_id] + pgi.Quantity;
				}
				else
				{
					counts[colour_id] = pgi.Quantity;
				}
			}
			var colours = new ArrayList<int>();
			colours.add_all(counts.keys);
			colours.sort((a, b) => counts[b] - counts[a]);
			int i = 0;
			for(i = 0; i < 16 && i < colours.size; i++)
			{
				colour_codes[i] = colours[i];
			}
			int j = 0;
			for(; i < 16; i++, j++)
			{
				colour_codes[i] = base_colours[j];
			}
			changed();
		}
	}
}
