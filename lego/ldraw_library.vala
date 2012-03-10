using Gee;

namespace Ldraw.Lego
{
	public class LdrawLibrary : Object // singleton
	{
		private static LdrawLibrary m_Instance;
		private static Object s_InstanceLock = new Object();

		private File m_LibraryDir;
		private File m_PartsDirectory;
		private File m_SubPartsDirectory;
		private File m_PrimitivesDirectory;
		private File m_HiresPrimitivesDirectory;

		private Gee.List<LdrawPart> m_Parts;
		private Gee.List<LdrawPrimitive> m_Primitives;
		private Gee.List<LdrawSubPart> m_SubParts;
		private Gee.List<LdrawHiresPrimitive> m_HiresPrimitives;
		
		private TreeSet<string> m_Categories;

		private LdrawLibrary()
		{
			m_LibraryDir = File.new_for_path("/home/robin/ldraw");
			m_PartsDirectory = m_LibraryDir.get_child("parts");
			m_SubPartsDirectory = m_PartsDirectory.get_child("s");
			m_PrimitivesDirectory = m_LibraryDir.get_child("p");
			m_HiresPrimitivesDirectory = m_PrimitivesDirectory.get_child("48");
			m_Parts = new ArrayList<LdrawPart>();
			m_Primitives = new ArrayList<LdrawPrimitive>();
			m_HiresPrimitives = new ArrayList<LdrawHiresPrimitive>();
			m_SubParts = new ArrayList<LdrawSubPart>();
			
			m_Categories = new TreeSet<string>();
		}

		public static LdrawLibrary Instance
		{
			get
			{
				lock(s_InstanceLock)
				{
					if(m_Instance == null)
					{
						m_Instance = new LdrawLibrary();
					}
					return m_Instance;
				}
			}
		}

		public File LibraryDirectory
		{
			get
			{
				return m_LibraryDir;
			}
		}

		public File PartsDirectory
		{
			get
			{
				return m_PartsDirectory;
			}
		}

		public File SubPartsDirectory
		{
			get
			{
				return m_SubPartsDirectory;
			}
		}

		public File PrimitivesDirectory
		{
			get
			{
				return m_PrimitivesDirectory;
			}
		}

		public File HiresPrimitivesDirectory
		{
			get
			{
				return m_HiresPrimitivesDirectory;
			}
		}

		public LdrawPart? GetPartByName(string name)
		{
			foreach(LdrawPart part in m_Parts)
			{
				if(part.Name == name)
				{
					return part;
				}
			}
			return null;
		}

		public bool TryGetPrimitive(string name, out LdrawPrimitive primitive)
		{
			foreach(LdrawPrimitive prim in m_Primitives)
			{
				if(prim.Name == name)
				{
					primitive = prim;
					return true;
				}
			}
			primitive = null;
			return false;
		}

		public LdrawPrimitive RegisterPrimitive(LdrawPrimitive primitive)
		{
			LdrawPrimitive p;
			if(!TryGetPrimitive(primitive.Name, out p))
			{
				m_Primitives.add(primitive);
				return primitive;
			}
			return p;
		}

		public bool TryGetHiresPrimitive(string name, out LdrawHiresPrimitive primitive)
		{
			foreach(LdrawHiresPrimitive prim in m_HiresPrimitives)
			{
				if(prim.Name == name)
				{
					primitive = prim;
					return true;
				}
			}
			primitive = null;
			return false;
		}

		public LdrawHiresPrimitive RegisterHiresPrimitive(LdrawHiresPrimitive primitive)
		{
			LdrawHiresPrimitive p;
			if(!TryGetHiresPrimitive(primitive.Name, out p))
			{
				m_HiresPrimitives.add(primitive);
				return primitive;
			}
			return p;
		}

		public bool TryGetPart(string name, out LdrawPart part)
		{
			foreach(LdrawPart p in m_Parts)
			{
				if(p.Name == name)
				{
					part = p;
					return true;
				}
			}
			part = null;
			return false;
		}

		public LdrawPart RegisterPart(LdrawPart primitive)
		{
			LdrawPart p;
			if(!TryGetPart(primitive.Name, out p))
			{
				m_Parts.add(primitive);
				m_Categories.add(primitive.Category);
				return primitive;
			}
			return p;
		}

		public bool TryGetSubPart(string name, out LdrawSubPart part)
		{
			foreach(LdrawSubPart p in m_SubParts)
			{
				if(p.Name == name)
				{
					part = p;
					return true;
				}
			}
			part = null;
			return false;
		}

