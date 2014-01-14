using Gee;
using Gtk;

using Ldraw.Expressions;
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;

namespace Ldraw.Ui
{
	/* AnimationDialog - gets user input on what animation to apply to nodes in the selection
	 *
	 * Initial display depends on selection (filtered to part nodes only.)
	 * - None: Should not be shown
	 * - Single node: Populate with aniation for that node
	 * - Multiple nodes (Same animation for all): Populate with that animation data
	 * - Multiple nodes (Different animations): Populate empty
	 *
	 * Behavior on 'OK':
	 * - All selected nodes have their animation set to what is shown in the dialog
	 *
	 */
	public class AnimationDialog : GLib.Object
	{
		private AnimatedModel model;
		private Dialog dialog;

		// Rotation
		bool hasRotation = false;
		private Vector? rotationAxis;
		private Expression rotationAngle;

		// Translation
		bool hasTranslation = false;
		private Vector? translationVector;
		private Expression translationDistance;

		public AnimationDialog(AnimatedModel model, Window parent)
		{
			this.model = model;

			dialog = new Dialog.with_buttons("Model details", parent,
				DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
				Stock.OK, ResponseType.ACCEPT,
				Stock.CANCEL, ResponseType.REJECT);

			GetOriginalValues(model);

			var contentArea = (VBox)dialog.get_content_area();

		}

		public void Run()
		{
			dialog.show_all();
			var result = dialog.run();
			if(result == ResponseType.ACCEPT)
			{

			}
			dialog.destroy();
		}

		private void GetOriginalValues(AnimatedModel model)
		{
			hasRotation = false;
			hasTranslation = false;
			rotationAngle = null;
			rotationAxis = Vector.NullVector;
			translationDistance = null;
			translationVector = Vector.NullVector;

			var selection = model.Model.Selection;
			// selection
			//   .Select(n => GetAnimationFor(n))
			//   .Distinct() // May need equality func
			//   .SingleOrDefault();
			var animationSets = GetAnimationsFor(selection, model.Model);
			var distinctSets = Distinctify(animationSets);
			if(distinctSets.size == 1)
			{
				var commandList = distinctSets.to_array()[0];
				var rotation = FirstRotation(commandList);
				if(rotation != null)
				{
					hasRotation = true;
					rotationAngle = rotation.Angle;
					rotationAxis = rotation.Axis;
				}
				// TODO: translations
			}
		}

		private Collection<Collection<AnimMetaCommand>> GetAnimationsFor(Collection<LdrawNode> nodes, LdrawObject object)
		{
			var result = new LinkedList<Collection<AnimMetaCommand>>();
			foreach(var node in nodes)
			{
				result.add(GetAnimationFor(node, object));
			}
			return result;
		}

		private Collection<AnimMetaCommand> GetAnimationFor(LdrawNode node, LdrawObject object)
		{
			var result = new LinkedList<AnimMetaCommand>();
			LdrawNode previous = node;
			while(previous != null)
			{
				previous = object.GetPreviousNode(previous);
				var command = previous as AnimMetaCommand;
				if(command == null)
					break;
				result.add(command);
			}
			return result;
		}

		private Collection<Collection<AnimMetaCommand>> Distinctify(Collection<Collection<AnimMetaCommand>> commandSets)
		{
			var result = new LinkedList<Collection<AnimMetaCommand>>();
			foreach(var list in commandSets)
			{
				if(!Contains(result, list))
					result.add(list);
			}
			return result;
		}

		private bool Contains(Collection<Collection<AnimMetaCommand>> list, Collection<AnimMetaCommand> value)
		{
			foreach(var v in list)
			{
				if(AreEqual(v, value))
					return true;
			}
			return false;
		}

		private bool AreEqual(Collection<AnimMetaCommand> a, Collection<AnimMetaCommand> b)
		{
			if(a.size != b.size)
				return false;

			var arrayA = a.to_array();
			var arrayB = b.to_array();

			for(int i = 0; i < a.size; i++)
			{
				var cmdA = arrayA[i];
				var cmdB = arrayB[i];

				if(!cmdA.Equals(cmdB))
					return false;
			}
			return true;
		}

		private AnimRotateCommand? FirstRotation(Collection<AnimMetaCommand> list)
		{
			foreach(var cmd in list)
			{
				var rotateCommand = cmd as AnimRotateCommand;
				if(rotateCommand != null)
					return rotateCommand;
			}
			return null;
		}
	}
}
