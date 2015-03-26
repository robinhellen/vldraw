namespace Ldraw.Lego.Library
{
	public class LdrawColour : Object
	{
		private static Colour s_Colours[513];

		public static void ReadAllColours(ILdrawFolders library)
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
						var parsed = new Colour(line);
						s_Colours[parsed.Code] = parsed;
					}
				}
			}
			catch
			{
				throw new InitializationError.LoadingColours("IO error while reading LDraw configuration file.");
			}
			s_Colours[16] = new SpecialColour(16);
			s_Colours[24] = new SpecialColour(24);
		}

		public static Colour GetColour(int code)
			requires (code <= 512 && code >= 0)
		{
			return s_Colours[code];
		}

		public static Colour? GetColourByName(string name)
		{
			for(int i = 0; i <= 512; i++)
			{
				if(s_Colours[i] != null &&
					s_Colours[i].Name == name)
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
			return s_Colours[code].Name;
		}

		public static void SurfaceColour(int code, out float red, out float green, out float blue, out float alpha)
			requires (code != 16)
			requires (code != 24)
		{
			Colour colour = GetColour(code);
			if(colour == null)
			{
				red = green = blue = alpha = 0f;
			}
			else
			{
				red = colour.m_Red / 256.0f;
				green = colour.m_Green / 256.0f;
				blue = colour.m_Blue / 256.0f;

				alpha = 1.0f - colour.m_Alpha / 255.0f;
			}
		}

		public static void EdgeColour(int code, out float red, out float green, out float blue, out float alpha)
			requires (code != 16)
			requires (code != 24)
		{
			Colour colour = GetColour(code);
			if(colour == null)
			{
				red = green = blue = alpha = 0f;
			}
			else
			{
				red = colour.m_EdgeRed / 256.0f;
				green = colour.m_EdgeGreen / 256.0f;
				blue = colour.m_EdgeBlue / 256.0f;

				alpha = 1.0f - colour.m_Alpha / 255.0f;
			}
		}
		
		private class SpecialColour : Colour
		{
			public SpecialColour(int code)
			{
				base(@"0 !COLOUR SPECIAL CODE $code VALUE #000000 EDGE #000000");
			}
		}
	}
}
