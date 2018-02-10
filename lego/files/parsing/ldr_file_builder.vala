
namespace Ldraw.Lego
{
	public class LdrFileBuilder : LdrawVisitor<bool?>
	{
		private File m_File;
		private FileOutputStream m_OutStream;

		private Error m_CaughtError;
		private bool HadError = false;

		public LdrFileBuilder(string filename)
			throws Error
		{
			m_File = File.new_for_path(filename);
			m_OutStream = m_File.replace(null, false, FileCreateFlags.NONE);
		}

		public override bool VisitNode(LdrawNode node)
		{
			if(HadError)
				return false;
			try
			{
				m_OutStream.write(node.FileLine.data);
				m_OutStream.write("\r\n".data);
			}
			catch (Error e)
			{
				HadError = true;
				m_CaughtError = e;
				return false;
			}
			return true;
		}
		
		
		public override bool? GetResult(LdrawObject object)
		{
			return HadError;
		}

		public void Finish()
			throws Error
		{
			if(HadError)
				throw m_CaughtError;

			m_OutStream.close();
		}
	}
}
