using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	public class PovrayVisitor : LdrawVisitor<void>
	{
		private Gee.List<SdlTriangle> currentTriangles;
		private Gee.List<SdlObjectReference> currentSubObjects;

		private OutputStream outStream;
		private Error caughtError;
		private bool hadError = false;
		private SdlGenerator sdlGenerator = new SdlGenerator();

		public PovrayVisitor(OutputStream stream)
		{
			outStream = stream;
		}

		public override void Visit(LdrawObject object)
		{
			currentTriangles = new LinkedList<SdlTriangle>();
			currentSubObjects = new LinkedList<SdlObjectReference>();

			base.Visit(object);

			var povrayComponents = currentSubObjects.size + (currentTriangles.is_empty ? 0 : 1);

			if(povrayComponents == 0)
			{
				var escapedFilename = EscapeFilenameForSdl(object.FileName);
				Append(@"#declare $escapedFilename = object {sphere {0,0}}\n");
			}
			else
			{
				var header = GetObjectHeader(object, povrayComponents);
				Append(@"// object: $(object.FileName), $povrayComponents distinct components.\n");
				Append(header);
				foreach(var reference in currentSubObjects)
				{
					Append(sdlGenerator.ObjectReference(reference));
				}
				if(!(currentTriangles.is_empty))
					Append(sdlGenerator.Mesh(currentTriangles));
				Append(ObjectFooter(object));
			}
		}

		public override void VisitTriangle(TriangleNode node)
		{
			Colour c = null;
			if(node.Colour.Code != 16 && node.Colour.Code != 24)
				c = node.Colour;
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C, c));
		}

		public override void VisitQuad(QuadNode node)
		{
			Colour c = null;
			if(node.Colour.Code != 16 && node.Colour.Code != 24)
				c = node.Colour;
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C, c));
			currentTriangles.add(new SdlTriangle(node.D, node.A, node.C, c));
		}

		public override void VisitSubModel(PartNode node)
		{
			currentSubObjects.add(new SdlObjectReference(node));
		}

		private string GetObjectHeader(LdrawObject object, int subObjects)
		{
			var escapedFilename = EscapeFilenameForSdl(object.FileName);
			var sdlType = subObjects > 1 ? "union" : "object";
			if(object.File is LdrawPart)
				sdlType = @"object { $sdlType";
			return @"#declare $escapedFilename = $sdlType {\n";
		}

		private string ObjectFooter(LdrawObject object)
		{
			if(object.File is LdrawPart)
			{
				var bounds = object.BoundingBox;
				var x = bounds.MaxX - bounds.MinX;
				var y = bounds.MaxY - bounds.MinY;
				var z = bounds.MaxZ - bounds.MinZ;

				return @"}\nscale <1 - 0.5 / $x, 1 - 0.5 / $y, 1 - 0.5 / $z>\n}\n\n";
			}
			return @"}\n\n";
		}

		private void Append(string sdl)
		{
			if(hadError)
				return;
			try
			{
				outStream.write(sdl.data);
			}
			catch (Error e)
			{
				hadError = true;
				caughtError = e;
			}
		}

		public void Finish()
			throws Error
		{
			if(hadError)
				throw caughtError;
		}
	}
}
