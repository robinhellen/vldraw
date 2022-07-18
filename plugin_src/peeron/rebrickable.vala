using Gee;
using Json;
using Soup;

using Ldraw.Application;

namespace Ldraw.Peeron
{
	public errordomain RebrickableError
	{
		ParseFailure
	}
	
	public class RebrickableInventoryReader : GLib.Object, InventoryReader
	{
		string api_key = "";
		
		public ProgressReporter reporter {private get; construct;}
		
		public async Inventory GetInventoryFor(string setNumber)
			throws GLib.Error
		{
			var lines = new ArrayList<InventoryLine>();
			string? url = @"https://rebrickable.com/api/v3/lego/sets/$setNumber-1/parts/?key=$api_key";
			var session = new Session();
			while(url != null)
			{
				var rq = session.request(url);
				debug(@"Fetching $url");

				var rawStream = yield rq.send_async(null);
				debug(@"Recieved from $url\n");
				var parser = new Parser();
				var stream = new DataInputStream(rawStream);
				parser.error.connect(_ => warning(@"JSON parser encountered an error"));
				if(!yield parser.load_from_stream_async(stream)){
					warning(@"Unable to parse JSON");
					throw new RebrickableError.ParseFailure("");
				}
				var reader = new Reader(parser.get_root());
				url = null;
				foreach(string member in reader.list_members())
				{
					switch(member)
					{
						case "next":
							reader.read_member(member);
							if(reader.get_null_value())
							{
								url = null;
							}
							else 
							{
								url = reader.get_string_value();
							}
							reader.end_member();
							break;
						case "results":
							reader.read_member(member);
							var elements = reader.count_elements();
							if(elements == -1) {
								var e = reader.get_error();
								warning(@"$(e.message)\n");
							}
							for(int i = 0; i < elements; i++)
							{
								reader.read_element(i);
								var line = read_line(reader);
								if(line != null)
									lines.add(line);
								reader.end_element();
							}
							reader.end_member();
							break;
					}
				}
			}

			return (Inventory) GLib.Object.new(typeof(Inventory), SetNumber: setNumber, Lines: lines);
		}
		
		private InventoryLine? read_line(Reader reader)
		{
			string part_id = "";
			int qty = 0;
			int colour = 0;
			bool spare = false;
			foreach(string member in reader.list_members())
			{
				switch(member)
				{
					case "part":
						reader.read_member(member);
						reader.read_member("external_ids");
						if(reader.read_member("LDraw"))
						{
							reader.read_element(0);
							part_id = reader.get_string_value();
							reader.end_element();
						}
						reader.end_member();
						reader.end_member();
						if(part_id == "")
						{
							reader.read_member("part_num");
							part_id = reader.get_string_value();
							reader.end_member();
						}
						reader.end_member();
						break;
					case "color":
						reader.read_member(member);
						reader.read_member("external_ids");
						reader.read_member("LDraw");
						reader.read_member("ext_ids");
						reader.read_element(0);
						colour = (int)reader.get_int_value();
						reader.end_element();
						reader.end_member();
						reader.end_member();
						reader.end_member();
						reader.end_member();
						break;
					case "quantity":
						reader.read_member(member);
						qty = (int)reader.get_int_value();
						reader.end_member();
						break;
					case "is_spare":
						reader.read_member(member);
						spare = reader.get_boolean_value();
						reader.end_member();
						break;
				}
			}	
			if(spare)
			{
				debug(@"Ignoring spare part.");
				return null;	
			}
			return (InventoryLine)GLib.Object.new(typeof(InventoryLine), PartNumber: part_id, Quantity: qty, Colour: @"$colour");	
		}
	}
}
