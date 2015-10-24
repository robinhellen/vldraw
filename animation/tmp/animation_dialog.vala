using Gee;
using Gtk;

using Ldraw.Animation;
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
	private class AnimationDialog : GLib.Object
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

			dialog = new Dialog.with_buttons("Animation details", parent,
				DialogFlags.MODAL | DialogFlags.DESTROY_WITH_PARENT,
				"_OK", ResponseType.ACCEPT,
				"_Cancel", ResponseType.REJECT);

			GetOriginalValues(model);

			var contentArea = (VBox)dialog.get_content_area();
			var animationControlsBox = new Box(Orientation.VERTICAL, 0);

			var rotationAngleEntry = new Entry();
			rotationAngleEntry.text = rotationAngle == null ? "" : rotationAngle.to_string();
			rotationAngleEntry.notify["text"].connect(() =>
				{
					rotationAngle = new Expression.Parse(rotationAngleEntry.text);
				});
			var rotationAxisX = new Entry();
			rotationAxisX.text = rotationAxis == null ? "" : rotationAxis.X.to_string();
			rotationAxisX.notify["text"].connect(() =>
				{
					rotationAxis = Vector((float)double.parse(rotationAxisX.text), rotationAxis.Y, rotationAxis.Z);
				});

			var rotationAxisY = new Entry();
			rotationAxisY.text = rotationAxis == null ? "" : rotationAxis.Y.to_string();
			rotationAxisY.notify["text"].connect(() =>
				{
					rotationAxis = Vector(rotationAxis.X, (float)double.parse(rotationAxisY.text), rotationAxis.Z);
				});

			var rotationAxisZ = new Entry();
			rotationAxisZ.text = rotationAxis == null ? "" : rotationAxis.Z.to_string();
			rotationAxisZ.notify["text"].connect(() =>
				{
					rotationAxis = Vector(rotationAxis.X, rotationAxis.Y, (float)double.parse(rotationAxisZ.text));
				});


			var enableRotation = new CheckButton.with_label("Rotate");
			enableRotation.active = hasRotation;
			enableRotation.toggled.connect(() =>
				{
					var state = enableRotation.active;
					hasRotation = state;
					rotationAngleEntry.sensitive = state;
					rotationAxisX.sensitive = state;
					rotationAxisY.sensitive = state;
					rotationAxisZ.sensitive = state;
				});
			rotationAngleEntry.sensitive = hasRotation;
			rotationAxisX.sensitive = hasRotation;
			rotationAxisY.sensitive = hasRotation;
			rotationAxisZ.sensitive = hasRotation;


			animationControlsBox.pack_start(enableRotation, false, false);
			animationControlsBox.pack_start(rotationAngleEntry, false, false);

			var rotationAxisHBox = new Box(Orientation.HORIZONTAL, 0);
			rotationAxisHBox.pack_start(new Label("Axis: ("), false, false);
			rotationAxisHBox.pack_start(rotationAxisX, false, false);
			rotationAxisHBox.pack_start(new Label(", "), false, false);
			rotationAxisHBox.pack_start(rotationAxisY, false, false);
			rotationAxisHBox.pack_start(new Label(", "), false, false);
			rotationAxisHBox.pack_start(rotationAxisZ, false, false);
			rotationAxisHBox.pack_start(new Label(")"), false, false);

			animationControlsBox.pack_start(rotationAxisHBox, false, false);

			contentArea.pack_start(animationControlsBox, false, false);

		}

		public void Run()
		{
			dialog.show_all();
			var result = dialog.run();
			if(result == ResponseType.ACCEPT)
			{
				SetSelectionAnimation();
			}
			dialog.destroy();
		}

		private void SetSelectionAnimation()
		{
			foreach(var node in model.Selection)
			{
				SetNodeAnimation(node);
			}
		}

		private void SetNodeAnimation(LdrawNode node)
		{
			var originalCommands = GetAnimationFor(node, model.Model);
			foreach(var command in originalCommands)
			{
				model.Model.RemoveNode(command);
			}

			if(hasRotation)
			{
				var newCommand = new RotateCommand.Rotation(rotationAxis, rotationAngle);
				model.Model.InsertNode(newCommand, node);
			}
		}

		private void GetOriginalValues(AnimatedModel model)
		{
			hasRotation = false;
			hasTranslation = false;
			rotationAngle = null;
			rotationAxis = null;
			translationDistance = null;
			translationVector = null;

			var selection = model.Selection;
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

		private Collection<Collection<AnimationCommand>> GetAnimationsFor(Collection<LdrawNode> nodes, LdrawObject object)
		{
			var result = new LinkedList<Collection<AnimationCommand>>();
			foreach(var node in nodes)
			{
				result.add(GetAnimationFor(node, object));
			}
			return result;
		}

		private Collection<AnimationCommand> GetAnimationFor(LdrawNode node, LdrawObject object)
		{
			var result = new LinkedList<AnimationCommand>();
			LdrawNode previous = node;
			while(previous != null)
			{
				previous = object.GetPreviousNode(previous);
				var command = previous as AnimationCommand;
				if(command == null)
					break;
				result.add(command);
			}
			return result;
		}

		private Collection<Collection<AnimationCommand>> Distinctify(Collection<Collection<AnimationCommand>> commandSets)
		{
			var result = new LinkedList<Collection<AnimationCommand>>();
			foreach(var list in commandSets)
			{
				if(!Contains(result, list))
					result.add(list);
			}
			return result;
		}

		private bool Contains(Collection<Collection<AnimationCommand>> list, Collection<AnimationCommand> value)
		{
			foreach(var v in list)
			{
				if(AreEqual(v, value))
					return true;
			}
			return false;
		}

		private bool AreEqual(Collection<AnimationCommand> a, Collection<AnimationCommand> b)
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

		private RotateCommand? FirstRotation(Collection<AnimationCommand> list)
		{
			foreach(var cmd in list)
			{
				var rotateCommand = cmd as RotateCommand;
				if(rotateCommand != null)
					return rotateCommand;
			}
			return null;
		}
	}
}
