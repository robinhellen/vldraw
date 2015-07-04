using Diva;

using Ldraw.Lego;
using Ldraw.Steps;

namespace Ldraw
{
	public class StepsModule : Object
	{
		public void Load(ContainerBuilder builder)
		{
			builder.Register<StepCommandFactory>()
					.Keyed<CommandFactory, string>("STEP");
		}
	}
}
