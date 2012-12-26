namespace Ldraw.Lego.Nodes
{
	public class Comment : LdrawNode
	{
		private string m_CommentText;

		class construct
		{
			Type = "Comment";
		}

		public Comment(string comment)
		{
			m_CommentText = comment;
		}

		public override string Description {get {return m_CommentText; } }

		public override string FileLine{owned get{return @"$m_CommentText";}}
	}
}
