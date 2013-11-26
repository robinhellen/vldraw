using Gee;
using Gtk;

namespace Ldraw.Utils
{
	public class ObservableList<T> : LinkedList<T>, TreeModel, TreeDragSource
	{
		// overrides of LinkedList
		public override bool remove(T item)
		{
			var originalIndex = index_of(item);
			var result = base.remove(item);
			if(result)
			{
				row_deleted(new TreePath.from_indices(originalIndex));
				if(item is GLib.Object)
				((GLib.Object)item).notify.disconnect(FireRowChangedOnNotify);
			}
			return result;
		}

		public override T remove_at(int index)
		{
			var result = base.remove_at(index);
			row_deleted(new TreePath.from_indices(index));

			if(result is GLib.Object)
			((GLib.Object)result).notify.disconnect(FireRowChangedOnNotify);

			return result;
		}

		public override void clear()
		{
			base.clear();
		}

		public override bool add(T item)
		{
			var result =  base.add(item);
			var index = index_of(item);

			TreeIter iter = TreeIter();
			iter.stamp = c_IteratorStamp;
			iter.user_data = index.to_pointer();
			row_inserted(new TreePath.from_indices(index), iter);


			if(item is GLib.Object)
			((GLib.Object)item).notify.connect(FireRowChangedOnNotify);

			return result;
		}

		public override void @set(int index, T item)
		{
			base.set(index, item);

			TreeIter iter = TreeIter();
			iter.stamp = c_IteratorStamp;
			iter.user_data = index.to_pointer();
			row_changed(new TreePath.from_indices(index), iter);

			if(item is GLib.Object)
			((GLib.Object)item).notify.connect(FireRowChangedOnNotify);
		}

		public override void insert(int index, T item)
		{
			base.insert(index, item);

			TreeIter iter = TreeIter();
			iter.stamp = c_IteratorStamp;
			iter.user_data = index.to_pointer();
			row_inserted(new TreePath.from_indices(index), iter);

			if(item is GLib.Object)
			((GLib.Object)item).notify.connect(FireRowChangedOnNotify);
		}

		private void FireRowChangedOnNotify(GLib.Object sender, ParamSpec pspec)
		{
			T item = (T) sender;
			var current = index_of(item);
			TreeIter cIter = TreeIter();
			cIter.stamp = c_IteratorStamp;
			cIter.user_data = current.to_pointer();
			row_changed(new TreePath.from_indices(current), cIter);
		}

		// implementation of TreeModel
		private const int c_IteratorStamp = 757398;

		public Type get_column_type(int index)
			requires (index == 0)
		{
			return element_type;
		}

		public TreeModelFlags get_flags()
		{
			return TreeModelFlags.LIST_ONLY;
		}

		public int get_n_columns()
		{
			return 1;
		}

		public bool get_iter(out TreeIter iter, TreePath path)
		{
			iter = TreeIter();
			if(path.get_depth() != 1)
				return false;
			var listIndex = path.get_indices()[0];

			if(size <= listIndex)
				return false;

			iter.stamp = c_IteratorStamp;
			iter.user_data = listIndex.to_pointer();
			return true;
		}

		public bool iter_has_child(TreeIter iter)
		{
			return false;
		}

		public bool iter_children(out TreeIter child, TreeIter? parent)
		{
			child = TreeIter();
			if(parent == null)
			{
				return get_iter_first(out child);
			}
			child.stamp = 0;
			return false;
		}

		public int iter_n_children(TreeIter? iter)
		{
			if(iter == null)
				return size;
			return 0;
		}

		public bool iter_parent(out TreeIter parent, TreeIter child)
		{
			parent = TreeIter();
			parent.stamp = 0;
			return false;
		}

		public bool iter_nth_child(out TreeIter child, TreeIter? parent, int n)
		{
			child = TreeIter();
			if(parent != null || n >= size)
			{
				child.stamp = 0;
				return false;
			}

			child.stamp = c_IteratorStamp;
			child.user_data = n.to_pointer();
			return true;
		}

		public bool iter_next(ref TreeIter iter)
		{
			if(iter.stamp != c_IteratorStamp || (int)(iter.user_data) >= size - 1)
			{
				iter.stamp = 0;
				return false;
			}
			iter.user_data = ((int)(iter.user_data) + 1).to_pointer();
			return true;
		}

		public bool iter_previous(ref TreeIter iter)
		{
			if(iter.stamp != c_IteratorStamp || (int)(iter.user_data) == 0)
			{
				iter.stamp = 0;
				return false;
			}
			iter.user_data = ((int)(iter.user_data) - 1).to_pointer();
			return true;
		}

		public TreePath? get_path(TreeIter iter)
		{
			if(iter.stamp != c_IteratorStamp)
			{
				return null;
			}

			return new TreePath.from_indices((int) iter.user_data);
		}

		public void get_value(TreeIter iter, int column, out Value value)
		{
			value = Value(element_type);
			if(iter.stamp != c_IteratorStamp || (int)(iter.user_data) >= size || column != 0)
			{
				value.set_instance(null);
				return;
			}
			value.set_instance(((Gee.List<T>)this).get((int)(iter.user_data)));
		}

		// end implementation of TreeModel

		// implementation of TreeDragSource

		public bool drag_data_delete(TreePath path)
		{
			return false;
		}

		public bool drag_data_get(TreePath path, SelectionData selData)
		{
			return false;
		}

		public bool row_draggable(TreePath path)
		{
			return true;
		}

		// end implementation of TreeDragSource
	}
}
