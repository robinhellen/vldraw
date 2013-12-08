using Gee;

using Ldraw.Lego;

namespace Ldraw.Ui.Commands
{
	public class DeleteNodesCommand : Command
	{
		public DeleteNodesCommand(LdrawObject model, Collection<LdrawNode> selection)
		{
			Object(Model: model, Selection: selection);
		}

		public Collection<LdrawNode> Selection { get; construct; }

		public LdrawObject Model {get; construct; }

		public override void Execute()
		{
			Model.RemoveNodes(Selection);
		}

		public override void Undo()
		{
			Model.AddNodes(Selection);
		}
	}
}
