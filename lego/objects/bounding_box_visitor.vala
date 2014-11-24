using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Lego.Objects
{
	public class BoundingBoxVisitor : LdrawVisitor<Bounds>
	{
		private Bounds BoundingBox {get; set;}
		private Matrix Transform {get; set;}
		private Vector Center {get; set;}
		
		public override void VisitLine(LineNode line) 
		{
			Vector a = Transform.TransformVector(line.A).Add(Center);
			Vector b = Transform.TransformVector(line.B).Add(Center);
			
			BoundingBox.Union(a);
			BoundingBox.Union(b);
		}
		
		public override void VisitTriangle(TriangleNode triangle) 
		{
			Vector a = Transform.TransformVector(triangle.A).Add(Center);
			Vector b = Transform.TransformVector(triangle.B).Add(Center);
			Vector c = Transform.TransformVector(triangle.C).Add(Center);	
						
			BoundingBox.Union(a);
			BoundingBox.Union(b);
			BoundingBox.Union(c);		
		}
		
		public override void VisitQuad(QuadNode quad) 
		{
			Vector a = Transform.TransformVector(quad.A).Add(Center);
			Vector b = Transform.TransformVector(quad.B).Add(Center);
			Vector c = Transform.TransformVector(quad.C).Add(Center);
			Vector d = Transform.TransformVector(quad.D).Add(Center);
			
			BoundingBox.Union(a);
			BoundingBox.Union(b);
			BoundingBox.Union(c);
			BoundingBox.Union(d);
		}
		
		public override void VisitCondLine(CondLineNode line) 
		{
			Vector a = Transform.TransformVector(line.A).Add(Center);
			Vector b = Transform.TransformVector(line.B).Add(Center);
			
			BoundingBox.Union(a);
			BoundingBox.Union(b);
		}
		
		
		public override void VisitSubModel(PartNode part) 
		{
			var oldCenter = Center;
			var oldTransform = Transform;
			
			// apply the current transform to the sub-model's transform and center vector
			Center = oldTransform.TransformVector(part.Center).Add(oldCenter);
			Transform = oldTransform.TransformMatrix(part.Transform);
						
			// recurse into the current builder
			foreach(var node in part.Contents.Nodes)
			{
				VisitNode(node);
			}
			
			Center = oldCenter;
			Transform = oldTransform;
		}
		
		protected override void Initialize()
		{
			BoundingBox = new Bounds();
			Transform = Matrix.Identity;
			Center = Vector.NullVector;
		}
		
		protected override Bounds GetResult()
		{
			return BoundingBox;
		}
	}
}
