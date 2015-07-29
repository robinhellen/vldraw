using Ldraw.Lego.Library;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Diva;

namespace Ldraw.Lego
{
	public class LdrawParser : Object
	{
		static construct
		{
			var cls = (ObjectClass)typeof(LdrawParser).class_ref();
			SetIndexedInjection<string, CommandFactory>(cls, "CommandFactories");
		}
		
		public Index<CommandFactory, string> CommandFactories {construct; private get;}
		
		public async LdrawNode ParseLine(string line, ISubFileLocator locator, ColourContext colourContext)
			throws ParseError
			requires(!("\n" in line))
		{
			switch(line[0])
			{
				case '0':
					// may be a meta command
					return ParseCommentNode(line);
				case '1':
					return yield ParsePartNode(line, locator, colourContext);
				case '2':
					return ParseLineNode(line, colourContext);
				case '3':
					return ParseTriangleNode(line, colourContext);
				case '4':
					return ParseQuadNode(line, colourContext);
				case '5':
					return ParseCondLineNode(line, colourContext);
				default:
					throw new ParseError.UnknownLineType(@"Unable to parse line '$line'.");
			}
		}

		protected LdrawNode ParseCommentNode(string line)
			throws ParseError
		{
			var tokens = Tokenize(line);

			var command = tokens[1];
			if(command == null)
				return new Comment("");
			if(command != null && command.has_prefix("!"))
				command = command.substring(1);
				
			var factory = CommandFactories[command];
			if(factory == null)
				return new Comment(string.joinv(" ", tokens[1: tokens.length]));
			
			return factory.CreateCommand(tokens[1], tokens[2:tokens.length]);
		}

		protected async LdrawNode ParsePartNode(string line, ISubFileLocator locator, ColourContext colourContext)
			throws ParseError
		{
			var tokens = Tokenize(line);
			GuardTokenCount(tokens, 5);

			var center = ParseTokensToVector(tokens[2:4]);
			var transform = Matrix((float)double.parse(tokens[5]), (float)double.parse(tokens[6]), (float)double.parse(tokens[7]),
								(float)double.parse(tokens[8]), (float)double.parse(tokens[9]), (float)double.parse(tokens[10]),
								(float)double.parse(tokens[11]), (float)double.parse(tokens[12]), (float)double.parse(tokens[13]));

			int colourId = int.parse(tokens[1]);
			string text = tokens[14].strip().down();

			return new PartNode(center, transform, yield locator.GetObjectFromReference(text), colourContext.GetColourById(colourId));
		}

		protected LdrawNode ParseLineNode(string line, ColourContext colourContext)
			throws ParseError
		{
			var tokens = Tokenize(line);
			GuardTokenCount(tokens, 8);

			var a = ParseTokensToVector(tokens[2:4]);
			var b = ParseTokensToVector(tokens[5:7]);
			var colourId = int.parse(tokens[1]);

			return new LineNode(colourContext.GetColourById(colourId), a, b);
		}

		protected LdrawNode ParseTriangleNode(string line, ColourContext colourContext)
			throws ParseError
		{
			var tokens = Tokenize(line);
			GuardTokenCount(tokens, 11);

			var a = ParseTokensToVector(tokens[2:4]);
			var b = ParseTokensToVector(tokens[5:7]);
			var c = ParseTokensToVector(tokens[8:10]);
			var colourId = int.parse(tokens[1]);

			return new TriangleNode(colourContext.GetColourById(colourId), a, b, c);
		}

		protected LdrawNode ParseQuadNode(string line, ColourContext colourContext)
			throws ParseError
		{
			var tokens = Tokenize(line);
			GuardTokenCount(tokens, 14);

			var a = ParseTokensToVector(tokens[2:4]);
			var b = ParseTokensToVector(tokens[5:7]);
			var c = ParseTokensToVector(tokens[8:10]);
			var d = ParseTokensToVector(tokens[11:13]);
			var colourId = int.parse(tokens[1]);

			return new QuadNode(colourContext.GetColourById(colourId), a, b, c, d);
		}

		protected LdrawNode ParseCondLineNode(string line, ColourContext colourContext)
			throws ParseError
		{
			var tokens = Tokenize(line);
			GuardTokenCount(tokens, 14);

			var a = ParseTokensToVector(tokens[2:4]);
			var b = ParseTokensToVector(tokens[5:7]);
			var c = ParseTokensToVector(tokens[8:10]);
			var d = ParseTokensToVector(tokens[11:13]);
			var colourId = int.parse(tokens[1]);

			return new CondLineNode(colourContext.GetColourById(colourId), a, b, c, d);
		}

		protected static string[] Tokenize(string line)
		{
			var allTokens = line.split_set(" \t");
			string[] tokens = {};

			foreach(string token in allTokens)
			{
				if(token != "")
				{
					tokens += token;
				}
			}
			return tokens;
		}

		protected static Vector ParseTokensToVector(string[] tokens)
			requires(tokens.length == 2)
		{
			return Vector((float)double.parse(tokens[0])
						, (float)double.parse(tokens[1])
						, (float)double.parse(tokens[2]));
		}

		protected void GuardTokenCount(string[] tokens, int expected)
			throws ParseError
		{
			if(tokens.length < expected)
			{
				throw new ParseError.IncompleteLine(@"Unable to parse: Expected $expected tokens (space separated), found $(tokens.length).");
			}
		}
	}
	
	public interface CommandFactory : Object 
	{
		public abstract MetaCommand CreateCommand(string command, string[] args);
	}
	
	public interface ColourContext : Object
	{
		public abstract Colour GetColourById(int colourId);
	}
}
