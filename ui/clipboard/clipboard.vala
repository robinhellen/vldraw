using Gdk;
using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Maths;
using Ldraw.Ui;

namespace Ldraw.Ui.Clipboard
{
	private class ClipboardHandler : Object
	{
		public AnimatedModel Model { private get; construct; }
		public Gtk.Clipboard Clipboard { private get; construct; }

		private Set<LdrawNode> clipboardContents;
		TargetEntry textTarget;
		TargetEntry nodesTarget;
		private TargetEntry[] targets;

		construct
		{
			textTarget = {"text", 0, 1};
			nodesTarget = {"ldraw-nodes",TargetFlags.SAME_APP,2};
			targets = {textTarget, nodesTarget};
			clipboardContents = new HashSet<LdrawNode>();
		}

		public void PutSelectionOnClipboard()
		{
			Clear();
			clipboardContents.add_all(Model.Selection);
			Clipboard.set_with_owner(targets, (b,s,i,o) => ((ClipboardHandler)o).GetData(b,s,i), Clear, this);
		}

		private void GetData(Gtk.Clipboard board, SelectionData selData, uint info)
		{
			if(info == textTarget.info)
			{
				/* put selection into selData as text*/
			}
			else if(info == nodesTarget.info) {
				stderr.printf("Copying nodes directly.");/* put selection into selData as raw nodes*/}
		}

		private void Clear()
		{
			clipboardContents.clear();
		}

		public async Collection<LdrawNode>? GetNodesFromClipboard()
		{
			SourceFunc callback1 = GetNodesFromClipboard.callback;
			Atom[] targets = {};
			Clipboard.request_targets((cb, t) => {targets = t; Idle.add((owned)callback1);});
			yield;
			if(TargetInList(targets, nodesTarget))
			{
				// pasted nodes from same app: don't bother with actual data.
				stderr.printf("Copied nodes directly.");
				return DuplicateNodes(clipboardContents);
			}
			else if(TargetInList(targets, textTarget))
			{
				return yield GetTextNodesFromClipboard();
			}

			return null;
		}

		private async Collection<LdrawNode>? GetTextNodesFromClipboard()
		{
			SourceFunc callback1 = GetTextNodesFromClipboard.callback;
			string text = null;
			Clipboard.request_text((cb, selData) => {text = selData; callback1();});

			// parse nodes, return null if they don't parse
			// TODO: Warn user

			return null;
		}

		private bool TargetInList(Atom[] targets, TargetEntry entry)
		{
			foreach(var target in targets)
			{
				if(Atom.intern(entry.target, false) == target)
					return true;
			}
			return false;
		}

		private Collection<LdrawNode> DuplicateNodes(Collection<LdrawNode> nodes)
		{
			var newNodes = new ArrayList<LdrawNode>();
			foreach(var node in nodes)
			{
				newNodes.add(node.TransformNode(Matrix.Identity, Vector.NullVector));
			}
			return newNodes;
		}
	}
}
