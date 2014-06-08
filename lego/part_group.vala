using Gee;

using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class PartGroup : Object
	{
		public Collection<PartGroupItem> Items {get; construct;}

		public PartGroupItem? GetItemFor(LdrawPart part, LdrawColour colour)
		{
			foreach(var i in Items)
			{
				if(i.Part == part && i.Colour == colour)
					return i;
			}
			return null;
		}

		public PartGroup.FromModel(LdrawModelFile model)
		{
			var builder = new GroupBuilder();
			model.MainObject.BuildFromFile(builder);
			Object(Items: builder.GetItems());
		}

		private class GroupBuilder : LdrawVisitor
		{
			private Collection<PartNode> parts = new ArrayList<PartNode>();

			public override void VisitSubModel(PartNode node)
			{
				if(node.Contents.File is LdrawPart)
				{
					parts.add(node);
				}
				else if(node.Contents.File is LdrawModel
						|| node.Contents.File is MultipartModel)
				{
					node.Contents.BuildFromFile(this);
				}
				else
				{
					stderr.printf(@"Unexpected class of file object: $(node.Contents.File.get_type().name()).\n");
				}
			}

			public Collection<PartGroupItem> GetItems()
			{
				var result = new ArrayList<PartGroupItem>();
				var map = new TreeMap<LdrawPart, MultiMap<LdrawColour?, PartNode>>();
				foreach(var p in parts)
				{
					if(map[p.Contents.File as LdrawPart] == null)
						map[p.Contents.File as LdrawPart] = new HashMultiMap<LdrawColour?, PartNode>();
					map[p.Contents.File as LdrawPart][LdrawColour.GetColour(p.ColourId)] = p;
				}
				foreach(LdrawPart p in map.keys)
				{
					foreach(LdrawColour c in map[p].get_keys())
					{
						var item = (PartGroupItem)Object.new(typeof(PartGroupItem),
									Part: p,
									Colour: c,
									Quantity: map[p][c].size);
						result.add(item);
					}
				}
				result.sort(PartGroupItem.SortFunc);
				return result;
			}
		}
	}

	public class PartGroupItem : Object
	{
		public LdrawPart Part {get; construct;}
		public int Quantity {get; construct;}
		public LdrawColour Colour {get; construct;}

		public PartGroupItem(PartGroupItem other)
		{
			Object(Part: other.Part, Quantity: other.Quantity, Colour: other.Colour);
		}

		public static int SortFunc(PartGroupItem a, PartGroupItem b)
		{
			// first sort by part number
			var partNoCompare = strcmp(a.Part.Name, b.Part.Name);
			if(partNoCompare != 0)
				return partNoCompare;
			// then by colour
			if(a.Colour.Code > b.Colour.Code)
				return -1;
			else if(a.Colour.Code < b.Colour.Code)
				return 1;
			return 0;
		}
	}
}
