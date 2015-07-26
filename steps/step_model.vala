
using Ldraw.Lego;
using Ldraw.Ui;
using Ldraw.Ui.Commands;

namespace Ldraw.Steps
{
	private class StepModel : Object
	{
		public AnimatedModel Model { construct; private get; }
		public UndoStack UndoStack { construct; private get; }
		
		construct
		{
			Model.view_changed.connect(UpdateTotal);
			notify["CurrentStep"].connect(() => Model.view_changed());
			Model.notify["Model"].connect(() => { UpdateTotal(); CurrentStep = TotalSteps; });
		}
		
		public int CurrentStep {get; set; default = 0;}
		public int TotalSteps {get; set; default = 0;}
		
		public void First() {CurrentStep = 0; UpdateHasProps();}
		public void Previous() {CurrentStep--; UpdateHasProps();}
		public void Next() {CurrentStep++; UpdateHasProps();}
		public void Last() {CurrentStep = TotalSteps; UpdateHasProps();}
		
		public void AddStep() 
		{			
			var command = new AddNodeCommand(Model.Model, new StepCommand(), Model.LastSelected);
			UndoStack.ExecuteCommand(command);
		}
		
		public bool HasNextSteps {get; set;}
		public bool HasPrevSteps {get; set;}
		
		private void UpdateTotal()
		{
			TotalSteps = Model.Model.Nodes.fold(CountIfStep, 0) + 1; // there is always an implicit last step not marked by a command.
			var clamped = CurrentStep.clamp(0, TotalSteps);
			if(CurrentStep != clamped) // test to avoid causing another signal emission.
				CurrentStep = clamped; 
			UpdateHasProps();
		}
		
		private void UpdateHasProps()
		{
			HasPrevSteps = CurrentStep > 0;
			HasNextSteps = CurrentStep < TotalSteps;				
		}
		
		private int CountIfStep(owned LdrawNode node, owned int i)
		{
			return (node is StepCommand) ? i + 1 : i;
		}
	}
}
