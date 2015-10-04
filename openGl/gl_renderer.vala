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
				
		public void PrepareRender(LdrawObject model, Colour defaultColour)
		{
			CreateProgram();
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
		
		private void PrepareVertexData(LdrawObject model, Colour defaultColour)
		{
			GLuint vao;
			glGenVertexArrays(1, out vao);
			glBindVertexArray(vao);
			var nodes = FlattenObject(model);
			
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
