using GLib.Test;

using Ldraw.Tests.Vectors;

namespace Ldraw.Tests
{
	static int main(string[] args)
	{
		Test.init(ref args);

		var rootSuite = TestSuite.get_root();
		rootSuite.add_suite(new VectorTests().get_suite());
		rootSuite.add_suite(new MatrixTests().get_suite());
		rootSuite.add_suite(new BoundsTests().get_suite());

		Test.run();
		return 0;
	}
}
