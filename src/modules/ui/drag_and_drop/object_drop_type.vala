namespace Ldraw.Ui.DragAndDrop
{
	public enum ObjectDropType
	{
		Library = 1,
		Document;
		
		public static ObjectDropType FromString(string dropSource)
		{
			switch(dropSource)
			{
				case "":
					return Library;
				case "Document":
					return Document;
			}
			assert_not_reached();
		}
		
		public string AsString()
		{
			switch(this)
			{
				case Library:
					return "";
				case Document:
					return "Document";
					
			}
			assert_not_reached();
		}
	}
}
