
using Gee;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	public class GlBuilder : LdrawVisitor
	{
		private Vector m_Eyeline;

		private SavedState state = new SavedState();
		private AnimationState nextObjectAnimationState = new AnimationState();

		private int m_RecursionDepth = 0;

		public GlBuilder(int widthPx, int heightPx, int defaultColour, Bounds viewArea
					, Vector eyeline, Vector centre, Vector up, Map<string, float?> parameters = Map.empty<string, float?>())
			requires(defaultColour != 24 && defaultColour != 16) // default colour must be an actual colour
		{
			state.CurrentColour = defaultColour;
			state.Parameters = parameters;

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

			Vector a = state.Transform.TransformVector(line.A).Add(state.Center);
			Vector b = state.Transform.TransformVector(line.B).Add(state.Center);

			glBegin(GL_LINES);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());

			glEnd();
		}

		public override void VisitTriangle(TriangleNode triangle)
		{
			SetRenderColour(triangle.ColourId);

			Vector a = state.Transform.TransformVector(triangle.A).Add(state.Center);
			Vector b = state.Transform.TransformVector(triangle.B).Add(state.Center);
			Vector c = state.Transform.TransformVector(triangle.C).Add(state.Center);

			glBegin(GL_POLYGON);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());
			glVertex3fv(c.value_vector());

			glEnd();
		}

		public override void VisitQuad(QuadNode quad)
		{
			SetRenderColour(quad.ColourId);

			Vector a = state.Transform.TransformVector(quad.A).Add(state.Center);
			Vector b = state.Transform.TransformVector(quad.B).Add(state.Center);
			Vector c = state.Transform.TransformVector(quad.C).Add(state.Center);
			Vector d = state.Transform.TransformVector(quad.D).Add(state.Center);

			glBegin(GL_POLYGON);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());
			glVertex3fv(c.value_vector());
			glVertex3fv(d.value_vector());

			glEnd();
		}

		public override void VisitSubModel(PartNode part)
		{
			var oldState = state;
			state = new SavedState();
			state.ColourInverted = oldState.ColourInverted;
			state.CurrentColour = oldState.CurrentColour;

			state.Parameters = nextObjectAnimationState.ParameterValues;

			// apply the current transform to the sub-model's transform and center vector
			state.Center = oldState.Transform.TransformVector(part.Center).Add(oldState.Center).Add(nextObjectAnimationState.Translation);
			state.Transform = nextObjectAnimationState.Rotation.TransformMatrix(oldState.Transform.TransformMatrix(part.Transform));

			// reset the animation
			nextObjectAnimationState = new AnimationState();

			if(part.ColourId != 16 && part.ColourId != 24)
			{
				state.CurrentColour = part.ColourId;
			}
			if(part.Selected)
			{
				state.ColourInverted = true;
				RenderBounds(part.Contents.BoundingBox.Transform(state.Transform, state.Center).Scale(1.2f));
			}

			m_RecursionDepth++;
			// recurse into the current builder
			Visit(part.Contents);
			// finally restore the old state
			m_RecursionDepth--;
			state = oldState;
		}

		public override void VisitComment(Comment comment)
		{
			var animRotateCmd = comment as AnimRotateCommand;
			if(animRotateCmd != null)
			{
				var m = Matrix.ForRotation(animRotateCmd.Axis, animRotateCmd.Angle.Evaluate(state.Variables));
				nextObjectAnimationState.Rotation = m;
			}
			var param = comment as AnimParameterCommand;
			if(param != null)
			{
				var identifier = param.Identifier;
				var p = state.Parameters[identifier];
				if(p == null || p < param.Min)
					state.Variables[identifier] = param.Min;
				else if ( p > param.Max)
					state.Variables[identifier] = param.Max;
				else
					state.Variables[identifier] = p;
			}
		}

		public override void VisitCondLine(CondLineNode line)
		{

			Vector a = state.Transform.TransformVector(line.A).Add(state.Center);
			Vector b = state.Transform.TransformVector(line.B).Add(state.Center);

			Vector c1 = state.Transform.TransformVector(line.Control1).Add(state.Center);
			Vector c2 = state.Transform.TransformVector(line.Control2).Add(state.Center);

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
			int actualColour = (ldrawColour == 24 || ldrawColour == 16) ? state.CurrentColour : ldrawColour;

			bool actualInvert = (invert && !state.ColourInverted) || (!invert && state.ColourInverted);
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

		private class SavedState
		{
			public SavedState()
			{
				Transform = Matrix.Identity;
				Center = Vector.NullVector;
				CurrentColour = 0;
				ColourInverted = false;
				Variables = new HashMap<string, float?>();
			}

			public Matrix Transform;
			public Vector Center;
			public int CurrentColour;
			public bool ColourInverted;
			public Map<string, float?> Variables;
			public Map<string, float?> Parameters;
		}

		private class AnimationState
		{
			public AnimationState()
			{
				Rotation = Matrix.Identity;
				Translation = Vector.NullVector;
				ParameterValues = new HashMap<string, float?>();
			}

			public Matrix Rotation;
			public Vector Translation;
			public Map<string, float?> ParameterValues;
		}
	}
}
