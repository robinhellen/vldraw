using Gee;

namespace Ldraw.Utils.Di
{
    public class Maker : Object
    {
        private Type t;
        private Map<string, Resolver> resolvers = new HashMap<string, Resolver>();
        private Value cache;

        public Maker(Type t)
        {
            this.t = t;
            cache = Value(t);
        }

        public Maker.Instance(Type t, Object instance)
        {
			this.t = t;
			cache = Value(t);
			cache.set_object(instance);
			Cache = true;
		}

        public bool Cache {get; set; default = true;}

        public Object Make(Creator c)
            throws DependencyResolutionError
        {
            return MakeWith(c, Map.empty<string, Resolver>());
        }

        public Object MakeWith(Creator c, Map<string, Resolver> extraResolvers)
            throws DependencyResolutionError
        {
            if(Cache && cache.get_object() != null)
                return cache.get_object();

            var finalResolvers = new HashMap<string, Resolver>();
            foreach(var key in resolvers.keys)
            {
                finalResolvers[key] = resolvers[key];
            }
            foreach(var key in extraResolvers.keys)
            {
                finalResolvers[key] = extraResolvers[key];
            }

            var o = c.CreateObj(t, finalResolvers);
            cache.set_object(o);
            return o;
        }

        public void AddResolver(string name, Resolver resolver)
        {
            resolvers[name] = resolver;
        }
    }
}
