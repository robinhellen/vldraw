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
		public Collection<RenderNodeStrategy> RenderStrategies {get; construct;}
		
		static construct 
		{
			var cls = (ObjectClass)typeof(GlRenderer).class_ref();
			set_indexed_injection<ShaderType, ShaderProvider>(cls, "ShaderProviders");
			set_collection_injection<RenderNodeStrategy>(cls, "RenderStrategies");
		}	
		
		// initialized at preparation time, and then used at render time.
		//	  the program 
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
		LdrawObject currentModel;
		
		public void Render2(GLContext context,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay,
				float lduWidth, float lduHeight,
				float cameraLongitude, float cameraLatitude,
				float lduScrollX, float lduScrollY)
		{
			var longTransform = Matrix.ForRotation(Vector(0,1,0), -cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -cameraLatitude);
			
			var lightLongitude = cameraLongitude + 5;
			var lightLatitude = cameraLatitude + 5;
			var lightPos = Matrix.ForRotation(Vector(1,0,0), lightLatitude)
						.TransformMatrix(Matrix.ForRotation(Vector(0,1,0), lightLongitude))
						.TransformVector(Vector(0,0,-currentModel.BoundingBox.Radius));
			
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
			glUniform3fv(lightPosition, 1, {lightPos.X,lightPos.Y,lightPos.Z});
			
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			
			glEnableVertexAttribArray(0);
			glEnableVertexAttribArray(1);
			glEnableVertexAttribArray(2);
			
			if(currentModel.File is LdrawModelFile)
			{
				foreach(var strategy in RenderStrategies)
				{
					strategy.StartModel(currentModel);
				}
				foreach(var node in currentModel.Nodes)
				{
					if(!RenderStrategies.fold<bool>((s, r) => r &= s.ShouldRenderNode(node), true))
						continue;
					var partNode = node as PartNode;
					if(partNode == null)
						continue;
					RenderObject(partNode.Contents, partNode.Transform, partNode.Center, partNode.Colour);
				}
			}
			else
			{
				RenderObject(currentModel, Matrix.Identity, Vector.NullVector, DefaultColour);	
			}
		}
		
		private void RenderObject(LdrawObject o, Matrix transform, Vector offset, Colour colour)
		{
			var t = transform; var v = offset;
			float modelTransform[16] = 
						{t[0,0], t[1,0], t[2,0], 0,
						 t[0,1], t[1,1], t[2,1], 0,
						 t[0,2], t[1,2], t[2,2], 0,
						 v.X   , v.Y   , v.Z   , 1};
			glUniformMatrix4fv(modelMatrix, 1, (GLboolean)GL_FALSE, modelTransform);
			glUniform4fv(defaultColour, 1, {colour.Red / 255f, colour.Green / 255f, colour.Blue / 255f, colour.Alpha / 255f});
			glUniform4fv(defaultEdgeColour, 1, {colour.EdgeRed / 255f, colour.EdgeGreen / 255f, colour.EdgeBlue / 255f, colour.Alpha / 255f});
		
			var arrays = arrayCache[o];
			glBindBuffer(GL_ARRAY_BUFFER, arrays.vertexBuffer);
			glVertexAttribPointer(
				0,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glBindBuffer(GL_ARRAY_BUFFER, arrays.colourBuffer);
			glVertexAttribPointer(
				1,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			
			glBindBuffer(GL_ARRAY_BUFFER, arrays.normalBuffer);
			glVertexAttribPointer(
				2,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glDrawArrays(GL_TRIANGLES, 0, arrays.count);
		}
				
		public void PrepareRender(LdrawObject model, Colour defaultColour)
		{
			CreateProgram();
			GLuint vao;
			glGenVertexArrays(1, out vao);
			glBindVertexArray(vao);
			PrepareAllVertexData(model);
			
			DefaultColour = defaultColour;
			currentModel = model;
			
			glEnable(GL_CULL_FACE);
			glCullFace(GL_BACK);
		}
		
		static Map<LdrawObject, FlattenedNodes> cache = new HashMap<LdrawObject, FlattenedNodes>();
		Map<LdrawObject, RenderArrays> arrayCache = new HashMap<LdrawObject, RenderArrays>();
		
		private class RenderArrays
		{
			public RenderArrays(GLuint vertexBuffer, GLuint normalBuffer, GLuint colourBuffer, int count)
			{
				this.vertexBuffer = vertexBuffer;
				this.normalBuffer = normalBuffer;
				this.colourBuffer = colourBuffer;
				this.count = count;
			}
			
			public GLuint vertexBuffer;
			public GLuint normalBuffer;
			public GLuint colourBuffer;
			public int count;
		}
		
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
		
		private void PrepareAllVertexData(LdrawObject model)
		{
			if(!(model.File is LdrawModelFile))
			{
				arrayCache[model] = PrepareVertexData(model);
				return;
			}
			
			foreach(var node in model.Nodes)
			{
				PartNode partNode = node as PartNode;
				if(partNode == null)
					continue;
				
				var obj = partNode.Contents;
				if(arrayCache.has_key(obj))
					continue;
				
				arrayCache[obj] = PrepareVertexData(obj);
			}
		}
		
		private RenderArrays PrepareVertexData(LdrawObject model)
		{
			var nodes = FlattenObject(model);
			
			GLuint[] buffers = {0,0,0};
			glGenBuffers(3, buffers);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Vertices, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[1]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Normals, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[2]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Colours, GL_STATIC_DRAW);
			
			glClearColor(1f,1f,1f,0f);
			
			return new RenderArrays(buffers[0], buffers[1], buffers[2], nodes.ArraySizes);
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
