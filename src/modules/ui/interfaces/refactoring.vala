using Gtk;

namespace Ldraw.Ui
{
	public interface Refactoring : GLib.Object
	{
		/*
		 * Return the label used to identify this refactoring in the menu
		 * */
		public abstract string GetLabel();

		/*
		 * Returns true if this refactoring can be executed on the current model / file / selection
		 * */
		public abstract bool CanExecute(AnimatedModel model);

		/*
		 * Get allthe information necessary to execute the refactoring
		 * returns true if the user wants to procede
		 * returns false if the user cancels.
		 * */
		public abstract bool PrepareToExecute(AnimatedModel model, Window dialogParent, out Command? command);
	}
}
