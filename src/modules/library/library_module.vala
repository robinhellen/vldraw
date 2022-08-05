using Diva;

using Ldraw.Application;

namespace Ldraw.Lego.Library
{
	public class LibraryModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{			
            builder.register<FileCachedLibrary>().as<ILibrary>().as<InitializeOnStartup>().single_instance();
            builder.register<LdrawLibrary>().as<ILdrawFolders>();
            builder.register<OnDemandPartLoader>().as<IDatFileCache>().single_instance();    
            builder.register<OnDemandSubFileLoader>().single_instance().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);
		
		}
	}
}
