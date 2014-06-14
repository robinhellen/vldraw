using Gee;

namespace Ldraw.Utils.Di
{
    public class Creator : DependencyResolutionContext, Object
    {
        private Map<Type, Maker> registrations = new HashMap<Type, Maker>();
        private Map<Type, Collection<Maker>> all_registrations = new HashMap<Type, Collection<Maker>>();
        private MultiMap<Type, Value?> all_constructed = new HashMultiMap<Type, Value?>();

        public Creator(Map<Type, Maker> registrations, Map<Type, Collection<Maker>> all_registrations)
        {
            this.registrations = registrations;
            this.all_registrations = all_registrations;
        }

        public T Resolve<T>()
            throws DependencyResolutionError
            requires(registrations.has_key(typeof(T)))
        {
            var o = registrations[typeof(T)].Make(this);
            all_constructed[typeof(T)] = ObjectValue(typeof(T), o);
            return (T)o;
        }

        private Object Create(Type t)
            throws DependencyResolutionError
        {
            if(!registrations.has_key(t))
                throw new DependencyResolutionError.NotRegistered(@"The type '$(t.name())' was not registered.");

            var constructed = registrations[t].Make(this);
            all_constructed[t] = ObjectValue(t, constructed);
            return constructed;
        }

        private Value ObjectValue(Type t, Object o)
        {
            var v = Value(t);
            v.set_object(o);
            return v;
        }

        public Collection<T> ResolveAll<T>()
            throws DependencyResolutionError
            requires(all_registrations.has_key(typeof(T)))
        {
            var output = new ArrayList<T>();
            foreach(var maker in all_registrations[typeof(T)])
            {
                output.add(maker.Make(this));
                var o = maker.Make(this);
                all_constructed[typeof(T)] = ObjectValue(typeof(T), o);
                output.add((T)o);
            }
            return output.read_only_view;
        }

        public T ResolveWithProperty<T>(string propertyName, Resolver resolver)
            throws DependencyResolutionError
        {
            var resolvers = new HashMap<string, Resolver>();
            resolvers[propertyName] = resolver;
            return registrations[typeof(T)].MakeWith(this, resolvers);
        }

        public T ResolveWithProperties<T>(string propertyName, Resolver resolver, ...)
            throws DependencyResolutionError
        {
            var resolvers = new HashMap<string, Resolver>();
            resolvers[propertyName] = resolver;

            var args = va_list();
            while(true)
            {
                string p = args.arg();
                if(p == null)
                {
                    break;
                }
                Resolver r = args.arg();
                resolvers[p] = r;
            }

            var o = registrations[typeof(T)].MakeWith(this, resolvers);
            all_constructed[typeof(T)] = ObjectValue(typeof(T), o);
            return o;
        }

        public Collection<T> AllCreated<T>()
        {
            var result = new ArrayList<T>();
            foreach(var val in all_constructed[typeof(T)])
            {
                result.add((T)val.get_object());
            }
            return result;
        }

        public Object CreateObj(Type t, Map<string, Resolver> resolvers)
            throws DependencyResolutionError
        {
            if(!t.is_object())
            {
                throw new DependencyResolutionError.InvalidType(@"Cannot construct $(t.name())");
            }
            var cls = t.class_ref();
            var properties = ((ObjectClass)cls).list_properties();
            var params = new Parameter[] {};
            foreach(var prop in properties)
            {
                var flags = prop.flags;
                if(  ((flags & ParamFlags.CONSTRUCT) == ParamFlags.CONSTRUCT)
                  || ((flags & ParamFlags.CONSTRUCT_ONLY) == ParamFlags.CONSTRUCT_ONLY))
                {
                    var p = Parameter();
                    p.name = prop.name;

                    if(resolvers.has_key(p.name))
                    {
                        Resolver r = resolvers[p.name];
                        p.value = r(this);
                    }
                    else
                    {
                        p.value = Value(prop.value_type);
                        try
                        {
                            p.value.set_object(Create(prop.value_type));
                        }
                        catch(DependencyResolutionError e)
                        {
                            if((flags & ParamFlags.CONSTRUCT_ONLY) == ParamFlags.CONSTRUCT_ONLY)
                                throw new DependencyResolutionError.InnerResolutionError(@"Unable to resolve $(prop.value_type.name()) for property $(p.name) when creating $(t.name()):\n\t$(e.message)");
                        }
                    }
                    params += p;
                }
            }
            var o = Object.newv(t, params);
            return o;
        }

    }

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

    public class RegistrationContext : Object
    {
        private Maker maker;

        public RegistrationContext(Maker maker)
        {
            this.maker = maker;
        }

        public RegistrationContext WithProperty(string propertyName, Resolver func)
        {
            maker.AddResolver(propertyName, func);
            return this;
        }

        public RegistrationContext InstancePerDependency()
        {
            maker.Cache = false;
            return this;
        }
    }

    public errordomain DependencyResolutionError
    {
        InvalidType,
        NotRegistered,
        InnerResolutionError;
    }
}
