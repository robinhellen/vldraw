using Ldraw.Lego;

namespace Ldraw.Lego.Library
{
	public class StandardColourContext : Object, ColourContext
	{
		public Colour GetColourById(int colourId)
		{
			return LdrawColour.GetColour(colourId);
		}
	}
}
