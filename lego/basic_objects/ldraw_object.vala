using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class LdrawObject : Object
	{
		private Bounds m_BoundingBox;
		private Gee.List<LdrawNode> nodes;

		public LdrawObject(string description)
		{
			var nodeList = new ArrayList<LdrawNode>();
			Object(Nodes: nodeList, Description: description);
		}

		public Gee.List<LdrawNode> Nodes
		{
			get{return nodes;}
			protected construct set
			{
				nodes = value;
				foreach(var node in nodes)
				{
					node.notify.connect(() => VisibleChange());
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

		// public LdrawFile File {get; construct set;}

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
			return new BoundingBoxVisitor().Visit(this);
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
			newNode.notify.connect(() => VisibleChange());
			VisibleChange();
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
		}

		public void InsertNode(LdrawNode toInsert, LdrawNode after)
		{
			nodes.insert(nodes.index_of(after) + 1, toInsert);
			toInsert.notify.connect(() => VisibleChange());
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

		public T? BuildFromFile<T>(LdrawVisitor<T> builder)
		{
			return builder.Visit(this);
		}

		public virtual signal void VisibleChange()
		{
			m_BoundingBox = null;
		}

		public signal void ComponentsChanged();
	}
}
