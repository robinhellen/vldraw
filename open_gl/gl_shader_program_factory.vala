using Diva;
using GL;

namespace Ldraw.OpenGl
{
	private class GlShaderProgramFactory : Object, ShaderProgramFactory
	{		
		public Index<ShaderProvider, ShaderType> ShaderProviders {get; construct;}
		
		static construct 
		{
			var cls = (ObjectClass)typeof(GlShaderProgramFactory).class_ref();
			set_indexed_injection<ShaderType, ShaderProvider>(cls, "ShaderProviders");
		}
			
		public GLuint CreateProgram(ShaderType shader)
		{
			var shaderProvider = ShaderProviders[shader];
			
			var vertexShader = glCreateShader(GL_VERTEX_SHADER);
			var fragShader = glCreateShader(GL_FRAGMENT_SHADER);
			
			glShaderSource(vertexShader, 1, {shaderProvider.VertexShader}, null);
			glCompileShader(vertexShader);
			CheckShaderStatus(vertexShader, "Vertex Shader");
			
			glShaderSource(fragShader, 1, {shaderProvider.FragmentShader}, null);			
			glCompileShader(fragShader);
			CheckShaderStatus(fragShader, "Fragment Shader");
			
			var program = glCreateProgram();
			glAttachShader(program, vertexShader);
			glAttachShader(program, fragShader);
			
			glLinkProgram(program);
			CheckProgramStatus(program);
			return program;			
		}
		
		private void CheckShaderStatus(GLuint shader, string shaderName)
		{
			int result;
			glGetShaderiv(shader, GL_COMPILE_STATUS, out result);
			if(result == GL_TRUE)
				return;
			if(result != GL_FALSE)
				assert_not_reached();
			
			stderr.printf(@"Shader compile error in $shaderName: \n\t");
			int log_length;
			glGetShaderiv(shader, GL_INFO_LOG_LENGTH, out log_length);
			var buffer = new char[log_length];
			glGetShaderInfoLog(shader, log_length, null, buffer);
			for(int i = 0; i < log_length; i++){stderr.printf(@"$(buffer[i])");}
			
			stderr.printf("\n");
		}
		
		private void CheckProgramStatus(GLuint program)
		{
			int result;
			glGetProgramiv(program, GL_LINK_STATUS, out result);
			if(result == GL_TRUE)
				return;
			if(result != GL_FALSE)
				assert_not_reached();
			
			stderr.printf("Program link error: \n\t");
			 
			int log_length;
			glGetProgramiv(program, GL_INFO_LOG_LENGTH, out log_length);
			var buffer = new char[log_length];
			glGetProgramInfoLog(program, log_length, null, buffer);
			for(int i = 0; i < log_length; i++){stderr.printf(@"$(buffer[i])");}
			
			stderr.printf("\n");
		}
	}
}
