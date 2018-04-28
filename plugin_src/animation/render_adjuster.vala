
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.Maths;
using Ldraw.OpenGl;
using Ldraw.Ui;

namespace Ldraw.Animation
{
	private class RenderAdjuster : Object, NodeAdjuster
	{
		private RotateCommand lastCommand = null;
		private int targetFramerate = 20;
		
		public AnimatedModel Model {construct; private get;}
		
		construct
		{
			Timeout.add(1000 / targetFramerate, RotateCurrentParams);
		}
		
		public GlMatrix GetAdjustmentFor(LdrawNode node)
		{
			var partNode = node as PartNode;
			if(partNode != null)
			{
				if(lastCommand == null)
					return new GlMatrix.Identity();
				
				var angle = lastCommand.Angle.Evaluate(Model.CurrentParameters);
				var rotation = Matrix.ForRotation(lastCommand.Axis, angle);
				lastCommand = null;
				return new GlMatrix.FromTransformAndTranslation(rotation, Vector.NullVector);
			}
			var rotateCommand = node as RotateCommand;
			if(rotateCommand != null)
			{
				lastCommand = rotateCommand;
			}
			var parameterCommand = node as ParameterCommand;
			if(parameterCommand != null && !Model.CurrentParameters.has_key(parameterCommand.Identifier))
			{
				Model.CurrentParameters[parameterCommand.Identifier] = parameterCommand.Min;
			}
			return new GlMatrix.Identity();
		}
		
		private bool RotateCurrentParams()
		{
			// get all parameters of the current model
			var params = Model.Model.NodesOfType<ParameterCommand>();
			foreach(var param in params)
			{
				if(!Model.CurrentParameters.has_key(param.Identifier))
				{
					Model.CurrentParameters[param.Identifier] = param.Min;
				}
				var step = (param.Max - param.Min) / targetFramerate / 11;
				var current = Model.CurrentParameters[param.Identifier];
				var newVal = current + step;
				if(newVal >= param.Max)
					newVal = param.Min;
				Model.CurrentParameters[param.Identifier] = (current + step);
			}
			if(!params.is_empty)
			{
				Model.view_changed();
			}			
			return true;
		}
	}
}
