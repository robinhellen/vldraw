using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.DragAndDrop
{
	public class DocumentObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public AnimatedModel Model {construct; private get;}

		public async DroppedObject? GetObjectForName(string name)
		{
			var file = Model.File as MultipartModel;
			if(file == null) return null;
			foreach(var obj in file.SubModels)
			{
				if(obj.FileName == name)
					return DroppedObject.Subfile(file, obj);
			}
			return null;
		}
	}
}
