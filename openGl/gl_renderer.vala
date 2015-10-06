using Diva;
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
		public Index<ShaderProvider, ShaderType> ShaderProviders {get; construct;}
		
		static construct 
		{
			var cls = (ObjectClass)typeof(GlRenderer).class_ref();
			set_indexed_injection<ShaderType, ShaderProvider>(cls, "ShaderProviders");
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
		GLint modelMatrix;
		GLint lightColour;
		GLint lightPosition;
		GLint defaultColour;
		GLint defaultEdgeColour;
		Colour DefaultColour;
		
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
			float modelTransform[16] = {1, 0, 0, 0,
									    0, 1, 0, 0,
									    0, 0, 1, 0,
									    0, 0, 0, 1};
			
									     
			
			glUseProgram(program);
			 
			glUniformMatrix4fv(viewAngleMatrix, 1, (GLboolean)GL_FALSE, viewingAngle);
			glUniformMatrix4fv(scrollMatrix, 1, (GLboolean)GL_FALSE, scrollTransform);
			glUniformMatrix4fv(scaleMatrix, 1, (GLboolean)GL_FALSE, scaleTransform);
			glUniformMatrix4fv(modelMatrix, 1, (GLboolean)GL_FALSE, modelTransform);
			glUniform3fv(lightColour, 1, {1f,1f,1f});
			glUniform3fv(lightPosition, 1, {-20,-30,-50});
			glUniform4fv(defaultColour, 1, {DefaultColour.Red / 255f, DefaultColour.Green / 255f, DefaultColour.Blue / 255f, DefaultColour.Alpha / 255f});
			glUniform4fv(defaultEdgeColour, 1, {DefaultColour.EdgeRed / 255f, DefaultColour.EdgeGreen / 255f, DefaultColour.EdgeBlue / 255f, DefaultColour.Alpha / 255f});
			
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
				
		public void PrepareRender(LdrawObject model, Colour defaultColour)
		{
			CreateProgram();
			GLuint vao;
			glGenVertexArrays(1, out vao);
			glBindVertexArray(vao);
			PrepareVertexData(model, defaultColour);
		}
		
		static Map<LdrawObject, FlattenedNodes> cache = new HashMap<LdrawObject, FlattenedNodes>();
		
		private FlattenedNodes FlattenObject(LdrawObject model)
		{
			var cached = cache[model];
			if(cached == null)
			{
				var flats = FlattenedNodes.FlatForObject(model);
				cache[model] = flats;
				cached = flats;
				model.VisibleChange.connect(() => cache.unset(model));
			}
			return cached;
		}
		
		/*private void PrepareAllVertexData(LdrawObject model, Colour defaultColour)
		{
			foreach(var node in 
		}*/
		
		private void PrepareVertexData(LdrawObject model, Colour defaultColour)
		{
			var nodes = FlattenObject(model);
			
			GLuint[] buffers = {0,0,0};
			glGenBuffers(3, buffers);	
			vertexBuffer = buffers[0];
			vertexColourBuffer = buffers[1];
			vertexNormals = buffers[2];	
			vertexCount = nodes.ArraySizes;	
			
			glBindBuffer(GL_ARRAY_BUFFER, vertexBuffer);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Vertices, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, vertexColourBuffer);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Colours, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, vertexNormals);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Normals, GL_STATIC_DRAW);
			
			glClearColor(1f,1f,1f,0f);
			
			DefaultColour = defaultColour;
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
			var shaderProvider = ShaderProviders[ShaderType.Drawing];
			
			var vertexShader = glCreateShader(GL_VERTEX_SHADER);
			var fragShader = glCreateShader(GL_FRAGMENT_SHADER);
			
			glShaderSource(vertexShader, 1, {shaderProvider.VertexShader}, null);
			glCompileShader(vertexShader);
			CheckShaderStatus(vertexShader);
			
			glShaderSource(fragShader, 1, {shaderProvider.FragmentShader}, null);			
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
			lightColour = glGetUniformLocation(program, "LightColor");
			defaultColour = glGetUniformLocation(program, "DefaultColour");
			defaultEdgeColour = glGetUniformLocation(program, "DefaultEdgeColour");
			modelMatrix = glGetUniformLocation(program, "modelTransform");
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
	
	public interface RenderNodeStrategy : Object
    {
        public abstract void StartModel(LdrawObject object);            
        public abstract bool ShouldRenderNode(LdrawNode node);
    }
    
    public interface ShaderProvider : Object
    {
		public abstract string VertexShader {get;}
		public abstract string FragmentShader {get;}
	}
	
	public enum ShaderType
	{
		Drawing,
		Selection
	}
}
