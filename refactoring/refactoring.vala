
using Ldraw.Ui.Commands

namespace Ldraw.Refactoring
{
    public abstract class Refactoring : Object
    {
        public abstract string GetName();
        public abstract Command PrepareRefactoring();
    }
}
