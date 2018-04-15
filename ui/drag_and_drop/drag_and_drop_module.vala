using Diva;

namespace Ldraw.Ui.DragAndDrop
{
	public class DragAndDropModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<LibraryObjectLocator>().single_instance().keyed<IDroppedObjectLocator, ObjectDropType>(ObjectDropType.Library);
            builder.register<DocumentObjectLocator>().single_instance().keyed<IDroppedObjectLocator, ObjectDropType>(ObjectDropType.Document);
                        
            builder.register<CombinedObjectLocator>().as<IDroppedObjectLocator>();			
		}
	}
}
