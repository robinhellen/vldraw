using Diva;

namespace Ldraw.Ui.DragAndDrop
{
	public class DragAndDropModule
	{
		public void Load(ContainerBuilder builder)
		{
            builder.Register<LibraryObjectLocator>().Keyed<IDroppedObjectLocator, ObjectDropType>(ObjectDropType.Library);
            builder.Register<DocumentObjectLocator>().Keyed<IDroppedObjectLocator, ObjectDropType>(ObjectDropType.Document);
            
            //builder.Register<CombinedObjectLocator>().AsInterface<IDroppedObjectLocator>();
            builder.Register<CombinedObjectLocator>().As<IDroppedObjectLocator>();			
		}
	}
}
