using Diva;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class MoveOriginModule : Module
	{
		public override void Load(ContainerBuilder builder)
		{
            builder.Register<MoveOriginRefactoring>().As<Refactoring>();
		}
	}
}
