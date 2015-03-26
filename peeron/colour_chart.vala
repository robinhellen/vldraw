using Gee;
using Soup;
using Html;
using Xml.XPath;

using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Peeron
{
	public class ColourChart : GLib.Object
	{
		private bool Loaded {get; set; default = false;}
		private Map<string, int> ColourMap = new HashMap<string, int>();

		private void Load()
			throws GLib.Error
		{
			if(Loaded)
				return;

			var url = @"http://peeron.com/inv/colors";
			var session = new Session();
			var rq = session.request(url);

			var stream = new DataInputStream(rq.send());
			var data = stream.read_upto("\0", 1, null);

			var doc = Doc.read_doc(data, url, null);

			var xpathCtxt = new Context(doc);
			var tableRows = xpathCtxt.eval("/html/body/table/tbody/tr")->nodesetval;

			for(int i = 0; i < tableRows->length(); i++)
			{
				var rowNode = tableRows->item(i);
				var col1 = rowNode->children->next; // ignoring the initial text item
				var col2 = col1->next;
				var col3 = col2->next;
				var col4 = col3->next;
				var col5 = col4->next;

				var name = col1->children->children->content; // the colour name is a link
				if(col5->children == null)
				{
					stderr.printf(@"Peeron lists no LDraw colour id for $name.\n");
					continue;
				}
				var ldrawId = int.parse(col5->children->content);

				ColourMap[name] = ldrawId;
			}
			Loaded = true;
		}

		public Colour GetColourFromName(string name)
		{
			return LdrawColour.GetColour(GetColourIdFromName(name));
		}

		private int GetColourIdFromName(string name)
		{
			Load();
			return ColourMap[name];
		}
	}
}
