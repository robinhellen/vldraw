using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	private class PovrayVisitor : AsyncLdrawVisitor<void>
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

		public override async void Visit(LdrawObject object)
		{
			currentTriangles = new LinkedList<SdlTriangle>();
			currentSubObjects = new LinkedList<SdlObjectReference>();

			yield base.Visit(object);

			var povrayComponents = currentSubObjects.size + (currentTriangles.is_empty ? 0 : 1);

			if(povrayComponents == 0)
			{
				var escapedFilename = EscapeFilenameForSdl(object.FileName);
				yield Append(@"#declare $escapedFilename = object {sphere {0,0}}\n");
			}
			else
			{
				yield writer.WriteUnion(outStream, currentSubObjects, currentTriangles, object, povrayComponents);
			}
		}

		public override async void VisitTriangle(TriangleNode node)
		{
			Colour c = null;
			if(node.Colour.Code != 16 && node.Colour.Code != 24)
				c = node.Colour;
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C, c));
		}

		public override async void VisitQuad(QuadNode node)
		{
			Colour c = null;
			if(node.Colour.Code != 16 && node.Colour.Code != 24)
				c = node.Colour;
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C, c));
			currentTriangles.add(new SdlTriangle(node.D, node.A, node.C, c));
		}

		public override async void VisitSubModel(PartNode node)
		{
			currentSubObjects.add(new SdlObjectReference(node));
		}

		private async void Append(string sdl)
		{
			if(hadError)
				return;
			try
			{
				yield outStream.write_async(sdl.data);
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

	private interface UnionWriter : Object
	{
		public abstract async void WriteUnion(OutputStream s,
				Gee.List<SdlObjectReference> subObjects,
				Gee.List<SdlTriangle> triangles,
				LdrawObject object,
				int unionCount);
	}

	private class StandardUnionWriter : Object, UnionWriter
	{
		protected SdlGenerator sdlGenerator = new SdlGenerator();

		public virtual async void WriteUnion(OutputStream s,
				Gee.List<SdlObjectReference> subObjects,
				Gee.List<SdlTriangle> triangles,
				LdrawObject object,
				int unionCount)
		{
			var header = GetObjectHeader(object, unionCount);
			yield s.write_async(@"// object: $(object.FileName), $unionCount distinct components.\n".data);
			yield s.write_async(header.data);
			foreach(var reference in subObjects)
			{
				yield s.write_async(sdlGenerator.ObjectReference(reference).data);
			}
			if(!(triangles.is_empty))
				yield s.write_async(sdlGenerator.Mesh(triangles).data);
			yield s.write_async(ObjectFooter(object).data);
		}

		protected virtual string GetObjectHeader(LdrawObject object, int subObjects)
		{
			var escapedFilename = EscapeFilenameForSdl(object.FileName);
			var sdlType = subObjects > 1 ? "union" : "object";
//~ 			if(object.File is LdrawPart)
//~ 				sdlType = @"object { $sdlType";
			return @"#declare $escapedFilename = $sdlType {\n";
		}

		protected virtual string ObjectFooter(LdrawObject object)
		{
//~ 			if(object.File is LdrawPart)
//~ 			{
//~ 				var bounds = object.BoundingBox;
//~ 				var x = bounds.MaxX - bounds.MinX;
//~ 				var y = bounds.MaxY - bounds.MinY;
//~ 				var z = bounds.MaxZ - bounds.MinZ;

//~ 				return @"}\nscale <1 - 0.5 / $x, 1 - 0.5 / $y, 1 - 0.5 / $z>\n}\n\n";
//~ 			}
			return @"}\n\n";
		}
	}
}
