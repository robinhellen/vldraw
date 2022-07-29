using Gee;

namespace Ldraw.Lego.Library
{
	public class LdrawPrimitive : LdrawFile
	{
		private string m_Description = null;
		private string m_Category = null;
		private string m_Name;

		public static int s_Creations = 0;

		public string Category
		{
			get
			{
				if(m_Category == null)
				{
					m_Category = m_Description.split(" ")[0];
				}
				return m_Category;
			}
		}

		public string Name
		{
			get
			{
				return m_Name;
			}
		}
	}
}
