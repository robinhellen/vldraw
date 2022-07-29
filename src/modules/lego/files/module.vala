using Diva;

using Ldraw.Lego.Library;

namespace Ldraw.Lego
{
	public class LegoModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<LdrawLibrary>().as<ILdrawFolders>();
            builder.register<LdrawFileLoader>();
            builder.register<FileReaderFactory>();
            builder.register<LdrawParser>();
            builder.register<OnDemandPartLoader>().as<IDatFileCache>().single_instance();
            builder.register<LibrarySubFileLocator>().single_instance().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.PartsOnly);
            builder.register<OnDemandSubFileLoader>().single_instance().keyed<ISubFileLocator, ReferenceLoadStrategy>(ReferenceLoadStrategy.SubPartsAndPrimitives);
		}
	}
}
