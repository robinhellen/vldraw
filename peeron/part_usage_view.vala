using Gee;
using Gtk;

using Ldraw.Lego;
using Ldraw.Utils;

namespace Ldraw.Peeron
{
	private class PartUsageViewModel : TreeModel, TreeDragSource, GLib.Object
	{
		private ObservableList<PartGroupItem> used;
		private ObservableList<PartGroupItem> unused;
		private ObservableList<PartGroupItem> extra;

		public PartUsageViewModel(PartGroupUsage usage)
		{
			used = new ObservableList<PartGroupItem>();
			used.add_all(usage.Used.Items);
			unused = new ObservableList<PartGroupItem>();
			unused.add_all(usage.Unused.Items);
			extra = new ObservableList<PartGroupItem>();
			extra.add_all(usage.Extra.Items);
		}
		
		public void Update(PartGroupUsage usage)
		{
			UpdateList(unused, usage.Unused.Items, 0);
			UpdateList(used, usage.Used.Items, 1);
			UpdateList(extra, usage.Extra.Items, 2);
		}
		
		private void UpdateList(ObservableList<PartGroupItem> original, Collection<PartGroupItem> updated, int firstIndex)
		{
			var updatedList = new ArrayList<PartGroupItem>();
			updatedList.add_all(updated);			
			
			// lists should be sorted, so I can step both
			int i = 0;
			int j = 0;
			while(i < original.size && j < updatedList.size)
			{
				var originalItem = ((Gee.List<PartGroupItem>)original)[i];
				var updatedItem = updatedList[j];
				
				var relation = PartGroupItem.SortFunc(originalItem, updatedItem);
				if(relation == 0)
				{
					if(originalItem.Quantity != updatedItem.Quantity)
					{
						originalItem.Quantity = updatedItem.Quantity;
						TreeIter iter;
						var path = new TreePath.from_indices(firstIndex, i);
						get_iter(out iter, path);
						row_changed(path, iter);
					}
					i++; j++;
				}
				else if(relation < 0)
				{
					original.insert(i, updatedItem);
					TreeIter iter;
					var path = new TreePath.from_indices(firstIndex, i);
					get_iter(out iter, path);
					row_inserted(path, iter);
					if(original.size == 1)
					{
						path = new TreePath.from_indices(firstIndex);
						get_iter(out iter, path);		
						row_has_child_toggled(path, iter);				
					}
					i++; j++;
				}
				else if(relation > 0)
				{
					original.remove_at(i);
					var path = new TreePath.from_indices(firstIndex, i);
					row_deleted(path);
				}
				else
				{
					assert_not_reached();
				}
			}
			
			// any further items 
			while(i < original.size)
			{
				original.remove_at(i);
				var path = new TreePath.from_indices(firstIndex, i);
				row_deleted(path);
			}
			while(j < updatedList.size)
			{
				var path = new TreePath.from_indices(firstIndex, original.size);
				original.add(updatedList[j]);
				TreeIter iter;
				get_iter(out iter, path);
				row_inserted(path, iter);
				if(original.size == 1)
				{
					path = new TreePath.from_indices(firstIndex);
					get_iter(out iter, path);		
					row_has_child_toggled(path, iter);				
				}
				j++;
			}
		}

		// implementation of TreeModel
		private const int c_IteratorStamp = 423958;

		public Type get_column_type(int index)
			requires (index <= 2 && index >= 0)
		{
			switch(index)
			{
				case 0:
					return typeof(int);
				case 1:
					return typeof(string);
				case 2:
					return typeof(PartGroupItem);
				default:
					assert_not_reached();
			}
		}

		public TreeModelFlags get_flags()
		{
			return (TreeModelFlags)0;
		}

		public int get_n_columns()
		{
			return 3;
		}

		// TreeIter usage
		// user_data  : depth
		// user_data2 : section (0: unused, 1: used, 2: extra)
		// user_data3 : if depth 1, user_data from base iter
		// WARNING: This class is tightly coupled to ObservableList<T>.
		// In particular, if that changes how it creates TreeIters,
		// then this code will have a bug.

