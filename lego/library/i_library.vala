using Gee;

namespace Ldraw.Lego.Library
{
	public interface ILibrary : Object
	{
		public abstract Set<string> AllCategories {	owned get;}

		public abstract Collection<LdrawPart> GetPartsByCategory(string? category);

		public abstract Collection<LdrawPart> GetVariantsOf(LdrawPart part);
	}
}
