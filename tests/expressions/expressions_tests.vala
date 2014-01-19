using Gee;

using Ldraw.Expressions;

namespace Ldraw.Tests.Expressions
{
	public class ExpressionsTests : TestFixture
	{
		public ExpressionsTests()
		{
			base("ExpressionsTests");
			add_test("SimpleAddition", SimpleAddition);
			add_test("SimpleSubtraction", SimpleSubtraction);
			add_test("SimpleMultiplication", SimpleMultiplication);
			add_test("SimpleDivision", SimpleDivision);
			add_test("BracketedAddition", BracketedAddition);
			add_test("SimpleLiteral", () => EvaluateAndCheck("2.5", 2.5f));
			add_test("BracketedLiteral", () => EvaluateAndCheck("(3.7)", 3.7f));
			add_test("TwoOperations", () => EvaluateAndCheck("1 + 2 + 3", 6));
			add_test("OperatorPrecedence1", () => EvaluateAndCheck("1 + 2 * 3", 7));
			add_test("OperatorPrecedence2", () => EvaluateAndCheck("2 * 3 + 1", 7));
			add_test("BracketsOverridePrecedence1", () => EvaluateAndCheck("(1 + 2) * 3", 9));
			add_test("BracketsOverridePrecedence2", () => EvaluateAndCheck("2 * (3 + 1)", 8));
			add_test("EvaluateWithVariables", EvaluateWithVariables);
			add_test("ConstantEquality", () => CheckEquality("2"));
			add_test("VariableEquality", () => CheckEquality("Foo"));
			add_test("OperatorEquality", () => CheckEquality("1 + Foo"));
		}

		private void SimpleAddition()
		{
			var e = new Expression.Parse("1 + 1");
			var result = e.Evaluate(Map.empty<string, float?>());

			Assert.AreEqualFloat(2, result);
		}

		private void SimpleSubtraction()
		{
			var e = new Expression.Parse("5 - 2");
			var result = e.Evaluate(Map.empty<string, float?>());

			Assert.AreEqualFloat(3, result);
		}

		private void SimpleMultiplication()
		{
			var e = new Expression.Parse("3 * 8");
			var result = e.Evaluate(Map.empty<string, float?>());

			Assert.AreEqualFloat(24, result);
		}

		private void SimpleDivision()
		{
			var e = new Expression.Parse("100 / 20");
			var result = e.Evaluate(Map.empty<string, float?>());

			Assert.AreEqualFloat(5, result);
		}

		private void BracketedAddition()
		{
			var e = new Expression.Parse("(5 + 6)");
			var result = e.Evaluate(Map.empty<string, float?>());

			Assert.AreEqualFloat(11, result);
		}

		private void EvaluateAndCheck(string expression, float expected)
		{
			var e = new Expression.Parse(expression);
			var result = e.Evaluate(Map.empty<string, float?>());

			Assert.AreEqualFloat(expected, result);
		}

		private void EvaluateWithVariables()
		{
			var variables = new HashMap<string, float?>();
			variables["Variable"] = 4;

			var e = new Expression.Parse("3 * Variable");
			var result = e.Evaluate(variables);

			Assert.AreEqualFloat(12, result);
		}

		private void CheckEquality(string expression)
		{
			assert(new Expression.Parse(expression).Equals(new Expression.Parse(expression)));
		}
	}
}
