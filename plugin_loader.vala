using Diva;

namespace Ldraw
{
	public class PluginLoader : Object
	{
		[CCode(has_target = false)]
		private delegate Type PluginRegistrationFunc(GLib.Module module);

		public void LoadPlugins(ContainerBuilder builder)
		{
			// try each file in the directory
			if(!GLib.Module.supported())
			{
				stderr.printf("Plugins are not supported on this system.");
				return;
			}

			var pluginDir = File.new_for_path("./plugins");
			var potentialPlugins = pluginDir.enumerate_children("standard::*", FileQueryInfoFlags.NONE);
			FileInfo current;
			while((current = potentialPlugins.next_file()) != null)
			{
				if(current.get_file_type() == FileType.DIRECTORY)
					continue;

				string name = current.get_name();
				var plugin = pluginDir.get_child(name);

				var module = GLib.Module.open(plugin.get_path(), ModuleFlags.BIND_LAZY);
				if(module == null)
				{
					stderr.printf(@"Unable to load $name as a plugin: $(GLib.Module.error())\n");
					continue;
				}
				void *function;
				module.symbol("register_ldraw_plugin", out function);
				if(function == null)
				{
					stderr.printf(@"Unable to load $name as a plugin: could not find function register_ldraw_plugin()\n");
					continue;
				}
				var regFunc = (PluginRegistrationFunc) function;
				var pluginModule = regFunc(module);
				if(!pluginModule.is_a(typeof(Diva.Module)))
				{
					stderr.printf(@"Unable to load $name as a plugin: registration returned Type '$(pluginModule.name())', expected a type implementing $(typeof(Diva.Module).name()) ");
					continue;
				}
				module.make_resident();
				var mod = (Diva.Module)Object.new(pluginModule);
				builder.register_module(mod);
			}
		}
	}
}
