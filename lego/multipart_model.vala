using Gee;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class MultipartModel : LdrawModelFile
	{
		public ObservableList<LdrawModel> SubModels {get; construct;}

		public override string Description{get{return "";}}

		public override void Save()
		{

		}
	}
}
