namespace Ldraw.Lego
{
	public class LdrawModel : LdrawModelFile
	{
		public LdrawModel(string fullFilename)
			throws ParseError
		{
			File partFile = File.new_for_path(fullFilename);
			if(!partFile.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $fullFilename.");
			}
			base.FromFile(partFile, new LdrawParser(new LibrarySubFileLocator()));
		}

		public LdrawModel.FromFile(File file)
			throws ParseError
		{
			base.FromFile(file, new LdrawParser(new LibrarySubFileLocator()));
		}

		public LdrawModel.Empty()
		{
			base();
		}

		public override string Description
		{
			get
			{
				return "";
			}
		}

		public override void Save()
		{
			try
			{
				var builder = new LdrFileBuilder(FilePath);
				MainObject.BuildFromFile(builder);
				builder.Finish();
			}
			catch(Error e)
			{
				stderr.printf(@"Unable to save $FileName to $FilePath: $(e.message).\n");
			}
		}
	}
}
