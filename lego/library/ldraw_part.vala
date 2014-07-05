using Gee;

namespace Ldraw.Lego.Library
{
	public class LdrawPart : LdrawFile, Comparable<LdrawPart>
	{
		private string m_Description = null;
		private string m_Category = null;
		private string m_FileName;
		private string m_Name;
		private string m_BaseName;
		private Gee.List<string> m_Keywords = new ArrayList<string>();

		public static int s_Creations = 0;

		public LdrawPart(string filename, LdrawLibrary library)
			throws ParseError
		{
			File partsDir = library.PartsDirectory;
			File partFile = partsDir.get_child(filename);
			if(!partFile.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $filename.");
			}
			base.FromFile(partFile, new LdrawParser());

			m_FileName = filename;

			m_Name = filename.substring(0, filename.last_index_of_char('.'));
			m_BaseName = "";
			foreach(char c in m_Name.to_utf8())
			{
				if(c.isdigit())
					m_BaseName += c.to_string();
				else
					break;
			}

			s_Creations++;
		}

		public string Description { get{ return m_Description;}}

		public string Category
		{
			get
			{
				if(m_Category == null && m_Description != null)
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
				MainObject.Description = m_Description;
				return true;
			}

			if(line.has_prefix("0 !CATEGORY "))
			{
				string category = line.substring(12);
				if(m_Category != null)
				{
					string s = "Part '" + m_FileName + @"' has two category lines. \nFirst: $m_Category\n Second: $category";
					throw new ParseError.InvalidComment(s);
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

		public int compare_to(LdrawPart part)
		{
			return strcmp(m_Description, part.m_Description);
		}

		public bool IsVariant
		{
			get
			{
				return BaseName != Name;
			}
		}

		public bool IsVariantOf(LdrawPart other)
		{
			return !other.IsVariant && BaseName == other.BaseName;
		}

		private string BaseName
		{
			get
			{
				return m_BaseName;
			}
		}
	}
}
