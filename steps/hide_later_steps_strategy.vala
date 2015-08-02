
using Ldraw.Lego;
using Ldraw.Lego.Nodes;
using Ldraw.OpenGl;

namespace Ldraw.Steps
{
	private class HideLaterStepsStrategy : Object, RenderNodeStrategy
	{
		public StepModel Model {construct; private get;}
		
		private int currentStepNumber;
				
		public void StartModel(LdrawObject object)
		{
			currentStepNumber = 1;
		}
				
		public bool ShouldRenderNode(LdrawNode node)
		{
			if(node is StepCommand)
				currentStepNumber++;
			
			return currentStepNumber <= Model.CurrentStep;
		}
	}
}
