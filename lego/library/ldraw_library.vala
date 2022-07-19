using Gee;

using Ldraw;

namespace Ldraw.Lego.Library
{
	public class LdrawLibrary : Object, ILdrawFolders
	{
		private File m_LibraryDir;
		private File m_PartsDirectory;
		private File m_SubPartsDirectory;
		private File m_PrimitivesDirectory;
		private File m_HiresPrimitivesDirectory;
		private File m_LoresPrimitivesDirectory;
		private File m_ModelsDirectory;

		construct
		{
			var homeFolder = File.new_for_path(Environment.get_home_dir());
			m_LibraryDir = homeFolder.get_child("ldraw");
			m_PartsDirectory = m_LibraryDir.get_child("parts");
			m_SubPartsDirectory = m_PartsDirectory.get_child("s");
			m_PrimitivesDirectory = m_LibraryDir.get_child("p");
			m_HiresPrimitivesDirectory = m_PrimitivesDirectory.get_child("48");
			m_LoresPrimitivesDirectory = m_PrimitivesDirectory.get_child("8");

			m_ModelsDirectory = m_LibraryDir.get_child("models");
			if(!m_ModelsDirectory.query_exists())
			{
				m_ModelsDirectory = m_LibraryDir.get_child("MODELS");
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

		public File LoresPrimitivesDirectory
		{
			get
			{
				return m_LoresPrimitivesDirectory;
			}
		}

		public File ModelsDirectory {get{return m_ModelsDirectory;}}
	}

	public errordomain InitializationError
	{
		LoadingParts,
		LoadingColours,
	}
}
