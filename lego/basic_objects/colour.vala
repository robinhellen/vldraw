namespace Ldraw.Lego
{
	public class Colour : Object
	{
		private string m_Name;
		public int m_Code;
		public uint8 Red;
		public uint8 Green;
		public uint8 Blue;
		public uint8 EdgeRed;
		public uint8 EdgeGreen;
		public uint8 EdgeBlue;
		public uint8 Alpha;

		public Colour(string line)
		{
			// form of a colourLine:
			// 0 !COLOUR name CODE x VALUE v EDGE e [ALPHA a] [LUMINANCE l] [ CHROME | PEARLESCENT | RUBBER | MATTE_METALLIC | METAL | MATERIAL <params> ]</params>
			// name is a string
			// x is an integer
			// v is rgb #rrggbb
			// e is rgb #rrggbb
			// alpha is an int

			var allTokens = line.split_set(" \t");
			string[] tokens = {};

			foreach(string token in allTokens)
			{
				if(token != "")
				{
					tokens += token;
				}
			}

			// necessary tokens:
			if(!(tokens[0] == "0" 		&&
				 tokens[1] == "!COLOUR"	&&
				 tokens[3] == "CODE"	&&
				 tokens[5] == "VALUE"	&&
				 tokens[7] == "EDGE"	&&
				 // values start with #
				 tokens[6][0] == '#'	&&
				 tokens[8][0] == '#'
				 ))
			{
				// ERROR
			}
			m_Name = tokens[2];
			m_Code = int.parse(tokens[4]);

			Red = ParseHex(tokens[6][1], tokens[6][2]);
			Green = ParseHex(tokens[6][3], tokens[6][4]);
			Blue = ParseHex(tokens[6][5], tokens[6][6]);

			EdgeRed = ParseHex(tokens[8][1], tokens[8][2]);
			EdgeGreen = ParseHex(tokens[8][3], tokens[8][4]);
			EdgeBlue = ParseHex(tokens[8][5], tokens[8][6]);

			if(tokens[9] == "ALPHA")
			{
				Alpha = (uint8) (int.parse(tokens[10]));
			}
			else
			{
				Alpha = 0;
			}
		}

		private uint8 ParseHex(char c1, char c2)
			requires(c1.isxdigit())
			requires(c2.isxdigit())
		{
			int highNibble = c1.xdigit_value();
			int lowNibble = c2.xdigit_value();

			return (uint8) (highNibble * 16 + lowNibble);
		}

		public string Name {get {return m_Name;}}
		public int Code {get {return m_Code;}}
	}
}

