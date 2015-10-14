using Diva;
using Gee;
using GL;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.Ui;

namespace Ldraw.OpenGl
{
	private class FramebufferGlSelector : Object, GlSelector
	{
		public Collection<RenderNodeStrategy> RenderStrategies {get; construct;}
		public ShaderProgramFactory ProgramFactory {get; construct;}
		public FlatStore FlatStore {get; construct;}
		
		static construct 
		{
			var cls = (ObjectClass)typeof(FramebufferGlSelector).class_ref();
			set_collection_injection<RenderNodeStrategy>(cls, "RenderStrategies");
		}
				
		public LdrawNode? SelectAt(int x,int y,LdrawObject model,
							int width, int height,
							float lduViewWidth, float lduViewHeight, // scale
						    float cameraLongitude, float cameraLatitude,
						    float lduScrollX, float lduScrollY)
		{
			CheckGlError("Entering selection method.");
			GLuint[] framebuffer = {0};
			glGenFramebuffers(1, framebuffer);
			CheckGlError("Generating framebuffer.");
			glBindFramebuffer(GL_FRAMEBUFFER, framebuffer[0]);
			CheckGlError("Binding framebuffer.");
			
			GLuint[] renderbuffer = {0, 0};
			glGenRenderbuffers(2, renderbuffer);
			CheckGlError("Generating renderbuffer.");
			glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer[0]);
			CheckGlError("Binding colour renderbuffer.");
			glRenderbufferStorage(GL_RENDERBUFFER, GL_R16UI, width, height);
			CheckGlError("Assigning storage to colour renderbuffer.");
			glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, renderbuffer[0]);
			CheckGlError("Attaching colour renderbuffer to framebuffer.");
			
			glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer[1]);
			CheckGlError("Binding depth renderbuffer.");
			glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT, width, height);
			CheckGlError("Assigning storage to depth renderbuffer");
			glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, renderbuffer[1]);
			
			CheckGlError("Attaching depth renderbuffer to framebuffer.");
			
			glDrawBuffers(1, {GL_COLOR_ATTACHMENT0});
			glViewport(0,0,width, height);
			
			var program = ProgramFactory.CreateProgram(ShaderType.Selection);
			
			var scrollMatrix = glGetUniformLocation(program, "scroll");
			var viewAngleMatrix = glGetUniformLocation(program, "view_angle");
			var scaleMatrix = glGetUniformLocation(program, "scale");
			var modelMatrix = glGetUniformLocation(program, "modelTransform");
			var nodeIndex = glGetUniformLocation(program, "vertexId");
			
			CheckGlError("Created program.");
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
			float scaleTransform[16] = {2 / lduViewWidth, 0, 0, 0,
										0, -2 / lduViewHeight,0, 0,
										0, 0, 0.0001f, 0,
										0, 0, 0, 1};
									
			glClearColor(1f,1f,1f,1f);
			glUseProgram(program);
			 
			glUniformMatrix4fv(viewAngleMatrix, 1, (GLboolean)GL_FALSE, viewingAngle);
			glUniformMatrix4fv(scrollMatrix, 1, (GLboolean)GL_FALSE, scrollTransform);
			glUniformMatrix4fv(scaleMatrix, 1, (GLboolean)GL_FALSE, scaleTransform);
			
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			
			glEnableVertexAttribArray(0);
			glEnableVertexAttribArray(1);
			glEnableVertexAttribArray(2);
			
			if(model.File is LdrawModelFile)
			{
				foreach(var strategy in RenderStrategies)
				{
					strategy.StartModel(model);
				}
				uint i = 0;
				foreach(var node in model.Nodes)
				{
					glUniform1uiv(nodeIndex, 1, {i});
					i++;
					if(!RenderStrategies.fold<bool>((s, r) => r &= s.ShouldRenderNode(node), true))
						continue;
					var partNode = node as PartNode;
					if(partNode == null)
						continue;
					RenderObject(partNode.Contents, partNode.Transform, partNode.Center, modelMatrix);
				}
			}
			else
			{
				RenderObject(model, Matrix.Identity, Vector.NullVector, modelMatrix);	
			}
			CheckGlError("After rendering, before checking framebuffer.");
			
			var status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
			if(status != GL_FRAMEBUFFER_COMPLETE)
			{
				stderr.printf(@"Framebuffer error: $(status)\n");
				return null;
			}
			
			GLushort[] result = {0};
			glReadPixels(x, y, 1, 1, GL_RED_INTEGER, GL_UNSIGNED_SHORT, (GLvoid [])result);
			
			stderr.printf(@"Selected node at index: $(result[0]).\n");
			
			if(result[0] > model.Nodes.size)
				return null;
			return model.Nodes[result[0]];			
		}
		
		private void RenderObject(LdrawObject o, Matrix transform, Vector offset, GLint modelMatrix)
		{
			var t = transform; var v = offset;
			float modelTransform[16] = 
						{t[0,0], t[1,0], t[2,0], 0,
						 t[0,1], t[1,1], t[2,1], 0,
						 t[0,2], t[1,2], t[2,2], 0,
						 v.X   , v.Y   , v.Z   , 1};
			glUniformMatrix4fv(modelMatrix, 1, (GLboolean)GL_FALSE, modelTransform);
						
			var nodes = FlatStore[o];
			
			GLuint[] buffers = {0};
			glGenBuffers(1, buffers);
			
			glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
			glBufferData(GL_ARRAY_BUFFER, nodes.ArraySizes * sizeof(GLfloat), (GLvoid[]) nodes.Vertices, GL_STATIC_DRAW);
						
			glBindBuffer(GL_ARRAY_BUFFER, buffers[0]);
			glVertexAttribPointer(
				0,
				3,
				GL_FLOAT,
				(GLboolean) GL_FALSE,
				0,
				null
			);
			glDrawArrays(GL_TRIANGLES, 0, nodes.ArraySizes / 3);
		}
		
		private void CheckGlError(string location)
		{
			var error = glGetError();
			if(error == GL_NO_ERROR)
				return;
			
			stderr.printf(@"GL error $location: ");
			switch(error)
			{
				case GL_INVALID_ENUM:
					stderr.printf("Invalid enum value.\n");
					break;
				case GL_INVALID_VALUE:
					stderr.printf("Invalid argument value.\n");
					break;
				case GL_INVALID_OPERATION:
					stderr.printf("Invalid operation.\n");
					break;
				case GL_INVALID_FRAMEBUFFER_OPERATION:
					stderr.printf("Invalid framebuffer operation.\n");
					break;
				case GL_OUT_OF_MEMORY:
					stderr.printf("OOM\n");
					break;
				case GL_STACK_OVERFLOW:
					stderr.printf("Stack overflow.\n");
					break;
				case GL_STACK_UNDERFLOW:
					stderr.printf("Stack underflow.\n");
					break;
				default:
					stderr.printf(@"Other error: $error\n");
					break;
			}
		}
	}
}

