using Gee;

namespace Ldraw.Expressions
{
	public class Expression : Object
	{
		private ExpressionItem root;

		public Expression.Parse(string expression)
		{
			string currentToken = "";
			TokenType type = TokenType.None;
			Gee.List<Token?> tokens = new LinkedList<Token?>();

			for(int i = 0; i < expression.length; i++)
			{
				if(type == TokenType.TokenOf(expression[i]))
				{
					currentToken += expression[i:i+1];
				}
				else
				{
					var token = Token();
					token.type = type;
					token.token = currentToken;
					token.start = i - currentToken.length;
					token.end = i;

					if(type != TokenType.None)
						tokens.add(token);
					currentToken = expression[i:i+1];
					type = TokenType.TokenOf(expression[i]);
				}
			}

			{
				var token = Token();
				token.type = type;
				token.token = currentToken;
				token.start = expression.length - currentToken.length;
				token.end = expression.length;

				if(type != TokenType.None)
					tokens.add(token);
			}

			var interestingTokens = new LinkedList<Token?>();
			foreach(var token in tokens)
			{
				if(token.type != TokenType.Whitespace)
					interestingTokens.add(token);
			}

			root = GetExpressionForTokens(interestingTokens);
		}

		public float Evaluate(Map<string, float?> variables)
		{
			return root.Evaluate(variables);
		}

		public bool Equals(Expression other)
		{
			return root.Equals(other.root);
		}

