using Diva;

using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Steps;
using Ldraw.Ui;

namespace Ldraw
{
	public class StepsModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<StepCommandFactory>()
					.keyed<CommandFactory, string>("STEP");
			builder.register<StepModel>().single_instance();
			builder.register<StepToolbar>().as<ToolbarProvider>();
			builder.register<HideLaterStepsStrategy>().as<RenderNodeStrategy>();
		}
	}
}
