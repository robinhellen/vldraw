using Gee;

using Ldraw;

namespace Ldraw.Lego
{
	public class LdrawLibrary : Object
	{
		private File m_LibraryDir;
		private File m_PartsDirectory;
		private File m_SubPartsDirectory;
		private File m_PrimitivesDirectory;
		private File m_HiresPrimitivesDirectory;

		private Gee.List<LdrawPart> m_Parts;
		private Gee.List<LdrawPrimitive> m_Primitives;
		private Gee.List<LdrawSubPart> m_SubParts;
		private Gee.List<LdrawHiresPrimitive> m_HiresPrimitives;

		private MultiMap<string, LdrawPart> partPatterns;

		private TreeSet<string> m_Categories;

		public LdrawLibrary()
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

			partPatterns = new HashMultiMap<string, LdrawPart>();

			m_Categories = new TreeSet<string>();
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

		public LdrawObject? GetPartByName(string name)
		{
			foreach(LdrawPart part in m_Parts)
			{
				if(part.Name == name)
				{
					return part.MainObject;
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

		public Gee.List<LdrawPart> GetVariantsOf(LdrawPart part)
		{
			ArrayList<LdrawPart> parts = new ArrayList<LdrawPart>();
			foreach(LdrawPart p in m_Parts)
			{
				if(p.IsVariantOf(part))
				{
					parts.add(p);
				}
			}
			parts.sort();
			return parts;
		}

		delegate bool Finder<T>(string name, out T result);
		delegate T Creator<T>(string name, LdrawLibrary library) throws ParseError;
		delegate void Store<T>(T object);

		private void LoadAllInFolder<T>(File folder, IReportProgress progress, string friendlyName
									, Finder<T> tryGet, Creator<T> creator, Store<T> store)
			throws Error, InitializationError
		{
			float files = GetFileCount(folder);
			stderr.printf(@"counted $files $friendlyName.\n");
			var children = folder.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			unowned StringBuilder errors = new StringBuilder("Error loading ").append(friendlyName).append(".");
			bool parseError = false;
			int processed_files = 0;
			FileInfo current_file;
			while((current_file = children.next_file()) != null)
			{
				processed_files++;
				if(current_file.get_file_type() == FileType.DIRECTORY)
					continue;
				progress.Report(@"Loading $friendlyName.", processed_files / files);
				string name = current_file.get_name();

				T parsed;
				if(tryGet(name.substring(0, name.last_index_of(".")), out parsed))
					continue;

				try
				{
					var t = creator(name, this);
					store(t);
				}
				catch(ParseError e)
				{
					parseError = true;
					errors.append(@"\n$name: $(e.message)");
				}
			}
			if(parseError)
			{
				throw new InitializationError.LoadingParts(errors.str);
			}
		}

		private void LoadAllParts(IReportProgress progress)
			throws Error, InitializationError
		{
			LoadAllInFolder<LdrawPart>(PartsDirectory, progress, "parts",
				TryGetPart,
				(s, l) => new LdrawPart(s, l),
				p => {m_Parts.add(p); m_Categories.add(p.Category);}
			);
		}

		private void LoadAllSubParts(IReportProgress progress)
			throws Error, InitializationError
		{
			LoadAllInFolder<LdrawSubPart>(SubPartsDirectory, progress, "sub-parts",
				TryGetSubPart,
				(s, l) => new LdrawSubPart(s, l),
				p => m_SubParts.add(p)
			);
		}

		private void LoadAllPrimitives(IReportProgress progress)
			throws Error, InitializationError
		{
			LoadAllInFolder<LdrawPrimitive>(PrimitivesDirectory, progress, "primitives",
				TryGetPrimitive,
				(s, l) => new LdrawPrimitive(s, l),
				p => m_Primitives.add(p)
			);
		}

		private void LoadAllHiresPrimitives(IReportProgress progress)
			throws Error, InitializationError
		{
			LoadAllInFolder<LdrawHiresPrimitive>(HiresPrimitivesDirectory, progress, "high-res primitives",
				TryGetHiresPrimitive,
				(s, l) => new LdrawHiresPrimitive(s, l),
				p => m_HiresPrimitives.add(p)
			);
		}

		public void Initialize(IReportProgress progress)
			throws Error, InitializationError
		{
			// initialize colours
			LdrawColour.ReadAllColours(this);

			LoadAllHiresPrimitives(progress);
			LoadAllPrimitives(progress);
			LoadAllSubParts(progress);
			LoadAllParts(progress);
		}

		private int GetFileCount(File directory)
			throws Error
		{
			FileEnumerator enumer = directory.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			int count = 0;
			while(enumer.next_file() != null) count++;

			return count;
		}
	}

	public errordomain InitializationError
	{
		LoadingParts,
		LoadingColours,
	}
}
