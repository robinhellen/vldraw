using Ldraw.Maths;

namespace Ldraw.Lego
{
	public abstract class LdrawNode : Object
	{
		public int ColourId {get; set; default = 0;}

		public bool Selected { get; set; default = false;}

		public virtual string Geometry() {return "";}

		public virtual string Name { get {return "";} }

		public abstract string FileLine{owned get;}

		public abstract string Description {get;}

		public abstract LdrawNode TransformNode(Matrix transform, Vector center);

		public abstract void Accept(LdrawVisitor visitor);

		public class string Type;

		protected static string[] Tokenize(string line)
		{
			var allTokens = line.split_set(" \t");
			string[] tokens = {};

			foreach(string token in allTokens)
			{
				if(token != "")
				{
					tokens += token;
				}
			}
			return tokens;
		}
	}
}