		private static ExpressionItem GetExpressionForTokens(Gee.List<Token?> tokens, int depth = 0)
			throws ExpressionParseError
		{
			if(tokens.size == 1)
				return GetExpressionFromToken(tokens[0], new HashMap<Token?, ExpressionItem>(t => t.get_hash(), (t1, t2) => t1.equals(t2)));

			// deal with brackets first
			Token? firstBracket = null;
			Gee.List<Token?> tokensInsideBrackets = new LinkedList<Token?>();
			int bracketDepth = 0;

			Map<Token?, ExpressionItem> parsedTokens = new HashMap<Token?, ExpressionItem>(t => t.get_hash(), (t1, t2) => t1.equals(t2));

			foreach(var token in tokens)
			{
				if(token.type == TokenType.RParen)
				{
					bracketDepth--;
					if(bracketDepth == 0)
					{
						var parenExpression = GetExpressionForTokens(tokensInsideBrackets, depth + 1);
						parsedTokens[token] = parenExpression;
						parsedTokens[firstBracket] = parenExpression;
						foreach(var innerToken in tokensInsideBrackets)
						{
							parsedTokens[innerToken] = parenExpression;
						}

						tokensInsideBrackets.clear();
						firstBracket = null;
					}
					if(bracketDepth < 0)
					{
						throw new ExpressionParseError.ExtraRightParen(@"Extra closing parenthesis at character $(token.start).");
					}
				}
				if(bracketDepth >= 1)
				{
					tokensInsideBrackets.add(token);
				}
				if(token.type == TokenType.LParen)
				{
					if(bracketDepth == 0)
					{
						firstBracket = token;
					}
					bracketDepth ++;
				}
			}
			if(bracketDepth > 0)
			{
				throw new ExpressionParseError.UnmatchedLeftParen(@"Unmatched opening parenthesis at $(firstBracket.start).");
			}

			// multiplication and division
			for(int i = 0; i < tokens.size; i++)
			{
				// don't re-parse stuff inside brackets
				if(parsedTokens[tokens[i]] != null)
					continue;
				if(tokens[i].type == TokenType.Star)
				{
					if(i == 0)
						throw new ExpressionParseError.NoLhValue(@"Operator has no value on left.");

					if(i + 1 == tokens.size)
						throw new ExpressionParseError.NoRhValue("Operator has no value on right.");

					var left = GetExpressionFromToken(tokens[i - 1], parsedTokens);
					var right = GetExpressionFromToken(tokens[i + 1], parsedTokens);
					var e = new MathematicalOperation.Multiply(left, right);

					UpdateParsedTokens(parsedTokens, tokens[i], e);
					UpdateParsedTokens(parsedTokens, tokens[i - 1], e);
					UpdateParsedTokens(parsedTokens, tokens[i + 1], e);
				}
				else if(tokens[i].type == TokenType.Slash)
				{
					if(i == 0)
						throw new ExpressionParseError.NoLhValue(@"Operator has no value on left.");

					if(i + 1 == tokens.size)
						throw new ExpressionParseError.NoRhValue("Operator has no value on right.");

					var left = GetExpressionFromToken(tokens[i - 1], parsedTokens);
					var right = GetExpressionFromToken(tokens[i + 1], parsedTokens);
					var e = new MathematicalOperation.Divide(left, right);

					UpdateParsedTokens(parsedTokens, tokens[i], e);
					UpdateParsedTokens(parsedTokens, tokens[i - 1], e);
					UpdateParsedTokens(parsedTokens, tokens[i + 1], e);
				}
			}

			// addition and Subtraction
			for(int i = 0; i < tokens.size; i++)
			{
				// don't re-parse stuff inside brackets
				if(parsedTokens[tokens[i]] != null)
				{
					continue;
				}
				if(tokens[i].type == TokenType.PlusSign)
				{
					if(i == 0)
						throw new ExpressionParseError.NoLhValue(@"Operator has no value on left.");

					if(i + 1 == tokens.size)
						throw new ExpressionParseError.NoRhValue("Operator has no value on right.");

					var left = GetExpressionFromToken(tokens[i - 1], parsedTokens);
					var right = GetExpressionFromToken(tokens[i + 1], parsedTokens);
					var e = new MathematicalOperation.Add(left, right);

					UpdateParsedTokens(parsedTokens, tokens[i], e);
					UpdateParsedTokens(parsedTokens, tokens[i - 1], e);
					UpdateParsedTokens(parsedTokens, tokens[i + 1], e);
				}
				else if(tokens[i].type == TokenType.MinusSign)
				{
					if(i == 0)
						throw new ExpressionParseError.NoLhValue(@"Operator has no value on left.");

					if(i + 1 == tokens.size)
						throw new ExpressionParseError.NoRhValue("Operator has no value on right.");

					var left = GetExpressionFromToken(tokens[i - 1], parsedTokens);
					var right = GetExpressionFromToken(tokens[i + 1], parsedTokens);
					var e = new MathematicalOperation.Subtract(left, right);

					UpdateParsedTokens(parsedTokens, tokens[i], e);
					UpdateParsedTokens(parsedTokens, tokens[i - 1], e);
					UpdateParsedTokens(parsedTokens, tokens[i + 1], e);
				}
			}


			ExpressionItem finalExpression = null;

			foreach(var t in tokens)
			{
				var e = parsedTokens[t];
				if(e == null)
					throw new ExpressionParseError.UnexpectedToken(@"($depth) The parser did nothing with the token: $(t.token) at $(t.start).");

				if(finalExpression == null)
					finalExpression = e;

				if(finalExpression != e)
					throw new ExpressionParseError.UnexpectedToken(@"($depth) Broke into a second expression at $(t.token).");
			}

			if(finalExpression == null)
			{
				throw new ExpressionParseError.NoExpression("Expression has no content.");
			}
			return finalExpression;
		}

		private static ExpressionItem GetExpressionFromToken(Token t, Map<Token?, ExpressionItem> parsedTokens)
			throws ExpressionParseError
		{
			var parsedExpression = parsedTokens[t];
			if(parsedExpression != null)
				return parsedExpression;

			switch(t.type)
			{
				case TokenType.Literal:
					return new FloatLiteral((float)double.parse(t.token));
				case TokenType.Variable:
					return new Variable(t.token);
				default:
					throw new ExpressionParseError.UnexpectedToken("Unexected token.");
			}
		}

		private static void UpdateParsedTokens(Map<Token?, ExpressionItem> parsedTokens, Token t, ExpressionItem newExpression)
		{
			var oldExpression = parsedTokens[t];
			if(oldExpression == null)
			{
				parsedTokens[t] = newExpression;
				return;
			}

			var tokensToUpdate = new ArrayList<Token?>();
			foreach(var token in parsedTokens.keys)
			{
				if(parsedTokens[token] == oldExpression)
				{
					tokensToUpdate.add(token);
				}
			}

			foreach(var token in tokensToUpdate)
			{
				parsedTokens[token] = newExpression;
			}
		}

		[Compact]
		private struct Token
		{
			public TokenType type;
			public string token;
			public int start;
			public int end;

