using Gee;

namespace Ldraw.Lego
{
	public interface ISubFileLocator : Object
	{
		public abstract LdrawObject GetObjectFromReference(string reference)
			throws ParseError;
	}

	public class LibrarySubFileLocator : Object, ISubFileLocator
	{
		private LdrawLibrary library;

		public LibrarySubFileLocator(LdrawLibrary library)
		{
			this.library = library;
		}

		public LdrawObject GetObjectFromReference(string reference)
		{
			return library.GetPartByName(reference.substring(0, reference.last_index_of(".")));
		}
	}

	public class MultipartSubFileLocator : Object, ISubFileLocator
	{
		private ISubFileLocator m_Locator;
		private Collection<ProxyLdrawObject> m_Proxies;

		public MultipartSubFileLocator(ISubFileLocator baseLocator)
		{
			m_Locator = baseLocator;
			m_Proxies = new ArrayList<ProxyLdrawObject>();
		}

		public LdrawObject GetObjectFromReference(string reference)
			throws ParseError
		{
			var baseVal = m_Locator.GetObjectFromReference(reference);
			if(baseVal == null)
			{
				var proxy = new ProxyLdrawObject(reference);
				m_Proxies.add(proxy);
				return proxy;
			}
			return baseVal;
		}

		public void ResolveAll(Collection<LdrawObject> possibilities)
		{
			foreach(var proxy in m_Proxies)
			{
				proxy.Resolve(possibilities);
			}
		}

		public class ProxyLdrawObject : LdrawObject
		{
			public ProxyLdrawObject(string filename)
			{
				base("");
				FileName = filename;
			}

			public void Resolve(Collection<LdrawObject> possibilities)
			{
				foreach(LdrawObject object in possibilities)
				{
					if(object.FileName.casefold() == FileName.casefold())
					{
						Nodes = object.Nodes;
						Description = object.Description;
						return;
					}
				}
			}
		}
	}

	public class PartialLibrarySubFileLocator : Object, ISubFileLocator
	{
		private LibraryObjectTypes m_Types;
		private LdrawLibrary library;

		public PartialLibrarySubFileLocator(LibraryObjectTypes types, LdrawLibrary library)
		{
			m_Types = types;
			this.library = library;
		}

		public LdrawObject GetObjectFromReference(string reference)
			throws ParseError
		{
			string[] toks = reference.split_set("/\\");
			if(toks[0] == "s" && (m_Types & LibraryObjectTypes.SubPart) != 0)
			{
				string name = toks[1].substring(0, toks[1].last_index_of("."));
				LdrawSubPart sp;
				if(library.TryGetSubPart(name, out sp))
				{
					return sp.MainObject;
				}
				File subPartAttempt = library.SubPartsDirectory.get_child(toks[1]);
				if(subPartAttempt.query_exists())
				{
					sp = new LdrawSubPart(toks[1], library);
					library.RegisterSubPart(sp);
					return sp.MainObject;
				}
				throw new ParseError.MissingFile(@"Could not locate sub-part at $reference");
			}
			if(toks[0] == "48" && (m_Types & LibraryObjectTypes.HiResPrimitive) != 0)
			{
				string name = toks[1].substring(0, toks[1].last_index_of("."));
				LdrawHiresPrimitive hp;
				if(library.TryGetHiresPrimitive(name, out hp))
				{
					return hp.MainObject;
				}

				File hiresAttempt = library.HiresPrimitivesDirectory.get_child(toks[1]);
				if(hiresAttempt.query_exists())
				{
					hp = new LdrawHiresPrimitive(toks[1], library);
					library.RegisterHiresPrimitive(hp);
					return hp.MainObject;
				}
				throw new ParseError.MissingFile(@"Could not locate primitive at $reference");
			}
			// no directory prefix : primitive _or_ part
			// try primitive first
			string name = toks[0].substring(0, toks[0].last_index_of("."));
			if((m_Types & LibraryObjectTypes.Primitive) != 0)
			{
				LdrawPrimitive p;
				if(library.TryGetPrimitive(name, out p))
					return p.MainObject;

				File primitiveAttempt = library.PrimitivesDirectory.get_child(toks[0]);
				if(primitiveAttempt.query_exists())
				{
					p = new LdrawPrimitive(toks[0], library);
					p = library.RegisterPrimitive(p);
					return p.MainObject;
				}
			}

			if((m_Types & LibraryObjectTypes.Part) != 0)
			{
				LdrawPart part;
				if(library.TryGetPart(name, out part))
					return part.MainObject;

				File partAttempt = library.PartsDirectory.get_child(toks[0]);
				if(partAttempt.query_exists())
				{
					part = new LdrawPart(toks[0], library);
					library.RegisterPart(part);
					return part.MainObject;
				}
			}
			throw new ParseError.MissingFile(@"Could not locate part or primitive for $reference");
		}
	}

	[Flags]
	public enum LibraryObjectTypes
	{
		Part = 1,
		SubPart = 2,
		Primitive = 4,
		HiResPrimitive = 8,
	}

}
