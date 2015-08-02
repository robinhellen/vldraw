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

		public Colour(string[] tokens)
		{
			// form of a colourLine:
			// 0 !COLOUR name CODE x VALUE v EDGE e [ALPHA a] [LUMINANCE l] [ CHROME | PEARLESCENT | RUBBER | MATTE_METALLIC | METAL | MATERIAL <params> ]</params>
			// name is a string
			// x is an integer
			// v is rgb #rrggbb
			// e is rgb #rrggbb
			// alpha is an int

			// necessary tokens:
			if(!(tokens[1] == "CODE"	&&
				 tokens[3] == "VALUE"	&&
				 tokens[5] == "EDGE"	&&
				 // values start with #
				 tokens[4][0] == '#'	&&
				 tokens[6][0] == '#'
				 ))
			{
				// ERROR
			}
			m_Name = tokens[0];
			m_Code = int.parse(tokens[2]);

			Red = ParseHex(tokens[4][1], tokens[4][2]);
			Green = ParseHex(tokens[4][3], tokens[4][4]);
			Blue = ParseHex(tokens[4][5], tokens[4][6]);

			EdgeRed = ParseHex(tokens[6][1], tokens[6][2]);
			EdgeGreen = ParseHex(tokens[6][3], tokens[6][4]);
			EdgeBlue = ParseHex(tokens[6][5], tokens[6][6]);

			if(tokens[7] == "ALPHA")
			{
				Alpha = (uint8) (int.parse(tokens[8]));
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

