

namespace Ldraw.Ui
{
	public abstract class Command : Object
	{
		public abstract void Undo();

		public abstract void Execute();
		
		public virtual bool TryCombine(Command other)
		{
			return false;
		}
	}
}
