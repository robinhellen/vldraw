using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class LdrFileBuilder : LdrawVisitor<bool?>
	{
		private File m_File;
		private FileOutputStream m_OutStream;

		private Error m_CaughtError;
		private bool HadError = false;

		public LdrFileBuilder(string filename)
			throws Error
		{
			m_File = File.new_for_path(filename);
			m_OutStream = m_File.replace(null, false, FileCreateFlags.NONE);
		}	

		public override bool VisitLine(LineNode line) 
		{
			return write(@"2 $(line.Colour.Code) $(line.A.X) $(line.A.Y) $(line.A.Z) $(line.B.X) $(line.B.Y) $(line.B.Z)");
		}
		public override bool VisitTriangle(TriangleNode line) 
		{
			return write(@"3 $(line.Colour.Code) $(line.A.X) $(line.A.Y) $(line.A.Z) $(line.B.X) $(line.B.Y) $(line.B.Z) $(line.C.X) $(line.C.Y) $(line.C.Z)");
		}
		public override bool VisitQuad(QuadNode line) 
		{
			return write(@"4 $(line.Colour.Code) $(line.A.X) $(line.A.Y) $(line.A.Z) $(line.B.X) $(line.B.Y) $(line.B.Z) $(line.C.X) $(line.C.Y) $(line.C.Z) $(line.D.X) $(line.D.Y) $(line.D.Z)");
		}
		public override bool VisitCondLine(CondLineNode line)
		{
			return write(@"5 $(line.Colour.Code) $(line.A.X) $(line.A.Y) $(line.A.Z) $(line.B.X) $(line.B.Y) $(line.B.Z) $(line.Control1.X) $(line.Control1.Y) $(line.Control1.Z) $(line.Control2.X) $(line.Control2.Y) $(line.Control2.Z)");
		}
		public override bool VisitSubModel(PartNode line)
		{
			return write("1 %d %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %.3f %s".printf(
					line.Colour.Code,
					line.Center.X, line.Center.Y, line.Center.Z,
					line.Transform[0,0], line.Transform[0,1], line.Transform[0,2],
					line.Transform[1,0], line.Transform[1,1], line.Transform[1,2],
					line.Transform[2,0], line.Transform[2,1], line.Transform[2,2],
					line.Contents.FileName));
		}
		public override bool VisitComment(Comment line)
		{
			return write(@"0 $(line.CommentText)");
		}
		
		private bool write(string data)
		{
			if(HadError)
				return false;
			try
			{
				m_OutStream.write(data.data);
				m_OutStream.write("\r\n".data);
			}
			catch (Error e)
			{
				HadError = true;
				m_CaughtError = e;
				return false;
			}
			return true;			
		}
		
		public override bool? GetResult(LdrawObject object)
		{
			return HadError;
		}

		public void Finish()
			throws Error
		{
			if(HadError)
				throw m_CaughtError;

			m_OutStream.close();
		}
	}
}
