using Gee;
using GL;

using Ldraw.Maths;
using Ldraw.Lego.Library;
using Ldraw.Lego;
using Ldraw.Lego.Nodes;

namespace Ldraw.OpenGl
{
	public class DisplayListRenderer : Object, IRenderModel
	{
		public void RenderModel(LdrawObject object, Colour colour, Vector finalEyeline, Set<LdrawNode> selection)
		{
			EnsureDisplayListExists(object, colour);				
			CallDisplayList(object, colour);
		}
		
		private void EnsureDisplayListExists(LdrawObject object, Colour colour)
		{
			var storage = GetDisplayListsForObject(object);
			if(!storage.HasListForColour(colour))
			{
				CreateDisplayList(object, colour);
			}
		}
		
		private void CallDisplayList(LdrawObject object, Colour colour)
		{
			var storage = GetDisplayListsForObject(object);
			var listId = storage.ListForColour(colour);
			
			glCallList(listId);
		}
		
		private DisplayListStorage GetDisplayListsForObject(LdrawObject object)
		{
			var storage = object.get_data<DisplayListStorage>("DisplayLists");
			if(storage == null)
			{
				storage = new DisplayListStorage();
				object.set_data<DisplayListStorage>("DisplayLists", storage);
			}
			return storage;		
		}
		
		private void CreateDisplayList(LdrawObject object, Colour colour)
		{
			// ensure all sub-objects have display lists
			foreach(var node in object.Nodes)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;
					
				var innerColour = (partNode.Colour.Code == 16 || partNode.Colour.Code == 24) ? colour : partNode.Colour;
				EnsureDisplayListExists(partNode.Contents, innerColour);
			}
			
			// create the list for this object
			var listName = glGenLists(1);
			glNewList(listName, GL_COMPILE);
			var visitor = new DisplayListRenderVisitor(colour, 
						(part, code) => GetDisplayListsForObject(part).ListForColour(code)
					);
			foreach(var node in object.Nodes)
			{
				node.Accept(visitor);
			}
			
			glEndList();
			
			
			// store the list
			var storage = GetDisplayListsForObject(object);
			storage.StoreListForColour(colour, (int)listName);
			
			// invalidate this list when the object changes.
		}
	}
	
	public class DisplayListRenderVisitor : LdrawVisitor<void>
	{
		private Colour colour;
		
		public delegate int DisplayListFunc(LdrawObject object, Colour colour);
		public DisplayListFunc getDisplayList;
		
		public DisplayListRenderVisitor(Colour colour, DisplayListFunc getDisplayList)
		{
			this.colour = colour;
			this.getDisplayList = getDisplayList;
		}
		
		public override void VisitLine(LineNode line)
		{
			glPushAttrib(GL_CURRENT_BIT);
			SetRenderColour(line.Colour);

			glBegin(GL_LINES);

			glVertex3fv(line.A.value_vector());
			glVertex3fv(line.B.value_vector());

			glEnd();
			glPopAttrib();
		}

		public override void VisitTriangle(TriangleNode triangle)
		{
			glPushAttrib(GL_CURRENT_BIT);
			SetRenderColour(triangle.Colour);

			glBegin(GL_POLYGON);

			glVertex3fv(triangle.A.value_vector());
			glVertex3fv(triangle.B.value_vector());
			glVertex3fv(triangle.C.value_vector());

			glEnd();
			glPopAttrib();
		}

		public override void VisitQuad(QuadNode quad)
		{
			glPushAttrib(GL_CURRENT_BIT);
			SetRenderColour(quad.Colour);

			glBegin(GL_POLYGON);

			glVertex3fv(quad.A.value_vector());
			glVertex3fv(quad.B.value_vector());
			glVertex3fv(quad.C.value_vector());
			glVertex3fv(quad.D.value_vector());

			glEnd();
			glPopAttrib();
		}

		public override void VisitSubModel(PartNode part)
		{
			glPushAttrib(GL_CURRENT_BIT);
			glPushMatrix();

			glTranslatef(part.Center.X, part.Center.Y, part.Center.Z);
			var m = part.Transform;
			glMultMatrixf(new float[] {m[0,0], m[1,0], m[2,0], 0, 
						 m[0,1], m[1,1], m[2,1], 0,
						 m[0,2], m[1,2], m[2,2], 0,
						 0,		 0,		 0,		 1});
						 
			var partColour = part.Colour;
			if(partColour.Code == 16 || partColour.Code == 24)
			{
				partColour = colour;
			}
			glCallList(getDisplayList(part.Contents, partColour));

			glPopMatrix();
			glPopAttrib();
		}

		private void SetRenderColour(Colour ldrawColour)
		{
			float red, green, blue, alpha;
			switch(ldrawColour.Code)
			{
				case 16:
					red = colour.Red / 255f;
					green = colour.Green / 255f;
					blue = colour.Blue / 255f;
					alpha = 1f - colour.Alpha / 255f;
					break;
				case 24:
					red = colour.EdgeRed / 255f;
					green = colour.EdgeGreen / 255f;
					blue = colour.EdgeBlue / 255f;
					alpha = 1f - colour.Alpha / 255f;
					break;
				default:
					red = ldrawColour.Red / 255f;
					green = ldrawColour.Green / 255f;
					blue = ldrawColour.Blue / 255f;
					alpha = 1f - ldrawColour.Alpha / 255f;
					break;
			}

			glColor4f(red, green, blue, alpha);
		}		
	}
	
	public class DisplayListStorage : Object
	{
		private Map<Colour, int?> colours = new HashMap<Colour, int?>();
				
		public bool HasListForColour(Colour colour)
		{
			return colours.has_key(colour);
		}
		
		public int ListForColour(Colour colour)
		{
			return colours[colour];
		}
		
		public void StoreListForColour(Colour colour, int listId)
		{
			colours[colour] = listId;
		}
	}
}
