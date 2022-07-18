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
	private class GlRenderer : Object, Renderer
	{
		public Collection<RenderNodeStrategy> RenderStrategies {get; construct;}
		public FlatStore FlatStore {get; construct;}
		public ShaderProgramFactory ProgramFactory {get; construct;}
		public NodeAdjuster NodeAdjuster {get; construct;}
		public RenderCacheMode mode {set{this._mode = value;}}

		static construct
		{
			var cls = (ObjectClass)typeof(GlRenderer).class_ref();
			set_collection_injection<RenderNodeStrategy>(cls, "RenderStrategies");
		}

		// initialized at preparation time, and then used at render time.
		//	  the program
		GLuint program = 0;
		//	  uniform parameters to the shaders
		LdrawObject currentModel;
		RenderCacheMode _mode = RenderCacheMode.CacheWholeModel;

		public void Render(GLContext context,
				Gee.Set<LdrawNode> selection,
				Overlay? overlay,
				ViewParameters viewParameters,
				Colour defaultColour)
		{
			PrepareAllVertexData(currentModel);

			var scaleMatrix = glGetUniformLocation(program, "scale");

			var longTransform = Matrix.ForRotation(Vector(0,1,0), -viewParameters.cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -viewParameters.cameraLatitude);
			
			var m = latTransform.TransformMatrix(longTransform);
			var viewingAngle = new GlMatrix.FromTransformAndTranslation(m, Vector.NullVector);
			var scrollTransform = new GlMatrix.FromTransformAndTranslation(Matrix.Identity, Vector(viewParameters.lduScrollX, viewParameters.lduScrollY, 0));

			float scaleTransform[16] = {2 / viewParameters.lduWidth, 0, 0, 0,
										0, -2 / viewParameters.lduHeight,0, 0,
										0, 0, 0.0001f, 0,
										0, 0, 0, 1};

			glEnable(GL_BLEND);
			glClearColor(1f,1f,1f,1f);
			glLineWidth(2);
			glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
			glUseProgram(program);

			viewingAngle.SetProgramUniform(program, "view_angle");
			scrollTransform.SetProgramUniform(program, "scroll");

			glUniformMatrix4fv(scaleMatrix, 1, (GLboolean)GL_FALSE, scaleTransform);

			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

			glEnableVertexAttribArray(0);
			glEnableVertexAttribArray(1);
			glEnableVertexAttribArray(2);

			switch(_mode)
			{
				case RenderCacheMode.CacheSubModels:
					foreach(var strategy in RenderStrategies)
					{
						strategy.StartModel(currentModel);
					}
					foreach(var node in currentModel.Nodes)
					{
						if(!RenderStrategies.fold<bool>((s, r) => r &= s.ShouldRenderNode(node), true))
							continue;
						var adjustment = NodeAdjuster.GetAdjustmentFor(node);
						var partNode = node as PartNode;
						if(partNode == null)
							continue;
						var selected = node in selection;
						RenderObject(partNode.Contents, partNode.Transform, partNode.Center, partNode.Colour, selected, adjustment);
					}
					break;
				case RenderCacheMode.CacheWholeModel:
					RenderObject(currentModel, Matrix.Identity, Vector.NullVector, defaultColour, false, new GlMatrix.Identity());
					break;
				default:
					assert_not_reached();
			}
			if(overlay != null)
			{
				new GlMatrix.FromTransformAndTranslation(Matrix.Identity, Vector.NullVector)
					.SetProgramUniform(program, "modelTransform");

				var ctx = new GlDrawingContext();
				overlay.Draw(ctx);
				ctx.Render();
			}
		}

		private void RenderObject(LdrawObject o, Matrix transform, Vector offset, Colour colour, bool selected, GlMatrix adjustment)
		{
			var modelTransform = new GlMatrix.FromTransformAndTranslation(transform, offset);
			modelTransform.SetProgramUniform(program, "modelTransform");
			adjustment.SetProgramUniform(program, "animationTransform");

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

		public void PrepareRender(LdrawObject model)
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
			switch(_mode)
			{
				case RenderCacheMode.CacheWholeModel:
					if(!arrayCache.has_key(model))
					{
						arrayCache[model] = PrepareVertexData(model);
						model.VisibleChange.connect(() => arrayCache.unset(model));
					}
					break;
				case RenderCacheMode.CacheSubModels:
					foreach(var node in model.Nodes)
					{
						PartNode partNode = node as PartNode;
						if(partNode == null)
							continue;

						var obj = partNode.Contents;
						if(arrayCache.has_key(obj))
						{
							continue;
						}

						arrayCache[obj] = PrepareVertexData(obj);
						obj.VisibleChange.connect(() => arrayCache.unset(obj));
					}
					break;
				default:
					assert_not_reached();
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

	private class GlDrawingContext : Object, Widgets.DrawingContext
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

    private interface ShaderProvider : Object
    {
		public abstract string VertexShader {get;}
		public abstract string FragmentShader {get;}
	}

	private interface FlatStore : Object
	{
		public abstract FlattenedNodes @get(LdrawObject part);
		public abstract void Prepare(LdrawObject part);
	}

	private interface ShaderProgramFactory : Object
	{
		public abstract GLuint CreateProgram(ShaderType shader);
	}

	private enum ShaderType
	{
		Drawing,
		Selection
	}
}
