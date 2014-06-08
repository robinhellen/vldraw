
using Gee;

namespace Ldraw.Lego
{
	public class PartGroupUsage : Object
	{
		public PartGroup Unused {get; construct;}
		public PartGroup Used {get; construct;}
		public PartGroup Extra {get; construct;}

		public PartGroupUsage(PartGroup group, PartGroup model)
		{
			var unused = new ArrayList<PartGroupItem>();
			var used = new ArrayList<PartGroupItem>();
			var extra = new ArrayList<PartGroupItem>();

			foreach(var i in group.Items)
			{
				var match = model.GetItemFor(i.Part, i.Colour);
				if(match == null)
				{
					unused.add(new PartGroupItem(i));
				}
				else if(match.Quantity == i.Quantity)
				{
					used.add(new PartGroupItem(i));
				}
				else if(match.Quantity < i.Quantity)
				{
					used.add(new PartGroupItem(match));
					unused.add((PartGroupItem)Object.new(typeof(PartGroupItem), Part: match.Part, Colour: match.Colour, Quantity: (i.Quantity - match.Quantity)));
				}
				else if(match.Quantity > i.Quantity)
				{
					used.add(new PartGroupItem(i));
					extra.add((PartGroupItem)Object.new(typeof(PartGroupItem), Part: match.Part, Colour: match.Colour, Quantity: (match.Quantity - i.Quantity)));
				}
			}

			foreach(var i in model.Items)
			{
				var match = group.GetItemFor(i.Part, i.Colour);
				if(match == null)
				{
					extra.add(new PartGroupItem(i));
				}
			}

			var uu = (PartGroup)Object.new(typeof(PartGroup), Items: unused);
			var  u = (PartGroup)Object.new(typeof(PartGroup), Items: used);
			var  e = (PartGroup)Object.new(typeof(PartGroup), Items: extra);

			Object(Unused: uu, Used: u, Extra: e);
		}
	}
}
