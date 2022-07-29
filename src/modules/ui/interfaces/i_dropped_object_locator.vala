using Ldraw.Lego;

namespace Ldraw.Ui.DragAndDrop
{
	public struct DroppedObject
	{
		public LdrawFile file;
		public LdrawObject object;
		
		public DroppedObject.Subfile(LdrawFile file, LdrawObject object)
		{
			this.file = file;
			this.object = object;
		}
	}
	
	public interface IDroppedObjectLocator : GLib.Object
	{
		public abstract async DroppedObject? GetObjectForName(string name);
	}
}
