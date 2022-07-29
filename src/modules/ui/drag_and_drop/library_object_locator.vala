using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Ui.DragAndDrop
{
	public class LibraryObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public IDatFileCache Library {construct; private get;}

		public async DroppedObject? GetObjectForName(string name)
		{
			LdrawPart part;
			if(!yield Library.TryGetPart(name, out part))
			{
				return null;
			}
			return DroppedObject.Subfile(part, part.MainObject);
		}
	}	
}
