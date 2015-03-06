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
		public IRenderModel SelectedRenderer {private get; construct;}
		
		construct
		{
			InnerRenderer = new FromFlatPartRenderer();
			SelectedRenderer = new FromFlatInversePartRenderer();
		}
		
		public void RenderModel(LdrawObject model, int defaultColour, Vector finalEyeline)
		{
			// Action taken depends upon file type:
			var file = model.File;
			if(file is LdrawModelFile)
				RenderBuiltModel(model, defaultColour, finalEyeline);
			else
				RenderLibraryPart(model, defaultColour, finalEyeline);
		}
		
		public void RenderBuiltModel(LdrawObject model, int defaultColour, Vector finalEyeline)
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
				if(part.Selected)
					SelectedRenderer.RenderModel(part.Contents, part.ColourId, finalEyeline);
				else
					InnerRenderer.RenderModel(part.Contents, part.ColourId, finalEyeline);
				glPopMatrix();
			}
		}
		
		public void RenderLibraryPart(LdrawObject model, int defaultColour, Vector finalEyeline)
		{
			InnerRenderer.RenderModel(model, defaultColour, finalEyeline);
		}
		
		public void RenderBoundsFor(PartNode part)
		{		
			glPushMatrix();

			glTranslatef(part.Center.X, part.Center.Y, part.Center.Z);
			var m = part.Transform;	
			var bounds = part.Contents.BoundingBox;
			glColor3f(0.0f, 0.0f, 0.0f);

			glBegin(GL_LINE_STRIP);
			glVertex3f(bounds.MinX, bounds.MinY, bounds.MinZ); // (a) - 1
			glVertex3f(bounds.MinX, bounds.MinY, bounds.MaxZ); // (b) - 2
			glVertex3f(bounds.MinX, bounds.MaxY, bounds.MaxZ); // (c) - 2
			glVertex3f(bounds.MinX, bounds.MaxY, bounds.MinZ); // (d) - 2
			glVertex3f(bounds.MinX, bounds.MinY, bounds.MinZ); // (a) - 3
			glVertex3f(bounds.MaxX, bounds.MinY, bounds.MinZ); // (h) - 2
			glVertex3f(bounds.MaxX, bounds.MaxY, bounds.MinZ); // (e) - 2
			glVertex3f(bounds.MaxX, bounds.MaxY, bounds.MaxZ); // (f) - 2
			glVertex3f(bounds.MaxX, bounds.MinY, bounds.MaxZ); // (g) - 2
			glVertex3f(bounds.MaxX, bounds.MinY, bounds.MinZ); // (h) - 3
			glEnd();

			glBegin(GL_LINES);
			glVertex3f(bounds.MaxX, bounds.MinY, bounds.MaxZ); // (g) - 3
			glVertex3f(bounds.MinX, bounds.MinY, bounds.MaxZ); // (b) - 3
			glVertex3f(bounds.MinX, bounds.MaxY, bounds.MaxZ); // (c) - 3
			glVertex3f(bounds.MaxX, bounds.MaxY, bounds.MaxZ); // (f) - 3
			glVertex3f(bounds.MinX, bounds.MaxY, bounds.MinZ); // (d) - 3
			glVertex3f(bounds.MaxX, bounds.MaxY, bounds.MinZ); // (e) - 3
			glEnd();
			glPopMatrix();
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
		
		protected virtual void RenderType<T>(MultiMap<RenderColour, T> nodes, RenderAction<T> render, GLenum drawType, LdrawColour defaultColour)
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
		protected delegate void RenderAction<T>(T t);		
	}
	
	public class FromFlatInversePartRenderer : FromFlatPartRenderer
	{
		protected override void RenderType<T>(MultiMap<RenderColour, T> nodes, RenderAction<T> render, GLenum drawType, LdrawColour defaultColour)
		{
			glBegin(drawType);
			foreach(var colour in nodes.get_keys())
			{
				colour.UseColour((r,g,b,a) => glColor4f(1-r,1-g,1-b,a), defaultColour);
				
				// render the vertices
				var nodeList = nodes[colour];
				foreach(var node in nodeList)
				{
					render(node);
				}
			}
			glEnd();			
		}
		protected delegate void RenderAction<T>(T t);		
	}
}
