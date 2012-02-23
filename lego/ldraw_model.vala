namespace Ldraw.Lego
{
	public class LdrawModel : LdrawFile
	{
		public LdrawModel(string fullFilename)
			throws ParseError
		{
			File partFile = File.new_for_path(fullFilename);
			if(!partFile.query_exists())
			{
				throw new ParseError.MissingFile(@"Unable to find part file $fullFilename.");
			}
			base.FromFile(partFile);
		}

		public override LdrawFile LoadPartFromReference(string reference)
			throws ParseError
		{
			LdrawLibrary lib = LdrawLibrary.Instance;

			return lib.GetPartByName(reference.substring(0, reference.last_index_of(".")));
		}

		public override string Description
		{
			get
			{
				return "";
			}
		}
	}
}
