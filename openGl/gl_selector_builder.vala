using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using GL;

namespace Ldraw.OpenGl
{
	public class GlSelectorBuilder : LdrawBuilder
	{
		private Vector m_Eyeline;
		private Matrix m_Transform;
		private Vector m_Center;

		private int m_CurrentColour;
		private bool m_InvertColour = false;

		private int m_RecursionDepth = 0;

		private Timer timer;

		private GLuint selectBuffer[1024];

		public int currentName = 0;

		public GlSelectorBuilder(Bounds clickArea, Vector eyeline, Vector centre, Vector up)
		{
			base();
			m_Transform = Matrix.Identity;
			m_Center = Vector.NullVector;

			timer = new Timer();

			// Set up the current openGl area for drawing
			// Clear the colour and alpha
			glClear(GL_DEPTH_BUFFER_BIT);
			// enable depth, and alpha
			glEnable(GL_DEPTH_TEST);
			glDepthFunc(GL_LESS);

			glSelectBuffer(1024, selectBuffer);
			glRenderMode(GL_SELECT);
			glInitNames();
			glPushName(-1);

			// set up the view
			glMatrixMode(GL_PROJECTION);
			glLoadIdentity();

			glOrtho(clickArea.MaxX, clickArea.MinX,
					clickArea.MinY, clickArea.MaxY,
					clickArea.MinZ, clickArea.MaxZ);
			m_Eyeline = lookAt(eyeline, centre, up);

			glMatrixMode(GL_MODELVIEW);
			glLoadIdentity();

			glLineWidth(2.0f);
			glMatrixMode(GL_MODELVIEW);
		}

		public void ApplySelection(LdrawObject model)
		{
			glFlush();

			var hits = glRenderMode(GL_RENDER);
			model.ClearSelection();

			if(hits == 0)
				return;

			var currentMinZ = uint.MAX;
			uint currentFrontName = 0;

			for(int i = 0; i < hits; i++)
			{
				int datapointBase = i * 4;
				var namesOnStack = selectBuffer[datapointBase];
				assert(namesOnStack == 1);
				var minZ = selectBuffer[datapointBase + 1];
				var maxZ = selectBuffer[datapointBase + 2];
				var name = selectBuffer[datapointBase + 3];

				if(minZ < currentMinZ)
				{
					currentFrontName = name;
					currentMinZ = minZ;
				}
			}

			var rawNode = model.Nodes[(int)currentFrontName];
			rawNode.Selected = true;
			model.VisibleChange();
		}

		public override void BuildLine(LineNode line)
		{
			if(m_RecursionDepth == 0)
			{
				glLoadName(currentName);
				currentName++;
			}

			Vector a = m_Transform.TransformVector(line.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(line.B).Add(m_Center);

			SetRenderColour(line.ColourId);
			glBegin(GL_LINES);

			glVertex3f(a.X, a.Y, a.Z);
			glVertex3f(b.X, b.Y, b.Z);

			glEnd();
		}

		public override void BuildTriangle(TriangleNode triangle)
		{
			if(m_RecursionDepth == 0)
			{
				glLoadName(currentName);
				currentName++;
			}

			Vector a = m_Transform.TransformVector(triangle.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(triangle.B).Add(m_Center);
			Vector c = m_Transform.TransformVector(triangle.C).Add(m_Center);

			SetRenderColour(triangle.ColourId);
			glBegin(GL_POLYGON);

			glVertex3f(a.X, a.Y, a.Z);
			glVertex3f(b.X, b.Y, b.Z);
			glVertex3f(c.X, c.Y, c.Z);

			glEnd();
		}

		public override void BuildQuad(QuadNode quad)
		{
			if(m_RecursionDepth == 0)
			{
				glLoadName(currentName);
				currentName++;
			}

			Vector a = m_Transform.TransformVector(quad.A).Add(m_Center);
			Vector b = m_Transform.TransformVector(quad.B).Add(m_Center);
			Vector c = m_Transform.TransformVector(quad.C).Add(m_Center);
			Vector d = m_Transform.TransformVector(quad.D).Add(m_Center);

			SetRenderColour(quad.ColourId);
			glBegin(GL_POLYGON);

			glVertex3f(a.X, a.Y, a.Z);
			glVertex3f(b.X, b.Y, b.Z);
			glVertex3f(c.X, c.Y, c.Z);
			glVertex3f(d.X, d.Y, d.Z);

			glEnd();
		}

		public override void BuildSubModel(PartNode part)
		{
			if(m_RecursionDepth == 0)
			{
				glLoadName(currentName);
				currentName++;
			}

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

			m_RecursionDepth++;
			// recurse into the current builder
			part.Contents.BuildFromFile(this);
			// finally restore the old state
			m_RecursionDepth--;
			m_Transform = oldTransform;
			m_Center = oldCenter;
			m_CurrentColour = oldColour;
			m_InvertColour = oldInverted;
		}

		public override void BuildCondLine(CondLineNode line)
		{
			if(m_RecursionDepth == 0)
			{
				glLoadName(currentName);
				currentName++;
			}

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

			glVertex3f(a.X, a.Y, a.Z);
			glVertex3f(b.X, b.Y, b.Z);

			glEnd();
		}

		public override void BuildComment(Comment line)
		{
			if(m_RecursionDepth == 0)
			{
				glLoadName(currentName);
				currentName++;
			}
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
	}
}
