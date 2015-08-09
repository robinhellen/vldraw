using Diva;

using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Steps;
using Ldraw.Ui;

namespace Ldraw
{
	public class StepsModule : Module
	{
		public override void Load(ContainerBuilder builder)
		{
			builder.Register<StepCommandFactory>()
					.Keyed<CommandFactory, string>("STEP");
			builder.Register<StepModel>().SingleInstance();
			builder.Register<StepToolbar>().As<ToolbarProvider>();
			builder.Register<HideLaterStepsStrategy>().As<RenderNodeStrategy>();
		}
	}
}
