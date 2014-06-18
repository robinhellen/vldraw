using Gee;

namespace Ldraw.Lego.Library
{
	public class LdrawSubPart : LdrawFile
	{
		private string m_Description = null;
		private string m_Category = null;
		private string m_FileName;
		private string m_Name;
		private Gee.List<string> m_Keywords = new ArrayList<string>();

		public static int s_Creations = 0;

		public LdrawSubPart(string filename, LdrawLibrary library)
			throws ParseError
		{
			File partsDir = library.SubPartsDirectory;
			File partFile = partsDir.get_child(filename);
			if(!partFile.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $filename.");
			}
			base.FromFile(partFile, new LdrawParser(
						new PartialLibrarySubFileLocator(LibraryObjectTypes.Part
													| LibraryObjectTypes.SubPart
													| LibraryObjectTypes.Primitive
													| LibraryObjectTypes.HiResPrimitive, library)));

			m_FileName = filename;

			m_Name = filename.substring(0, filename.last_index_of_char('.'));

			s_Creations++;
		}

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
					throw new ParseError.InvalidComment(@"Sub-Part '$(m_FileName ?? nu)' has two category lines. \nFirst: $m_Category\n Second: $category");
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
	}
}
