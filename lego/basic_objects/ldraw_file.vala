using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public abstract class LdrawFile : Object
	{
		protected LdrawFile()
		{
			MainObject = new LdrawObject("");
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
