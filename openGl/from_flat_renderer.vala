using Gee;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	public class FromFlatRenderer : Object, IRenderModel
	{
		public IRenderModel InnerRenderer {private get; construct;}
		
		construct
		{
			InnerRenderer = new FromFlatPartRenderer();
		}
		
		public void RenderModel(LdrawObject model, int defaultColour, Vector finalEyeline)
		{
			foreach(var node in model.Nodes)
			{
				var part = node as PartNode;
				if(part == null)
					continue;
				
				glPushMatrix();

				glTranslatef(part.Center.X, part.Center.Y, part.Center.Z);
				var m = part.Transform;
				glMultMatrixf(new float[] {m[0,0], m[1,0], m[2,0], 0, 
							 m[0,1], m[1,1], m[2,1], 0,
							 m[0,2], m[1,2], m[2,2], 0,
							 0,		 0,		 0,		 1});
				InnerRenderer.RenderModel(part.Contents, part.ColourId, finalEyeline);
				glPopMatrix();
			}
		}		
	}
	
	public class FromFlatPartRenderer : Object, IRenderModel
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
			RenderType<CLine>(cached.CLines, cl => RenderCLine(cl, finalEyeline), GL_LINES, c);
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
		
		private static void RenderCLine(CLine cline, Vector eyeline)
		{			
			var a = cline.A; var b = cline.B; var c1 = cline.C1; var c2 = cline.C2;
			
			Vector v = a.Subtract(b); // vector along line
			Vector perpend = v.Cross(eyeline); // vector perpendicular to line in plane of drawing
			Vector c1disp = a.Subtract(c1); // vectors from a to control points
			Vector c2disp = a.Subtract(c2);

			// test values determine which side of v c1 and c2 are. (+ve is same as perpend, -ve is opposite
			float test1 = c1disp.Dot(perpend);
			float test2 = c2disp.Dot(perpend);

			float totalTest = test1 * test2;
			if(totalTest < 0)
			{
				return; // different signs means different sides
			}

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());
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
