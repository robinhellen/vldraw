using Diva;

namespace Ldraw.Ui.Dialogs
{
	public class DialogsModule : Diva.Module
	{
		public override void load(ContainerBuilder builder)
		{
            builder.register<DialogManager>().as<IDialogManager>();
		}
	}
}
