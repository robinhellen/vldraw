using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	private class PovrayVisitor : LdrawVisitor<void>
	{
		private Gee.List<SdlTriangle> currentTriangles;
		private Gee.List<SdlObjectReference> currentSubObjects;

		private OutputStream outStream;
		private UnionWriter writer;
		private Error caughtError;
		private bool hadError = false;

		public PovrayVisitor(OutputStream stream, UnionWriter writer)
		{
			outStream = stream;
			this.writer = writer;
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
				writer.WriteUnion(Append, currentSubObjects, currentTriangles, object, povrayComponents);
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

	private delegate void Action<T>(T param);

	private interface UnionWriter : Object
	{
		public abstract void WriteUnion(Action<string> write,
				Gee.List<SdlObjectReference> subObjects,
				Gee.List<SdlTriangle> triangles,
				LdrawObject object,
				int unionCount);
	}

	private class StandardUnionWriter : Object, UnionWriter
	{
		protected SdlGenerator sdlGenerator = new SdlGenerator();

		public virtual void WriteUnion(Action<string> write,
				Gee.List<SdlObjectReference> subObjects,
				Gee.List<SdlTriangle> triangles,
				LdrawObject object,
				int unionCount)
		{
			var header = GetObjectHeader(object, unionCount);
			write(@"// object: $(object.FileName), $unionCount distinct components.\n");
			write(header);
			foreach(var reference in subObjects)
			{
				write(sdlGenerator.ObjectReference(reference));
			}
			if(!(triangles.is_empty))
				write(sdlGenerator.Mesh(triangles));
			write(ObjectFooter(object));
		}

		protected virtual string GetObjectHeader(LdrawObject object, int subObjects)
		{
			var escapedFilename = EscapeFilenameForSdl(object.FileName);
			var sdlType = subObjects > 1 ? "union" : "object";
			if(object.File is LdrawPart)
				sdlType = @"object { $sdlType";
			return @"#declare $escapedFilename = $sdlType {\n";
		}

		protected virtual string ObjectFooter(LdrawObject object)
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
	}
}
