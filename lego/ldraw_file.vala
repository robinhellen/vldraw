using Gee;

namespace Ldraw.Lego
{
	public class LdrawFile : Object
	{
		protected LdrawFile()
		{
		}
		
		public LdrawFile.FromFile(string filename)
		{
			// TODO: Parse the file.
		}
		
		private List<LdrawNode> m_Nodes = new ArrayList();
		private string m_FileName;
		
		
	}
}
