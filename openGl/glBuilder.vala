using Ldraw.Lego;
using Ldraw.Maths;
using GL;

namespace Ldraw.OpenGl
{
	public class GlBuilder : LdrawBuilder
	{
		private Vector m_Eyeline;
		private Matrix m_Transform;
		private Vector m_Center;

		private int m_CurrentColour;
		private bool m_InvertColour = false;

		private int m_RecursionDepth;

		public GlBuilder(int widthPx, int heightPx, int defaultColour)
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
		}
	}
}
