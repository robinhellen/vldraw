using Gee;

using Ldraw.Lego.Library;

namespace Ldraw.Lego
{
	public interface ISubFileLocator : Object
	{
		public abstract LdrawObject? GetObjectFromReference(string reference)
			throws ParseError;
	}

	public class LibrarySubFileLocator : Object, ISubFileLocator
	{
		public IDatFileCache Library {construct; private get;}

		public LdrawObject? GetObjectFromReference(string reference)
			throws ParseError
		{
			var partName = reference.substring(0, reference.last_index_of("."));

			LdrawPart part;
			if(Library.TryGetPart(partName, out part))
				return part.MainObject;

			return null;
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

		public LdrawObject? GetObjectFromReference(string reference)
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
				base("", null);
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
						File = object.File;
						return;
					}
				}
			}
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

	public enum ReferenceLoadStrategy
	{
		PartsOnly,
		SubPartsAndPrimitives,
	}
}
