using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;
using Ldraw.Utils;

namespace Ldraw.Lego
{
	public class LdrawObject : Object
	{
		private Bounds m_BoundingBox;
		private bool m_ChangingSelection;
		private Gee.List<LdrawNode> nodes;

		public LdrawObject(string description, LdrawFile? file)
		{
			var nodeList = new ArrayList<LdrawNode>();
			Object(Nodes: nodeList, Description: description, File: file);
		}

		public Gee.List<LdrawNode> Nodes
		{
			get{return nodes;}
			protected construct set
			{
				nodes = value;
				var observable = nodes as ObservableList<LdrawNode>;
				if(observable != null)
				{
					observable.row_changed.connect(() => VisibleChange());
				}
			}
		}

		public Collection<T> NodesOfType<T>()
		{
			var typedNodes = new LinkedList<T>();
			foreach(var node in nodes)
			{
                Object obj = (Object)node;
                if(obj.get_type().is_a(typeof(T)))
                {
                    typedNodes.add(node);
                }
			}
			return typedNodes;
		}

		public string FileName {get; set;}

		public string Description {get; public construct set;}

		public LdrawFile File {get; construct set;}

		public Bounds BoundingBox
		{
			get
			{
				if(m_BoundingBox == null)
				{
					m_BoundingBox = CalculateBounds();
				}
				return m_BoundingBox;
			}
		}

		protected Bounds CalculateBounds()
		{
			Bounds bounds = new Bounds();
			foreach(LdrawNode node in Nodes)
			{
				if(node is PartNode)
				{
					PartNode part = (PartNode)node;
					bounds.IncludeBounds(part.Contents.BoundingBox, part.Transform, part.Center);
				}
				else if(node is LineNode)
				{
					bounds.Union(((LineNode)node).A);
					bounds.Union(((LineNode)node).B);
				}
				else if(node is TriangleNode)
				{
					bounds.Union(((TriangleNode)node).A);
					bounds.Union(((TriangleNode)node).B);
					bounds.Union(((TriangleNode)node).C);
				}
				else if(node is QuadNode)
				{
					bounds.Union(((QuadNode)node).A);
					bounds.Union(((QuadNode)node).B);
					bounds.Union(((QuadNode)node).C);
					bounds.Union(((QuadNode)node).D);
				}
				else if(node is CondLineNode)
				{
					bounds.Union(((CondLineNode)node).A);
					bounds.Union(((CondLineNode)node).B);
				}
			}
			return bounds;
		}

		public Collection<LdrawNode> Selection
		{
			owned get
			{
				var selectedList = new ArrayList<LdrawNode>();

				foreach(var node in Nodes)
				{
					if(node.Selected)
						selectedList.add(node);
				}

				return selectedList;
			}
		}

		public LdrawNode? GetPreviousNode(LdrawNode node)
		{
			LdrawNode previousNode  = null;
			foreach(var n in nodes)
			{
				if(n == node)
					return previousNode;

				previousNode = n;
			}

			return previousNode;
		}

		public PartNode? LastSubFile
		{
			get
			{
				weak PartNode lastSubFile = null;
				foreach(LdrawNode node in Nodes)
				{
					if(!(node is PartNode))
					{
						continue;
					}
					lastSubFile = node as PartNode;
				}
				return lastSubFile;
			}
		}

		public PartNode? LastSelected
		{
			get
			{
				weak PartNode lastSubFile = null;
				foreach(LdrawNode node in Nodes)
				{
					if(!(node is PartNode) || !node.Selected)
					{
						continue;
					}
					lastSubFile = node as PartNode;
				}
				return lastSubFile;
			}
		}

		public void AddNode(LdrawNode newNode, LdrawNode? after = null)
		{
			if(after == null)
			{
				Nodes.add(newNode);
			}
			else
			{
				Nodes.insert(Nodes.index_of(after) + 1, newNode);
			}
			m_BoundingBox = null;
			newNode.notify["ColourId"].connect(() => VisibleChange());
			newNode.notify["Selected"].connect(() => VisibleChange());
		}

		public void AddHeaderNode(LdrawNode node)
		{
			LdrawNode lastHeader = null;
			foreach(var n in nodes)
			{
				if(!(n is Comment))
					break;
				lastHeader = n;
			}
			if(lastHeader == null)
				nodes.add(node);

			else
				nodes.insert(Nodes.index_of(lastHeader) + 1, node);

			ComponentsChanged();
			VisibleChange();
			m_BoundingBox = null;
			node.notify["ColourId"].connect(() => VisibleChange());
			node.notify["Selected"].connect(() => VisibleChange());
		}

		public void InsertNode(LdrawNode toInsert, LdrawNode after)
		{
			nodes.insert(nodes.index_of(after), toInsert);
			VisibleChange();
		}

		public void RemoveNodes(Collection<LdrawNode> toDelete)
		{
			Nodes.remove_all(toDelete);
			if(!toDelete.is_empty)
			{
				VisibleChange();
			}
		}

		public void RemoveNode(LdrawNode node)
		{
			Nodes.remove(node);
			VisibleChange();
		}

		public void AddNodes(Collection<LdrawNode> nodes)
		{
			foreach(var node in nodes)
			{
				AddNode(node);
			}
		}

		public void TransformSelectedNodes(Matrix transform)
		{
			foreach(LdrawNode node in Nodes)
			{
				if(!node.Selected || !(node is PartNode))
					continue;

				PartNode part = (PartNode)node;
				part.TransformPart(transform);
			}
			VisibleChange();
		}

		public void ClearSelection()
		{
			m_ChangingSelection = true;
			foreach(LdrawNode node in Nodes)
			{
				node.Selected = false;
			}
			m_ChangingSelection = false;
		}

		public void BuildFromFile(LdrawVisitor builder)
		{
			builder.Visit(this);
		}

		public virtual signal void VisibleChange()
		{
			m_BoundingBox = null;
		}

		public signal void SelectionChanged();

		public signal void ComponentsChanged();
	}
}