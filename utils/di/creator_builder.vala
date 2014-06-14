using Gee;

namespace Ldraw.Utils.Di
{
    public class CreatorBuilder : Object
    {
        private Map<Type, Maker> registrations = new HashMap<Type, Maker>();
        private Map<Type, Collection<Maker>> all_registrations = new HashMap<Type, Collection<Maker>>();

        public RegistrationContext Register<T>()
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
            return new RegistrationContext(maker);
        }

        public RegistrationContext RegisterAsInterface<TImpl, TInterface>()
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
            return new RegistrationContext(maker);
        }

        public DependencyResolutionContext Build()
        {
            return new Creator(registrations.read_only_view, all_registrations.read_only_view);
        }
    }
}
