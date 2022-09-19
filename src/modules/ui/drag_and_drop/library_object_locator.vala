using Diva;
using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;

namespace Ldraw.Ui.DragAndDrop
{
	public class LibraryObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		static construct
		{
			var cls = (ObjectClass)typeof(LibraryObjectLocator).class_ref();
			set_collection_injection<ISubFileLocator>(cls, "locators");
		}
		
		public Collection<ISubFileLocator> locators {construct; private get;}

		public async DroppedObject? GetObjectForName(string name)
		{
            var file_ref = yield get_single_sub_file(locators, name, ReferenceContext.Model);
            if(file_ref == null) return null;
            var part = file_ref.file as LdrawPart;
            if(part == null) return null;
			return DroppedObject.Subfile(part, part.MainObject);
		}
	}	
}
