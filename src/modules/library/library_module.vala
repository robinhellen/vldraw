using Diva;

using Ldraw.Application;
using Ldraw.Library;

namespace Ldraw.Lego.Library
{
	public class LibraryModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{			
            builder.register<FileCachedLibrary>().as<ILibrary>().as<InitializeOnStartup>().single_instance();
            builder.register<LdrawLibrary>().as<ILdrawFolders>();
            builder.register<FoldersFactory>().as<ILdrawFolders.Factory>();
            builder.register<OnDemandPartLoader>().as<IDatFileCache>().single_instance();    
            builder.register<OnDemandSubFileLoader>().single_instance();
            builder.register<SubFileLocator>().single_instance().as<ISubFileLocator>();		
            builder.register<TrackerSubFileLocator>().single_instance().as<ISubFileLocator>();	
            builder.register<PartsTrackerFiles>().single_instance();	
		}
	}
}
