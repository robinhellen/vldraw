using Diva;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class MoveOriginModule : Object
	{
		public void Load(ContainerBuilder builder)
		{
            builder.Register<MoveOriginRefactoring>().As<Refactoring>();
		}
	}
}
