using Gee;

namespace Ldraw.Utils.Di
{
    public class Creator : DependencyResolutionContext, Object
    {
        private Map<Type, Maker> registrations = new HashMap<Type, Maker>();
        private Map<Type, Collection<Maker>> all_registrations = new HashMap<Type, Collection<Maker>>();
        private MultiMap<Type, Registration> contexts;

        public Creator(Map<Type, Maker> registrations, Map<Type, Collection<Maker>> all_registrations, MultiMap<Type, Registration> contexts)
        {
            this.registrations = registrations;
            this.all_registrations = all_registrations;
            this.contexts = contexts;
        }

        public T Resolve<T>()
            throws DependencyResolutionError
        {
			if(!registrations.has_key(typeof(T)))
			{
				throw new DependencyResolutionError.NotRegistered(@"'$(typeof(T).name())' was not registered");
			}
            var o = registrations[typeof(T)].Make(this);
            return (T)o;
        }

        private Object Create(Type t)
            throws DependencyResolutionError
        {
            if(!registrations.has_key(t))
                throw new DependencyResolutionError.NotRegistered(@"The type '$(t.name())' was not registered.");

            var constructed = registrations[t].Make(this);
            return constructed;
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
            return o;
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
                if(CanInjectProperty(prop))
                {
					Parameter p;
					if(
						ResolversIncludes(prop, resolvers, out p) ||
						IsIndex(prop, out p) ||
						CanCreate(prop, out p)
					)
					{
						params += p;
					}
					else
					{
						if((prop.flags & ParamFlags.CONSTRUCT_ONLY) == ParamFlags.CONSTRUCT_ONLY)
							throw new DependencyResolutionError.InnerResolutionError(@"Unable to resolve $(prop.value_type.name()) for property $(prop.name) when creating $(t.name()):\n\tNo matching regstrations found.");

					}
                }
            }
            var o = Object.newv(t, params);
            return o;
        }

        private bool CanInjectProperty(ParamSpec p)
        {
			var flags = p.flags;
			return (  ((flags & ParamFlags.CONSTRUCT) == ParamFlags.CONSTRUCT)
			  || ((flags & ParamFlags.CONSTRUCT_ONLY) == ParamFlags.CONSTRUCT_ONLY));
		}

		private bool ResolversIncludes(ParamSpec prop, Map<string, Resolver> resolvers, out Parameter p)
			throws DependencyResolutionError
		{
			p = Parameter();
			if(!resolvers.has_key(prop.name))
			{
				return false;
			}

			p.name = prop.name;

			Resolver r = resolvers[p.name];
			p.value = r(this);
			return true;
		}

		private bool CanCreate(ParamSpec prop, out Parameter p)
			throws DependencyResolutionError
		{
			p = Parameter();
			var t = prop.value_type;
            if(!registrations.has_key(t))
            {
				return false;
			}

			p.name = prop.name;

			p.value = Value(t);
			try
			{
				p.value.set_object(Create(t));
			}
			catch(DependencyResolutionError e)
			{
				if((prop.flags & ParamFlags.CONSTRUCT_ONLY) == ParamFlags.CONSTRUCT_ONLY)
					throw new DependencyResolutionError.InnerResolutionError(@"Unable to resolve $(prop.value_type.name()) for property $(p.name) when creating $(t.name()):\n\t$(e.message)");

			}
			return true;
		}

		private bool IsIndex(ParamSpec property, out Parameter p)
		{
			p = Parameter();
			if(property.value_type != typeof(IIndex))
			{
				return false;
			}

			p.name = property.name;

			p.value = Value(property.value_type);
			var indexData = (IndexPropertyData)property.get_qdata(Quark.from_string("di_indexed"));

			p.value.set_object(CreateIndex(indexData));
			return true;
		}

		private Object CreateIndex(IndexPropertyData data)
		{
			var keyType = data.Key;
			var dependencyType = data.Dependency;

			var keyedRegistrations = new HashMap<Value?, Registration>();

			foreach(var registration in contexts.get_values())
			{
				var keys = registration.GetKeysFor(dependencyType);
				foreach (var key in keys)
				{
					if(key.holds(keyType))
					{
						keyedRegistrations[key] = registration;
					}
				}
			}

			var index = (MakerIndex<Object, Object>)Object.new(typeof(MakerIndex), Creator: this, tkey_type: keyType, tdependency_type: dependencyType);
			index.Initialize(keyedRegistrations);
			return index;
		}
    }

	public class MakerIndex<TKey, TDependency> : IIndex<TKey, TDependency>, Object
	{
		private Map<TKey, Maker> Makers {set; get;}
		public Creator Creator {construct; private get;}

		public new TDependency @get(TKey key)
		{
			return Makers[key].Make(Creator);
		}

		public void Initialize(Map<Value?, Registration> registrations)
		{
			Makers = new HashMap<TKey, Maker>();
			foreach(var entry in registrations.entries)
			{
				var v = entry.key;

				Makers[ExtractKey(v)] = entry.value.Maker;
			}
		}

		private TKey ExtractKey(Value v)
		{
			var valueType = v.type();
			if(valueType.is_enum())
			{
				var key = (TKey)v.get_enum();
				return key;
			}
			return (TKey)v.get_pointer;
		}
	}

    public errordomain DependencyResolutionError
    {
        InvalidType,
        NotRegistered,
        InnerResolutionError;
    }
}
