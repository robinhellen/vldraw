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
		public void RenderModel(LdrawObject object, int code, Vector finalEyeline)
		{
			var colour = LdrawColour.GetColour(code);
			EnsureDisplayListExists(object, colour);				
			CallDisplayList(object, colour);
		}
		
		private void EnsureDisplayListExists(LdrawObject object, LdrawColour colour)
		{
			var storage = GetDisplayListsForObject(object);
			if(!storage.HasListForColour(colour))
			{
				CreateDisplayList(object, colour);
			}
		}
		
		private void CallDisplayList(LdrawObject object, LdrawColour colour)
		{
			var storage = GetDisplayListsForObject(object);
			var listId = storage.ListForColour(colour.Code);
			
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
		
		private void CreateDisplayList(LdrawObject object, LdrawColour colour)
		{
			// ensure all sub-objects have display lists
			foreach(var node in object.Nodes)
			{
				var partNode = node as PartNode;
				if(partNode == null)
					continue;
					
				var innerColour = (partNode.ColourId == 16 || partNode.ColourId == 24) ? colour : LdrawColour.GetColour(partNode.ColourId);
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
		private LdrawColour colour;
		
		public delegate int DisplayListFunc(LdrawObject object, int colour);
		public DisplayListFunc getDisplayList;
		
		public DisplayListRenderVisitor(LdrawColour colour, DisplayListFunc getDisplayList)
		{
			this.colour = colour;
			this.getDisplayList = getDisplayList;
		}
		
		public override void VisitLine(LineNode line)
		{
			glPushAttrib(GL_CURRENT_BIT);
			SetRenderColour(line.ColourId);

			glBegin(GL_LINES);

			glVertex3fv(line.A.value_vector());
			glVertex3fv(line.B.value_vector());

			glEnd();
			glPopAttrib();
		}

		public override void VisitTriangle(TriangleNode triangle)
		{
			glPushAttrib(GL_CURRENT_BIT);
			SetRenderColour(triangle.ColourId);

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
			SetRenderColour(quad.ColourId);

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
						 
			var partColour = part.ColourId;
			if(partColour == 16 || partColour == 24)
			{
				partColour = colour.Code;
			}
			glCallList(getDisplayList(part.Contents, partColour));

			glPopMatrix();
			glPopAttrib();
		}

		private void SetRenderColour(int ldrawColour)
		{
			float red, green, blue, alpha;
			switch(ldrawColour)
			{
				case 16:
					LdrawColour.SurfaceColour(colour.Code, out red, out green, out blue, out alpha);
					break;
				case 24:
					LdrawColour.EdgeColour(colour.Code, out red, out green, out blue, out alpha);
					break;
				default:
					LdrawColour.SurfaceColour(ldrawColour, out red, out green, out blue, out alpha);
					break;
			}

			glColor4f(red, green, blue, alpha);
		}		
	}
	
	public class DisplayListStorage : Object
	{
		private Map<LdrawColour, int?> colours = new HashMap<LdrawColour, int?>();
				
		public bool HasListForColour(LdrawColour colour)
		{
			return colours.has_key(colour);
		}
		
		public int ListForColour(int colourCode)
		{
			return colours[LdrawColour.GetColour(colourCode)];
		}
		
		public void StoreListForColour(LdrawColour colour, int listId)
		{
			colours[colour] = listId;
		}
	}
}
