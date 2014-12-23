using Ldraw.Utils.Di;

namespace Ldraw.Ui.DragAndDrop
{
	public class DragAndDropModule : Module
	{
		public override void Load(CreatorBuilder builder)
		{
            builder.Register<LibraryObjectLocator>().Keyed<ObjectDropType, IDroppedObjectLocator>(ObjectDropType.Library);
            builder.Register<DocumentObjectLocator>().Keyed<ObjectDropType, IDroppedObjectLocator>(ObjectDropType.Document);
            
            //builder.Register<CombinedObjectLocator>().AsInterface<IDroppedObjectLocator>();
            builder.RegisterAsInterface<CombinedObjectLocator, IDroppedObjectLocator>();			
		}
	}
}
