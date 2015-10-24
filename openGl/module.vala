using Diva;

using Ldraw.Lego;
using Ldraw.OpenGl;
using Ldraw.Ui;

namespace Ldraw
{
	public class OpenGlModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<StandardShaderProvider>().keyed<ShaderProvider, ShaderType>(ShaderType.Drawing);
			builder.register<SelectionShaderProvider>().keyed<ShaderProvider, ShaderType>(ShaderType.Selection);
			builder.register<BfcCommandFactory>().keyed<CommandFactory, string>("BFC");
			builder.register<GlShaderProgramFactory>().as<ShaderProgramFactory>();
			builder.register<CachingFlatStore>().as<FlatStore>();
			builder.register<FramebufferGlSelector>().as<GlSelector>();
			builder.register<DefaultNodeAdjuster>().as<NodeAdjuster>();
		}
	}
}
