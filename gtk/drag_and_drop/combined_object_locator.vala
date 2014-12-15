using Ldraw.Lego;
using Ldraw.Utils.Di;

namespace Ldraw.Ui.DragAndDrop
{
	public class CombinedObjectLocator : IDroppedObjectLocator, GLib.Object
	{
		public IIndex<ObjectDropType, IDroppedObjectLocator> Locators {construct; private get;}
		
		static construct
		{
			var cls = (ObjectClass)typeof(CombinedObjectLocator).class_ref();
			SetIndexedInjection<ObjectDropType, IDroppedObjectLocator>(cls, "Locators");
		}

		public LdrawObject? GetObjectForName(string name)
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
			
			return Locators[ObjectDropType.FromString(source)].GetObjectForName(objectName);
		}
	}
}