			public string to_string()
			{
				return @"'$token': $type";
			}

			public bool equals(Token other)
			{
				var retval = (type == other.type) &&
					   (token == other.token) &&
					   (start == other.start) &&
					   (end == other.end);

			   return retval;
			}

			public uint get_hash()
			{
				return str_hash(token) & ((int) type);
			}
		}

		public abstract class ExpressionItem : Object
		{
			public abstract float Evaluate(Map<string, float?> variables);

			public abstract bool Equals(ExpressionItem other);
		}

		public enum TokenType
		{
			None,
			LParen,
			RParen,
			PlusSign,
			MinusSign,
			Star,
			Slash,
			Literal,
			Variable,
			Whitespace;

			public static TokenType TokenOf(char c)
			{
				if(c.isspace())
					return Whitespace;
				if(c.isdigit() || c == '.')
					return Literal;
				switch(c)
				{
					case '(':
						return LParen;
					case ')':
						return RParen;
					case '+':
						return PlusSign;
					case '-':
						return MinusSign;
					case '*':
						return Star;
					case '/':
					case '\\':
						return Slash;
				}
				return Variable;
			}

			public string to_string()
			{
				switch(this)
				{
					case None:
						return "None";
					case LParen:
						return "LParen";
					case RParen:
						return "RParen";
					case PlusSign:
						return "PlusSign";
					case MinusSign:
						return "MinusSign";
					case Star:
						return "Star";
					case Slash:
						return "Slash";
					case Literal:
						return "Literal";
					case Variable:
						return "Variable";
					case Whitespace:
						return "Whitespace";
					default:
						return "Unknown";
				}
			}
		}

		public class FloatLiteral : ExpressionItem
		{
			private float value;

			public FloatLiteral(float value)
			{
				this.value = value;
			}

			public override float Evaluate(Map<string, float?> variables)
			{
				return value;
			}

			public override bool Equals(ExpressionItem other)
			{
				return EqualsInner(other as FloatLiteral);
			}

			public bool EqualsInner(FloatLiteral other)
			{
				return value == other.value;
			}
		}

		public class Variable : ExpressionItem
		{
			private string identifier;

			public Variable(string identifier)
			{
				this.identifier = identifier;
			}

			public override float Evaluate(Map<string, float?> variables)
			{
				var actual = variables[identifier];
				if(actual == null)
				{
					stderr.printf(@"Unknown variable $identifier.\n");
					return 0;
				}
				return actual;
			}

			public override bool Equals(ExpressionItem other)
			{
				return EqualsInner(other as Variable);
			}

			public bool EqualsInner(Variable other)
			{
				return identifier == other.identifier;
			}
		}

		public class MathematicalOperation : ExpressionItem
		{
			[CCode(has_target = false)]
			private delegate float Operation(float left, float right);

			private Operation operator;
			private ExpressionItem left;
			private ExpressionItem right;

			private MathematicalOperation(ExpressionItem left, ExpressionItem right, Operation operator)
			{
				this.operator = operator;
				this.left = left;
				this.right = right;
			}

			public MathematicalOperation.Add(ExpressionItem left, ExpressionItem right)
			{
				this(left, right, (a, b) => a+b);
			}

			public MathematicalOperation.Subtract(ExpressionItem left, ExpressionItem right)
			{
				this(left, right, (a, b) => a - b);
			}

			public MathematicalOperation.Multiply(ExpressionItem left, ExpressionItem right)
			{
				this(left, right, (a, b) => a * b);
			}

			public MathematicalOperation.Divide(ExpressionItem left, ExpressionItem right)
			{
				this(left, right, (a, b) => a / b);
			}

			public override float Evaluate(Map<string, float?> variables)
			{
				return operator(left.Evaluate(variables), right.Evaluate(variables));
			}

			public override bool Equals(ExpressionItem other)
			{
				return EqualsInner(other as MathematicalOperation);
			}

			public bool EqualsInner(MathematicalOperation other)
			{
				return operator == other.operator &&
						right.Equals(other.right) &&
						left.Equals(other.left);
			}
		}
	}

	public errordomain ExpressionParseError
	{
		UnmatchedLeftParen,
		ExtraRightParen,

		NoLhValue,
		NoRhValue,
		UnexpectedToken,

		NoExpression,
		MissingOperator,
	}
}
