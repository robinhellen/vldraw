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
		public LdrawParser Parser {private get; construct; }
		public ISubFileLocator Locator {private get; construct;}
		public ColourContext ColourContext {construct; private get;}

		private Set<LdrawNode> clipboardContents;
		private TargetEntry[] targets;
		private const int textTargetId = 1;
		private const int nodesTargetId = 2;
		private Atom nodesAtom = Atom.intern("ldraw-nodes", false);

		construct
		{
			var tList = new TargetList(null);
			tList.add_text_targets(textTargetId);
			tList.add(nodesAtom, TargetFlags.SAME_APP, nodesTargetId);
			targets = target_table_new_from_list(tList);
			clipboardContents = new HashSet<LdrawNode>();
		}

		public void PutSelectionOnClipboard()
		{
			Clear();
			clipboardContents.add_all(Model.Selection);
			if(!Clipboard.set_with_owner(targets, (b,s,i,o) => {stderr.printf("Clipboard data requested (1)\n");((ClipboardHandler)o).GetData(b,s,i);}, Clear, this))
				stderr.printf("Failed to set clipboard data.");
			else
				stderr.printf("Successfully put clipboard data");
			Clipboard.store();
		}

		private void GetData(Gtk.Clipboard board, SelectionData selData, uint info)
		{
			stderr.printf("Clipboard data requested.\n");
			if(info == textTargetId)
			{
				var text = clipboardContents.fold<string>((node, s) => @"$s\r\n$(node.FileLine)", "");
				stderr.printf("adding node info to clipboard as text.\n");
				selData.set_text(text, text.length);
			}
			else if(info == nodesTargetId) {
				stderr.printf("Copying nodes directly.\n");/* put selection into selData as raw nodes*/}
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
			if(TargetInList(targets, nodesAtom))
			{
				// pasted nodes from same app: don't bother with actual data.
				stderr.printf("Copied nodes directly.");
				return DuplicateNodes(clipboardContents);
			}
			else if(TargetInList(targets, Atom.intern("TARGETS", true)))
			{
				return yield GetTextNodesFromClipboard();
			}

			return null;
		}

		private async Collection<LdrawNode>? GetTextNodesFromClipboard()
		{
			string text = Clipboard.wait_for_text();
			// parse nodes, return null if they don't parse
			var result = new ArrayList<LdrawNode>();
			try
			{
				foreach(var line in text.split("\n"))
				{
					result.add(yield Parser.ParseLine(line, Locator, ColourContext));
				}
			}
			catch(ParseError e)
			{
				// TODO: flag this to user
				stderr.printf(@"Unable to paste text as lego parts: $(e.message)\n");
				return null;
			}
			return result;
		}

		private bool TargetInList(Atom[] targets, Atom atom)
		{
			foreach(var target in targets)
			{
				if(atom == target)
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
