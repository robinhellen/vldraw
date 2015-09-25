using Gee;
using Gdk;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui;
using Ldraw.Ui.Widgets;

namespace Ldraw.OpenGl
{
	public class GlRenderer : Object, Renderer
	{
		public IRenderModel ModelRenderer {construct; private get;}
		
		public GlRenderer()
		{
			var m = new FromFlatRenderer();
			Object(ModelRenderer: m);
		}
		
		// initialized at preparation time, and then used at render time.
		//	  vertex information
		GLuint vertexBuffer;
		GLuint vertexColourBuffer;
		GLuint vertexNormals;
		//    how many triangles there are to draw
		int vertexCount;
		//	  the program itself
		GLuint program;
		//	  uniform parameters to the shaders
		GLint scrollMatrix;
		GLint viewAngleMatrix;
		GLint scaleMatrix;
		GLint lightColour;
		GLint lightPosition;
		
		public void Render2(GLContext context,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay,
				float lduWidth, float lduHeight,
				float cameraLongitude, float cameraLatitude,
				float lduScrollX, float lduScrollY)
		{
			var longTransform = Matrix.ForRotation(Vector(0,1,0), -cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -cameraLatitude);
			
			var m = latTransform.TransformMatrix(longTransform);
			float[16] viewingAngle = {m[0,0], m[1,0], m[2,0], 0,
									  m[0,1], m[1,1], m[2,1], 0,
									  m[0,2], m[1,2], m[2,2], 0,
									  0		, 0		, 0		, 1};
			float scrollTransform[16] = {1, 0, 0, 0,
									     0, 1, 0, 0,
									     0, 0, 1, 0,
									     lduScrollX, lduScrollY, 0, 1};
			float scaleTransform[16] = {2 / lduWidth, 0, 0, 0,
										0, -2 / lduHeight,0, 0,
										0, 0, 0.0001f, 0,
										0, 0, 0, 1};
									     
			
			glUseProgram(program);
			 
			glUniformMatrix4fv(viewAngleMatrix, 1, (GLboolean)GL_FALSE, viewingAngle);
			glUniformMatrix4fv(scrollMatrix, 1, (GLboolean)GL_FALSE, scrollTransform);
			glUniformMatrix4fv(scaleMatrix, 1, (GLboolean)GL_FALSE, scaleTransform);
			glUniform3fv(lightColour, 1, {1f,1f,1f});
			glUniform3fv(lightPosition, 1, {-20,-30,-50});
			
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			
			glEnableVertexAttribArray(0);
			glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
			glVertexAttribPointer(
				0,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glEnableVertexAttribArray(1);
			glBindBuffer(GL_ARRAY_BUFFER, vertexColourBuffer);
			glVertexAttribPointer(
				1,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			
			glEnableVertexAttribArray(2);
			glBindBuffer(GL_ARRAY_BUFFER, vertexNormals);
			glVertexAttribPointer(
				2,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glDrawArrays(GL_TRIANGLES, 0, 3 * vertexCount);
			
			glDisableVertexAttribArray(0);			
		}
		
		public void Render(
				GLContext context, Colour defaultColour, 
				Bounds viewArea, Vector eyeline, Vector center, Vector up, 
				LdrawObject model,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay = null)
		{			
			glUseProgram(program);
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		}
				
		public void PrepareRender(LdrawObject model, Colour defaultColour)
		{
			CreateProgram();
			PrepareVertexData(model, defaultColour);
		}
		
		private void PrepareVertexData(LdrawObject model, Colour defaultColour)
		{
			GLuint vao;
			glGenVertexArrays(1, out vao);
			glBindVertexArray(vao);
			var nodes = FlattenedNodes.FlatForObject(model);
			
			var vertices = new LinkedList<VertexInfo?>();
			
			var triangles = nodes.Triangles;
			foreach(var colour in triangles.get_keys())
			{
				foreach(var colouredTri in triangles[colour])
				{
					// calculate normal
					var a = colouredTri.A;
					var b = colouredTri.B;
					var c = colouredTri.C;
					
					var normal = b.Subtract(a).Cross(c.Subtract(a));
					
					var x = VertexInfo(a, normal, colour);
					var y = VertexInfo(b, normal, colour);
					var z = VertexInfo(c, normal, colour);
					vertices.add(x);
					vertices.add(y);
					vertices.add(z);					
				}
			}
			var quads = nodes.Quads;
			foreach(var colour in quads.get_keys())
			{
				foreach(var colouredQuad in quads[colour])
				{
					// calculate normal
					var a = colouredQuad.A;
					var b = colouredQuad.B;
					var c = colouredQuad.C;
					var d = colouredQuad.D;
					
					var normal = b.Subtract(a).Cross(c.Subtract(a));
					
					
					// decompose to triangles
					var x = VertexInfo(a, normal, colour);
					var y = VertexInfo(b, normal, colour);
					var z = VertexInfo(c, normal, colour);
					vertices.add(x);
					vertices.add(y);
					vertices.add(z);
					x = VertexInfo(a, normal, colour);
					y = VertexInfo(c, normal, colour);
					z = VertexInfo(d, normal, colour);
					vertices.add(x);
					vertices.add(y);
					vertices.add(z);						
				}
			}
			vertexCount = vertices.size;
			
			var vertexPositionsList = new LinkedList<float?>();
			var vertexColoursList = new LinkedList<float?>();
			var vertexNormalsList = new LinkedList<float?>();
			
			foreach(var vertex in vertices)
			{
				vertexPositionsList.add(vertex.Position.X);
				vertexPositionsList.add(vertex.Position.Y);
				vertexPositionsList.add(vertex.Position.Z);
				vertex.Colour.UseColour((r,g,b,a) => 
					{
						vertexColoursList.add(r);
						vertexColoursList.add(g);
						vertexColoursList.add(b);
					}, defaultColour);
				vertexNormalsList.add(vertex.Normal.X);
				vertexNormalsList.add(vertex.Normal.Y);
				vertexNormalsList.add(vertex.Normal.Z);
			}
			GLfloat[] vertexData = {};
			vertexPositionsList.foreach(x => {vertexData += x; return true;});
			GLfloat[] vertexColours = {};
			vertexColoursList.foreach(x => {vertexColours += x; return true;});
			GLfloat[] vertexNorms = {};
			vertexNormalsList.foreach(x => {vertexNorms += x; return true;});
			
			glGenBuffers(1, out vertexBuffer);
			glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
			glBufferData(GL_ARRAY_BUFFER, vertexPositionsList.size * sizeof(GLfloat), (GLvoid[]) vertexData, GL_STATIC_DRAW);
			
			glGenBuffers(1, out vertexColourBuffer);
			glBindBuffer(GL_ARRAY_BUFFER, vertexColourBuffer);
			glBufferData(GL_ARRAY_BUFFER, vertexColoursList.size * sizeof(GLfloat), (GLvoid[]) vertexColours, GL_STATIC_DRAW);
			
			glGenBuffers(1, out vertexNormals);
			glBindBuffer(GL_ARRAY_BUFFER, vertexNormals);
			glBufferData(GL_ARRAY_BUFFER, vertexNormalsList.size * sizeof(GLfloat), (GLvoid[]) vertexNorms, GL_STATIC_DRAW);
			
			
			glClearColor(1f,1f,1f,0f);			
		}
		
		private struct VertexInfo
		{
			public VertexInfo(Vector position, Vector normal, RenderColour colour)
			{
				Position = position;
				Normal = normal;
				Colour = colour;
			}
			
			public Vector Position;
			public Vector Normal;
			public RenderColour Colour; // ready for opengl (R,G,B) => (x,y,x), values in range 0 => 1
		}
		
		private void CreateProgram()
		{
			var vertexShader = glCreateShader(GL_VERTEX_SHADER);
			var fragShader = glCreateShader(GL_FRAGMENT_SHADER);
			
			glShaderSource(vertexShader, 1, {vertexShaderSource}, null);
			glCompileShader(vertexShader);
			CheckShaderStatus(vertexShader);
			
			glShaderSource(fragShader, 1, {fragShaderSource}, null);			
			glCompileShader(fragShader);
			CheckShaderStatus(fragShader);
			
			program = glCreateProgram();
			glAttachShader(program, vertexShader);
			glAttachShader(program, fragShader);
			
			glLinkProgram(program);
			CheckProgramStatus(program);
			
			scrollMatrix = glGetUniformLocation(program, "scroll");
			viewAngleMatrix = glGetUniformLocation(program, "view_angle");
			scaleMatrix = glGetUniformLocation(program, "scale");
			lightPosition = glGetUniformLocation(program, "LightPosition_worldspace");
			if(lightPosition == -1)
				stderr.printf(@"Could not get program location for light position.\n");
			lightColour = glGetUniformLocation(program, "LightColor");
			if(lightColour == -1)
				stderr.printf(@"Could not get program location for light colour.\n");
		}
		
		private void CheckShaderStatus(GLuint shader)
		{
			int result;
			glGetShaderiv(shader, GL_COMPILE_STATUS, out result);
			if(result == GL_TRUE)
				return;
			if(result != GL_FALSE)
				assert_not_reached();
			
			stderr.printf("Shader compile error: \n\t");
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
		
		const string vertexShaderSource = @"#version 330 core

layout(location = 0) in vec3 vertexPosition_modelspace;
layout(location = 1) in vec3 vertexColour;
layout(location = 2) in vec3 vertexNormal;
uniform mat4 scroll;
uniform mat4 scale;
uniform mat4 view_angle;
uniform vec3 LightPosition_worldspace = vec3(20,30,50);

out vec3 fragmentColour;
out vec3 Position_worldspace;
out vec3 EyeDirection_cameraspace;
out vec3 Normal_cameraspace;
out vec3 LightDirection_cameraspace;


void main () {
	vec4 v = vec4(vertexPosition_modelspace, 1);
	gl_Position = scale * scroll * view_angle * v;
	
	//vectors necessary for shading
	Position_worldspace = vertexPosition_modelspace;
	
	vec3 vertexPosition_cameraspace = (scroll * view_angle * vec4(vertexPosition_modelspace, 1)).xyz;
	EyeDirection_cameraspace = vec3(0,0,0) - vertexPosition_cameraspace;
	
	vec3 LightPosition_cameraspace = (scroll * view_angle * vec4(LightPosition_worldspace,1)).xyz;
	LightDirection_cameraspace = LightPosition_cameraspace + EyeDirection_cameraspace;
	
	Normal_cameraspace = (scroll * view_angle * vec4(vertexNormal,0)).xyz;	
	
	fragmentColour = vertexColour;
}";
		string fragShaderSource = @"#version 330 core
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
}";
	}
	
	private class GlDrawingContext : Object, DrawingContext
	{
		public void DrawLine(Vector a, Vector b)
		{
			glColor4f(1F, 0F, 0F, 1F);
			glBegin(GL_LINES);

			glVertex3fv(a.value_vector());
			glVertex3fv(b.value_vector());

			glEnd();
		}
	}
	
	public class StandardModelRenderer : Object, IRenderModel
	{
		public void RenderModel(LdrawObject model, Colour colour, Vector finalEyeline, Gee.Set<LdrawNode> selection)
		{
			GlBuilder builder = new GlBuilder(colour, finalEyeline, Gee.Map.empty<string, float?>(), selection);
			model.BuildFromFile<void>(builder);	
			
			builder.Flush();		
		}
	}
	
	public interface IRenderModel : Object
	{
		public abstract void RenderModel(LdrawObject object, Colour colour, Vector finalEyeline, Gee.Set<LdrawNode> selection);			
	}
}
