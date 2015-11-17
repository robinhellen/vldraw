using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	public class FlattenedNodes : Object
	{
		public float[] Vertices {get; private set;}
		public float[] Normals {get; private set;}
		public float[] Colours {get; private set;}
		public int ArraySizes {get; private set;}
		
		public float[] LineVertices {get; private set;}
		public float[] LineNormals {get; private set;}
		public float[] LineColours {get; private set;}
		public int LineArraySizes {get; private set;}
		
		public static FlattenedNodes FlatForObject(LdrawObject obj)
		{
			return new NodeFlattenerVisitor().Visit(obj);
		}
		
		private class NodeFlattenerVisitor : LdrawVisitor<FlattenedNodes>
		{
			public Collection<float?> Vertices {get; private set;}
			public Collection<float?> Normals {get; private set;}
			public Collection<float?> Colours {get; private set;}
			
			public Collection<float?> LineVertices {get; private set;}
			public Collection<float?> LineNormals {get; private set;}
			public Collection<float?> LineColours {get; private set;}
			
			private SavedState state;
			
			public override void Initialize()
			{
				Vertices = new LinkedList<float?>();
				Normals = new LinkedList<float?>();
				Colours = new LinkedList<float?>();
				LineVertices = new LinkedList<float?>();
				LineNormals = new LinkedList<float?>();
				LineColours = new LinkedList<float?>();
				
				state = new SavedState();
			}
			
			public override FlattenedNodes GetResult(LdrawObject object)
			{
				var flat = new FlattenedNodes();
				float[] temp = {};
				foreach(var f in Vertices) temp += f;
				flat.Vertices = temp;
				temp = {};
				foreach(var f in Normals) temp += f;
				flat.Normals = temp;
				temp = {};
				foreach(var f in Colours ) temp += f;
				flat.Colours = temp;
				flat.ArraySizes = Vertices.size;
				
				temp = {};
				foreach(var f in LineVertices) temp += f;
				flat.LineVertices = temp;
				temp = {};
				foreach(var f in LineNormals) temp += f;
				flat.LineNormals = temp;
				temp = {};
				foreach(var f in LineColours ) temp += f;
				flat.LineColours = temp;
				
				flat.LineArraySizes = LineVertices.size;
				return flat;
			}

			public override void VisitTriangle(TriangleNode triangle)
			{
				PushColour(triangle.Colour, 3, Colours);
				var a = state.Transform.TransformVector(triangle.A).Add(state.Center);
				var b = state.Transform.TransformVector(triangle.B).Add(state.Center);
				var c = state.Transform.TransformVector(triangle.C).Add(state.Center);
				
				if(state.BfcInvertCurrent ^ state.BfcClockwise)
				{
					var v = a;
					a = b;
					b = v;
				}
				
				var normal = (b.Subtract(a)).Cross(c.Subtract(a)).Normalized();
				
				PushVector(a, Vertices);	
				PushVector(b, Vertices);	
				PushVector(c, Vertices);		
				PushVector(normal, Normals, 3);
				if(!state.BfcOn)
				{
					PushColour(triangle.Colour, 3, Colours);
					PushVector(a, Vertices);	
					PushVector(c, Vertices);	
					PushVector(b, Vertices);		
					PushVector(Vector.NullVector.Subtract(normal), Normals, 3);
				}
			}

			public override void VisitQuad(QuadNode quad)
			{
				PushColour(quad.Colour, 6, Colours);
				Vector a = state.Transform.TransformVector(quad.A).Add(state.Center);
				Vector b = state.Transform.TransformVector(quad.B).Add(state.Center);
				Vector c = state.Transform.TransformVector(quad.C).Add(state.Center);
				Vector d = state.Transform.TransformVector(quad.D).Add(state.Center);
				
				if(state.BfcInvertCurrent ^ state.BfcClockwise)
				{
					var v = a;
					a = c;
					c = v;
				}
				var normal = (b.Subtract(a)).Cross(c.Subtract(a)).Normalized();
				
				// decomposed to two trinagles
				PushVector(a, Vertices);	
				PushVector(b, Vertices);	
				PushVector(c, Vertices);
					
				PushVector(a, Vertices);	
				PushVector(c, Vertices);	
				PushVector(d, Vertices);	
				PushVector(normal, Normals, 6);
				if(!state.BfcOn)
				{
					PushColour(quad.Colour, 6, Colours);
					PushVector(a, Vertices);
					PushVector(c, Vertices);	
					PushVector(b, Vertices);	
						
					PushVector(a, Vertices);	
					PushVector(d, Vertices);	
					PushVector(c, Vertices);	
					PushVector(Vector.NullVector.Subtract(normal), Normals, 6);
				}
			}

			public override void VisitLine(LineNode line)
			{
				PushColour(line.Colour, 2, LineColours);
				var a = state.Transform.TransformVector(line.A).Add(state.Center);
				var b = state.Transform.TransformVector(line.B).Add(state.Center);
				
				var normal = Vector.NullVector;
				
				PushVector(a, LineVertices);	
				PushVector(b, LineVertices);	
				PushVector(normal, LineNormals, 2);
			}

			public override void VisitSubModel(PartNode part)
			{
				var oldState = state;
				state = new SavedState();
				state.ColourInverted = oldState.ColourInverted;
				state.CurrentColour = oldState.CurrentColour;
				
				// BfcProperties
				state.BfcInvertCurrent = 
						oldState.BfcInvertCurrent ^ 
						oldState.BfcInvertNext ^
						(part.Transform.Determinant < 0);

				// apply the current transform to the sub-model's transform and center vector
				state.Center = oldState.Transform.TransformVector(part.Center).Add(oldState.Center);
				state.Transform = oldState.Transform.TransformMatrix(part.Transform);

				if(part.Colour.Code != 16 && part.Colour.Code != 24)
				{
					state.CurrentColour = part.Colour;
				}
				// recurse into the current builder
				VisitInner(part.Contents);
				// finally restore the old state
				state = oldState;
				state.BfcInvertNext = false;
			}

			public override void VisitComment(Comment comment)
			{
				if(comment is BfcInvertNext)
				{
					state.BfcInvertNext = true;
					return;
				}
				var certify = comment as BfcCertifyCommand;
				if(certify != null)
				{
					if(!certify.Certified)
						state.BfcOn = false;
					if(certify.ClockwiseWinding)
						state.BfcClockwise = true;
				}
				var bfc = comment as BfcCommand;
				if(bfc != null)
				{
					if(bfc.IsOptionSet(BfcOptions.WindingAntiClockwise))
						state.BfcClockwise = false;
					if(bfc.IsOptionSet(BfcOptions.WindingClockwise))
						state.BfcClockwise = true;
					if(bfc.IsOptionSet(BfcOptions.ClipOff))
						state.BfcOn = false;
					if(bfc.IsOptionSet(BfcOptions.ClipOn))
						state.BfcOn = true;					
				}
			}
			
			private class SavedState
			{
				public SavedState()
				{
					Transform = Matrix.Identity;
					Center = Vector.NullVector;
					CurrentColour = Colour.MainColour;
					ColourInverted = false;
					BfcInvertNext = false;
					BfcInvertCurrent = false;
					BfcOn = false;
					BfcClockwise = false;
				}

				public Matrix Transform;
				public Vector Center;
				public Colour CurrentColour;
				public bool ColourInverted;
				public bool BfcInvertNext;
				public bool BfcInvertCurrent;
				public bool BfcOn;
				public bool BfcClockwise;
			}
			
			private void PushColour(Colour colour, int vertices, Collection<float?> target)
			{
				float red, green, blue;
				if(colour.Code == 16)
				{
					if(state.CurrentColour.Code == 16)
						red = green = blue = -1;
					else if(state.CurrentColour.Code == 24)
						red = green = blue = -2;
					else
					{
						red = state.CurrentColour.Red / 255f;
						green = state.CurrentColour.Green / 255f;
						blue = state.CurrentColour.Blue / 255f;
					}					
				}
				else if(colour.Code == 24)
				{
					if(state.CurrentColour.Code == 16)
						red = green = blue = -2;
					else if(state.CurrentColour.Code == 24)
						red = green = blue = -1;
					else
					{
						red = state.CurrentColour.EdgeRed / 255f;
						green = state.CurrentColour.EdgeGreen / 255f;
						blue = state.CurrentColour.EdgeBlue / 255f;
					}
				}
				else
				{
					red = colour.Red / 255f;
					green = colour.Green / 255f;
					blue = colour.Blue / 255f;
				}
				var alpha = colour.Alpha / 255f;
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
		}
	}
}
