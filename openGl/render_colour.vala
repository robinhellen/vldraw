using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.OpenGl
{
	public class RenderColour : Object
	{
		private static Map<int, RenderColour> surfaces;
		private static Map<int, RenderColour> edges;
		private static RenderColour NullReplacement;
		private static void CreateCaches() 
		{
			// TODO: Yes, I know this fails in multi-threaded situations.
			if(surfaces == null)
			{
				surfaces = new HashMap<int, RenderColour>();
				edges = new HashMap<int, RenderColour>();
				NullReplacement = (RenderColour)Object.new(typeof(RenderColour), Red: 0F, Green: 0F, Blue: 0F, Alpha: 0F);
			}
		}		
		
		public static RenderColour FromLdrawColour(Colour? c)
			requires(c.Code != 24)
		{
			CreateCaches();
			if(c == null)
				return NullReplacement;
			var cached = surfaces[c.Code];
			if(cached != null)
				return cached;
			
			RenderColour newColour;
			if(c.Code == 16)
				newColour = new DefaultSurface();
			else
				newColour = new RenderColour.ConsFromLdrawColour(c);
				
			surfaces[c.Code] = newColour;
			return newColour;
		}
		
		public static RenderColour FromLdrawEdgeColour(Colour c)
			requires(c.Code != 24)
		{
			CreateCaches();
			if(c == null)
				return NullReplacement;
			var cached = edges[c.Code];
			if(cached != null)
				return cached;
			
			RenderColour newColour;
			if(c.Code == 16)
				newColour = new DefaultEdge();
			else
				newColour = new RenderColour.ConsFromLdrawEdgeColour(c);
				
			edges[c.Code] = newColour;
			return newColour;
		}
		
		private RenderColour.ConsFromLdrawColour(Colour c)
		{
			Object(Red:c.Red / 255f, Green:c.Green / 255f, Blue:c.Blue / 255f, Alpha:1f - c.Alpha / 255f);
		}
		
		private RenderColour.ConsFromLdrawEdgeColour(Colour c)
		{
			Object(Red:c.EdgeRed / 255f, Green:c.EdgeGreen / 255f, Blue:c.EdgeBlue / 255f, Alpha:1f - c.Alpha / 255f);
		}
		
		public float Red {get; construct;}
		public float Green {get; construct;}
		public float Blue {get; construct;}
		public float Alpha {get; construct;}
		
		public virtual void UseColour(UseColourFunc u, Colour defaultColour)
			requires(defaultColour.Code != 16)
			requires(defaultColour.Code != 24)
		{
			u(Red, Green, Blue, Alpha);
		}
		
		private class DefaultEdge : RenderColour
		{			
			public override void UseColour(UseColourFunc u, Colour defaultColour)
				requires(defaultColour.Code != 16)
				requires(defaultColour.Code != 24)
			{
				FromLdrawEdgeColour(defaultColour).UseColour(u, defaultColour);
			}
		}
		
		private class DefaultSurface : RenderColour
		{		
			public override void UseColour(UseColourFunc u, Colour defaultColour)
				requires(defaultColour.Code != 16)
				requires(defaultColour.Code != 24)
			{
				FromLdrawColour(defaultColour).UseColour(u, defaultColour);
			}			
		}
		
		public delegate void UseColourFunc(float red, float green, float blue, float alpha);
	}
}
