using Gee;

using Ldraw.Lego.Nodes;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class MultipartModel : LdrawModelFile
	{
		public ObservableList<LdrawObject> SubModels {get; construct;}

		public override void Save()
		{
			try
			{
				var builder = new LdrFileBuilder(FilePath);
				foreach(var model in SubModels)
				{
					builder.VisitNode(new MetaCommand("FILE", {model.FileName}));

					model.BuildFromFile<void>(builder);

					builder.VisitNode(new MetaCommand("NOFILE", {}));
				}
				builder.Finish();
			}
			catch(Error e)
			{
				stderr.printf(@"Unable to save $FileName to $FilePath: $(e.message).\n");
			}
		}
	}
}
