using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;

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

		public Collection<InventoryLine?> Lines {get; construct;}
	}

	public struct InventoryLine
	{
		public InventoryLine(LdrawPart part, int quantity, Colour colour)
		{
			this.part = part;
			this.quantity = quantity;
			this.colour = colour;
		}
		
		public LdrawPart part;
		public int quantity;
		public Colour colour;
	}
}
