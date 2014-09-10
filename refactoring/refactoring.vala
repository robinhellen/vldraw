
using Ldraw.Ui.Commands;

namespace Ldraw.Refactoring
{
    public interface Refactoring : Object
    {
        public abstract string GetName();
        public abstract Command PrepareRefactoring();
    }
}
