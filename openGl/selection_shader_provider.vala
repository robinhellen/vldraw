

namespace Ldraw.OpenGl
{
	private class SelectionShaderProvider : ShaderProvider, Object
	{		
		public string VertexShader 
		{
			get
			{
				return vertexShader;
			}
		}
		public string FragmentShader 
		{
			get
			{
				return fragmentShader;
			}
		}
		
		private const string fragmentShader = @"#version 330 core
flat in uint fragmentColour;

out uint color;

uniform vec3 LightColor = vec3(1,1,1);

void main(){
	color = fragmentColour;
}
";
		private const string vertexShader = @"#version 330 core

layout(location = 0) in vec3 vertexPosition_modelspace;

uniform mat4 modelTransform;
uniform uint vertexId;

uniform mat4 scroll;
uniform mat4 scale;
uniform mat4 view_angle;

flat out uint fragmentColour;

void main () {
	vec4 v = vec4(vertexPosition_modelspace, 1);
	
	//vectors necessary for shading
	vec4 Position_worldspace = modelTransform * v;	
	
	// the position
	gl_Position = scale * scroll * view_angle * Position_worldspace;
	
	fragmentColour = vertexId;
}
";
	}
}
