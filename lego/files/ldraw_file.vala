using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawFile : Object
	{
		public LdrawFile()
		{
			MainObject = new LdrawObject("", this);
		}

		// return true to indicate that all processing on this line is done,
		// false to create a node for this comment.
		public virtual bool HandleCommentLine(string line)
			throws ParseError
		{
			return false;
		}

		public LdrawObject MainObject {get; construct set;}

		public string FileName {get; construct set;}
	}

	public abstract class LdrawModelFile : LdrawFile
	{
		public abstract void Save();

		public string FilePath {get; construct set;}
	}
}
