using Gee;

using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.OpenGl;
using Ldraw.Ui;

namespace Ldraw.Animation
{
	private class RenderAdjuster : Object, NodeAdjuster
	{
		private RotateCommand last_command = null;
		private int target_framerate = 20;
		public Map<string, float?> parameters = new HashMap<string, float?>();
		
		public AnimatedModel Model {construct; private get;}
		
		construct
		{
			Timeout.add(1000 / target_framerate, RotateCurrentParams);
		}
		
		public GlMatrix GetAdjustmentFor(LdrawNode node)
		{
			var part_node = node as PartNode;
			if(part_node != null)
			{
				if(last_command == null)
					return new GlMatrix.Identity();
				
				var angle = last_command.Angle.Evaluate(parameters);
				var rotation = Matrix.ForRotation(last_command.Axis, angle);
				last_command = null;
				return new GlMatrix.FromTransformAndTranslation(rotation, Vector.NullVector);
			}
			var rotate_command = node as RotateCommand;
			if(rotate_command != null)
			{
				last_command = rotate_command;
			}
			var parameter_command = node as ParameterCommand;
			if(parameter_command != null && !parameters.has_key(parameter_command.Identifier))
			{
				parameters[parameter_command.Identifier] = parameter_command.Min;
			}
			return new GlMatrix.Identity();
		}
		
		private bool RotateCurrentParams()
		{
			// get all parameters of the current model
			var params = Model.Model.NodesOfType<ParameterCommand>();
			foreach(var param in params)
			{
				if(!parameters.has_key(param.Identifier))
				{
					parameters[param.Identifier] = param.Min;
				}
				var step = (param.Max - param.Min) / target_framerate / 11;
				var current = parameters[param.Identifier];
				var new_val = current + step;
				if(new_val >= param.Max)
					new_val = param.Min;
				parameters[param.Identifier] = (current + step);
			}
			if(!params.is_empty)
			{
				Model.view_changed();
			}			
			return true;
		}
	}
}