		public bool get_iter(out TreeIter iter, TreePath path)
		{
			var section = path.get_indices()[0];

			switch(path.get_depth())
			{
				case 1:
					return get_iter_for_section(out iter, section);
				case 2:
					return get_iter_for_item(out iter, section, path.get_indices()[1]);
				default:
					iter = TreeIter();
					return false;
			}
		}

		private bool get_iter_for_section(out TreeIter iter, int sectionIndex)
		{
			if(sectionIndex < 0 || sectionIndex > 2)
			{
				iter = TreeIter();
				return false;
			}

			iter = TreeIter();
			iter.stamp = c_IteratorStamp;
			iter.user_data = 0.to_pointer();
			iter.user_data2 = sectionIndex.to_pointer();
			return true;
		}

		private bool get_iter_for_item(out TreeIter iter, int sectionIndex, int itemIndex)
		{
			iter = TreeIter();
			ObservableList<PartGroupItem> sectionList;
			switch(sectionIndex)
			{
				case 0:
					sectionList = unused; break;
				case 1:
					sectionList = used; break;
				case 2:
					sectionList = extra; break;
				default:
					return false;
			}

			var pathForChild = new TreePath.from_indices(itemIndex);
			TreeIter childIter;
			if(!sectionList.get_iter(out childIter, pathForChild))
				return false;

			iter.stamp = c_IteratorStamp;
			iter.user_data = 1.to_pointer();
			iter.user_data2 = sectionIndex.to_pointer();
			iter.user_data3 = childIter.user_data;
			return true;
		}

		public bool iter_has_child(TreeIter iter)
		{
			if((int)iter.user_data != 0)
				return false;

			switch((int) iter.user_data2)
			{
				case 0:
					return !unused.is_empty;
				case 1:
					return !used.is_empty;
				case 2:
					return !extra.is_empty;
				default:
					return false;
			}
		}

		public bool iter_children(out TreeIter child, TreeIter? parent)
		{
			child = TreeIter();
			if(parent == null)
			{
				return get_iter_first(out child);
			}

			if(parent.stamp != c_IteratorStamp)
				return false;
			if(parent.user_data != 0.to_pointer())
				return false;

			child.stamp = c_IteratorStamp;
			child.user_data = 1.to_pointer();
			child.user_data2 = parent.user_data2;
			child.user_data3 = 0.to_pointer();

			return true;
		}

		public int iter_n_children(TreeIter? iter)
		{
			if(iter == null)
				return 3;
			if((int)iter.user_data != 0)
				return 0;
			ObservableList<PartGroupItem> section;
			switch((int)iter.user_data2)
			{
				case 0:
					section = unused; break;
				case 1:
					section = used; break;
				case 2:
					section = extra; break;
				default:
					return 0;
			}
			return section.size;
		}

		public bool iter_parent(out TreeIter parent, TreeIter child)
		{
			parent = TreeIter();
			if((int)child.user_data != 1)
				return false;
			parent.stamp = c_IteratorStamp;
			parent.user_data = 0.to_pointer();
			parent.user_data2 = child.user_data2;
			return true;
		}

		public bool iter_nth_child(out TreeIter child, TreeIter? parent, int n)
		{
			child = TreeIter();
			if(parent == null)
			{
				if(n > 2 || n < 0)
					return false;
				child.stamp = c_IteratorStamp;
				child.user_data = 0.to_pointer();
				child.user_data2 = n.to_pointer();
				return true;
			}
			else
			{
				ObservableList<PartGroupItem> section;
				switch((int)parent.user_data2)
				{
					case 0:
						section = unused; break;
					case 1:
						section = used;	break;
					case 2:
						section = extra; break;
					default:
						return false;
				}
				TreeIter childIter;
				if(!iter_nth_child(out childIter, null, n))
					return false;

				child.stamp = c_IteratorStamp;
				child.user_data = 1.to_pointer();
				child.user_data2 = parent.user_data2;
				child.user_data3 = childIter.user_data;
				return true;
			}
		}

		public bool iter_next(ref TreeIter iter)
		{
			if(iter.stamp != c_IteratorStamp)
			{
				iter.stamp = 0;
				return false;
			}
			switch((int)iter.user_data)
			{
				case 0:
					return iter_next_section(ref iter);
				case 1:
					return iter_next_item(ref iter);
				default:
					iter.stamp = 0;
					return false;
			}
		}

