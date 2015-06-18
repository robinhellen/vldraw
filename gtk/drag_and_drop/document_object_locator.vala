using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.DragAndDrop
{
	public class DocumentObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public AnimatedModel Model {construct; private get;}

		public async LdrawObject? GetObjectForName(string name)
		{
			var file = Model.Model.File as MultipartModel;
			if(file == null) return null;
			foreach(var obj in file.SubModels)
			{
				if(obj.FileName == name)
					return obj;
			}
			return null;
		}
	}
}
