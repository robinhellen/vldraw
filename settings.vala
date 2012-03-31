namespace Ldraw
{
	public class Settings : Object
	{
		public float GridX;
		public float GridY;
		public float GridZ;

		public static Settings Load()
		{
			Settings defaults = new Settings();

			defaults.GridX = 5.0f;
			defaults.GridZ = 5.0f;
			defaults.GridY = 4.0f;

			return defaults;
		}
	}
}
