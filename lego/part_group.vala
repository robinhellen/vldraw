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
			model.MainObject.BuildFromFile<void>(builder);
			Object(Items: builder.GetItems());
		}

		private class GroupBuilder : LdrawVisitor<void>
		{
			private Collection<PartNode> parts = new ArrayList<PartNode>();

			public override void VisitSubModel(PartNode node)
			{
				var file = node.Contents.File;
				if(file == null)
				{
					return;
				}
				if(file is LdrawPart)
				{
					parts.add(node);
				}
				else if(file is LdrawModel
						|| file is MultipartModel)
				{
					node.Contents.BuildFromFile<void>(this);
				}
				else
				{
					stderr.printf(@"Unexpected class of file object: $(node.Contents.File.get_type().name()).\n");
				}
			}

			public Collection<PartGroupItem> GetItems()
			{
				var result = new ArrayList<PartGroupItem>();
				var map = new HashMap<LdrawPart, MultiMap<Colour?, PartNode>>();
				foreach(var p in parts)
				{
					var partFile = p.Contents.File as LdrawPart;
					if(map[partFile] == null)
					{
						map[partFile] = new HashMultiMap<Colour?, PartNode>();
					}
					map[partFile][p.Colour] = p;
				}
				foreach(LdrawPart p in map.keys)
				{
					foreach(Colour c in map[p].get_keys())
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
		public int Quantity {get; construct set;}
		public Colour Colour {get; construct;}

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
