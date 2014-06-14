
namespace Ldraw.Utils.Di
{
    [CCode(has_target = false)]
    public delegate Value Resolver(Creator c) // should be DependencyResolver (bug in vala)
            throws DependencyResolutionError;
}
