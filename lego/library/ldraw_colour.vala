namespace Ldraw.Lego
{
	public class LdrawColour : Object
	{
		private string m_Name;
		private int m_Code;
		private uint8 m_Red;
		private uint8 m_Green;
		private uint8 m_Blue;
		private uint8 m_EdgeRed;
		private uint8 m_EdgeGreen;
		private uint8 m_EdgeBlue;
		private uint8 m_Alpha;

		private static LdrawColour s_Colours[513];

		private LdrawColour(string line)
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

			m_Red = ParseHex(tokens[6][1], tokens[6][2]);
			m_Green = ParseHex(tokens[6][3], tokens[6][4]);
			m_Blue = ParseHex(tokens[6][5], tokens[6][6]);

			m_EdgeRed = ParseHex(tokens[8][1], tokens[8][2]);
			m_EdgeGreen = ParseHex(tokens[8][3], tokens[8][4]);
			m_EdgeBlue = ParseHex(tokens[8][5], tokens[8][6]);

			if(tokens[9] == "ALPHA")
			{
				m_Alpha = (uint8) (int.parse(tokens[10]));
			}
			else
			{
				m_Alpha = 0;
			}
		}

		public static void ReadAllColours(LdrawLibrary library)
			throws InitializationError
		{
			File ldrawDir = library.LibraryDirectory;
			File configFile = ldrawDir.get_child("LDConfig.ldr");

			DataInputStream inStream;
			try
			{
				inStream = new DataInputStream(configFile.read());
			}
			catch
			{
				throw new InitializationError.LoadingColours("Unable to open the LDraw config file for reading.");
			}

			string line;
			int lineNo = 0;
			try
			{
				while((line = inStream.read_line(null)) != null)
				{
					line = line.strip();
					lineNo++;
					if(line == "")
						continue; // ignore blank lines
					if(line.contains("!COLOUR"))
					{
						LdrawColour parsed = new LdrawColour(line);
						s_Colours[parsed.m_Code] = parsed;
					}
				}
			}
			catch
			{
				throw new InitializationError.LoadingColours("IO error while reading LDraw configuration file.");
			}
		}

		public static LdrawColour GetColour(int code)
			requires (code <= 512 && code >= 0)
		{
			return s_Colours[code];
		}

		public static LdrawColour? GetColourByName(string name)
		{
			for(int i = 0; i <= 512; i++)
			{
				if(s_Colours[i] != null &&
					s_Colours[i].m_Name == name)
				{
					return s_Colours[i];
				}
			}
			stderr.printf(@"Unable to find colour; '$name'\n");
			return null;
		}

		public static string GetName(int code)
			requires (code <= 512 && code >= 0)
		{
			return s_Colours[code].m_Name;
		}

		public static void SurfaceColour(int code, out float red, out float green, out float blue, out float alpha)
			requires (code != 16)
			requires (code != 24)
		{
			LdrawColour colour = GetColour(code);
			red = colour.m_Red / 256.0f;
			green = colour.m_Green / 256.0f;
			blue = colour.m_Blue / 256.0f;

			alpha = 1.0f - colour.m_Alpha / 255.0f;
		}

		public static void EdgeColour(int code, out float red, out float green, out float blue, out float alpha)
			requires (code != 16)
			requires (code != 24)
		{
			LdrawColour colour = GetColour(code);
			red = colour.m_EdgeRed / 256.0f;
			green = colour.m_EdgeGreen / 256.0f;
			blue = colour.m_EdgeBlue / 256.0f;

			alpha = 1.0f - colour.m_Alpha / 255.0f;
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
