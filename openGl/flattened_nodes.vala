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
		
		public static FlattenedNodes FlatForObject(LdrawObject obj)
		{
			return new NodeFlattenerVisitor().Visit(obj);
		}
		
		private class NodeFlattenerVisitor : LdrawVisitor<FlattenedNodes>
		{
			public Collection<float?> Vertices {get; private set;}
			public Collection<float?> Normals {get; private set;}
			public Collection<float?> Colours {get; private set;}
			
			private SavedState state;
			
			public override void Initialize()
			{
				Vertices = new LinkedList<float?>();
				Normals = new LinkedList<float?>();
				Colours = new LinkedList<float?>();
				
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
				flat.ArraySizes = Colours.size;
				return flat;
			}

			public override void VisitTriangle(TriangleNode triangle)
			{
				PushColour(triangle.Colour, 3);
				var a = state.Transform.TransformVector(triangle.A).Add(state.Center);
				var b = state.Transform.TransformVector(triangle.B).Add(state.Center);
				var c = state.Transform.TransformVector(triangle.C).Add(state.Center);
				
				var normal = (b.Subtract(a)).Cross(c.Subtract(a)).Normalized();
				
				PushVector(a, Vertices);	
				PushVector(b, Vertices);	
				PushVector(c, Vertices);		
				PushVector(normal, Normals, 3);
			}

			public override void VisitQuad(QuadNode quad)
			{
				PushColour(quad.Colour, 6);
				Vector a = state.Transform.TransformVector(quad.A).Add(state.Center);
				Vector b = state.Transform.TransformVector(quad.B).Add(state.Center);
				Vector c = state.Transform.TransformVector(quad.C).Add(state.Center);
				Vector d = state.Transform.TransformVector(quad.D).Add(state.Center);
				
				var normal = (b.Subtract(a)).Cross(c.Subtract(a)).Normalized();
				
				// decomposed to two trinagles
				PushVector(a, Vertices);	
				PushVector(b, Vertices);	
				PushVector(c, Vertices);
					
				PushVector(a, Vertices);	
				PushVector(c, Vertices);	
				PushVector(d, Vertices);	
				PushVector(normal, Normals, 6);
			}

			public override void VisitSubModel(PartNode part)
			{
				var oldState = state;
				state = new SavedState();
				state.ColourInverted = oldState.ColourInverted;
				state.CurrentColour = oldState.CurrentColour;

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
			}

			private class SavedState
			{
				public SavedState()
				{
					Transform = Matrix.Identity;
					Center = Vector.NullVector;
					CurrentColour = Colour.MainColour;
					ColourInverted = false;
				}

				public Matrix Transform;
				public Vector Center;
				public Colour CurrentColour;
				public bool ColourInverted;
			}
			
			private void PushColour(Colour colour, int vertices)
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
				for(int i = 0; i < vertices; i++)
				{
					Colours.add(red);
					Colours.add(green);
					Colours.add(blue);
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
