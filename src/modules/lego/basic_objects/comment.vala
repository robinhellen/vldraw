using Ldraw.Maths;

namespace Ldraw.Lego.Nodes
{
	public class Comment : LdrawNode
	{
		public string CommentText {get; set;}

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

		public override bool Accept(LdrawVisitor visitor)
		{
			return visitor.VisitComment(this);
		}

		public override async void AcceptAsync(AsyncLdrawVisitor visitor)
		{
			yield visitor.VisitComment(this);
		}
	}
}
