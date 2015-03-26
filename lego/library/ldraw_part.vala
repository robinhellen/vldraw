using Gee;

using Ldraw.Lego.Nodes;

namespace Ldraw.Lego.Library
{
	public class LdrawPart : LdrawFile, Comparable<LdrawPart>, IPartMetadata
	{
		private string m_Description = null;
		private string m_Category = null;
		private string m_Name;
		private string m_BaseName;
		private Gee.List<string> m_Keywords = new ArrayList<string>();

		public string Description
		{
			get
			{
				if(m_Description == null)
				{
					foreach(var comment in MainObject.NodesOfType<Comment>())
					{
						m_Description = comment.Description;
						break;
					}
				}
				return m_Description;
			}
		}

		public string Category
		{
			get
			{
				if(m_Category == null)
					foreach(var comment in MainObject.NodesOfType<Comment>())
					{
						var words = comment.Description.split(" ");
						if(words[0] == "!CATEGORY")
						{
							m_Category = words[1];
							break;
						}
					}
				if(m_Category == null)
				{
					m_Category = Description.split(" ")[0];
				}
				return m_Category;
			}
		}

		public Collection<string> Keywords
		{
			get
			{
				return m_Keywords;
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
					string s = "Part '" + FileName + @"' has two category lines. \nFirst: $m_Category\n Second: $category";
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
				if(m_Name == null)
					m_Name = FileName.substring(0, FileName.last_index_of_char('.'));

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