		private bool iter_next_section(ref TreeIter iter)
		{
			if((int)iter.user_data2 < 0 || (int)iter.user_data2 >= 2) // if section == 2, then there is no next
			{
				iter.stamp = 0;
				return false;
			}
			iter.user_data2++;
			return true;
		}

		private bool iter_next_item(ref TreeIter iter)
		{
			ObservableList<PartGroupItem> section;
			switch((int) iter.user_data2)
			{
				case 0:
					section = unused; break;
				case 1:
					section = used; break;
				case 2:
					section = extra; break;
				default:
					iter.stamp = 0;
					return false;
			}
			var sectionIter = create_section_iter(iter);
			if(!section.iter_next(ref sectionIter))
			{
				iter.stamp = 0;
				return false;
			}
			iter.user_data3 = sectionIter.user_data;
			return true;
		}

		private TreeIter create_section_iter(TreeIter iter)
		{
			var section_iter = TreeIter();
			section_iter.stamp = 757398;
			section_iter.user_data = iter.user_data3;
			return section_iter;
		}

		public bool iter_previous(ref TreeIter iter)
		{
			if(iter.stamp != c_IteratorStamp)
			{
				iter.stamp = 0;
				return false;
			}
			switch((int)iter.user_data)
			{
				case 0:
					return iter_previous_section(ref iter);
				case 1:
					return iter_previous_item(ref iter);
				default:
					iter.stamp = 0;
					return false;
			}
		}

		private bool iter_previous_section(ref TreeIter iter)
		{
			if((int)iter.user_data2 <= 0 || (int)iter.user_data2 > 2) // if section == 0, then there is no prev
			{
				iter.stamp = 0;
				return false;
			}
			iter.user_data--;
			return true;
		}

		private bool iter_previous_item(ref TreeIter iter)
		{
			ObservableList<PartGroupItem> section;
			switch((int) iter.user_data2)
			{
				case 0:
					section = unused; break;
				case 1:
					section = used; break;
				case 2:
					section = extra; break;
				default:
					iter.stamp = 0;
					return false;
			}
			var sectionIter = create_section_iter(iter);
			if(!section.iter_previous(ref sectionIter))
			{
				iter.stamp = 0;
				return false;
			}
			iter.user_data3 = sectionIter.user_data;
			return true;
		}

		public TreePath? get_path(TreeIter iter)
		{
			if(iter.stamp != c_IteratorStamp)
			{
				return null;
			}
			switch((int)iter.user_data)
			{
				case 0:
					return new TreePath.from_indices(iter.user_data2);
				case 1:
					return new TreePath.from_indices(iter.user_data2, iter.user_data3);
				default:
					return null;
			}
		}

		// columns are: int, string, PartGroupItem
		public void get_value(TreeIter iter, int column, out Value value)
		{
			if(iter.stamp != c_IteratorStamp)
				assert_not_reached();
			switch(column)
			{
				case 0:
					value = Value(typeof(int));
					value.set_int((int)iter.user_data);
					return;
				case 1:
					value = Value(typeof(string));
					switch((int) iter.user_data)
					{
						case 0:
							switch((int) iter.user_data2)
							{
								case 0:
									value.set_string("Unused parts"); break;
								case 1:
									value.set_string("Used parts"); break;
								case 2:
									value.set_string("Extra parts required"); break;
								default:
									assert_not_reached();
							}
							break;
						case 1:
							value.set_string("");
							break;
						default:
							assert_not_reached();
					}
					return;
				case 2:
					value = Value(typeof(PartGroupItem));
					switch((int) iter.user_data)
					{
						case 0:
							value.set_instance(null);
							break;
						case 1:
							ObservableList<PartGroupItem> section;
							switch((int) iter.user_data2)
							{
								case 0:
									section = unused; break;
								case 1:
									section = used; break;
								case 2:
									section = extra; break;
								default:
									assert_not_reached();
							}
							var sectionIter = create_section_iter(iter);
							section.get_value(sectionIter, 0, out value);
							break;
						default:
							assert_not_reached();
					}
					return;
				default:
					assert_not_reached();
			}
		}

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
			if(path.get_depth() != 2)
				return false;
			if(path.get_indices()[0] != 0)
				return false;
			return true;
		}
	}
}
