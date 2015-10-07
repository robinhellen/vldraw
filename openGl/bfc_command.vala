
using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.OpenGl
{
	private class BfcCertifyCommand : MetaCommand
	{
		public BfcCertifyCommand(string command, string[] args, bool certified)
		{
			base(command, args);
			Certified = certified;
		}
		
		public bool Certified {get; set;}
	}
	
	private class BfcInvertNext : MetaCommand
	{
		public BfcInvertNext(string command, string[]args)
		{
			base(command, args);
		}
	}
	
	private class BfcCommand : MetaCommand
	{
		public BfcCommand(string command, string[] args)
		{
			base(command, args);
			var options = BfcOptions.None;
			foreach(var arg in args)
			{
				BfcOptions o;
				if(BfcOptions.TryParse(arg, out o))
					options |= o;
			}
			Options = options;
		}
		
		public BfcOptions Options {get; set;}
	}
	
	[Flags]
	private enum BfcOptions
	{
		None,
		ClipOn,
		ClipOff,
		WindingClockwise,
		WindingAntiClockwise;
		
		public static bool TryParse(string s, out BfcOptions o)
		{
			switch(s)
			{
				case "CLIP":
					o = ClipOn; return true;
				case "NOCLIP":
					o = ClipOff; return true;
				case "CW":
					o = WindingClockwise; return true;
				case "CCW":
					o = WindingAntiClockwise; return true;
				default:
					o = None;
					return false;
			}
		}
	}
	
	private class BfcCommandFactory : Object, CommandFactory
	{
		public MetaCommand CreateCommand(string command, string[] args)
		{
			switch(command)
			{
				case "BFC":
					switch (args[0])
					{
						case "CERTIFY":
							return new BfcCertifyCommand(command, args, true);
						case "NOCERTIFY":
							return new BfcCertifyCommand(command, args, false);
						case "INVERTNEXT":
							return new BfcInvertNext(command, args);
						case "CW":
						case "CCW":
						case "CLIP":
						case "NOCLIP":
							return new BfcCommand(command, args);
						default:
							return new MetaCommand(command, args);
					}
				default:
					assert_not_reached();
			}
		}
	}
	
}
