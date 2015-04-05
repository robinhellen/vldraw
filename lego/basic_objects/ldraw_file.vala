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

		public LdrawObject MainObject {get; construct set;}

		public string FileName {get; construct set;}
	}

	public abstract class LdrawModelFile : LdrawFile
	{
		public abstract void Save();

		public string FilePath {get; construct set;}
	}
}
