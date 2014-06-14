using Gee;

namespace Ldraw.Utils.Di
{
    public interface DependencyResolutionContext : Object
    {
        public abstract T Resolve<T>()
            throws DependencyResolutionError;

        public abstract Collection<T> ResolveAll<T>()
            throws DependencyResolutionError;

        public abstract T ResolveWithProperty<T>(string propertyName, Resolver resolver)
            throws DependencyResolutionError;

        /*public abstract T ResolveWithProperties<T>(string propertyName, Resolver resolver, ...)
            throws DependencyResolutionError;*/

        public abstract Collection<T> AllCreated<T>();
    }
}
