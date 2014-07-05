using Ldraw.Lego.Library;

namespace Ldraw.Lego
{
	public class LdrawModel : LdrawModelFile
	{
		public LdrawModel.Empty()
		{
			base();
		}

		public override void Save()
		{
			try
			{
				var builder = new LdrFileBuilder(FilePath);
				MainObject.BuildFromFile(builder);
				builder.Finish();
			}
			catch(Error e)
			{
				stderr.printf(@"Unable to save $FileName to $FilePath: $(e.message).\n");
			}
		}
	}
}
