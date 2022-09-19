using Gee;

using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class PartGroup : Object
	{
		public Collection<PartGroupItem> Items {get; construct;}

		public PartGroupItem? GetItemFor(LdrawPart part, Colour colour)
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
			model.MainObject.BuildFromFile<bool>(builder);
			Object(Items: builder.GetItems());
		}

		private class GroupBuilder : LdrawVisitor<bool>
		{
			private Collection<PartNode> parts = new ArrayList<PartNode>();

			public override bool VisitSubModel(PartNode node)
			{
				var file = node.File;
				if(file == null)
				{
					return true;
				}
				if(file is LdrawPart)
				{
					parts.add(node);
				}
				else if(file is LdrawModel
						|| file is MultipartModel)
				{
					node.Contents.BuildFromFile<bool>(this);
				}
				else
				{
					stderr.printf(@"Unexpected class of file object: $(node.File.get_type().name()).\n");
				}
				return true;
			}

			public Collection<PartGroupItem> GetItems()
			{
				var result = new ArrayList<PartGroupItem>();
				var map = new HashMap<LdrawPart, Map<Colour?, int>>();
				foreach(var p in parts)
				{
					var partFile = p.File as LdrawPart;
					if(map[partFile] == null)
					{
						map[partFile] = new HashMap<Colour?, int>();
					}
					if(map[partFile].has_key(p.Colour)) {
						map[partFile][p.Colour] = map[partFile][p.Colour] + 1;
					} else {
						map[partFile][p.Colour] = 1;
					}
				}
				foreach(LdrawPart p in map.keys)
				{
					foreach(Colour c in map[p].keys)
					{
						var item = (PartGroupItem)Object.new(typeof(PartGroupItem),
									Part: p,
									Colour: c,
									Quantity: map[p][c]);
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
		public int Quantity {get; construct set;}
		public Colour Colour {get; construct;}

		public PartGroupItem(PartGroupItem other)
		{
			Object(Part: other.Part, Quantity: other.Quantity, Colour: other.Colour);
		}

		public static int SortFunc(PartGroupItem a, PartGroupItem b)
		{
			// first sort by part number
			var partNoCompare = strcmp(a.Part.name, b.Part.name);
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
