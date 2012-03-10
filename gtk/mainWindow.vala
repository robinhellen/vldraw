using Gtk;
using Ldraw.Ui.Widgets;
using Ldraw.Lego;

namespace Ldraw.Ui
{
	public class MainWindow : Window
	{
		private LdrawFile m_Model;

		// controls
		LdrawViewPane m_View;

		public MainWindow()
		{
			this.WithModel(null);
		}

		public MainWindow.WithModel(LdrawFile? model)
		{
			m_Model = model;

			maximize();

			SetUpControls();
		}

		private void SetUpControls()
		{
			// to start with I just have a ldrawView
			try
			{
				m_View = new LdrawViewPane.WithModel(ViewAngle.Ortho,m_Model);
			}
			catch(OpenGl.GlError e)
			{
				stdout.printf(e.message);
			}
			add(m_View);
		}
	}
}
