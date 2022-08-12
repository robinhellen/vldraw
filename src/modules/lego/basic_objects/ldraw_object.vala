using Gee;
using Ldraw.Maths;
using Ldraw.Lego.Nodes;

namespace Ldraw.Lego
{
	public class LdrawObject : Object
	{
		private Bounds bounds;
		private Gee.List<LdrawNode> nodes;
		private string _description = "";

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

		public string Description {
			get {return _description;} 
			set {
				_description = value;
				Comment description_comment;
				if(!nodes.is_empty && nodes[0].get_type() == typeof(Comment)) {
					description_comment = (Comment)nodes[0];
					description_comment.CommentText = value;
				} else {
					description_comment = new Comment(value);
					nodes.insert(0, description_comment);
				}
			}
		}

		public Bounds BoundingBox
		{
			get
			{
				if(bounds == null)
				{
					bounds = CalculateBounds();
				}
				return bounds;
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
			newNode.notify.connect(() => VisibleChange());
			VisibleChange();
		}
		
		public void add_node_after(LdrawNode node, LdrawNode after) {
			nodes.insert(nodes.index_of(after) + 1, node);
			node.notify.connect(() => VisibleChange());
			VisibleChange();
		}
		
		public void add_node_before(LdrawNode node, LdrawNode before) {
			nodes.insert(nodes.index_of(before), node);
			node.notify.connect(() => VisibleChange());
			VisibleChange();
		}

		public void AddHeaderNode(Comment node)
		{
			LdrawNode last_header = null;
			foreach(var n in nodes)
			{
				if(!(n is Comment))
					break;
				last_header = n;
			}
			AddNode(node, last_header);
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
			bounds = null;
		}
	}
}
