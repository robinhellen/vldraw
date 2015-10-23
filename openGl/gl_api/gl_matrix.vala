using GL;

using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	private class GlMatrix : Object
	{
		private float values[16];
		
		public GlMatrix.FromTransformAndTranslation(Matrix transform, Vector translation)
		{
			values = {transform[0,0], transform[1,0], transform[2,0], 0,
					  transform[0,1], transform[1,1], transform[2,1], 0,
					  transform[0,2], transform[1,2], transform[2,2], 0,
					  translation.X , translation.Y , translation.Z , 1};
		}
		
		public void SetProgramUniform(GLuint program, string uniformName)
		{			
			var uniform = glGetUniformLocation(program, uniformName);
			glUniformMatrix4fv(uniform, 1, (GLboolean)GL_FALSE, values);
		}
	}
}
