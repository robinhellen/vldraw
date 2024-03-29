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
				
		public Set<LdrawNode> SelectAt(
							int selectionLeft, int selectionTop,
							int selectionRight, int selectionBottom,
							LdrawObject model,
							int width, int height,
							ViewParameters viewParameters)
		{
			GLuint[] framebuffer = {0};
			glGenFramebuffers(1, framebuffer);
			glBindFramebuffer(GL_FRAMEBUFFER, framebuffer[0]);
			
			GLuint[] renderbuffer = {0, 0};
			glGenRenderbuffers(2, renderbuffer);
			glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer[0]);
			glRenderbufferStorage(GL_RENDERBUFFER, GL_R16UI, width, height);
			glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_RENDERBUFFER, renderbuffer[0]);
			
			glBindRenderbuffer(GL_RENDERBUFFER, renderbuffer[1]);
			glRenderbufferStorage(GL_RENDERBUFFER, GL_DEPTH_COMPONENT, width, height);
			glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER, renderbuffer[1]);
			
			glDrawBuffers(1, {GL_COLOR_ATTACHMENT0});
			glViewport(0,0,width, height);
			
			var program = ProgramFactory.CreateProgram(ShaderType.Selection);
			
			var scaleMatrix = glGetUniformLocation(program, "scale");
			var nodeIndex = glGetUniformLocation(program, "vertexId");
			
			var longTransform = Matrix.ForRotation(Vector(0,1,0), -viewParameters.cameraLongitude);
			var latTransform = Matrix.ForRotation(Vector(1,0,0), -viewParameters.cameraLatitude);
			
			var m = latTransform.TransformMatrix(longTransform);
			var viewingAngle = new GlMatrix.FromTransformAndTranslation(m, Vector.NullVector);
			var scrollTransform = new GlMatrix.FromTransformAndTranslation(Matrix.Identity, Vector(viewParameters.lduScrollX, viewParameters.lduScrollY, 0));
			
			float scaleTransform[16] = {2 / viewParameters.lduWidth, 0, 0, 0,
										0, -2 / viewParameters.lduHeight,0, 0,
										0, 0, 0.0001f, 0,
										0, 0, 0, 1};
									
			glClearColor(1f,1f,1f,1f);
			glUseProgram(program);
			
			viewingAngle.SetProgramUniform(program, "view_angle");
			scrollTransform.SetProgramUniform(program, "scroll");
			glUniformMatrix4fv(scaleMatrix, 1, (GLboolean)GL_FALSE, scaleTransform);
			
			glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
			
			glEnableVertexAttribArray(0);
			glEnableVertexAttribArray(1);
			glEnableVertexAttribArray(2);
			
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
				RenderObject(partNode.Contents, partNode.Transform, partNode.Center, program);
			}
		
			var status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
			if(status != GL_FRAMEBUFFER_COMPLETE)
			{
				stderr.printf(@"Framebuffer error: $(status)\n");
				glDeleteRenderbuffers(2, renderbuffer);
				glDeleteFramebuffers(1, framebuffer);
				return Set.empty<LdrawNode>();
			}
			
			var lassoWidth = int.max(selectionRight - selectionLeft, 1);
			var lassoHeight = int.max(selectionBottom - selectionTop, 1);
			GLushort[] result = new GLushort[(lassoWidth + 1) * (lassoHeight + 1)];
			glReadPixels(selectionLeft, height - selectionBottom, lassoWidth, lassoHeight, GL_RED_INTEGER, GL_UNSIGNED_SHORT, (GLvoid [])result);
			glDeleteRenderbuffers(2, renderbuffer);
			glDeleteFramebuffers(1, framebuffer);
			
			var selected = new HashSet<LdrawNode>();
			for(int j = 0; j < (lassoHeight * lassoWidth); j++)
			{
				var index = result[j];
				if(index < 0 || index >= model.Nodes.size)
					continue;
				
				selected.add(model.Nodes[index]);
			}
			return selected;			
		}
		
		private void RenderObject(LdrawObject o, Matrix transform, Vector offset, GLuint program)
		{
			var modelTransform = new GlMatrix.FromTransformAndTranslation(transform, offset);
			modelTransform.SetProgramUniform(program, "modelTransform");
						
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
	}
}

