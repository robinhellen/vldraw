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

		//private ArrayList<LdrawNode> m_Nodes = new ArrayList();
		private string m_FileName;

		public virtual string Description
		{
			get
			{
				return "";
			}
		}
		
		public string FileName
		{
			get
			{
				return m_FileName;
			}
		}
	}

	public errordomain ParseError
	{
		UnknownLineType,
	}
}
