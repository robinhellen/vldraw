using Diva;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class MoveOriginModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<MoveOriginRefactoring>().as<Refactoring>();
		}
	}
}
