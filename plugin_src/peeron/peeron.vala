using Gee;
using Soup;
using Html;
using Xml.XPath;

namespace Ldraw.Peeron
{
	public class PeeronInventoryReader : GLib.Object, InventoryReader
	{
		public async Inventory GetInventoryFor(string setNumber)
			throws GLib.Error
		{
			var url = @"http://peeron.com/inv/sets/$setNumber";
			var session = new Session();
			var rq = session.request(url);

			var rawStream = yield rq.send_async(null);
			var stream = new DataInputStream(rawStream);
			var data = stream.read_upto("\0", 1, null);

			var doc = Doc.read_doc(data, url, null);

			var xpathCtxt = new Context(doc);
			var tableRows = xpathCtxt.eval("/html/body/table[2]/tbody/tr")->nodesetval;

			var lines = new ArrayList<InventoryLine>();
			for(int i = 0; i < tableRows->length(); i++)
			{
				var rowNode = tableRows->item(i);
				var col1 = rowNode->children->next; // ignoring the initial text item
				var col2 = col1->next;
				var col3 = col2->next;
				//var col4 = col3->next; // description
				//var col5 = col4->next; // picture
				//var col6 = col5->next; // note

				var qty = int.parse(col1->children->content);
				var partNo = col2->children->children->content; // the part number is a link
				var colour = col3->children->content;

				var line = (InventoryLine)GLib.Object.new(typeof(InventoryLine), PartNumber: partNo, Quantity: qty, Colour: colour);
				lines.add(line);
			}
			return (Inventory) GLib.Object.new(typeof(Inventory), SetNumber: setNumber, Lines: lines);
		}
	}
}
