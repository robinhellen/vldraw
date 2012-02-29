<?xml version="1.0"?>
<api version="1.0">
	<namespace name="Gtk">
		<function name="gl_init" symbol="gtk_gl_init">
			<return-type type="void"/>
			<parameters>
				<parameter name="argc" type="int*"/>
				<parameter name="argv" type="char***"/>
			</parameters>
		</function>
		<function name="gl_init_check" symbol="gtk_gl_init_check">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="argc" type="int*"/>
				<parameter name="argv" type="char***"/>
			</parameters>
		</function>
		<function name="gl_parse_args" symbol="gtk_gl_parse_args">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="argc" type="int*"/>
				<parameter name="argv" type="char***"/>
			</parameters>
		</function>
		<function name="widget_create_gl_context" symbol="gtk_widget_create_gl_context">
			<return-type type="GdkGLContext*"/>
			<parameters>
				<parameter name="widget" type="GtkWidget*"/>
				<parameter name="share_list" type="GdkGLContext*"/>
				<parameter name="direct" type="gboolean"/>
				<parameter name="render_type" type="int"/>
			</parameters>
		</function>
		<function name="widget_get_gl_config" symbol="gtk_widget_get_gl_config">
			<return-type type="GdkGLConfig*"/>
			<parameters>
				<parameter name="widget" type="GtkWidget*"/>
			</parameters>
		</function>
		<function name="widget_get_gl_context" symbol="gtk_widget_get_gl_context">
			<return-type type="GdkGLContext*"/>
			<parameters>
				<parameter name="widget" type="GtkWidget*"/>
			</parameters>
		</function>
		<function name="widget_get_gl_window" symbol="gtk_widget_get_gl_window">
			<return-type type="GdkGLWindow*"/>
			<parameters>
				<parameter name="widget" type="GtkWidget*"/>
			</parameters>
		</function>
		<function name="widget_is_gl_capable" symbol="gtk_widget_is_gl_capable">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="widget" type="GtkWidget*"/>
			</parameters>
		</function>
		<function name="widget_set_gl_capability" symbol="gtk_widget_set_gl_capability">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="widget" type="GtkWidget*"/>
				<parameter name="glconfig" type="GdkGLConfig*"/>
				<parameter name="share_list" type="GdkGLContext*"/>
				<parameter name="direct" type="gboolean"/>
				<parameter name="render_type" type="int"/>
			</parameters>
		</function>
		<enum name="GtkGLDebugFlag">
			<member name="GTK_GL_DEBUG_MISC" value="1"/>
			<member name="GTK_GL_DEBUG_FUNC" value="2"/>
		</enum>
		<constant name="GTKGLEXT_BINARY_AGE" type="int" value="0"/>
		<constant name="GTKGLEXT_INTERFACE_AGE" type="int" value="0"/>
		<constant name="GTKGLEXT_MAJOR_VERSION" type="int" value="1"/>
		<constant name="GTKGLEXT_MICRO_VERSION" type="int" value="0"/>
		<constant name="GTKGLEXT_MINOR_VERSION" type="int" value="2"/>
	</namespace>
</api>
