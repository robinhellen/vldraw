using Gee;

namespace Ldraw.Lego
{
	public class LdrawPrimitive : LdrawFile
	{
		private string m_Description = null;
		private string m_Category = null;
		private string m_FileName;
		private string m_Name;
		private Gee.List<string> m_Keywords = new ArrayList<string>();

		public static int s_Creations = 0;

		public LdrawPrimitive(string filename)
			throws ParseError
		{
			File partsDir = LdrawLibrary.Instance.PrimitivesDirectory;
			File partFile = partsDir.get_child(filename);
			if(!partFile.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $filename.");
			}
			base.FromFile(partFile);

			m_FileName = filename;

			m_Name = filename.substring(0, filename.last_index_of_char('.'));

			s_Creations++;
		}

		public override string Description { get{ return m_Description;}}

		public string Category
		{
			get
			{
				if(m_Category == null)
				{
					m_Category = m_Description.split(" ")[0];
				}
				return m_Category;
			}
		}

		public override bool HandleCommentLine(string line)
			throws ParseError
		{
			if(m_Description == null)
			{
				m_Description = line.substring(2);
				return true;
			}

			if(line.has_prefix("0 !CATEGORY "))
			{
				string category = line.substring(12);
				if(m_Category != null)
				{
					string nu = "null";
					throw new ParseError.InvalidComment(@"Primitive '$(m_FileName ?? nu)' has two category lines. \nFirst: $m_Category\n Second: $category");
				}
				m_Category = category;
				return true;
			}

			if(line.has_prefix("0 !KEYWORDS"))
			{
				string keywords = line.substring(12);
				string[] words = keywords.split(",");
				foreach(string word in words)
				{
					m_Keywords.add(word);
				}
				return true;
			}

			return base.HandleCommentLine(line);
		}

		public string Name
		{
			get
			{
				return m_Name;
			}
		}

		public override LdrawFile LoadPartFromReference(string reference)
			throws ParseError
		{
			// in a primitive file, the only allowed refs are other primitives.
			LdrawLibrary lib = LdrawLibrary.Instance;

			string[] toks = reference.split_set("/\\");
			if(toks[0] == "48")
			{
				string name = toks[1].substring(0, toks[1].last_index_of("."));
				LdrawHiresPrimitive hp;
				if(lib.TryGetHiresPrimitive(name, out hp))
				{
					return hp;
				}

				File hiresAttempt = lib.HiresPrimitivesDirectory.get_child(toks[1]);
				if(hiresAttempt.query_exists())
				{
					hp = new LdrawHiresPrimitive(toks[1]);
					lib.RegisterHiresPrimitive(hp);
					return hp;
				}
				throw new ParseError.MissingFile(@"Could not locate primitive at $reference");
			}
			// no directory prefix : primitive
			string name = toks[0].substring(0, toks[0].last_index_of("."));
			LdrawPrimitive p;
			if(lib.TryGetPrimitive(name, out p))
				return p;

			File primitiveAttempt = lib.PrimitivesDirectory.get_child(toks[0]);
			if(primitiveAttempt.query_exists())
			{
				p = new LdrawPrimitive(toks[0]);
				p = lib.RegisterPrimitive(p);
				return p;
			}
			throw new ParseError.MissingFile(@"Could not locate primitive for $reference");
		}
	}
}
