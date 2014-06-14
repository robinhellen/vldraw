using Gee;

namespace Ldraw.Lego.Library
{
	public interface ILibrary : Object
	{
		public abstract Set<string> AllCategories {	owned get;}

		public abstract Collection<LdrawPart> GetPartsByCategory(string? category);

		public abstract Collection<LdrawPart> GetVariantsOf(LdrawPart part);
	}

	public interface IDatFileCache : Object
	{
		public abstract bool TryGetPrimitive(string name, out LdrawPrimitive primitive);

		public abstract bool TryGetHiresPrimitive(string name, out LdrawHiresPrimitive primitive);

		public abstract bool TryGetPart(string name, out LdrawPart part);

		public abstract bool TryGetSubPart(string name, out LdrawSubPart part);
	}

	public interface ILdrawFolders
	{
		public abstract File LibraryDirectory { get; }

		public abstract File PartsDirectory { get; }

		public abstract File SubPartsDirectory { get; }

		public abstract File PrimitivesDirectory { get; }

		public abstract File HiresPrimitivesDirectory { get; }
	}
}