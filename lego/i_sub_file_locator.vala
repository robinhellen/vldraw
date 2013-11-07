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
		public LdrawObject GetObjectFromReference(string reference)
		{
			LdrawLibrary lib = LdrawLibrary.Instance;

			return lib.GetPartByName(reference.substring(0, reference.last_index_of(".")));
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
			private string m_FileName;

			public ProxyLdrawObject(string filename)
			{
				base("");
				m_FileName = filename;
			}

			public void Resolve(Collection<LdrawObject> possibilities)
			{
				foreach(LdrawObject object in possibilities)
				{
					if(object.FileName.casefold() == m_FileName.casefold())
					{
						Nodes = object.Nodes;
						FileName = m_FileName;
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

		public PartialLibrarySubFileLocator(LibraryObjectTypes types)
		{
			m_Types = types;
		}

		public LdrawObject GetObjectFromReference(string reference)
			throws ParseError
		{
			LdrawLibrary lib = LdrawLibrary.Instance;

			string[] toks = reference.split_set("/\\");
			if(toks[0] == "s" && (m_Types & LibraryObjectTypes.SubPart) != 0)
			{
				string name = toks[1].substring(0, toks[1].last_index_of("."));
				LdrawSubPart sp;
				if(lib.TryGetSubPart(name, out sp))
				{
					return sp.MainObject;
				}
				File subPartAttempt = lib.SubPartsDirectory.get_child(toks[1]);
				if(subPartAttempt.query_exists())
				{
					sp = new LdrawSubPart(toks[1]);
					lib.RegisterSubPart(sp);
					return sp.MainObject;
				}
				throw new ParseError.MissingFile(@"Could not locate sub-part at $reference");
			}
			if(toks[0] == "48" && (m_Types & LibraryObjectTypes.HiResPrimitive) != 0)
			{
				string name = toks[1].substring(0, toks[1].last_index_of("."));
				LdrawHiresPrimitive hp;
				if(lib.TryGetHiresPrimitive(name, out hp))
				{
					return hp.MainObject;
				}

				File hiresAttempt = lib.HiresPrimitivesDirectory.get_child(toks[1]);
				if(hiresAttempt.query_exists())
				{
					hp = new LdrawHiresPrimitive(toks[1]);
					lib.RegisterHiresPrimitive(hp);
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
				if(lib.TryGetPrimitive(name, out p))
					return p.MainObject;

				File primitiveAttempt = lib.PrimitivesDirectory.get_child(toks[0]);
				if(primitiveAttempt.query_exists())
				{
					p = new LdrawPrimitive(toks[0]);
					p = lib.RegisterPrimitive(p);
					return p.MainObject;
				}
			}

			if((m_Types & LibraryObjectTypes.Part) != 0)
			{
				LdrawPart part;
				if(lib.TryGetPart(name, out part))
					return part.MainObject;

				File partAttempt = lib.PartsDirectory.get_child(toks[0]);
				if(partAttempt.query_exists())
				{
					part = new LdrawPart(toks[0]);
					lib.RegisterPart(part);
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
