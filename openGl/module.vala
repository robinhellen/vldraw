using Diva;

using Ldraw.OpenGl;

namespace Ldraw
{
	public class OpenGlModule : Module
	{
		public override void load(ContainerBuilder builder)
		{
			builder.register<StandardShaderProvider>().keyed<ShaderProvider, ShaderType>(ShaderType.Drawing);
		}
	}
}
