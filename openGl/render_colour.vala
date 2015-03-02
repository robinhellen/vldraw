using Gee;

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
		
		public static RenderColour FromLdrawColour(LdrawColour? c)
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
		
		public static RenderColour FromLdrawEdgeColour(LdrawColour c)
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
		
		private RenderColour.ConsFromLdrawColour(LdrawColour c)
		{
			float red, green, blue, alpha;
			LdrawColour.SurfaceColour(c.Code, out red, out green, out blue, out alpha);
			stderr.printf("building render colour from %s\n", c.Name);
			Object(Red:red, Green:green, Blue:blue, Alpha:alpha);
		}
		
		private RenderColour.ConsFromLdrawEdgeColour(LdrawColour c)
		{
			float red, green, blue, alpha;
			LdrawColour.EdgeColour(c.Code, out red, out green, out blue, out alpha);
			stderr.printf("building render edge colour from %s\n", c.Name);
			Object(Red:red, Green:green, Blue:blue, Alpha:alpha);			
		}
		
		public float Red {get; construct;}
		public float Green {get; construct;}
		public float Blue {get; construct;}
		public float Alpha {get; construct;}
		
		public virtual void UseColour(UseColourFunc u, LdrawColour defaultColour)
		{
			u(Red, Green, Blue, Alpha);
		}
		
		private class DefaultEdge : RenderColour
		{			
			public override void UseColour(UseColourFunc u, LdrawColour defaultColour)
			{
				FromLdrawEdgeColour(defaultColour).UseColour(u, defaultColour);
			}
		}
		
		private class DefaultSurface : RenderColour
		{		
			public override void UseColour(UseColourFunc u, LdrawColour defaultColour)
			{
				FromLdrawColour(defaultColour).UseColour(u, defaultColour);
			}			
		}
		
		public delegate void UseColourFunc(float red, float green, float blue, float alpha);
	}
}
