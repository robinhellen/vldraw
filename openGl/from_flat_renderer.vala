using Gee;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	public class FromFlatRenderer : Object, IRenderModel
	{
		static Map<LdrawObject, FlattenedNodes> cache = new HashMap<LdrawObject, FlattenedNodes>();
		
		public void RenderModel(LdrawObject model, int defaultColour, Vector finalEyeline)
		{
			var cached = cache[model];
			if(cached == null)
			{
				var flats = FlattenedNodes.FlatForObject(model);
				cache[model] = flats;
				cached = flats;
			}
			
			var c = LdrawColour.GetColour(defaultColour);
			
			RenderType<Triangle>(cached.Triangles, RenderTriangle, GL_TRIANGLES, c);
			RenderType<Quad>(cached.Quads, RenderQuad, GL_QUADS, c);
			RenderType<Line>(cached.Lines, RenderLine, GL_LINES, c);
		}
		
		private static void RenderQuad(Quad quad)
		{
			glVertex3fv(quad.A.value_vector());
			glVertex3fv(quad.B.value_vector());
			glVertex3fv(quad.C.value_vector());
			glVertex3fv(quad.D.value_vector());
		}
		
		private static void RenderTriangle(Triangle triangle)
		{
			glVertex3fv(triangle.A.value_vector());
			glVertex3fv(triangle.B.value_vector());
			glVertex3fv(triangle.C.value_vector());
		}
		
		private static void RenderLine(Line line)
		{
			glVertex3fv(line.A.value_vector());
			glVertex3fv(line.B.value_vector());
		}
		
		private void RenderType<T>(MultiMap<RenderColour, T> nodes, RenderAction<T> render, GLenum drawType, LdrawColour defaultColour)
		{
			glBegin(drawType);
			foreach(var colour in nodes.get_keys())
			{
				colour.UseColour((r,g,b,a) => glColor4f(r,g,b,a), defaultColour);
				
				// render the vertices
				var nodeList = nodes[colour];
				foreach(var node in nodeList)
				{
					render(node);
				}
			}
			glEnd();			
		}
		private delegate void RenderAction<T>(T t);		
	}
}
