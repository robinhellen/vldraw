using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Ui.DragAndDrop
{
	public class LibraryObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public IDatFileCache Library {construct; private get;}

		public LdrawObject? GetObjectForName(string name)
		{
			LdrawPart part;
			if(!Library.TryGetPart(name, out part))
			{
				return null;
			}
			return part.MainObject;
		}
	}	
}
