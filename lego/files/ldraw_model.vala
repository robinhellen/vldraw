
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawModel : LdrawModelFile
	{
		public LdrawModel.Empty()
		{
			var nodes = new ObservableList<LdrawNode>();
			var filename = "";
			var mainObject = (LdrawObject)Object.new(typeof(LdrawObject), Nodes: nodes, FileName: filename);
			Object(MainObject: mainObject, FileName: filename);
		}

		public override void Save()
		{
			try
			{
				var builder = new LdrFileBuilder(FilePath);
				MainObject.BuildFromFile<void>(builder);
				builder.Finish();
			}
			catch(Error e)
			{
				stderr.printf(@"Unable to save $FileName to $FilePath: $(e.message).\n");
			}
		}
	}
}
