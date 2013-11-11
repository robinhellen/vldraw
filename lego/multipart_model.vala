using Gee;

using Ldraw.Lego.Nodes;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class MultipartModel : LdrawModelFile
	{
		public ObservableList<LdrawModel> SubModels {get; construct;}

		public override string Description{get{return "";}}

		public override void Save()
		{
			stderr.printf("Saving multipart model.\n");
			var builder = new LdrFileBuilder(FilePath);
			foreach(var model in SubModels)
			{
				builder.BuildNode(new MetaCommand("FILE", {model.FileName}));

				model.MainObject.BuildFromFile(builder);

				builder.BuildNode(new MetaCommand("NOFILE", {}));
			}
			builder.Finish();
		}
	}
}
