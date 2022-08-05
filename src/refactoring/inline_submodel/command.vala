using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Ui;

namespace Ldraw.Refactor
{
	public class InlineSubModelCommand : Command
	{
		private Collection<PartNode> references;
		private LdrawObject definition;
		private Map<PartNode, LdrawObject> objects;
		private MultipartModel model;
		private Map<PartNode, Collection<LdrawNode>> replacements;
		
		private bool remove_definition;
				
		public InlineSubModelCommand.from_reference(LdrawObject object, PartNode node, MultipartModel model, bool remove_definition)
		{
			references = new ArrayList<PartNode>();
			objects = new HashMap<PartNode, LdrawObject>();
			references.add(node);
			objects[node] = object;
			this.model = model;
			this.remove_definition = remove_definition;
			definition = node.Contents;
			replacements = create_replacements(references, definition);
		}
		
		public InlineSubModelCommand.all(LdrawObject sub_model, MultipartModel model, bool remove_definition)
		{
			this.model = model;
			this.remove_definition = remove_definition;
			definition = sub_model;
			
			references = new ArrayList<PartNode>();
			objects = new HashMap<PartNode, LdrawObject>();
			
			foreach(var m in model.SubModels)
			{
				foreach(var n in m.NodesOfType<PartNode>())
				{
					if(n.Contents.FileName.casefold() == sub_model.FileName.casefold())
					{
						references.add(n);
						objects[n] = m;
					}
				}
			}
			replacements = create_replacements(references, definition);
		}
		
		public override void Execute()
		{
			foreach(var reference in references)
			{
				var object = objects[reference];
				LdrawNode last = reference;
				foreach(var node in replacements[reference])
				{
					object.InsertNode(node, last);
					last = node;
				}
				object.RemoveNode(reference);
			}
			if(remove_definition)
			{
				foreach(var f in model.SubModels)
				{
					if(f.FileName.casefold() == definition.FileName.casefold())
					{
						model.SubModels.remove(f);
						break;
					}
				}
			}
		}
		
		public override void Undo()
		{
			if(remove_definition)
				model.SubModels.add(definition); // TODO: insert at same position
			foreach(var reference in references)
			{
				var object = objects[reference];
				var first = true;
				foreach(var node in replacements[reference])
				{
					if(first)
					{
						first = false;
						object.InsertNode(reference, node);
					}
					object.RemoveNode(node);
				}
			}
		}
		
		private static Map<PartNode, Collection<LdrawNode>> create_replacements(Collection<PartNode> references, LdrawObject definition)
		{
			var replacements = new HashMap<PartNode, Collection<LdrawNode>>();
			foreach(var reference in references)
			{
				replacements[reference] = new ArrayList<LdrawNode>();
				foreach(var node in definition.Nodes)
				{
					replacements[reference].add(node.TransformNode(reference.Transform, reference.Center));
				}
			}
			return replacements;			
		}
	}
}
