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
		LdrawViewPane m_PartDetail;

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
				m_View = new LdrawViewPane.WithModel(ViewAngle.Ortho, m_Model);
			}
			catch(OpenGl.GlError e)
			{
				stdout.printf(e.message);
			}
			
			m_PartDetail = new LdrawViewPane(ViewAngle.Ortho);
			m_PartDetail.set_size_request(200, 200);
			
			PartsTree tree = new PartsTree();
			
			Paned treePaned = new HPaned();
			
			Box treeDetailBox = new VBox(false, 0);
			treeDetailBox.pack_start(tree.Widget);
			treeDetailBox.pack_start(m_PartDetail, true, false);
			treePaned.add1(treeDetailBox);
			treePaned.add2(m_View);
			
			tree.DetailView = m_PartDetail;
			
			add(treePaned);
		}
	}
}
