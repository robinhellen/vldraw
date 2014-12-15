using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.DragAndDrop
{
	public class DocumentObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public Collection<LdrawObject> Objects {get; construct set; default = Gee.List.empty<LdrawObject>();}

		public LdrawObject? GetObjectForName(string name)
		{
			foreach(var obj in Objects)
			{
				if(obj.FileName == name)
					return obj;
			}
			return null;
		}
	}
}
