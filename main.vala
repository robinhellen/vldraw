using Ldraw.Lego;

namespace Ldraw
{
	public class LdrawApp
	{
		public static int main(string[] args)
		{
			LdrawLibrary lib = LdrawLibrary.Instance;
			try
			{
				lib.Initialize();
			}
			catch(Error e)
			{
				stdout.printf(e.message);
			}
			try
			{
			var model = new LdrawModel("/home/robin/ldraw/models/car.dat");
			stdout.printf(@"$(model.FileName)");
			}
			catch(Error e)
			{
				stdout.printf(e.message);
			}

			return 0;
		}
	}
}
