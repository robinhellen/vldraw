using Gee;

using Ldraw.Application;

namespace Ldraw.Lego.Library
{
	public interface ILibrary : Object
	{
		public abstract async Set<string> GetAllCategories();
		public abstract async Collection<IPartMetadata> GetPartsByCategory(string? category);		
		public abstract async void refresh(ProgressReporter reporter);		
		public signal void refreshed();

		public abstract Collection<IPartMetadata> GetVariantsOf(IPartMetadata part);
	}

	public interface IPartMetadata : Object {
		public abstract string Name {get;}
		public abstract string Category {get;}
		public abstract string Description {get;}
		public abstract Collection<string> Keywords {get;}
	}

	public interface IDatFileCache : Object {
		public abstract async bool TryGetPart(string name, out LdrawPart part);
	}

	public interface ILdrawFolders : Object
	{
		public abstract File LibraryDirectory { get; }

		public abstract File PartsDirectory { get; }

		public abstract File SubPartsDirectory { get; }

		public abstract File PrimitivesDirectory { get; }

		public abstract File HiresPrimitivesDirectory { get; }
		
		public abstract File LoresPrimitivesDirectory { get; }

		public abstract File ModelsDirectory {get;}
	}
}
