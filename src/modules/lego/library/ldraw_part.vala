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

		public string description {
			get	{
				if(m_Description == null) {
					foreach(var comment in MainObject.NodesOfType<Comment>()) {
						m_Description = comment.Description;
						break;
					}
				}
				return m_Description;
			}
		}

		public string category {
			get {
				if(m_Category == null)
					foreach(var comment in MainObject.NodesOfType<Comment>()) {
						var words = comment.Description.split(" ");
						if(words[0] == "!CATEGORY") {
							m_Category = words[1];
							break;
						}
					}
				if(m_Category == null) {
					m_Category = description.split(" ")[0];
				}
				return m_Category;
			}
		}

		public Collection<string> keywords {
			get {
				return m_Keywords;
			}
		}

		public string name {
			get {
				if(m_Name == null)
					m_Name = FileName.substring(0, FileName.last_index_of_char('.'));

				return m_Name;
			}
		}

		public int compare_to(LdrawPart part) {
			return strcmp(m_Description, part.m_Description);
		}

		public bool IsVariant {
			get {
				return BaseName != name;
			}
		}

		public bool IsVariantOf(LdrawPart other) {
			return !other.IsVariant && BaseName == other.BaseName;
		}

		private string BaseName {
			get {
				return m_BaseName;
			}
		}
		
		public async LdrawPart get_part() {
			return this;
		}
	}
}
