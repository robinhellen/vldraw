using Gee;

namespace Ldraw.Utils.Di
{
    public class Registration : Object
    {
		public Maker Maker{get; private set;}
		private Type type;
		private Set<Type> provides = new HashSet<Type>();
		private MultiMap<Type, Value?> keys = new HashMultiMap<Type, Value?>();

		public Registration(Maker maker, Type type)
            requires(type.is_object())
		{
			Maker = maker;
			this.type = type;
			provides.add(type);
		}

		public Registration AsInterface<TInterface>()
            requires(type.is_a(typeof(TInterface)))
		{
			provides.add(typeof(TInterface));
			return this;
		}

		public Registration AsImplementedInterfaces()
		{
			var interfaces = type.interfaces();
			provides.add_all_array(interfaces);
			return this;
		}

        public Registration WithProperty(string propertyName, Resolver func)
        {
            Maker.AddResolver(propertyName, func);
            return this;
        }

        public Registration InstancePerDependency()
        {
            Maker.Cache = false;
            return this;
        }

        public Registration Keyed<TKey, TInterface>(TKey key)
        {
			var t = typeof(TKey);
			var v = Value(t);
			if(t.is_object())
				v.set_object((Object)key);
			if(t.is_enum())
				v.set_enum((int) key);

			keys[typeof(TInterface)] = v;
			provides.add(typeof(TInterface));
			return this;
		}

		public Collection<Value?> GetKeysFor(Type depedencyType)
		{
			return keys[depedencyType];
		}
	}
}
