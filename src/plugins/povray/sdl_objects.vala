
using Ldraw.Lego;
using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Povray
{
	private class SdlTriangle
	{
		public Vector A;
		public Vector B;
		public Vector C;
		public Colour? Colour;

		public SdlTriangle(Vector a, Vector b, Vector c, Colour? colour = null)
		{
			A = a; B = b; C = c;
			Colour = colour;
		}
	}

	private class SdlObjectReference
	{
		public string ObjectName;
		public Vector Center;
		public Matrix Transform;

		public Colour Colour;
		public Bounds? bounds = null;

		public SdlObjectReference(PartNode part)
		{
			Colour = part.Colour;
			ObjectName = EscapeFilenameForSdl(part.Contents.FileName);
			Center = part.Center;
			Transform = part.Transform;
			
			if(part.File is LdrawPart)
			{
				bounds = part.Contents.BoundingBox;
			}
		}
	}

	public string EscapeFilenameForSdl(string filename)
	{
		var escaped = filename
				.replace(".", "_")
				.replace("/", "__")
				.replace("\\", "__")
				.replace("-", "_dash_");

		if(escaped[0].isdigit())
			escaped = "_" + escaped;

		return escaped;
	}
}