		public LdrawSubPart RegisterSubPart(LdrawSubPart primitive)
		{
			LdrawSubPart p;
			if(!TryGetSubPart(primitive.Name, out p))
			{
				m_SubParts.add(primitive);
				return primitive;
			}
			return p;
		}

		public Set<string> AllCategories
		{
			owned get
			{
				return m_Categories.read_only_view;
			}
		}

		public Gee.List<LdrawPart> GetPartsByCategory(string? category)
		{
			ArrayList<LdrawPart> parts = new ArrayList<LdrawPart>();
			foreach(LdrawPart part in m_Parts)
			{
				if(part.Category == category)
				{
					parts.add(part);
				}
			}
			parts.sort();
			return parts;
		}

		private void LoadAllParts()
			throws Error, InitializationError
		{
			FileEnumerator enumer = PartsDirectory.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			FileInfo info;
			StringBuilder sb = new StringBuilder("Error loading parts.");
			bool parseError = false;
			while((info = enumer.next_file()) != null)
			{
				if(info.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = info.get_name();

				LdrawPart sp;
				if(TryGetPart(name.substring(0, name.last_index_of(".")), out sp))
					continue;

				try
				{
					LdrawPart part = new LdrawPart(name);
					m_Parts.add(part);
					m_Categories.add(part.Category);
				}
				catch (ParseError e)
				{
					parseError = true;
					string message = e.message;
					sb.append(@"\n$name: $message");
				}
			}
			if(parseError)
			{
				throw new InitializationError.LoadingParts(sb.str);
			}
		}

		private void LoadAllSubParts()
			throws Error, InitializationError
		{
			FileEnumerator enumer = SubPartsDirectory.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			FileInfo info;
			StringBuilder sb = new StringBuilder("Error loading parts.");
			bool parseError = false;
			while((info = enumer.next_file()) != null)
			{
				if(info.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = info.get_name();

				LdrawSubPart sp;
				if(TryGetSubPart(name.substring(0, name.last_index_of(".")), out sp))
					continue;

				try
				{
					LdrawSubPart part = new LdrawSubPart(name);
					m_SubParts.add(part);
				}
				catch (ParseError e)
				{
					parseError = true;
					string message = e.message;
					sb.append(@"\n$name: $message");
				}
			}
			if(parseError)
			{
				throw new InitializationError.LoadingParts(sb.str);
			}
		}

		private void LoadAllPrimitives()
			throws Error, InitializationError
		{
			FileEnumerator enumer = PrimitivesDirectory.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			FileInfo info;
			StringBuilder sb = new StringBuilder("Error loading parts.");
			bool parseError = false;
			while((info = enumer.next_file()) != null)
			{
				if(info.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = info.get_name();
				LdrawPrimitive p;
				if(TryGetPrimitive(name.substring(0, name.last_index_of(".")), out p))
					continue;

				try
				{
					LdrawPrimitive part = new LdrawPrimitive(name);
					m_Primitives.add(part);
				}
				catch (ParseError e)
				{
					parseError = true;
					string message = e.message;
					sb.append(@"\n$name: $message");
				}
			}
			if(parseError)
			{
				throw new InitializationError.LoadingParts(sb.str);
			}
		}

		private void LoadAllHiresPrimitives()
			throws Error, InitializationError
		{
			FileEnumerator enumer = HiresPrimitivesDirectory.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			FileInfo info;
			StringBuilder sb = new StringBuilder("Error loading parts.");
			bool parseError = false;
			while((info = enumer.next_file()) != null)
			{
				if(info.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = info.get_name();
				LdrawHiresPrimitive p;
				if(TryGetHiresPrimitive(name.substring(0, name.last_index_of(".")), out p))
					continue;

				try
				{
					LdrawHiresPrimitive part = new LdrawHiresPrimitive(name);
					m_HiresPrimitives.add(part);
				}
				catch (ParseError e)
				{
					parseError = true;
					string message = e.message;
					sb.append(@"\n$name: $message");
				}
			}
			if(parseError)
			{
				throw new InitializationError.LoadingParts(sb.str);
			}
		}

		public void Initialize()
			throws Error, InitializationError
		{
			// initialize colours
			LdrawColour.ReadAllColours();

			LoadAllHiresPrimitives();
			LoadAllPrimitives();
			LoadAllSubParts();
			LoadAllParts();
		}
	}

	public errordomain InitializationError
	{
		LoadingParts,
		LoadingColours,
	}
}
