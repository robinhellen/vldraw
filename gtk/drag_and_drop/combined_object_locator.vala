using Ldraw.Lego;
using Diva;

namespace Ldraw.Ui.DragAndDrop
{
	public class CombinedObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public Index<IDroppedObjectLocator, ObjectDropType> Locators {construct; private get;}
		
		static construct
		{
			var cls = (ObjectClass)typeof(CombinedObjectLocator).class_ref();
			SetIndexedInjection<ObjectDropType, IDroppedObjectLocator>(cls, "Locators");
		}

		public async LdrawObject? GetObjectForName(string name)
		{
			var separatorIndex = name.index_of("::");
			string source;
			string objectName;
			if(separatorIndex == -1)
			{
				source = "";
				objectName = name;
			}
			else
			{
				source = name.substring(0, separatorIndex);
				objectName = name.substring(separatorIndex + 2);
			}
			
			return yield Locators[ObjectDropType.FromString(source)].GetObjectForName(objectName);
		}
	}
}
