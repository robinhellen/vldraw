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
		public Collection<RenderNodeStrategy> RenderStrategies {get; construct;}
		public FlatStore FlatStore {get; construct;}
		public ShaderProgramFactory ProgramFactory {get; construct;}
		
		static construct 
		{
			var cls = (ObjectClass)typeof(GlRenderer).class_ref();
			set_collection_injection<RenderNodeStrategy>(cls, "RenderStrategies");
		}	
		
		// initialized at preparation time, and then used at render time.
		//	  the program 
		GLuint program = 0;
		//	  uniform parameters to the shaders
		Colour DefaultColour;
		LdrawObject currentModel;
		
		public void Render2(GLContext context,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay,
				float lduWidth, float lduHeight,
				float cameraLongitude, float cameraLatitude,
				float lduScrollX, float lduScrollY)
		{			
			PrepareAllVertexData(currentModel);
			
			var scrollMatrix = glGetUniformLocation(program, "scroll");
			var viewAngleMatrix = glGetUniformLocation(program, "view_angle");
			var scaleMatrix = glGetUniformLocation(program, "scale");
			var lightPosition = glGetUniformLocation(program, "LightPosition_worldspace");
			var lightColour = glGetUniformLocation(program, "LightColor");
			
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
									
			glEnable(GL_BLEND);
			glClearColor(1f,1f,1f,1f);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
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
					var selected = node in selection;
					RenderObject(partNode.Contents, partNode.Transform, partNode.Center, partNode.Colour, selected);
				}
			}
			else
			{
				RenderObject(currentModel, Matrix.Identity, Vector.NullVector, DefaultColour, false);	
			}
			if(overlay != null)
			{
				float modelTransform[16] = 
							{	1, 0, 0, 0, 
								0, 1, 0, 0, 
								0, 0, 1, 0, 
								0, 0, 0, 1
							};
				var modelMatrix = glGetUniformLocation(program, "modelTransform");
				glUniformMatrix4fv(modelMatrix, 1, (GLboolean)GL_FALSE, modelTransform);
				var ctx = new GlDrawingContext();
				overlay.Draw(ctx);
				ctx.Render();
			}
		}
		
		private void RenderObject(LdrawObject o, Matrix transform, Vector offset, Colour colour, bool selected)
		{
			var t = transform; var v = offset;
			float modelTransform[16] = 
						{t[0,0], t[1,0], t[2,0], 0,
						 t[0,1], t[1,1], t[2,1], 0,
						 t[0,2], t[1,2], t[2,2], 0,
						 v.X   , v.Y   , v.Z   , 1};
			var modelMatrix = glGetUniformLocation(program, "modelTransform");
			glUniformMatrix4fv(modelMatrix, 1, (GLboolean)GL_FALSE, modelTransform);
			var defaultColour = glGetUniformLocation(program, "DefaultColour");
			var defaultEdgeColour = glGetUniformLocation(program, "DefaultEdgeColour");
			if(selected)
			{
				glUniform4fv(defaultEdgeColour, 1, {colour.Red / 255f, colour.Green / 255f, colour.Blue / 255f, colour.Alpha / 255f});
				glUniform4fv(defaultColour, 1, {colour.EdgeRed / 255f, colour.EdgeGreen / 255f, colour.EdgeBlue / 255f, colour.Alpha / 255f});
			}
			else
			{
				glUniform4fv(defaultColour, 1, {colour.Red / 255f, colour.Green / 255f, colour.Blue / 255f, colour.Alpha / 255f});
				glUniform4fv(defaultEdgeColour, 1, {colour.EdgeRed / 255f, colour.EdgeGreen / 255f, colour.EdgeBlue / 255f, colour.Alpha / 255f});
			}
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
				4,
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
			glDrawArrays(GL_TRIANGLES, 0, arrays.count / 3);
			
			glBindBuffer(GL_ARRAY_BUFFER, arrays.lineVertexBuffer);
			glVertexAttribPointer(
				0,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glBindBuffer(GL_ARRAY_BUFFER, arrays.lineColourBuffer);
			glVertexAttribPointer(
				1,
				4,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			
			glBindBuffer(GL_ARRAY_BUFFER, arrays.lineNormalBuffer);
			glVertexAttribPointer(
				2,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glDrawArrays(GL_LINES, 0, arrays.lineCount / 3);
		}
				
		public void PrepareRender(LdrawObject model, Colour defaultColour)
		{
			if(program == 0)
			{
				program = ProgramFactory.CreateProgram(ShaderType.Drawing);
				GLuint vao;
				glGenVertexArrays(1, out vao);
				glBindVertexArray(vao);
				glEnable(GL_CULL_FACE);
				glCullFace(GL_BACK);
			}
			
			DefaultColour = defaultColour;
			currentModel = model;
			
		}
		
		Map<LdrawObject, RenderArrays> arrayCache = new HashMap<LdrawObject, RenderArrays>();
		
		private class RenderArrays
		{
			public RenderArrays(GLuint vertexBuffer, GLuint normalBuffer, GLuint colourBuffer, int count,
								GLuint lineVertexBuffer, GLuint lineNormalBuffer, GLuint lineColourBuffer, int lineCount)
			{
				this.vertexBuffer = vertexBuffer;
				this.normalBuffer = normalBuffer;
				this.colourBuffer = colourBuffer;
				this.count = count;
				this.lineVertexBuffer = lineVertexBuffer;
				this.lineNormalBuffer = lineNormalBuffer;
				this.lineColourBuffer = lineColourBuffer;
				this.lineCount = lineCount;
			}
			
			public GLuint vertexBuffer;
			public GLuint normalBuffer;
			public GLuint colourBuffer;
			public int count;
			
			public GLuint lineVertexBuffer;
			public GLuint lineNormalBuffer;
			public GLuint lineColourBuffer;
			public int lineCount;
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
			var nodes = FlatStore[model];
			
			GLuint[] buffers = {0,0,0,0,0,0};
			glGenBuffers(6, buffers);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Vertices, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[1]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Normals, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[2]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * 4 / 3 * sizeof(GLfloat), (GLvoid[]) nodes.Colours, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[3]);
			glBufferData(GL_ARRAY_BUFFER, nodes.LineArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.LineVertices, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[4]);
			glBufferData(GL_ARRAY_BUFFER, nodes.LineArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.LineNormals, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[5]);
			glBufferData(GL_ARRAY_BUFFER, nodes.LineArraySizes * 4 / 3 * sizeof(GLfloat), (GLvoid[]) nodes.LineColours, GL_STATIC_DRAW);
						
			return new RenderArrays(buffers[0], buffers[1], buffers[2], nodes.ArraySizes, buffers[3], buffers[4], buffers[5], nodes.LineArraySizes);
		}
		
	}
	
	private class GlDrawingContext : Object, DrawingContext
	{
		private Collection<float?> vertices = new LinkedList<float?>();
		private Collection<float?> normals  = new LinkedList<float?>();
		private Collection<float?> colours  = new LinkedList<float?>();
		
		public void DrawLine(Vector a, Vector b, Colour colour)
		{
			PushColour(colour, 2, colours);
			PushVector(Vector.NullVector, normals, 2);
			PushVector(a, vertices);
			PushVector(b, vertices);
		}
			
		private void PushColour(Colour colour, int vertices, Collection<float?> target)
		{
			float red = colour.Red / 255f;
			float green = colour.Green / 255f;
			float blue = colour.Blue / 255f;
			float alpha = colour.Alpha / 255f;
			
			for(int i = 0; i < vertices; i++)
			{
				target.add(red);
				target.add(green);
				target.add(blue);
				target.add(alpha);
			}					
		}
		
		private void PushVector(Vector v, Collection<float?> list, int repeats = 1)
		{
			for(int i = 0; i < repeats; i++)
			{
				list.add(v.X);
				list.add(v.Y);
				list.add(v.Z);
			}
		}
		
		public void Render()
		{
			GLfloat[] glVertices = {}; foreach(var f in vertices) {glVertices += f;}
			GLfloat[] glNormals  = {}; foreach(var f in normals) {glNormals  += f;}
			GLfloat[] glColours  = {}; foreach(var f in colours) {glColours  += f;}
			
			GLuint[] buffers = {0,0,0};
			glGenBuffers(3, buffers);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
			glBufferData(GL_ARRAY_BUFFER, vertices.size * sizeof(GLfloat), (GLvoid[]) glVertices, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[1]);
			glBufferData(GL_ARRAY_BUFFER, colours.size * sizeof(GLfloat), (GLvoid[]) glColours, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[2]);
			glBufferData(GL_ARRAY_BUFFER, normals.size * sizeof(GLfloat), (GLvoid[]) glNormals, GL_STATIC_DRAW);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
			glVertexAttribPointer(
				0,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glBindBuffer(GL_ARRAY_BUFFER, buffers[1]);
			glVertexAttribPointer(
				1,
				4,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[2]);
			glVertexAttribPointer(
				2,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glDrawArrays(GL_LINES, 0, vertices.size / 3);
			
			glDeleteBuffers(3, buffers);
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
	
	public interface FlatStore : Object
	{
		public abstract FlattenedNodes @get(LdrawObject part);
		public abstract void Prepare(LdrawObject part);
	}
	
	public interface ShaderProgramFactory : Object
	{
		public abstract GLuint CreateProgram(ShaderType shader);
	}
	
	public enum ShaderType
	{
		Drawing,
		Selection
	}
}
