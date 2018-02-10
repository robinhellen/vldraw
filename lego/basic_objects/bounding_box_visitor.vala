using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Lego
{
	private class BoundingBoxVisitor : LdrawVisitor<Bounds>
	{
		private Bounds BoundingBox {get; set;}
		private Matrix Transform {get; set;}
		private Vector Center {get; set;}
		
		public override bool VisitLine(LineNode line) 
		{
			Vector a = Transform.TransformVector(line.A).Add(Center);
			Vector b = Transform.TransformVector(line.B).Add(Center);
			
			BoundingBox.Union(a);
			BoundingBox.Union(b);
			return true;
		}
		
		public override bool VisitTriangle(TriangleNode triangle) 
		{
			Vector a = Transform.TransformVector(triangle.A).Add(Center);
			Vector b = Transform.TransformVector(triangle.B).Add(Center);
			Vector c = Transform.TransformVector(triangle.C).Add(Center);	
						
			BoundingBox.Union(a);
			BoundingBox.Union(b);
			BoundingBox.Union(c);
			return true;		
		}
		
		public override bool VisitQuad(QuadNode quad) 
		{
			Vector a = Transform.TransformVector(quad.A).Add(Center);
			Vector b = Transform.TransformVector(quad.B).Add(Center);
			Vector c = Transform.TransformVector(quad.C).Add(Center);
			Vector d = Transform.TransformVector(quad.D).Add(Center);
			
			BoundingBox.Union(a);
			BoundingBox.Union(b);
			BoundingBox.Union(c);
			BoundingBox.Union(d);
			return true;
		}
		
		public override bool VisitCondLine(CondLineNode line) 
		{
			Vector a = Transform.TransformVector(line.A).Add(Center);
			Vector b = Transform.TransformVector(line.B).Add(Center);
			
			BoundingBox.Union(a);
			BoundingBox.Union(b);
			return true;
		}
		
		
		public override bool VisitSubModel(PartNode part) 
		{
			var oldCenter = Center;
			var oldTransform = Transform;
			
			// apply the current transform to the sub-model's transform and center vector
			Center = oldTransform.TransformVector(part.Center).Add(oldCenter);
			Transform = oldTransform.TransformMatrix(part.Transform);
						
			// recurse into the current builder
			foreach(var node in part.Contents.Nodes)
			{
				if(!VisitNode(node))
					return false;
			}
			
			Center = oldCenter;
			Transform = oldTransform;
			return true;
		}
		
		protected override void Initialize()
		{
			BoundingBox = new Bounds();
			Transform = Matrix.Identity;
			Center = Vector.NullVector;
		}
		
		protected override Bounds GetResult(LdrawObject object)
		{
			return BoundingBox;
		}
	}
}
