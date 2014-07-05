using Gee;

namespace Ldraw.Utils.Di
{
    public class CreatorBuilder : Object
    {
        private Map<Type, Maker> registrations = new HashMap<Type, Maker>();
        private Map<Type, Collection<Maker>> all_registrations = new HashMap<Type, Collection<Maker>>();
        private MultiMap<Type, Registration> contexts = new HashMultiMap<Type, Registration>();

        public Registration Register<T>()
            requires(typeof(T).is_object())
            requires(!typeof(T).is_abstract())
        {
            var t = typeof(T);
            var maker = new Maker(t);
            registrations[t] = maker;
            if(!all_registrations.has_key(t))
            {
                all_registrations[t] = new ArrayList<Maker>();
            }
            all_registrations[t].add(maker);
            var reg = new Registration(maker, t);
            contexts[t] = reg;
            return reg;
        }

        public Registration RegisterAsInterface<TImpl, TInterface>()
            requires(typeof(TImpl).is_object())
            requires(typeof(TImpl).is_a(typeof(TInterface)))
            requires(!typeof(TImpl).is_abstract())
        {
            var t = typeof(TInterface);
            var maker = new Maker(typeof(TImpl));
            registrations[t] = maker;
            if(!all_registrations.has_key(t))
            {
                all_registrations[t] = new ArrayList<Maker>();
            }
            all_registrations[t].add(maker);
            return new Registration(maker, typeof(TImpl));
        }

        public Registration RegisterInstance<T>(T instance)
        {
			Type t2;
			var obj = instance as Object;
			if(obj == null)
				t2 = typeof(T);
			else
				t2 = obj.get_type();

			var t = typeof(T);
			var maker = new Maker.Instance(t, (Object)instance);
            registrations[t] = maker;
            if(!all_registrations.has_key(t))
            {
                all_registrations[t] = new ArrayList<Maker>();
            }
            all_registrations[t].add(maker);
            return new Registration(maker, t2);
		}

        public DependencyResolutionContext Build()
        {
            return new Creator(registrations.read_only_view, all_registrations.read_only_view, contexts);
        }
    }
}
