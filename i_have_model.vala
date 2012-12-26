using Ldraw.Lego;

namespace Ldraw
{
	public interface IHaveModel : Object
	{
		public abstract LdrawObject Model { get; protected set;}
	}
}
