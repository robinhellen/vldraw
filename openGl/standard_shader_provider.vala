

namespace Ldraw.OpenGl
{
	private class StandardShaderProvider : ShaderProvider, Object
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
in vec3 fragmentColour;
in vec3 Position_worldspace;
in vec3 EyeDirection_cameraspace;
in vec3 Normal_cameraspace;
in vec3 LightDirection_cameraspace;

out vec4 color;

uniform vec3 LightColor = vec3(1,1,1);

void main(){
	vec3 n = normalize(Normal_cameraspace);
	vec3 l = normalize(LightDirection_cameraspace);
	float cosTheta = clamp(dot(n,l),0,1);
	
	vec3 E = normalize(EyeDirection_cameraspace);
	vec3 R = reflect(l,n);
	float cosAlpha = clamp(dot(E,R),0,1);
	
	vec3 diffuseColour = fragmentColour * LightColor * cosTheta; // TODO: Fall-off with distance from light source
	vec3 ambientColour = fragmentColour * vec3(0.1,0.1,0.1);
	//vec3 specularColour = fragmentColour * LightColor * pow(cosAlpha,5);
	//vec3 ambientColour = vec3(0,0,0);
	vec3 specularColour = vec3(0,0,0);
	color.xyz = diffuseColour + ambientColour + specularColour;
	color.a = 1;
}
";
		private const string vertexShader = @"#version 330 core

layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 1) in vec3 vertexColour;
layout(location = 2) in vec3 vertexNormal;

uniform mat4 modelTransform;

uniform mat4 scroll;
uniform mat4 scale;
uniform mat4 view_angle;
uniform vec3 LightPosition_worldspace = vec3(20,30,50);
uniform vec4 DefaultColour;
uniform vec4 DefaultEdgeColour;

out vec3 fragmentColour;
out vec3 Position_worldspace;
out vec3 EyeDirection_cameraspace;
out vec3 Normal_cameraspace;
out vec3 LightDirection_cameraspace;


void main () {
	vec4 v = vec4(vertexPosition_modelspace, 1);
	
	//vectors necessary for shading
	Position_worldspace = (modelTransform * v).xyz;
	
	vec3 vertexPosition_cameraspace = (scroll * view_angle * modelTransform * vec4(vertexPosition_modelspace, 1)).xyz;
	EyeDirection_cameraspace = vec3(0,0,0) - vertexPosition_cameraspace;
	
	vec3 LightPosition_cameraspace = (scroll * view_angle * vec4(LightPosition_worldspace,1)).xyz;
	LightDirection_cameraspace = LightPosition_cameraspace + EyeDirection_cameraspace;
	
	Normal_cameraspace = (scroll * view_angle * modelTransform * vec4(vertexNormal,0)).xyz;
	
	// the position
	gl_Position = scale * scroll * view_angle * vec4(Position_worldspace, 1);
	
	// use the defualt colour if necessary.	
	if(vertexColour.x == -1f)
		fragmentColour = DefaultColour.xyz;
	else if(vertexColour.x == -2f)
		fragmentColour = DefaultEdgeColour.xyz;
	else
		fragmentColour = vertexColour;
}
";
	}
}
