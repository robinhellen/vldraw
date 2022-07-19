using Diva;
using Gee;
using Json;
using Soup;

using Ldraw.Application;
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Options;

namespace Ldraw.Peeron
{
	public errordomain RebrickableError
	{
		ParseFailure
	}
	
	public class RebrickableInventoryReader : GLib.Object, InventoryReader
	{
		static construct
		{
			var cls = (ObjectClass)typeof(RebrickableInventoryReader).class_ref();
			set_lazy_injection<ProgressReporter>(cls, "reporter");
		}
		
		private string api_key;
		private OptionDomain option_domain;
		
		public IDatFileCache library {private get; construct;}
		public ColourContext colour_context {construct; private get;}
		public Lazy<ProgressReporter> reporter {private get; construct;}
		public IOptions options {
			construct {
				option_domain = value.get_domain("rebrickable");
				option_domain.initialize_option_string(OptionDef("api-key", typeof(string), "API Key"), "");
				api_key = option_domain.get_option("api-key").get_string();
			}
		}
		
		public async Inventory GetInventoryFor(string setNumber)
			throws GLib.Error
		{
			var task_name = @"Fetching set inventory for $setNumber";
			reporter.value.start_task(task_name);
			var lines = new ArrayList<InventoryLine?>();
			int64 count = 0;
			var progress = 0;
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
						case "count":
							reader.read_member(member);
							count = reader.get_int_value();
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
								var line = yield read_line(reader);
								progress++;
								reporter.value.task_progress(task_name, progress / (double)count);
								if(line != null)
									lines.add(line);
								reader.end_element();
							}
							reader.end_member();
							break;
					}
				}
			}
			reporter.value.end_task(task_name);

			return (Inventory) GLib.Object.new(typeof(Inventory), SetNumber: setNumber, Lines: lines);
		}
		
		private async InventoryLine? read_line(Reader reader)
		{
			LdrawPart part = null;
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
							var elements = reader.count_elements();
							if(elements == -1) {
								var e = reader.get_error();
								warning(@"$(e.message)\n");
							}
							string[] refs = {};
							for(int i = 0; i < elements; i++)
							{
								reader.read_element(i);
								var part_ref = reader.get_string_value();
								refs += part_ref;
								reader.end_element();
								if(part_ref == null)
								{
									warning(@"null part id at element $i");
									continue;
								}
								if(yield library.TryGetPart(part_ref, out part))
								{
									break;
								}
								else if (i == (elements - 1))
								{
									var part_refs_str = string.joinv(", ", refs);
									warning(@"Unable to find part in library from possibilities: $part_refs_str.\n");
								}
							}
						}
						reader.end_member();
						reader.end_member();
						if(part == null)
						{
							reader.read_member("part_num");
							var part_id = reader.get_string_value();
							reader.end_member();
							if(!yield library.TryGetPart(part_id, out part))
							{
								warning(@"Unable to find part in library from $part_id.\n");
								reader.end_member();
								return null;
							}
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
			return InventoryLine(part, qty, colour_context.GetColourById(colour));
		}
	}
}
