using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using GL;

namespace Ldraw.OpenGl
{
	public class GlBuilder : LdrawVisitor
	{
		private Vector m_Eyeline;
		private Matrix m_Transform;
		private Vector m_Center;

		private int m_CurrentColour;
		private bool m_InvertColour = false;

		private int m_RecursionDepth = 0;

		public GlBuilder(int widthPx, int heightPx, int defaultColour, Bounds viewArea
					, Vector eyeline, Vector centre, Vector up)
			requires(defaultColour != 24 && defaultColour != 16) // default colour must be an actual colour
		{
			m_CurrentColour = defaultColour;
			m_Transform = Matrix.Identity;
			m_Center = Vector.NullVector;

			// Set up the current openGl area for drawing
			// Clear the colour and alpha
			glClearColor(1.0f, 1.0f, 1.0f, 0.0f);
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			// enable depth, and alpha
			glEnable(GL_DEPTH_TEST);
			glDepthFunc(GL_LESS);
			glEnable(GL_BLEND);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
			// set up the view
			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();

			glOrtho(viewArea.MinX, viewArea.MaxX,
					viewArea.MinY, viewArea.MaxY,
					viewArea.MinZ, viewArea.MaxZ);
			m_Eyeline = lookAt(eyeline, centre, up);

			glMatrixMode(GL_MODELVIEW);
			//glScalef(1.0f, 1.0f, -1.0f);
			glLoadIdentity();

			glLineWidth(2.0f);
			glMatrixMode(GL_MODELVIEW);
		}

		public void Flush()
		{
			glFlush();
		}

		public override void VisitLine(LineNode line)
		{
			SetRenderColour(line.ColourId);

			Vector a = m_Transform.TransformVector(line.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(line.B).Add(m_Center);

			glBegin(GL_LINES);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());

			glEnd();
		}

		public override void VisitTriangle(TriangleNode triangle)
		{
			SetRenderColour(triangle.ColourId);

			Vector a = m_Transform.TransformVector(triangle.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(triangle.B).Add(m_Center);
			Vector c = m_Transform.TransformVector(triangle.C).Add(m_Center);

			glBegin(GL_POLYGON);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());
			glVertex3fv(c.value_vector());

			glEnd();
		}

		public override void VisitQuad(QuadNode quad)
		{
			SetRenderColour(quad.ColourId);

			Vector a = m_Transform.TransformVector(quad.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(quad.B).Add(m_Center);
			Vector c = m_Transform.TransformVector(quad.C).Add(m_Center);
			Vector d = m_Transform.TransformVector(quad.D).Add(m_Center);

			glBegin(GL_POLYGON);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());
			glVertex3fv(c.value_vector());
			glVertex3fv(d.value_vector());

			glEnd();
		}

		public override void VisitSubModel(PartNode part)
		{
			Matrix oldTransform = m_Transform;
			Vector oldCenter = m_Center;
			int oldColour = m_CurrentColour;
			bool oldInverted = m_InvertColour;

			// apply the current transform to the sub-model's transform and center vector
			m_Center = m_Transform.TransformVector(part.Center).Add(m_Center);
			m_Transform = m_Transform.TransformMatrix(part.Transform);

			if(part.ColourId != 16 && part.ColourId != 24)
			{
				m_CurrentColour = part.ColourId;
			}
			if(part.Selected)
			{
				m_InvertColour = true;
				RenderBounds(part.Contents.BoundingBox.Transform(m_Transform, m_Center).Scale(1.2f));
			}

			m_RecursionDepth++;
			// recurse into the current builder
			Visit(part.Contents);
			// finally restore the old state
			m_RecursionDepth--;
			m_Transform = oldTransform;
			m_Center = oldCenter;
			m_CurrentColour = oldColour;
			m_InvertColour = oldInverted;
		}

		public override void VisitCondLine(CondLineNode line)
		{

			Vector a = m_Transform.TransformVector(line.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(line.B).Add(m_Center);

			Vector c1 = m_Transform.TransformVector(line.Control1).Add(m_Center);
			Vector c2 = m_Transform.TransformVector(line.Control2).Add(m_Center);

			Vector v = a.Subtract(b); // vector along line
			Vector perpend = v.Cross(m_Eyeline); // vector perpendicular to line in plane of drawing
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

			SetRenderColour(line.ColourId);
			glBegin(GL_LINES);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());

			glEnd();
		}

		private void SetRenderColour(int ldrawColour)
		{
			bool invert = ldrawColour == 24;
			int actualColour = (ldrawColour == 24 || ldrawColour == 16) ? m_CurrentColour : ldrawColour;

			bool actualInvert = (invert && !m_InvertColour) || (!invert && m_InvertColour);
			float red, green, blue, alpha;
			if(actualInvert)
			{
				LdrawColour.EdgeColour(actualColour, out red, out green, out blue, out alpha);
				// get line colour
			}
			else
			{
				// get flat colour
				LdrawColour.SurfaceColour(actualColour, out red, out green, out blue, out alpha);
			}

			glColor4f(red, green, blue, alpha);
		}

		private Vector lookAt(Vector eye, Vector center, Vector up)
		{
			Vector f = center.Subtract(eye).Normalized();
			Vector s = f.Cross(up.Normalized());
			Vector u = s.Cross(f);

			float viewTransform[16] = {s.X, u.X, -f.X, 0,
									   s.Y, u.Y, -f.Y, 0,
									   s.Z, u.Z, -f.Z, 0,
									   0  , 0  , 0   , 1};

			glMultMatrixf(viewTransform);

			return center.Subtract(eye);
		}

		public void RenderBounds(Bounds bounds)
		{
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
		}
	}
}
