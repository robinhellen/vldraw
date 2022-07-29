using GLib.Test;

namespace Ldraw.Tests
{
	public class Assert
	{
		public static void AreEqualFloat(float expected, float actual, string message = "")
		{
			if(expected != actual)
			{
				GLib.message(@"$message\nExpected: $expected\nActual   : $actual");
				fail();
			}
		}
	}
}
