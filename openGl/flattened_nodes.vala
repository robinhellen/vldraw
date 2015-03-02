using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.OpenGl
{
	public class FlattenedNodes : Object
	{
		public MultiMap<RenderColour, Triangle> Triangles {get; construct;}
		public MultiMap<RenderColour, Quad> Quads {get; construct;}
		public MultiMap<RenderColour, Line> Lines {get; construct;}
		public MultiMap<RenderColour, CLine> CLines {get; construct;}
		
		public static FlattenedNodes FlatForObject(LdrawObject obj)
		{
			return new NodeFlattenerVisitor().Visit(obj);
		}
		
		private class NodeFlattenerVisitor : LdrawVisitor<FlattenedNodes>
		{
			MultiMap<RenderColour, Triangle> Triangles;
			MultiMap<RenderColour, Quad> Quads;
			MultiMap<RenderColour, Line> Lines;
			MultiMap<RenderColour, CLine> CLines;
			
			private SavedState state;
			
			public override void Initialize()
			{
				Triangles = new HashMultiMap<RenderColour, Triangle>();
				Quads = new HashMultiMap<RenderColour, Quad>();
				Lines = new HashMultiMap<RenderColour, Line>();
				CLines = new HashMultiMap<RenderColour, CLine>();
				
				state = new SavedState();
			}
			
			public override FlattenedNodes GetResult()
			{
				return (FlattenedNodes)Object.new(typeof(FlattenedNodes),
					Triangles: Triangles,
					Quads: Quads,
					Lines: Lines,
					CLines: CLines
				);
			}

			public override void VisitLine(LineNode line)
			{
				Vector a = state.Transform.TransformVector(line.A).Add(state.Center);
				Vector b = state.Transform.TransformVector(line.B).Add(state.Center);
				
				Lines[GetColour(line)] = new Line(a, b);
			}

			public override void VisitTriangle(TriangleNode triangle)
			{
				Vector a = state.Transform.TransformVector(triangle.A).Add(state.Center);
				Vector b = state.Transform.TransformVector(triangle.B).Add(state.Center);
				Vector c = state.Transform.TransformVector(triangle.C).Add(state.Center);
				
				Triangles[GetColour(triangle)] = new Triangle(a, b, c);
			}

			public override void VisitQuad(QuadNode quad)
			{
				Vector a = state.Transform.TransformVector(quad.A).Add(state.Center);
				Vector b = state.Transform.TransformVector(quad.B).Add(state.Center);
				Vector c = state.Transform.TransformVector(quad.C).Add(state.Center);
				Vector d = state.Transform.TransformVector(quad.D).Add(state.Center);
				
				Quads[GetColour(quad)] = new Quad(a, b, c, d);
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

				if(part.ColourId != 16 && part.ColourId != 24)
				{
					state.CurrentColour = part.ColourId;
				}
				// recurse into the current builder
				VisitInner(part.Contents);
				// finally restore the old state
				state = oldState;
			}

			public override void VisitCondLine(CondLineNode line)
			{

				Vector a = state.Transform.TransformVector(line.A).Add(state.Center);
				Vector b = state.Transform.TransformVector(line.B).Add(state.Center);

				Vector c1 = state.Transform.TransformVector(line.Control1).Add(state.Center);
				Vector c2 = state.Transform.TransformVector(line.Control2).Add(state.Center);

				CLines[GetColour(line)] = new CLine(a, b, c1, c2);
			}

			private class SavedState
			{
				public SavedState()
				{
					Transform = Matrix.Identity;
					Center = Vector.NullVector;
					CurrentColour = 16;
					ColourInverted = false;
				}

				public Matrix Transform;
				public Vector Center;
				public int CurrentColour;
				public bool ColourInverted;
			}
			
			private RenderColour GetColour(LdrawNode n)
			{
				
				if(n.ColourId == 16)
					return RenderColour.FromLdrawColour(LdrawColour.GetColour(state.CurrentColour));
				
				if(n.ColourId == 24)
					return RenderColour.FromLdrawEdgeColour(LdrawColour.GetColour(state.CurrentColour));
					
				return RenderColour.FromLdrawColour(LdrawColour.GetColour(n.ColourId));
			}
		}
	}
	
	
	public class Triangle : Object{ public Triangle(Vector a, Vector b, Vector c) {Object(A:a,B:b,C:c);} public Vector A {get; construct;} public Vector B {get; construct;} public Vector C {get; construct;}}
	public class CLine : Object { public CLine(Vector a, Vector b, Vector c1, Vector c2) {Object(A:a,B:b,C1:c1,C2:c2);} public Vector A {get; construct;} public Vector B {get; construct;} public Vector C1 {get; construct;} public Vector C2 {get; construct;}}
	public class Quad : Object { public Quad(Vector a, Vector b, Vector c, Vector d) {Object(A:a,B:b,C:c,D:d);} public Vector A {get; construct;} public Vector B {get; construct;} public Vector C {get; construct;} public Vector D {get; construct;}}
	public class Line : Object { public Line(Vector a, Vector b) {Object(A:a,B:b);} public Vector A {get; construct;} public Vector B {get; construct;}}
}
