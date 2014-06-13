namespace Ldraw.Lego
{
	public class LdrawModel : LdrawModelFile
	{
		public LdrawModel(string fullFilename, LdrawLibrary library)
			throws ParseError
		{
			File partFile = File.new_for_path(fullFilename);
			if(!partFile.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $fullFilename.");
			}
			base.FromFile(partFile, new LdrawParser(new LibrarySubFileLocator(library)));
		}

		public LdrawModel.FromFile(File file, LdrawLibrary library)
			throws ParseError
		{
			base.FromFile(file, new LdrawParser(new LibrarySubFileLocator(library)));
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
