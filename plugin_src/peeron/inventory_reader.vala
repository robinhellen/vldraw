using Gee;

namespace Ldraw.Peeron
{
	public interface InventoryReader : GLib.Object
	{
		public abstract async Inventory GetInventoryFor(string setNumber)
			throws GLib.Error;
	}

	public class Inventory : GLib.Object
	{
		public string SetNumber {get; construct;}

		public Collection<InventoryLine> Lines {get; construct;}
	}

	public class InventoryLine : GLib.Object
	{
		public string PartNumber {get; construct;}
		public int Quantity {get; construct;}
		public string Colour {get; construct;}
	}
}
