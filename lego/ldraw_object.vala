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

		public LdrawObject()
		{
			var nodeList = new LinkedList<LdrawNode>();
			Object(Nodes: nodeList);
		}

		public Gee.List<LdrawNode> Nodes {get; protected construct set;}

		public string FileName {get; set;}

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

		private void Nodes_OnSelectChanged(ParamSpec pspec)
		{
			if(m_ChangingSelection)
				return;

			SelectionChanged();
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
			ComponentsChanged();
			VisibleChange();
			if(newNode is PartNode)
			{
				newNode.notify["ColourId"].connect(() => VisibleChange());
			}
		}

		public void MoveSelectedNodes(Vector displacement)
		{
			// iterate nodes and move those that are selected and are models
			foreach(LdrawNode node in Nodes)
			{
				if(!node.Selected || !(node is PartNode))
					continue;

				PartNode part = (PartNode)node;
				part.Move(displacement);
			}
			VisibleChange();
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

		public void BuildFromFile(LdrawBuilder builder)
		{
			foreach(LdrawNode node in Nodes)
			{
				builder.BuildNode(node);

				if(node is LineNode)
					builder.BuildLine((LineNode) node);
				else if(node is TriangleNode)
					builder.BuildTriangle((TriangleNode) node);
				else if(node is QuadNode)
					builder.BuildQuad((QuadNode) node);
				else if(node is CondLineNode)
					builder.BuildCondLine((CondLineNode) node);
				else if(node is PartNode)
					builder.BuildSubModel((PartNode) node);
				else if(node is Comment)
					builder.BuildComment((Comment) node);
			}
		}

		public signal void VisibleChange();

		public signal void SelectionChanged();

		public signal void ComponentsChanged();
	}
}
