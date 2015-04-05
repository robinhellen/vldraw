using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class Comment : LdrawNode
	{
		protected string CommentText;

		class construct
		{
			Type = "Comment";
		}

		public Comment(string comment)
		{
			CommentText = comment;			
		}

		public override string Description {get {return CommentText; } }

		public override string FileLine{owned get{return @"0 $CommentText";}}

		public override LdrawNode TransformNode(Matrix _, Vector __)
		{
			return this;
		}

		public override void Accept(LdrawVisitor visitor)
		{
			visitor.VisitComment(this);
		}
	}
}
