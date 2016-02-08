using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	public class PovrayVisitor : LdrawVisitor<void>
	{
		private Gee.List<SdlTriangle> currentTriangles;
		private Gee.List<SdlObjectReference> currentSubObjects;
		private Set<Colour> currentColours = new HashSet<Colour>();

		private Set<string> exportedFiles = new HashSet<string>();
		private Set<string> emptyObjects = new HashSet<string>();
		private Set<Colour>	exportedColours = new HashSet<Colour>();

		private FileOutputStream outStream;
		private Error caughtError;
		private bool hadError = false;
		private SdlGenerator sdlGenerator = new SdlGenerator();

		public PovrayVisitor(FileOutputStream stream)
		{
			outStream = stream;
		}

		public override void Visit(LdrawObject object)
		{
			if(object.FileName in exportedFiles)
				return;

			var outerTriangles = currentTriangles;
			var outerSubModels = currentSubObjects;
			currentTriangles = new LinkedList<SdlTriangle>();
			currentSubObjects = new LinkedList<SdlObjectReference>();

			base.Visit(object);

			foreach(var colour in currentColours)
				Append(sdlGenerator.ColourDefinition(colour));
			exportedColours.add_all(currentColours);
			currentColours.clear();

			var povrayComponents = currentSubObjects.size + (currentTriangles.is_empty ? 0 : 1);

			if(povrayComponents == 0)
			{
				emptyObjects.add(object.FileName);
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

			currentTriangles = outerTriangles;
			currentSubObjects = outerSubModels;

			exportedFiles.add(object.FileName);
		}

		public override void VisitTriangle(TriangleNode node)
		{
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C));
		}

		public override void VisitQuad(QuadNode node)
		{
			currentTriangles.add(new SdlTriangle(node.A, node.B, node.C));
			currentTriangles.add(new SdlTriangle(node.D, node.A, node.C));
		}

		public override void VisitSubModel(PartNode node)
		{
			Visit(node.Contents);
			if(!(node.Colour in exportedColours))
				currentColours.add(node.Colour);

			if(!(node.Contents.FileName in emptyObjects))
			{
				currentSubObjects.add(new SdlObjectReference(node));
			}
		}

		private string GetObjectHeader(LdrawObject object, int subObjects)
		{
			var escapedFilename = EscapeFilenameForSdl(object.FileName);
			var sdlType = subObjects > 1 ? "union" : "object";
			return @"#declare $escapedFilename = $sdlType {\n";
		}

		private string ObjectFooter(LdrawObject object)
		{
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
