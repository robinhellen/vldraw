namespace Ldraw.Lego.Library
{
	public class LdrawColour : Object
	{
		private static Colour s_Colours[513];

		public static void ReadAllColours(ILdrawFolders library)
			throws InitializationError
		{
			s_Colours[16] = new SpecialColour(16);
			s_Colours[24] = new SpecialColour(24);
		}

		public static Colour GetColour(int code)
			requires (code <= 512 && code >= 0)
		{
			return s_Colours[code];
		}
		
		private class SpecialColour : Colour
		{
			public SpecialColour(int code)
			{
				base({"SPECIAL", "CODE", @"$code", "VALUE", "#000000", "EDGE", "#000000"});
			}
		}
	}
}
