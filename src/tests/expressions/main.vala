using GLib.Test;

using Ldraw.Tests.Expressions;

namespace Ldraw.Tests
{
	static int main(string[] args)
	{
		Test.init(ref args);

		var rootSuite = TestSuite.get_root();
		rootSuite.add_suite(new ExpressionsTests().get_suite());

		Test.run();
		return 0;
	}
}
