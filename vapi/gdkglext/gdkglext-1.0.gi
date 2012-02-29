<?xml version="1.0"?>
<api version="1.0">
	<namespace name="Gdk">
		<function name="gl_draw_cone" symbol="gdk_gl_draw_cone">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
				<parameter name="base" type="double"/>
				<parameter name="height" type="double"/>
				<parameter name="slices" type="int"/>
				<parameter name="stacks" type="int"/>
			</parameters>
		</function>
		<function name="gl_draw_cube" symbol="gdk_gl_draw_cube">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
				<parameter name="size" type="double"/>
			</parameters>
		</function>
		<function name="gl_draw_dodecahedron" symbol="gdk_gl_draw_dodecahedron">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
			</parameters>
		</function>
		<function name="gl_draw_icosahedron" symbol="gdk_gl_draw_icosahedron">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
			</parameters>
		</function>
		<function name="gl_draw_octahedron" symbol="gdk_gl_draw_octahedron">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
			</parameters>
		</function>
		<function name="gl_draw_sphere" symbol="gdk_gl_draw_sphere">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
				<parameter name="radius" type="double"/>
				<parameter name="slices" type="int"/>
				<parameter name="stacks" type="int"/>
			</parameters>
		</function>
		<function name="gl_draw_teapot" symbol="gdk_gl_draw_teapot">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
				<parameter name="scale" type="double"/>
			</parameters>
		</function>
		<function name="gl_draw_tetrahedron" symbol="gdk_gl_draw_tetrahedron">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
			</parameters>
		</function>
		<function name="gl_draw_torus" symbol="gdk_gl_draw_torus">
			<return-type type="void"/>
			<parameters>
				<parameter name="solid" type="gboolean"/>
				<parameter name="inner_radius" type="double"/>
				<parameter name="outer_radius" type="double"/>
				<parameter name="nsides" type="int"/>
				<parameter name="rings" type="int"/>
			</parameters>
		</function>
		<function name="gl_font_use_pango_font" symbol="gdk_gl_font_use_pango_font">
			<return-type type="PangoFont*"/>
			<parameters>
				<parameter name="font_desc" type="PangoFontDescription*"/>
				<parameter name="first" type="int"/>
				<parameter name="count" type="int"/>
				<parameter name="list_base" type="int"/>
			</parameters>
		</function>
		<function name="gl_font_use_pango_font_for_display" symbol="gdk_gl_font_use_pango_font_for_display">
			<return-type type="PangoFont*"/>
			<parameters>
				<parameter name="display" type="GdkDisplay*"/>
				<parameter name="font_desc" type="PangoFontDescription*"/>
				<parameter name="first" type="int"/>
				<parameter name="count" type="int"/>
				<parameter name="list_base" type="int"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_MESA_agp_offset" symbol="gdk_gl_get_GLX_MESA_agp_offset">
			<return-type type="GdkGL_GLX_MESA_agp_offset*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_MESA_set_3dfx_mode" symbol="gdk_gl_get_GLX_MESA_set_3dfx_mode">
			<return-type type="GdkGL_GLX_MESA_set_3dfx_mode*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_NV_vertex_array_range" symbol="gdk_gl_get_GLX_NV_vertex_array_range">
			<return-type type="GdkGL_GLX_NV_vertex_array_range*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_SGIX_pbuffer" symbol="gdk_gl_get_GLX_SGIX_pbuffer">
			<return-type type="GdkGL_GLX_SGIX_pbuffer*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_SGIX_video_resize" symbol="gdk_gl_get_GLX_SGIX_video_resize">
			<return-type type="GdkGL_GLX_SGIX_video_resize*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_SGI_cushion" symbol="gdk_gl_get_GLX_SGI_cushion">
			<return-type type="GdkGL_GLX_SGI_cushion*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_SGI_swap_control" symbol="gdk_gl_get_GLX_SGI_swap_control">
			<return-type type="GdkGL_GLX_SGI_swap_control*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_SGI_video_sync" symbol="gdk_gl_get_GLX_SGI_video_sync">
			<return-type type="GdkGL_GLX_SGI_video_sync*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GLX_SUN_get_transparent_index" symbol="gdk_gl_get_GLX_SUN_get_transparent_index">
			<return-type type="GdkGL_GLX_SUN_get_transparent_index*"/>
			<parameters>
				<parameter name="glconfig" type="GdkGLConfig*"/>
			</parameters>
		</function>
		<function name="gl_get_GL_3DFX_tbuffer" symbol="gdk_gl_get_GL_3DFX_tbuffer">
			<return-type type="GdkGL_GL_3DFX_tbuffer*"/>
		</function>
		<function name="gl_get_GL_APPLE_element_array" symbol="gdk_gl_get_GL_APPLE_element_array">
			<return-type type="GdkGL_GL_APPLE_element_array*"/>
		</function>
		<function name="gl_get_GL_APPLE_fence" symbol="gdk_gl_get_GL_APPLE_fence">
			<return-type type="GdkGL_GL_APPLE_fence*"/>
		</function>
		<function name="gl_get_GL_APPLE_texture_range" symbol="gdk_gl_get_GL_APPLE_texture_range">
			<return-type type="GdkGL_GL_APPLE_texture_range*"/>
		</function>
		<function name="gl_get_GL_APPLE_vertex_array_object" symbol="gdk_gl_get_GL_APPLE_vertex_array_object">
			<return-type type="GdkGL_GL_APPLE_vertex_array_object*"/>
		</function>
		<function name="gl_get_GL_APPLE_vertex_array_range" symbol="gdk_gl_get_GL_APPLE_vertex_array_range">
			<return-type type="GdkGL_GL_APPLE_vertex_array_range*"/>
		</function>
		<function name="gl_get_GL_APPLE_vertex_program_evaluators" symbol="gdk_gl_get_GL_APPLE_vertex_program_evaluators">
			<return-type type="GdkGL_GL_APPLE_vertex_program_evaluators*"/>
		</function>
		<function name="gl_get_GL_ARB_matrix_palette" symbol="gdk_gl_get_GL_ARB_matrix_palette">
			<return-type type="GdkGL_GL_ARB_matrix_palette*"/>
		</function>
		<function name="gl_get_GL_ARB_multisample" symbol="gdk_gl_get_GL_ARB_multisample">
			<return-type type="GdkGL_GL_ARB_multisample*"/>
		</function>
		<function name="gl_get_GL_ARB_multitexture" symbol="gdk_gl_get_GL_ARB_multitexture">
			<return-type type="GdkGL_GL_ARB_multitexture*"/>
		</function>
		<function name="gl_get_GL_ARB_point_parameters" symbol="gdk_gl_get_GL_ARB_point_parameters">
			<return-type type="GdkGL_GL_ARB_point_parameters*"/>
		</function>
		<function name="gl_get_GL_ARB_texture_compression" symbol="gdk_gl_get_GL_ARB_texture_compression">
			<return-type type="GdkGL_GL_ARB_texture_compression*"/>
		</function>
		<function name="gl_get_GL_ARB_transpose_matrix" symbol="gdk_gl_get_GL_ARB_transpose_matrix">
			<return-type type="GdkGL_GL_ARB_transpose_matrix*"/>
		</function>
		<function name="gl_get_GL_ARB_vertex_blend" symbol="gdk_gl_get_GL_ARB_vertex_blend">
			<return-type type="GdkGL_GL_ARB_vertex_blend*"/>
		</function>
		<function name="gl_get_GL_ARB_vertex_buffer_object" symbol="gdk_gl_get_GL_ARB_vertex_buffer_object">
			<return-type type="GdkGL_GL_ARB_vertex_buffer_object*"/>
		</function>
		<function name="gl_get_GL_ARB_vertex_program" symbol="gdk_gl_get_GL_ARB_vertex_program">
			<return-type type="GdkGL_GL_ARB_vertex_program*"/>
		</function>
		<function name="gl_get_GL_ARB_window_pos" symbol="gdk_gl_get_GL_ARB_window_pos">
			<return-type type="GdkGL_GL_ARB_window_pos*"/>
		</function>
		<function name="gl_get_GL_ATIX_pn_triangles" symbol="gdk_gl_get_GL_ATIX_pn_triangles">
			<return-type type="GdkGL_GL_ATIX_pn_triangles*"/>
		</function>
		<function name="gl_get_GL_ATI_blend_equation_separate" symbol="gdk_gl_get_GL_ATI_blend_equation_separate">
			<return-type type="GdkGL_GL_ATI_blend_equation_separate*"/>
		</function>
		<function name="gl_get_GL_ATI_draw_buffers" symbol="gdk_gl_get_GL_ATI_draw_buffers">
			<return-type type="GdkGL_GL_ATI_draw_buffers*"/>
		</function>
		<function name="gl_get_GL_ATI_element_array" symbol="gdk_gl_get_GL_ATI_element_array">
			<return-type type="GdkGL_GL_ATI_element_array*"/>
		</function>
		<function name="gl_get_GL_ATI_envmap_bumpmap" symbol="gdk_gl_get_GL_ATI_envmap_bumpmap">
			<return-type type="GdkGL_GL_ATI_envmap_bumpmap*"/>
		</function>
		<function name="gl_get_GL_ATI_fragment_shader" symbol="gdk_gl_get_GL_ATI_fragment_shader">
			<return-type type="GdkGL_GL_ATI_fragment_shader*"/>
		</function>
		<function name="gl_get_GL_ATI_map_object_buffer" symbol="gdk_gl_get_GL_ATI_map_object_buffer">
			<return-type type="GdkGL_GL_ATI_map_object_buffer*"/>
		</function>
		<function name="gl_get_GL_ATI_pn_triangles" symbol="gdk_gl_get_GL_ATI_pn_triangles">
			<return-type type="GdkGL_GL_ATI_pn_triangles*"/>
		</function>
		<function name="gl_get_GL_ATI_separate_stencil" symbol="gdk_gl_get_GL_ATI_separate_stencil">
			<return-type type="GdkGL_GL_ATI_separate_stencil*"/>
		</function>
		<function name="gl_get_GL_ATI_vertex_array_object" symbol="gdk_gl_get_GL_ATI_vertex_array_object">
			<return-type type="GdkGL_GL_ATI_vertex_array_object*"/>
		</function>
		<function name="gl_get_GL_ATI_vertex_attrib_array_object" symbol="gdk_gl_get_GL_ATI_vertex_attrib_array_object">
			<return-type type="GdkGL_GL_ATI_vertex_attrib_array_object*"/>
		</function>
		<function name="gl_get_GL_ATI_vertex_streams" symbol="gdk_gl_get_GL_ATI_vertex_streams">
			<return-type type="GdkGL_GL_ATI_vertex_streams*"/>
		</function>
		<function name="gl_get_GL_Autodesk_facet_normal" symbol="gdk_gl_get_GL_Autodesk_facet_normal">
			<return-type type="GdkGL_GL_Autodesk_facet_normal*"/>
		</function>
		<function name="gl_get_GL_Autodesk_valid_back_buffer_hint" symbol="gdk_gl_get_GL_Autodesk_valid_back_buffer_hint">
			<return-type type="GdkGL_GL_Autodesk_valid_back_buffer_hint*"/>
		</function>
		<function name="gl_get_GL_EXT_blend_color" symbol="gdk_gl_get_GL_EXT_blend_color">
			<return-type type="GdkGL_GL_EXT_blend_color*"/>
		</function>
		<function name="gl_get_GL_EXT_blend_func_separate" symbol="gdk_gl_get_GL_EXT_blend_func_separate">
			<return-type type="GdkGL_GL_EXT_blend_func_separate*"/>
		</function>
		<function name="gl_get_GL_EXT_blend_minmax" symbol="gdk_gl_get_GL_EXT_blend_minmax">
			<return-type type="GdkGL_GL_EXT_blend_minmax*"/>
		</function>
		<function name="gl_get_GL_EXT_color_subtable" symbol="gdk_gl_get_GL_EXT_color_subtable">
			<return-type type="GdkGL_GL_EXT_color_subtable*"/>
		</function>
		<function name="gl_get_GL_EXT_compiled_vertex_array" symbol="gdk_gl_get_GL_EXT_compiled_vertex_array">
			<return-type type="GdkGL_GL_EXT_compiled_vertex_array*"/>
		</function>
		<function name="gl_get_GL_EXT_convolution" symbol="gdk_gl_get_GL_EXT_convolution">
			<return-type type="GdkGL_GL_EXT_convolution*"/>
		</function>
		<function name="gl_get_GL_EXT_coordinate_frame" symbol="gdk_gl_get_GL_EXT_coordinate_frame">
			<return-type type="GdkGL_GL_EXT_coordinate_frame*"/>
		</function>
		<function name="gl_get_GL_EXT_copy_texture" symbol="gdk_gl_get_GL_EXT_copy_texture">
			<return-type type="GdkGL_GL_EXT_copy_texture*"/>
		</function>
		<function name="gl_get_GL_EXT_cull_vertex" symbol="gdk_gl_get_GL_EXT_cull_vertex">
			<return-type type="GdkGL_GL_EXT_cull_vertex*"/>
		</function>
		<function name="gl_get_GL_EXT_depth_bounds_test" symbol="gdk_gl_get_GL_EXT_depth_bounds_test">
			<return-type type="GdkGL_GL_EXT_depth_bounds_test*"/>
		</function>
		<function name="gl_get_GL_EXT_draw_range_elements" symbol="gdk_gl_get_GL_EXT_draw_range_elements">
			<return-type type="GdkGL_GL_EXT_draw_range_elements*"/>
		</function>
		<function name="gl_get_GL_EXT_fog_coord" symbol="gdk_gl_get_GL_EXT_fog_coord">
			<return-type type="GdkGL_GL_EXT_fog_coord*"/>
		</function>
		<function name="gl_get_GL_EXT_fragment_lighting" symbol="gdk_gl_get_GL_EXT_fragment_lighting">
			<return-type type="GdkGL_GL_EXT_fragment_lighting*"/>
		</function>
		<function name="gl_get_GL_EXT_histogram" symbol="gdk_gl_get_GL_EXT_histogram">
			<return-type type="GdkGL_GL_EXT_histogram*"/>
		</function>
		<function name="gl_get_GL_EXT_index_func" symbol="gdk_gl_get_GL_EXT_index_func">
			<return-type type="GdkGL_GL_EXT_index_func*"/>
		</function>
		<function name="gl_get_GL_EXT_index_material" symbol="gdk_gl_get_GL_EXT_index_material">
			<return-type type="GdkGL_GL_EXT_index_material*"/>
		</function>
		<function name="gl_get_GL_EXT_light_texture" symbol="gdk_gl_get_GL_EXT_light_texture">
			<return-type type="GdkGL_GL_EXT_light_texture*"/>
		</function>
		<function name="gl_get_GL_EXT_multi_draw_arrays" symbol="gdk_gl_get_GL_EXT_multi_draw_arrays">
			<return-type type="GdkGL_GL_EXT_multi_draw_arrays*"/>
		</function>
		<function name="gl_get_GL_EXT_multisample" symbol="gdk_gl_get_GL_EXT_multisample">
			<return-type type="GdkGL_GL_EXT_multisample*"/>
		</function>
		<function name="gl_get_GL_EXT_multitexture" symbol="gdk_gl_get_GL_EXT_multitexture">
			<return-type type="GdkGL_GL_EXT_multitexture*"/>
		</function>
		<function name="gl_get_GL_EXT_paletted_texture" symbol="gdk_gl_get_GL_EXT_paletted_texture">
			<return-type type="GdkGL_GL_EXT_paletted_texture*"/>
		</function>
		<function name="gl_get_GL_EXT_pixel_transform" symbol="gdk_gl_get_GL_EXT_pixel_transform">
			<return-type type="GdkGL_GL_EXT_pixel_transform*"/>
		</function>
		<function name="gl_get_GL_EXT_point_parameters" symbol="gdk_gl_get_GL_EXT_point_parameters">
			<return-type type="GdkGL_GL_EXT_point_parameters*"/>
		</function>
		<function name="gl_get_GL_EXT_polygon_offset" symbol="gdk_gl_get_GL_EXT_polygon_offset">
			<return-type type="GdkGL_GL_EXT_polygon_offset*"/>
		</function>
		<function name="gl_get_GL_EXT_scene_marker" symbol="gdk_gl_get_GL_EXT_scene_marker">
			<return-type type="GdkGL_GL_EXT_scene_marker*"/>
		</function>
		<function name="gl_get_GL_EXT_secondary_color" symbol="gdk_gl_get_GL_EXT_secondary_color">
			<return-type type="GdkGL_GL_EXT_secondary_color*"/>
		</function>
		<function name="gl_get_GL_EXT_stencil_two_side" symbol="gdk_gl_get_GL_EXT_stencil_two_side">
			<return-type type="GdkGL_GL_EXT_stencil_two_side*"/>
		</function>
		<function name="gl_get_GL_EXT_subtexture" symbol="gdk_gl_get_GL_EXT_subtexture">
			<return-type type="GdkGL_GL_EXT_subtexture*"/>
		</function>
		<function name="gl_get_GL_EXT_texture3D" symbol="gdk_gl_get_GL_EXT_texture3D">
			<return-type type="GdkGL_GL_EXT_texture3D*"/>
		</function>
		<function name="gl_get_GL_EXT_texture_object" symbol="gdk_gl_get_GL_EXT_texture_object">
			<return-type type="GdkGL_GL_EXT_texture_object*"/>
		</function>
		<function name="gl_get_GL_EXT_texture_perturb_normal" symbol="gdk_gl_get_GL_EXT_texture_perturb_normal">
			<return-type type="GdkGL_GL_EXT_texture_perturb_normal*"/>
		</function>
		<function name="gl_get_GL_EXT_vertex_array" symbol="gdk_gl_get_GL_EXT_vertex_array">
			<return-type type="GdkGL_GL_EXT_vertex_array*"/>
		</function>
		<function name="gl_get_GL_EXT_vertex_shader" symbol="gdk_gl_get_GL_EXT_vertex_shader">
			<return-type type="GdkGL_GL_EXT_vertex_shader*"/>
		</function>
		<function name="gl_get_GL_EXT_vertex_weighting" symbol="gdk_gl_get_GL_EXT_vertex_weighting">
			<return-type type="GdkGL_GL_EXT_vertex_weighting*"/>
		</function>
		<function name="gl_get_GL_HP_image_transform" symbol="gdk_gl_get_GL_HP_image_transform">
			<return-type type="GdkGL_GL_HP_image_transform*"/>
		</function>
		<function name="gl_get_GL_IBM_multimode_draw_arrays" symbol="gdk_gl_get_GL_IBM_multimode_draw_arrays">
			<return-type type="GdkGL_GL_IBM_multimode_draw_arrays*"/>
		</function>
		<function name="gl_get_GL_IBM_static_data" symbol="gdk_gl_get_GL_IBM_static_data">
			<return-type type="GdkGL_GL_IBM_static_data*"/>
		</function>
		<function name="gl_get_GL_IBM_vertex_array_lists" symbol="gdk_gl_get_GL_IBM_vertex_array_lists">
			<return-type type="GdkGL_GL_IBM_vertex_array_lists*"/>
		</function>
		<function name="gl_get_GL_INGR_blend_func_separate" symbol="gdk_gl_get_GL_INGR_blend_func_separate">
			<return-type type="GdkGL_GL_INGR_blend_func_separate*"/>
		</function>
		<function name="gl_get_GL_INTEL_parallel_arrays" symbol="gdk_gl_get_GL_INTEL_parallel_arrays">
			<return-type type="GdkGL_GL_INTEL_parallel_arrays*"/>
		</function>
		<function name="gl_get_GL_KTX_buffer_region" symbol="gdk_gl_get_GL_KTX_buffer_region">
			<return-type type="GdkGL_GL_KTX_buffer_region*"/>
		</function>
		<function name="gl_get_GL_MESA_resize_buffers" symbol="gdk_gl_get_GL_MESA_resize_buffers">
			<return-type type="GdkGL_GL_MESA_resize_buffers*"/>
		</function>
		<function name="gl_get_GL_MESA_window_pos" symbol="gdk_gl_get_GL_MESA_window_pos">
			<return-type type="GdkGL_GL_MESA_window_pos*"/>
		</function>
		<function name="gl_get_GL_NV_element_array" symbol="gdk_gl_get_GL_NV_element_array">
			<return-type type="GdkGL_GL_NV_element_array*"/>
		</function>
		<function name="gl_get_GL_NV_evaluators" symbol="gdk_gl_get_GL_NV_evaluators">
			<return-type type="GdkGL_GL_NV_evaluators*"/>
		</function>
		<function name="gl_get_GL_NV_fence" symbol="gdk_gl_get_GL_NV_fence">
			<return-type type="GdkGL_GL_NV_fence*"/>
		</function>
		<function name="gl_get_GL_NV_fragment_program" symbol="gdk_gl_get_GL_NV_fragment_program">
			<return-type type="GdkGL_GL_NV_fragment_program*"/>
		</function>
		<function name="gl_get_GL_NV_half_float" symbol="gdk_gl_get_GL_NV_half_float">
			<return-type type="GdkGL_GL_NV_half_float*"/>
		</function>
		<function name="gl_get_GL_NV_occlusion_query" symbol="gdk_gl_get_GL_NV_occlusion_query">
			<return-type type="GdkGL_GL_NV_occlusion_query*"/>
		</function>
		<function name="gl_get_GL_NV_pixel_data_range" symbol="gdk_gl_get_GL_NV_pixel_data_range">
			<return-type type="GdkGL_GL_NV_pixel_data_range*"/>
		</function>
		<function name="gl_get_GL_NV_point_sprite" symbol="gdk_gl_get_GL_NV_point_sprite">
			<return-type type="GdkGL_GL_NV_point_sprite*"/>
		</function>
		<function name="gl_get_GL_NV_primitive_restart" symbol="gdk_gl_get_GL_NV_primitive_restart">
			<return-type type="GdkGL_GL_NV_primitive_restart*"/>
		</function>
		<function name="gl_get_GL_NV_register_combiners" symbol="gdk_gl_get_GL_NV_register_combiners">
			<return-type type="GdkGL_GL_NV_register_combiners*"/>
		</function>
		<function name="gl_get_GL_NV_register_combiners2" symbol="gdk_gl_get_GL_NV_register_combiners2">
			<return-type type="GdkGL_GL_NV_register_combiners2*"/>
		</function>
		<function name="gl_get_GL_NV_stencil_two_side" symbol="gdk_gl_get_GL_NV_stencil_two_side">
			<return-type type="GdkGL_GL_NV_stencil_two_side*"/>
		</function>
		<function name="gl_get_GL_NV_vertex_array_range" symbol="gdk_gl_get_GL_NV_vertex_array_range">
			<return-type type="GdkGL_GL_NV_vertex_array_range*"/>
		</function>
		<function name="gl_get_GL_NV_vertex_program" symbol="gdk_gl_get_GL_NV_vertex_program">
			<return-type type="GdkGL_GL_NV_vertex_program*"/>
		</function>
		<function name="gl_get_GL_PGI_misc_hints" symbol="gdk_gl_get_GL_PGI_misc_hints">
			<return-type type="GdkGL_GL_PGI_misc_hints*"/>
		</function>
		<function name="gl_get_GL_SGIS_detail_texture" symbol="gdk_gl_get_GL_SGIS_detail_texture">
			<return-type type="GdkGL_GL_SGIS_detail_texture*"/>
		</function>
		<function name="gl_get_GL_SGIS_fog_function" symbol="gdk_gl_get_GL_SGIS_fog_function">
			<return-type type="GdkGL_GL_SGIS_fog_function*"/>
		</function>
		<function name="gl_get_GL_SGIS_multisample" symbol="gdk_gl_get_GL_SGIS_multisample">
			<return-type type="GdkGL_GL_SGIS_multisample*"/>
		</function>
		<function name="gl_get_GL_SGIS_multitexture" symbol="gdk_gl_get_GL_SGIS_multitexture">
			<return-type type="GdkGL_GL_SGIS_multitexture*"/>
		</function>
		<function name="gl_get_GL_SGIS_pixel_texture" symbol="gdk_gl_get_GL_SGIS_pixel_texture">
			<return-type type="GdkGL_GL_SGIS_pixel_texture*"/>
		</function>
		<function name="gl_get_GL_SGIS_point_parameters" symbol="gdk_gl_get_GL_SGIS_point_parameters">
			<return-type type="GdkGL_GL_SGIS_point_parameters*"/>
		</function>
		<function name="gl_get_GL_SGIS_sharpen_texture" symbol="gdk_gl_get_GL_SGIS_sharpen_texture">
			<return-type type="GdkGL_GL_SGIS_sharpen_texture*"/>
		</function>
		<function name="gl_get_GL_SGIS_texture4D" symbol="gdk_gl_get_GL_SGIS_texture4D">
			<return-type type="GdkGL_GL_SGIS_texture4D*"/>
		</function>
		<function name="gl_get_GL_SGIS_texture_color_mask" symbol="gdk_gl_get_GL_SGIS_texture_color_mask">
			<return-type type="GdkGL_GL_SGIS_texture_color_mask*"/>
		</function>
		<function name="gl_get_GL_SGIS_texture_filter4" symbol="gdk_gl_get_GL_SGIS_texture_filter4">
			<return-type type="GdkGL_GL_SGIS_texture_filter4*"/>
		</function>
		<function name="gl_get_GL_SGIX_async" symbol="gdk_gl_get_GL_SGIX_async">
			<return-type type="GdkGL_GL_SGIX_async*"/>
		</function>
		<function name="gl_get_GL_SGIX_flush_raster" symbol="gdk_gl_get_GL_SGIX_flush_raster">
			<return-type type="GdkGL_GL_SGIX_flush_raster*"/>
		</function>
		<function name="gl_get_GL_SGIX_fog_texture" symbol="gdk_gl_get_GL_SGIX_fog_texture">
			<return-type type="GdkGL_GL_SGIX_fog_texture*"/>
		</function>
		<function name="gl_get_GL_SGIX_fragment_lighting" symbol="gdk_gl_get_GL_SGIX_fragment_lighting">
			<return-type type="GdkGL_GL_SGIX_fragment_lighting*"/>
		</function>
		<function name="gl_get_GL_SGIX_framezoom" symbol="gdk_gl_get_GL_SGIX_framezoom">
			<return-type type="GdkGL_GL_SGIX_framezoom*"/>
		</function>
		<function name="gl_get_GL_SGIX_igloo_interface" symbol="gdk_gl_get_GL_SGIX_igloo_interface">
			<return-type type="GdkGL_GL_SGIX_igloo_interface*"/>
		</function>
		<function name="gl_get_GL_SGIX_instruments" symbol="gdk_gl_get_GL_SGIX_instruments">
			<return-type type="GdkGL_GL_SGIX_instruments*"/>
		</function>
		<function name="gl_get_GL_SGIX_list_priority" symbol="gdk_gl_get_GL_SGIX_list_priority">
			<return-type type="GdkGL_GL_SGIX_list_priority*"/>
		</function>
		<function name="gl_get_GL_SGIX_pixel_texture" symbol="gdk_gl_get_GL_SGIX_pixel_texture">
			<return-type type="GdkGL_GL_SGIX_pixel_texture*"/>
		</function>
		<function name="gl_get_GL_SGIX_polynomial_ffd" symbol="gdk_gl_get_GL_SGIX_polynomial_ffd">
			<return-type type="GdkGL_GL_SGIX_polynomial_ffd*"/>
		</function>
		<function name="gl_get_GL_SGIX_reference_plane" symbol="gdk_gl_get_GL_SGIX_reference_plane">
			<return-type type="GdkGL_GL_SGIX_reference_plane*"/>
		</function>
		<function name="gl_get_GL_SGIX_sprite" symbol="gdk_gl_get_GL_SGIX_sprite">
			<return-type type="GdkGL_GL_SGIX_sprite*"/>
		</function>
		<function name="gl_get_GL_SGIX_tag_sample_buffer" symbol="gdk_gl_get_GL_SGIX_tag_sample_buffer">
			<return-type type="GdkGL_GL_SGIX_tag_sample_buffer*"/>
		</function>
		<function name="gl_get_GL_SGI_color_table" symbol="gdk_gl_get_GL_SGI_color_table">
			<return-type type="GdkGL_GL_SGI_color_table*"/>
		</function>
		<function name="gl_get_GL_SUNX_constant_data" symbol="gdk_gl_get_GL_SUNX_constant_data">
			<return-type type="GdkGL_GL_SUNX_constant_data*"/>
		</function>
		<function name="gl_get_GL_SUN_global_alpha" symbol="gdk_gl_get_GL_SUN_global_alpha">
			<return-type type="GdkGL_GL_SUN_global_alpha*"/>
		</function>
		<function name="gl_get_GL_SUN_mesh_array" symbol="gdk_gl_get_GL_SUN_mesh_array">
			<return-type type="GdkGL_GL_SUN_mesh_array*"/>
		</function>
		<function name="gl_get_GL_SUN_multi_draw_arrays" symbol="gdk_gl_get_GL_SUN_multi_draw_arrays">
			<return-type type="GdkGL_GL_SUN_multi_draw_arrays*"/>
		</function>
		<function name="gl_get_GL_SUN_triangle_list" symbol="gdk_gl_get_GL_SUN_triangle_list">
			<return-type type="GdkGL_GL_SUN_triangle_list*"/>
		</function>
		<function name="gl_get_GL_SUN_vertex" symbol="gdk_gl_get_GL_SUN_vertex">
			<return-type type="GdkGL_GL_SUN_vertex*"/>
		</function>
		<function name="gl_get_GL_VERSION_1_2" symbol="gdk_gl_get_GL_VERSION_1_2">
			<return-type type="GdkGL_GL_VERSION_1_2*"/>
		</function>
		<function name="gl_get_GL_VERSION_1_3" symbol="gdk_gl_get_GL_VERSION_1_3">
			<return-type type="GdkGL_GL_VERSION_1_3*"/>
		</function>
		<function name="gl_get_GL_VERSION_1_4" symbol="gdk_gl_get_GL_VERSION_1_4">
			<return-type type="GdkGL_GL_VERSION_1_4*"/>
		</function>
		<function name="gl_get_GL_WIN_swap_hint" symbol="gdk_gl_get_GL_WIN_swap_hint">
			<return-type type="GdkGL_GL_WIN_swap_hint*"/>
		</function>
		<function name="gl_get_glActiveStencilFaceEXT" symbol="gdk_gl_get_glActiveStencilFaceEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glActiveStencilFaceNV" symbol="gdk_gl_get_glActiveStencilFaceNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glActiveTexture" symbol="gdk_gl_get_glActiveTexture">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glActiveTextureARB" symbol="gdk_gl_get_glActiveTextureARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAddSwapHintRectWIN" symbol="gdk_gl_get_glAddSwapHintRectWIN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAlphaFragmentOp1ATI" symbol="gdk_gl_get_glAlphaFragmentOp1ATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAlphaFragmentOp2ATI" symbol="gdk_gl_get_glAlphaFragmentOp2ATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAlphaFragmentOp3ATI" symbol="gdk_gl_get_glAlphaFragmentOp3ATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glApplyTextureEXT" symbol="gdk_gl_get_glApplyTextureEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAreProgramsResidentNV" symbol="gdk_gl_get_glAreProgramsResidentNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAreTexturesResidentEXT" symbol="gdk_gl_get_glAreTexturesResidentEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glArrayElementEXT" symbol="gdk_gl_get_glArrayElementEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glArrayObjectATI" symbol="gdk_gl_get_glArrayObjectATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glAsyncMarkerSGIX" symbol="gdk_gl_get_glAsyncMarkerSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBeginFragmentShaderATI" symbol="gdk_gl_get_glBeginFragmentShaderATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBeginOcclusionQueryNV" symbol="gdk_gl_get_glBeginOcclusionQueryNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBeginSceneEXT" symbol="gdk_gl_get_glBeginSceneEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBeginVertexShaderEXT" symbol="gdk_gl_get_glBeginVertexShaderEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindBufferARB" symbol="gdk_gl_get_glBindBufferARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindFragmentShaderATI" symbol="gdk_gl_get_glBindFragmentShaderATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindLightParameterEXT" symbol="gdk_gl_get_glBindLightParameterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindMaterialParameterEXT" symbol="gdk_gl_get_glBindMaterialParameterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindParameterEXT" symbol="gdk_gl_get_glBindParameterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindProgramARB" symbol="gdk_gl_get_glBindProgramARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindProgramNV" symbol="gdk_gl_get_glBindProgramNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindTexGenParameterEXT" symbol="gdk_gl_get_glBindTexGenParameterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindTextureEXT" symbol="gdk_gl_get_glBindTextureEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindTextureUnitParameterEXT" symbol="gdk_gl_get_glBindTextureUnitParameterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindVertexArrayAPPLE" symbol="gdk_gl_get_glBindVertexArrayAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBindVertexShaderEXT" symbol="gdk_gl_get_glBindVertexShaderEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3bEXT" symbol="gdk_gl_get_glBinormal3bEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3bvEXT" symbol="gdk_gl_get_glBinormal3bvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3dEXT" symbol="gdk_gl_get_glBinormal3dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3dvEXT" symbol="gdk_gl_get_glBinormal3dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3fEXT" symbol="gdk_gl_get_glBinormal3fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3fvEXT" symbol="gdk_gl_get_glBinormal3fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3iEXT" symbol="gdk_gl_get_glBinormal3iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3ivEXT" symbol="gdk_gl_get_glBinormal3ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3sEXT" symbol="gdk_gl_get_glBinormal3sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormal3svEXT" symbol="gdk_gl_get_glBinormal3svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBinormalPointerEXT" symbol="gdk_gl_get_glBinormalPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendColor" symbol="gdk_gl_get_glBlendColor">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendColorEXT" symbol="gdk_gl_get_glBlendColorEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendEquation" symbol="gdk_gl_get_glBlendEquation">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendEquationEXT" symbol="gdk_gl_get_glBlendEquationEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendEquationSeparateATI" symbol="gdk_gl_get_glBlendEquationSeparateATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendFuncSeparate" symbol="gdk_gl_get_glBlendFuncSeparate">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendFuncSeparateEXT" symbol="gdk_gl_get_glBlendFuncSeparateEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBlendFuncSeparateINGR" symbol="gdk_gl_get_glBlendFuncSeparateINGR">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBufferDataARB" symbol="gdk_gl_get_glBufferDataARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBufferRegionEnabled" symbol="gdk_gl_get_glBufferRegionEnabled">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glBufferSubDataARB" symbol="gdk_gl_get_glBufferSubDataARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glClientActiveTexture" symbol="gdk_gl_get_glClientActiveTexture">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glClientActiveTextureARB" symbol="gdk_gl_get_glClientActiveTextureARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glClientActiveVertexStreamATI" symbol="gdk_gl_get_glClientActiveVertexStreamATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor3fVertex3fSUN" symbol="gdk_gl_get_glColor3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor3fVertex3fvSUN" symbol="gdk_gl_get_glColor3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor3hNV" symbol="gdk_gl_get_glColor3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor3hvNV" symbol="gdk_gl_get_glColor3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4fNormal3fVertex3fSUN" symbol="gdk_gl_get_glColor4fNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4fNormal3fVertex3fvSUN" symbol="gdk_gl_get_glColor4fNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4hNV" symbol="gdk_gl_get_glColor4hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4hvNV" symbol="gdk_gl_get_glColor4hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4ubVertex2fSUN" symbol="gdk_gl_get_glColor4ubVertex2fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4ubVertex2fvSUN" symbol="gdk_gl_get_glColor4ubVertex2fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4ubVertex3fSUN" symbol="gdk_gl_get_glColor4ubVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColor4ubVertex3fvSUN" symbol="gdk_gl_get_glColor4ubVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorFragmentOp1ATI" symbol="gdk_gl_get_glColorFragmentOp1ATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorFragmentOp2ATI" symbol="gdk_gl_get_glColorFragmentOp2ATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorFragmentOp3ATI" symbol="gdk_gl_get_glColorFragmentOp3ATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorPointerEXT" symbol="gdk_gl_get_glColorPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorPointerListIBM" symbol="gdk_gl_get_glColorPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorPointervINTEL" symbol="gdk_gl_get_glColorPointervINTEL">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorSubTable" symbol="gdk_gl_get_glColorSubTable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorSubTableEXT" symbol="gdk_gl_get_glColorSubTableEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTable" symbol="gdk_gl_get_glColorTable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTableEXT" symbol="gdk_gl_get_glColorTableEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTableParameterfv" symbol="gdk_gl_get_glColorTableParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTableParameterfvSGI" symbol="gdk_gl_get_glColorTableParameterfvSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTableParameteriv" symbol="gdk_gl_get_glColorTableParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTableParameterivSGI" symbol="gdk_gl_get_glColorTableParameterivSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glColorTableSGI" symbol="gdk_gl_get_glColorTableSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerInputNV" symbol="gdk_gl_get_glCombinerInputNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerOutputNV" symbol="gdk_gl_get_glCombinerOutputNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerParameterfNV" symbol="gdk_gl_get_glCombinerParameterfNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerParameterfvNV" symbol="gdk_gl_get_glCombinerParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerParameteriNV" symbol="gdk_gl_get_glCombinerParameteriNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerParameterivNV" symbol="gdk_gl_get_glCombinerParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCombinerStageParameterfvNV" symbol="gdk_gl_get_glCombinerStageParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexImage1D" symbol="gdk_gl_get_glCompressedTexImage1D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexImage1DARB" symbol="gdk_gl_get_glCompressedTexImage1DARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexImage2D" symbol="gdk_gl_get_glCompressedTexImage2D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexImage2DARB" symbol="gdk_gl_get_glCompressedTexImage2DARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexImage3D" symbol="gdk_gl_get_glCompressedTexImage3D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexImage3DARB" symbol="gdk_gl_get_glCompressedTexImage3DARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexSubImage1D" symbol="gdk_gl_get_glCompressedTexSubImage1D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexSubImage1DARB" symbol="gdk_gl_get_glCompressedTexSubImage1DARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexSubImage2D" symbol="gdk_gl_get_glCompressedTexSubImage2D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexSubImage2DARB" symbol="gdk_gl_get_glCompressedTexSubImage2DARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexSubImage3D" symbol="gdk_gl_get_glCompressedTexSubImage3D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCompressedTexSubImage3DARB" symbol="gdk_gl_get_glCompressedTexSubImage3DARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionFilter1D" symbol="gdk_gl_get_glConvolutionFilter1D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionFilter1DEXT" symbol="gdk_gl_get_glConvolutionFilter1DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionFilter2D" symbol="gdk_gl_get_glConvolutionFilter2D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionFilter2DEXT" symbol="gdk_gl_get_glConvolutionFilter2DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameterf" symbol="gdk_gl_get_glConvolutionParameterf">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameterfEXT" symbol="gdk_gl_get_glConvolutionParameterfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameterfv" symbol="gdk_gl_get_glConvolutionParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameterfvEXT" symbol="gdk_gl_get_glConvolutionParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameteri" symbol="gdk_gl_get_glConvolutionParameteri">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameteriEXT" symbol="gdk_gl_get_glConvolutionParameteriEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameteriv" symbol="gdk_gl_get_glConvolutionParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glConvolutionParameterivEXT" symbol="gdk_gl_get_glConvolutionParameterivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyColorSubTable" symbol="gdk_gl_get_glCopyColorSubTable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyColorSubTableEXT" symbol="gdk_gl_get_glCopyColorSubTableEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyColorTable" symbol="gdk_gl_get_glCopyColorTable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyColorTableSGI" symbol="gdk_gl_get_glCopyColorTableSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyConvolutionFilter1D" symbol="gdk_gl_get_glCopyConvolutionFilter1D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyConvolutionFilter1DEXT" symbol="gdk_gl_get_glCopyConvolutionFilter1DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyConvolutionFilter2D" symbol="gdk_gl_get_glCopyConvolutionFilter2D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyConvolutionFilter2DEXT" symbol="gdk_gl_get_glCopyConvolutionFilter2DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyTexImage1DEXT" symbol="gdk_gl_get_glCopyTexImage1DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyTexImage2DEXT" symbol="gdk_gl_get_glCopyTexImage2DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyTexSubImage1DEXT" symbol="gdk_gl_get_glCopyTexSubImage1DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyTexSubImage2DEXT" symbol="gdk_gl_get_glCopyTexSubImage2DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyTexSubImage3D" symbol="gdk_gl_get_glCopyTexSubImage3D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCopyTexSubImage3DEXT" symbol="gdk_gl_get_glCopyTexSubImage3DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCullParameterdvEXT" symbol="gdk_gl_get_glCullParameterdvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCullParameterfvEXT" symbol="gdk_gl_get_glCullParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glCurrentPaletteMatrixARB" symbol="gdk_gl_get_glCurrentPaletteMatrixARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeformSGIX" symbol="gdk_gl_get_glDeformSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeformationMap3dSGIX" symbol="gdk_gl_get_glDeformationMap3dSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeformationMap3fSGIX" symbol="gdk_gl_get_glDeformationMap3fSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteAsyncMarkersSGIX" symbol="gdk_gl_get_glDeleteAsyncMarkersSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteBufferRegion" symbol="gdk_gl_get_glDeleteBufferRegion">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteBuffersARB" symbol="gdk_gl_get_glDeleteBuffersARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteFencesAPPLE" symbol="gdk_gl_get_glDeleteFencesAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteFencesNV" symbol="gdk_gl_get_glDeleteFencesNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteFragmentShaderATI" symbol="gdk_gl_get_glDeleteFragmentShaderATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteOcclusionQueriesNV" symbol="gdk_gl_get_glDeleteOcclusionQueriesNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteProgramsARB" symbol="gdk_gl_get_glDeleteProgramsARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteProgramsNV" symbol="gdk_gl_get_glDeleteProgramsNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteTexturesEXT" symbol="gdk_gl_get_glDeleteTexturesEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteVertexArraysAPPLE" symbol="gdk_gl_get_glDeleteVertexArraysAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDeleteVertexShaderEXT" symbol="gdk_gl_get_glDeleteVertexShaderEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDepthBoundsEXT" symbol="gdk_gl_get_glDepthBoundsEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDetailTexFuncSGIS" symbol="gdk_gl_get_glDetailTexFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDisableVariantClientStateEXT" symbol="gdk_gl_get_glDisableVariantClientStateEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDisableVertexAttribAPPLE" symbol="gdk_gl_get_glDisableVertexAttribAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDisableVertexAttribArrayARB" symbol="gdk_gl_get_glDisableVertexAttribArrayARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawArraysEXT" symbol="gdk_gl_get_glDrawArraysEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawBufferRegion" symbol="gdk_gl_get_glDrawBufferRegion">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawBuffersATI" symbol="gdk_gl_get_glDrawBuffersATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawElementArrayAPPLE" symbol="gdk_gl_get_glDrawElementArrayAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawElementArrayATI" symbol="gdk_gl_get_glDrawElementArrayATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawElementArrayNV" symbol="gdk_gl_get_glDrawElementArrayNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawMeshArraysSUN" symbol="gdk_gl_get_glDrawMeshArraysSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawRangeElementArrayAPPLE" symbol="gdk_gl_get_glDrawRangeElementArrayAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawRangeElementArrayATI" symbol="gdk_gl_get_glDrawRangeElementArrayATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawRangeElementArrayNV" symbol="gdk_gl_get_glDrawRangeElementArrayNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawRangeElements" symbol="gdk_gl_get_glDrawRangeElements">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glDrawRangeElementsEXT" symbol="gdk_gl_get_glDrawRangeElementsEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEdgeFlagPointerEXT" symbol="gdk_gl_get_glEdgeFlagPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEdgeFlagPointerListIBM" symbol="gdk_gl_get_glEdgeFlagPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glElementPointerAPPLE" symbol="gdk_gl_get_glElementPointerAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glElementPointerATI" symbol="gdk_gl_get_glElementPointerATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glElementPointerNV" symbol="gdk_gl_get_glElementPointerNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEnableVariantClientStateEXT" symbol="gdk_gl_get_glEnableVariantClientStateEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEnableVertexAttribAPPLE" symbol="gdk_gl_get_glEnableVertexAttribAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEnableVertexAttribArrayARB" symbol="gdk_gl_get_glEnableVertexAttribArrayARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEndFragmentShaderATI" symbol="gdk_gl_get_glEndFragmentShaderATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEndOcclusionQueryNV" symbol="gdk_gl_get_glEndOcclusionQueryNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEndSceneEXT" symbol="gdk_gl_get_glEndSceneEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEndVertexShaderEXT" symbol="gdk_gl_get_glEndVertexShaderEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glEvalMapsNV" symbol="gdk_gl_get_glEvalMapsNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glExecuteProgramNV" symbol="gdk_gl_get_glExecuteProgramNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glExtractComponentEXT" symbol="gdk_gl_get_glExtractComponentEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3b" symbol="gdk_gl_get_glFacetNormal3b">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3bv" symbol="gdk_gl_get_glFacetNormal3bv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3d" symbol="gdk_gl_get_glFacetNormal3d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3dv" symbol="gdk_gl_get_glFacetNormal3dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3f" symbol="gdk_gl_get_glFacetNormal3f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3fv" symbol="gdk_gl_get_glFacetNormal3fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3i" symbol="gdk_gl_get_glFacetNormal3i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3iv" symbol="gdk_gl_get_glFacetNormal3iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3s" symbol="gdk_gl_get_glFacetNormal3s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFacetNormal3sv" symbol="gdk_gl_get_glFacetNormal3sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFinalCombinerInputNV" symbol="gdk_gl_get_glFinalCombinerInputNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFinishAsyncSGIX" symbol="gdk_gl_get_glFinishAsyncSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFinishFenceAPPLE" symbol="gdk_gl_get_glFinishFenceAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFinishFenceNV" symbol="gdk_gl_get_glFinishFenceNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFinishObjectAPPLE" symbol="gdk_gl_get_glFinishObjectAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFinishTextureSUNX" symbol="gdk_gl_get_glFinishTextureSUNX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFlushPixelDataRangeNV" symbol="gdk_gl_get_glFlushPixelDataRangeNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFlushRasterSGIX" symbol="gdk_gl_get_glFlushRasterSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFlushStaticDataIBM" symbol="gdk_gl_get_glFlushStaticDataIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFlushVertexArrayRangeAPPLE" symbol="gdk_gl_get_glFlushVertexArrayRangeAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFlushVertexArrayRangeNV" symbol="gdk_gl_get_glFlushVertexArrayRangeNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordPointer" symbol="gdk_gl_get_glFogCoordPointer">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordPointerEXT" symbol="gdk_gl_get_glFogCoordPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordPointerListIBM" symbol="gdk_gl_get_glFogCoordPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordd" symbol="gdk_gl_get_glFogCoordd">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoorddEXT" symbol="gdk_gl_get_glFogCoorddEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoorddv" symbol="gdk_gl_get_glFogCoorddv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoorddvEXT" symbol="gdk_gl_get_glFogCoorddvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordf" symbol="gdk_gl_get_glFogCoordf">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordfEXT" symbol="gdk_gl_get_glFogCoordfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordfv" symbol="gdk_gl_get_glFogCoordfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordfvEXT" symbol="gdk_gl_get_glFogCoordfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordhNV" symbol="gdk_gl_get_glFogCoordhNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogCoordhvNV" symbol="gdk_gl_get_glFogCoordhvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFogFuncSGIS" symbol="gdk_gl_get_glFogFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentColorMaterialEXT" symbol="gdk_gl_get_glFragmentColorMaterialEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentColorMaterialSGIX" symbol="gdk_gl_get_glFragmentColorMaterialSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModelfEXT" symbol="gdk_gl_get_glFragmentLightModelfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModelfSGIX" symbol="gdk_gl_get_glFragmentLightModelfSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModelfvEXT" symbol="gdk_gl_get_glFragmentLightModelfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModelfvSGIX" symbol="gdk_gl_get_glFragmentLightModelfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModeliEXT" symbol="gdk_gl_get_glFragmentLightModeliEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModeliSGIX" symbol="gdk_gl_get_glFragmentLightModeliSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModelivEXT" symbol="gdk_gl_get_glFragmentLightModelivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightModelivSGIX" symbol="gdk_gl_get_glFragmentLightModelivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightfEXT" symbol="gdk_gl_get_glFragmentLightfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightfSGIX" symbol="gdk_gl_get_glFragmentLightfSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightfvEXT" symbol="gdk_gl_get_glFragmentLightfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightfvSGIX" symbol="gdk_gl_get_glFragmentLightfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightiEXT" symbol="gdk_gl_get_glFragmentLightiEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightiSGIX" symbol="gdk_gl_get_glFragmentLightiSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightivEXT" symbol="gdk_gl_get_glFragmentLightivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentLightivSGIX" symbol="gdk_gl_get_glFragmentLightivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialfEXT" symbol="gdk_gl_get_glFragmentMaterialfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialfSGIX" symbol="gdk_gl_get_glFragmentMaterialfSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialfvEXT" symbol="gdk_gl_get_glFragmentMaterialfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialfvSGIX" symbol="gdk_gl_get_glFragmentMaterialfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialiEXT" symbol="gdk_gl_get_glFragmentMaterialiEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialiSGIX" symbol="gdk_gl_get_glFragmentMaterialiSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialivEXT" symbol="gdk_gl_get_glFragmentMaterialivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFragmentMaterialivSGIX" symbol="gdk_gl_get_glFragmentMaterialivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFrameZoomSGIX" symbol="gdk_gl_get_glFrameZoomSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glFreeObjectBufferATI" symbol="gdk_gl_get_glFreeObjectBufferATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenAsyncMarkersSGIX" symbol="gdk_gl_get_glGenAsyncMarkersSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenBuffersARB" symbol="gdk_gl_get_glGenBuffersARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenFencesAPPLE" symbol="gdk_gl_get_glGenFencesAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenFencesNV" symbol="gdk_gl_get_glGenFencesNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenFragmentShadersATI" symbol="gdk_gl_get_glGenFragmentShadersATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenOcclusionQueriesNV" symbol="gdk_gl_get_glGenOcclusionQueriesNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenProgramsARB" symbol="gdk_gl_get_glGenProgramsARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenProgramsNV" symbol="gdk_gl_get_glGenProgramsNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenSymbolsEXT" symbol="gdk_gl_get_glGenSymbolsEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenTexturesEXT" symbol="gdk_gl_get_glGenTexturesEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenVertexArraysAPPLE" symbol="gdk_gl_get_glGenVertexArraysAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGenVertexShadersEXT" symbol="gdk_gl_get_glGenVertexShadersEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetArrayObjectfvATI" symbol="gdk_gl_get_glGetArrayObjectfvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetArrayObjectivATI" symbol="gdk_gl_get_glGetArrayObjectivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetBufferParameterivARB" symbol="gdk_gl_get_glGetBufferParameterivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetBufferPointervARB" symbol="gdk_gl_get_glGetBufferPointervARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetBufferSubDataARB" symbol="gdk_gl_get_glGetBufferSubDataARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTable" symbol="gdk_gl_get_glGetColorTable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableEXT" symbol="gdk_gl_get_glGetColorTableEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableParameterfv" symbol="gdk_gl_get_glGetColorTableParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableParameterfvEXT" symbol="gdk_gl_get_glGetColorTableParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableParameterfvSGI" symbol="gdk_gl_get_glGetColorTableParameterfvSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableParameteriv" symbol="gdk_gl_get_glGetColorTableParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableParameterivEXT" symbol="gdk_gl_get_glGetColorTableParameterivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableParameterivSGI" symbol="gdk_gl_get_glGetColorTableParameterivSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetColorTableSGI" symbol="gdk_gl_get_glGetColorTableSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCombinerInputParameterfvNV" symbol="gdk_gl_get_glGetCombinerInputParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCombinerInputParameterivNV" symbol="gdk_gl_get_glGetCombinerInputParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCombinerOutputParameterfvNV" symbol="gdk_gl_get_glGetCombinerOutputParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCombinerOutputParameterivNV" symbol="gdk_gl_get_glGetCombinerOutputParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCombinerStageParameterfvNV" symbol="gdk_gl_get_glGetCombinerStageParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCompressedTexImage" symbol="gdk_gl_get_glGetCompressedTexImage">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetCompressedTexImageARB" symbol="gdk_gl_get_glGetCompressedTexImageARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetConvolutionFilter" symbol="gdk_gl_get_glGetConvolutionFilter">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetConvolutionFilterEXT" symbol="gdk_gl_get_glGetConvolutionFilterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetConvolutionParameterfv" symbol="gdk_gl_get_glGetConvolutionParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetConvolutionParameterfvEXT" symbol="gdk_gl_get_glGetConvolutionParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetConvolutionParameteriv" symbol="gdk_gl_get_glGetConvolutionParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetConvolutionParameterivEXT" symbol="gdk_gl_get_glGetConvolutionParameterivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetDetailTexFuncSGIS" symbol="gdk_gl_get_glGetDetailTexFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFenceivNV" symbol="gdk_gl_get_glGetFenceivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFinalCombinerInputParameterfvNV" symbol="gdk_gl_get_glGetFinalCombinerInputParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFinalCombinerInputParameterivNV" symbol="gdk_gl_get_glGetFinalCombinerInputParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFogFuncSGIS" symbol="gdk_gl_get_glGetFogFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentLightfvEXT" symbol="gdk_gl_get_glGetFragmentLightfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentLightfvSGIX" symbol="gdk_gl_get_glGetFragmentLightfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentLightivEXT" symbol="gdk_gl_get_glGetFragmentLightivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentLightivSGIX" symbol="gdk_gl_get_glGetFragmentLightivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentMaterialfvEXT" symbol="gdk_gl_get_glGetFragmentMaterialfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentMaterialfvSGIX" symbol="gdk_gl_get_glGetFragmentMaterialfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentMaterialivEXT" symbol="gdk_gl_get_glGetFragmentMaterialivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetFragmentMaterialivSGIX" symbol="gdk_gl_get_glGetFragmentMaterialivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetHistogram" symbol="gdk_gl_get_glGetHistogram">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetHistogramEXT" symbol="gdk_gl_get_glGetHistogramEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetHistogramParameterfv" symbol="gdk_gl_get_glGetHistogramParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetHistogramParameterfvEXT" symbol="gdk_gl_get_glGetHistogramParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetHistogramParameteriv" symbol="gdk_gl_get_glGetHistogramParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetHistogramParameterivEXT" symbol="gdk_gl_get_glGetHistogramParameterivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetImageTransformParameterfvHP" symbol="gdk_gl_get_glGetImageTransformParameterfvHP">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetImageTransformParameterivHP" symbol="gdk_gl_get_glGetImageTransformParameterivHP">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetInstrumentsSGIX" symbol="gdk_gl_get_glGetInstrumentsSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetInvariantBooleanvEXT" symbol="gdk_gl_get_glGetInvariantBooleanvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetInvariantFloatvEXT" symbol="gdk_gl_get_glGetInvariantFloatvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetInvariantIntegervEXT" symbol="gdk_gl_get_glGetInvariantIntegervEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetListParameterfvSGIX" symbol="gdk_gl_get_glGetListParameterfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetListParameterivSGIX" symbol="gdk_gl_get_glGetListParameterivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetLocalConstantBooleanvEXT" symbol="gdk_gl_get_glGetLocalConstantBooleanvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetLocalConstantFloatvEXT" symbol="gdk_gl_get_glGetLocalConstantFloatvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetLocalConstantIntegervEXT" symbol="gdk_gl_get_glGetLocalConstantIntegervEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMapAttribParameterfvNV" symbol="gdk_gl_get_glGetMapAttribParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMapAttribParameterivNV" symbol="gdk_gl_get_glGetMapAttribParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMapControlPointsNV" symbol="gdk_gl_get_glGetMapControlPointsNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMapParameterfvNV" symbol="gdk_gl_get_glGetMapParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMapParameterivNV" symbol="gdk_gl_get_glGetMapParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMinmax" symbol="gdk_gl_get_glGetMinmax">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMinmaxEXT" symbol="gdk_gl_get_glGetMinmaxEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMinmaxParameterfv" symbol="gdk_gl_get_glGetMinmaxParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMinmaxParameterfvEXT" symbol="gdk_gl_get_glGetMinmaxParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMinmaxParameteriv" symbol="gdk_gl_get_glGetMinmaxParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetMinmaxParameterivEXT" symbol="gdk_gl_get_glGetMinmaxParameterivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetObjectBufferfvATI" symbol="gdk_gl_get_glGetObjectBufferfvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetObjectBufferivATI" symbol="gdk_gl_get_glGetObjectBufferivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetOcclusionQueryivNV" symbol="gdk_gl_get_glGetOcclusionQueryivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetOcclusionQueryuivNV" symbol="gdk_gl_get_glGetOcclusionQueryuivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetPixelTexGenParameterfvSGIS" symbol="gdk_gl_get_glGetPixelTexGenParameterfvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetPixelTexGenParameterivSGIS" symbol="gdk_gl_get_glGetPixelTexGenParameterivSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetPointervEXT" symbol="gdk_gl_get_glGetPointervEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramEnvParameterdvARB" symbol="gdk_gl_get_glGetProgramEnvParameterdvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramEnvParameterfvARB" symbol="gdk_gl_get_glGetProgramEnvParameterfvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramLocalParameterdvARB" symbol="gdk_gl_get_glGetProgramLocalParameterdvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramLocalParameterfvARB" symbol="gdk_gl_get_glGetProgramLocalParameterfvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramNamedParameterdvNV" symbol="gdk_gl_get_glGetProgramNamedParameterdvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramNamedParameterfvNV" symbol="gdk_gl_get_glGetProgramNamedParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramParameterdvNV" symbol="gdk_gl_get_glGetProgramParameterdvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramParameterfvNV" symbol="gdk_gl_get_glGetProgramParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramStringARB" symbol="gdk_gl_get_glGetProgramStringARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramStringNV" symbol="gdk_gl_get_glGetProgramStringNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramivARB" symbol="gdk_gl_get_glGetProgramivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetProgramivNV" symbol="gdk_gl_get_glGetProgramivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetSeparableFilter" symbol="gdk_gl_get_glGetSeparableFilter">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetSeparableFilterEXT" symbol="gdk_gl_get_glGetSeparableFilterEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetSharpenTexFuncSGIS" symbol="gdk_gl_get_glGetSharpenTexFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetTexBumpParameterfvATI" symbol="gdk_gl_get_glGetTexBumpParameterfvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetTexBumpParameterivATI" symbol="gdk_gl_get_glGetTexBumpParameterivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetTexFilterFuncSGIS" symbol="gdk_gl_get_glGetTexFilterFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetTexParameterPointervAPPLE" symbol="gdk_gl_get_glGetTexParameterPointervAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetTrackMatrixivNV" symbol="gdk_gl_get_glGetTrackMatrixivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVariantArrayObjectfvATI" symbol="gdk_gl_get_glGetVariantArrayObjectfvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVariantArrayObjectivATI" symbol="gdk_gl_get_glGetVariantArrayObjectivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVariantBooleanvEXT" symbol="gdk_gl_get_glGetVariantBooleanvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVariantFloatvEXT" symbol="gdk_gl_get_glGetVariantFloatvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVariantIntegervEXT" symbol="gdk_gl_get_glGetVariantIntegervEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVariantPointervEXT" symbol="gdk_gl_get_glGetVariantPointervEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribArrayObjectfvATI" symbol="gdk_gl_get_glGetVertexAttribArrayObjectfvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribArrayObjectivATI" symbol="gdk_gl_get_glGetVertexAttribArrayObjectivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribPointervARB" symbol="gdk_gl_get_glGetVertexAttribPointervARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribPointervNV" symbol="gdk_gl_get_glGetVertexAttribPointervNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribdvARB" symbol="gdk_gl_get_glGetVertexAttribdvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribdvNV" symbol="gdk_gl_get_glGetVertexAttribdvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribfvARB" symbol="gdk_gl_get_glGetVertexAttribfvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribfvNV" symbol="gdk_gl_get_glGetVertexAttribfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribivARB" symbol="gdk_gl_get_glGetVertexAttribivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGetVertexAttribivNV" symbol="gdk_gl_get_glGetVertexAttribivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactorbSUN" symbol="gdk_gl_get_glGlobalAlphaFactorbSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactordSUN" symbol="gdk_gl_get_glGlobalAlphaFactordSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactorfSUN" symbol="gdk_gl_get_glGlobalAlphaFactorfSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactoriSUN" symbol="gdk_gl_get_glGlobalAlphaFactoriSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactorsSUN" symbol="gdk_gl_get_glGlobalAlphaFactorsSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactorubSUN" symbol="gdk_gl_get_glGlobalAlphaFactorubSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactoruiSUN" symbol="gdk_gl_get_glGlobalAlphaFactoruiSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glGlobalAlphaFactorusSUN" symbol="gdk_gl_get_glGlobalAlphaFactorusSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glHintPGI" symbol="gdk_gl_get_glHintPGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glHistogram" symbol="gdk_gl_get_glHistogram">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glHistogramEXT" symbol="gdk_gl_get_glHistogramEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIglooInterfaceSGIX" symbol="gdk_gl_get_glIglooInterfaceSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glImageTransformParameterfHP" symbol="gdk_gl_get_glImageTransformParameterfHP">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glImageTransformParameterfvHP" symbol="gdk_gl_get_glImageTransformParameterfvHP">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glImageTransformParameteriHP" symbol="gdk_gl_get_glImageTransformParameteriHP">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glImageTransformParameterivHP" symbol="gdk_gl_get_glImageTransformParameterivHP">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIndexFuncEXT" symbol="gdk_gl_get_glIndexFuncEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIndexMaterialEXT" symbol="gdk_gl_get_glIndexMaterialEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIndexPointerEXT" symbol="gdk_gl_get_glIndexPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIndexPointerListIBM" symbol="gdk_gl_get_glIndexPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glInsertComponentEXT" symbol="gdk_gl_get_glInsertComponentEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glInstrumentsBufferSGIX" symbol="gdk_gl_get_glInstrumentsBufferSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glInterleavedTextureCoordSetsEXT" symbol="gdk_gl_get_glInterleavedTextureCoordSetsEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsAsyncMarkerSGIX" symbol="gdk_gl_get_glIsAsyncMarkerSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsBufferARB" symbol="gdk_gl_get_glIsBufferARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsFenceAPPLE" symbol="gdk_gl_get_glIsFenceAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsFenceNV" symbol="gdk_gl_get_glIsFenceNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsObjectBufferATI" symbol="gdk_gl_get_glIsObjectBufferATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsOcclusionQueryNV" symbol="gdk_gl_get_glIsOcclusionQueryNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsProgramARB" symbol="gdk_gl_get_glIsProgramARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsProgramNV" symbol="gdk_gl_get_glIsProgramNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsTextureEXT" symbol="gdk_gl_get_glIsTextureEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsVariantEnabledEXT" symbol="gdk_gl_get_glIsVariantEnabledEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsVertexArrayAPPLE" symbol="gdk_gl_get_glIsVertexArrayAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glIsVertexAttribEnabledAPPLE" symbol="gdk_gl_get_glIsVertexAttribEnabledAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLightEnviEXT" symbol="gdk_gl_get_glLightEnviEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLightEnviSGIX" symbol="gdk_gl_get_glLightEnviSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glListParameterfSGIX" symbol="gdk_gl_get_glListParameterfSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glListParameterfvSGIX" symbol="gdk_gl_get_glListParameterfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glListParameteriSGIX" symbol="gdk_gl_get_glListParameteriSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glListParameterivSGIX" symbol="gdk_gl_get_glListParameterivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLoadIdentityDeformationMapSGIX" symbol="gdk_gl_get_glLoadIdentityDeformationMapSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLoadProgramNV" symbol="gdk_gl_get_glLoadProgramNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLoadTransposeMatrixd" symbol="gdk_gl_get_glLoadTransposeMatrixd">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLoadTransposeMatrixdARB" symbol="gdk_gl_get_glLoadTransposeMatrixdARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLoadTransposeMatrixf" symbol="gdk_gl_get_glLoadTransposeMatrixf">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLoadTransposeMatrixfARB" symbol="gdk_gl_get_glLoadTransposeMatrixfARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glLockArraysEXT" symbol="gdk_gl_get_glLockArraysEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapBufferARB" symbol="gdk_gl_get_glMapBufferARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapControlPointsNV" symbol="gdk_gl_get_glMapControlPointsNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapObjectBufferATI" symbol="gdk_gl_get_glMapObjectBufferATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapParameterfvNV" symbol="gdk_gl_get_glMapParameterfvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapParameterivNV" symbol="gdk_gl_get_glMapParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapVertexAttrib1dAPPLE" symbol="gdk_gl_get_glMapVertexAttrib1dAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapVertexAttrib1fAPPLE" symbol="gdk_gl_get_glMapVertexAttrib1fAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapVertexAttrib2dAPPLE" symbol="gdk_gl_get_glMapVertexAttrib2dAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMapVertexAttrib2fAPPLE" symbol="gdk_gl_get_glMapVertexAttrib2fAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMatrixIndexPointerARB" symbol="gdk_gl_get_glMatrixIndexPointerARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMatrixIndexubvARB" symbol="gdk_gl_get_glMatrixIndexubvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMatrixIndexuivARB" symbol="gdk_gl_get_glMatrixIndexuivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMatrixIndexusvARB" symbol="gdk_gl_get_glMatrixIndexusvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMinmax" symbol="gdk_gl_get_glMinmax">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMinmaxEXT" symbol="gdk_gl_get_glMinmaxEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultTransposeMatrixd" symbol="gdk_gl_get_glMultTransposeMatrixd">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultTransposeMatrixdARB" symbol="gdk_gl_get_glMultTransposeMatrixdARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultTransposeMatrixf" symbol="gdk_gl_get_glMultTransposeMatrixf">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultTransposeMatrixfARB" symbol="gdk_gl_get_glMultTransposeMatrixfARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawArrays" symbol="gdk_gl_get_glMultiDrawArrays">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawArraysEXT" symbol="gdk_gl_get_glMultiDrawArraysEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawArraysSUN" symbol="gdk_gl_get_glMultiDrawArraysSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawElementArrayAPPLE" symbol="gdk_gl_get_glMultiDrawElementArrayAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawElementArrayNV" symbol="gdk_gl_get_glMultiDrawElementArrayNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawElements" symbol="gdk_gl_get_glMultiDrawElements">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawElementsEXT" symbol="gdk_gl_get_glMultiDrawElementsEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawElementsSUN" symbol="gdk_gl_get_glMultiDrawElementsSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawRangeElementArrayAPPLE" symbol="gdk_gl_get_glMultiDrawRangeElementArrayAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiDrawRangeElementArrayNV" symbol="gdk_gl_get_glMultiDrawRangeElementArrayNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiModeDrawArraysIBM" symbol="gdk_gl_get_glMultiModeDrawArraysIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiModeDrawElementsIBM" symbol="gdk_gl_get_glMultiModeDrawElementsIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1d" symbol="gdk_gl_get_glMultiTexCoord1d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dARB" symbol="gdk_gl_get_glMultiTexCoord1dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dEXT" symbol="gdk_gl_get_glMultiTexCoord1dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dSGIS" symbol="gdk_gl_get_glMultiTexCoord1dSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dv" symbol="gdk_gl_get_glMultiTexCoord1dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dvARB" symbol="gdk_gl_get_glMultiTexCoord1dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dvEXT" symbol="gdk_gl_get_glMultiTexCoord1dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1dvSGIS" symbol="gdk_gl_get_glMultiTexCoord1dvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1f" symbol="gdk_gl_get_glMultiTexCoord1f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fARB" symbol="gdk_gl_get_glMultiTexCoord1fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fEXT" symbol="gdk_gl_get_glMultiTexCoord1fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fSGIS" symbol="gdk_gl_get_glMultiTexCoord1fSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fv" symbol="gdk_gl_get_glMultiTexCoord1fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fvARB" symbol="gdk_gl_get_glMultiTexCoord1fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fvEXT" symbol="gdk_gl_get_glMultiTexCoord1fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1fvSGIS" symbol="gdk_gl_get_glMultiTexCoord1fvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1hNV" symbol="gdk_gl_get_glMultiTexCoord1hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1hvNV" symbol="gdk_gl_get_glMultiTexCoord1hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1i" symbol="gdk_gl_get_glMultiTexCoord1i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1iARB" symbol="gdk_gl_get_glMultiTexCoord1iARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1iEXT" symbol="gdk_gl_get_glMultiTexCoord1iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1iSGIS" symbol="gdk_gl_get_glMultiTexCoord1iSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1iv" symbol="gdk_gl_get_glMultiTexCoord1iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1ivARB" symbol="gdk_gl_get_glMultiTexCoord1ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1ivEXT" symbol="gdk_gl_get_glMultiTexCoord1ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1ivSGIS" symbol="gdk_gl_get_glMultiTexCoord1ivSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1s" symbol="gdk_gl_get_glMultiTexCoord1s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1sARB" symbol="gdk_gl_get_glMultiTexCoord1sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1sEXT" symbol="gdk_gl_get_glMultiTexCoord1sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1sSGIS" symbol="gdk_gl_get_glMultiTexCoord1sSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1sv" symbol="gdk_gl_get_glMultiTexCoord1sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1svARB" symbol="gdk_gl_get_glMultiTexCoord1svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1svEXT" symbol="gdk_gl_get_glMultiTexCoord1svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord1svSGIS" symbol="gdk_gl_get_glMultiTexCoord1svSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2d" symbol="gdk_gl_get_glMultiTexCoord2d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dARB" symbol="gdk_gl_get_glMultiTexCoord2dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dEXT" symbol="gdk_gl_get_glMultiTexCoord2dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dSGIS" symbol="gdk_gl_get_glMultiTexCoord2dSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dv" symbol="gdk_gl_get_glMultiTexCoord2dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dvARB" symbol="gdk_gl_get_glMultiTexCoord2dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dvEXT" symbol="gdk_gl_get_glMultiTexCoord2dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2dvSGIS" symbol="gdk_gl_get_glMultiTexCoord2dvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2f" symbol="gdk_gl_get_glMultiTexCoord2f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fARB" symbol="gdk_gl_get_glMultiTexCoord2fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fEXT" symbol="gdk_gl_get_glMultiTexCoord2fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fSGIS" symbol="gdk_gl_get_glMultiTexCoord2fSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fv" symbol="gdk_gl_get_glMultiTexCoord2fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fvARB" symbol="gdk_gl_get_glMultiTexCoord2fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fvEXT" symbol="gdk_gl_get_glMultiTexCoord2fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2fvSGIS" symbol="gdk_gl_get_glMultiTexCoord2fvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2hNV" symbol="gdk_gl_get_glMultiTexCoord2hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2hvNV" symbol="gdk_gl_get_glMultiTexCoord2hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2i" symbol="gdk_gl_get_glMultiTexCoord2i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2iARB" symbol="gdk_gl_get_glMultiTexCoord2iARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2iEXT" symbol="gdk_gl_get_glMultiTexCoord2iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2iSGIS" symbol="gdk_gl_get_glMultiTexCoord2iSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2iv" symbol="gdk_gl_get_glMultiTexCoord2iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2ivARB" symbol="gdk_gl_get_glMultiTexCoord2ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2ivEXT" symbol="gdk_gl_get_glMultiTexCoord2ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2ivSGIS" symbol="gdk_gl_get_glMultiTexCoord2ivSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2s" symbol="gdk_gl_get_glMultiTexCoord2s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2sARB" symbol="gdk_gl_get_glMultiTexCoord2sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2sEXT" symbol="gdk_gl_get_glMultiTexCoord2sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2sSGIS" symbol="gdk_gl_get_glMultiTexCoord2sSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2sv" symbol="gdk_gl_get_glMultiTexCoord2sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2svARB" symbol="gdk_gl_get_glMultiTexCoord2svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2svEXT" symbol="gdk_gl_get_glMultiTexCoord2svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord2svSGIS" symbol="gdk_gl_get_glMultiTexCoord2svSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3d" symbol="gdk_gl_get_glMultiTexCoord3d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dARB" symbol="gdk_gl_get_glMultiTexCoord3dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dEXT" symbol="gdk_gl_get_glMultiTexCoord3dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dSGIS" symbol="gdk_gl_get_glMultiTexCoord3dSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dv" symbol="gdk_gl_get_glMultiTexCoord3dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dvARB" symbol="gdk_gl_get_glMultiTexCoord3dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dvEXT" symbol="gdk_gl_get_glMultiTexCoord3dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3dvSGIS" symbol="gdk_gl_get_glMultiTexCoord3dvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3f" symbol="gdk_gl_get_glMultiTexCoord3f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fARB" symbol="gdk_gl_get_glMultiTexCoord3fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fEXT" symbol="gdk_gl_get_glMultiTexCoord3fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fSGIS" symbol="gdk_gl_get_glMultiTexCoord3fSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fv" symbol="gdk_gl_get_glMultiTexCoord3fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fvARB" symbol="gdk_gl_get_glMultiTexCoord3fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fvEXT" symbol="gdk_gl_get_glMultiTexCoord3fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3fvSGIS" symbol="gdk_gl_get_glMultiTexCoord3fvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3hNV" symbol="gdk_gl_get_glMultiTexCoord3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3hvNV" symbol="gdk_gl_get_glMultiTexCoord3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3i" symbol="gdk_gl_get_glMultiTexCoord3i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3iARB" symbol="gdk_gl_get_glMultiTexCoord3iARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3iEXT" symbol="gdk_gl_get_glMultiTexCoord3iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3iSGIS" symbol="gdk_gl_get_glMultiTexCoord3iSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3iv" symbol="gdk_gl_get_glMultiTexCoord3iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3ivARB" symbol="gdk_gl_get_glMultiTexCoord3ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3ivEXT" symbol="gdk_gl_get_glMultiTexCoord3ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3ivSGIS" symbol="gdk_gl_get_glMultiTexCoord3ivSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3s" symbol="gdk_gl_get_glMultiTexCoord3s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3sARB" symbol="gdk_gl_get_glMultiTexCoord3sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3sEXT" symbol="gdk_gl_get_glMultiTexCoord3sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3sSGIS" symbol="gdk_gl_get_glMultiTexCoord3sSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3sv" symbol="gdk_gl_get_glMultiTexCoord3sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3svARB" symbol="gdk_gl_get_glMultiTexCoord3svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3svEXT" symbol="gdk_gl_get_glMultiTexCoord3svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord3svSGIS" symbol="gdk_gl_get_glMultiTexCoord3svSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4d" symbol="gdk_gl_get_glMultiTexCoord4d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dARB" symbol="gdk_gl_get_glMultiTexCoord4dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dEXT" symbol="gdk_gl_get_glMultiTexCoord4dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dSGIS" symbol="gdk_gl_get_glMultiTexCoord4dSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dv" symbol="gdk_gl_get_glMultiTexCoord4dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dvARB" symbol="gdk_gl_get_glMultiTexCoord4dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dvEXT" symbol="gdk_gl_get_glMultiTexCoord4dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4dvSGIS" symbol="gdk_gl_get_glMultiTexCoord4dvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4f" symbol="gdk_gl_get_glMultiTexCoord4f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fARB" symbol="gdk_gl_get_glMultiTexCoord4fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fEXT" symbol="gdk_gl_get_glMultiTexCoord4fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fSGIS" symbol="gdk_gl_get_glMultiTexCoord4fSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fv" symbol="gdk_gl_get_glMultiTexCoord4fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fvARB" symbol="gdk_gl_get_glMultiTexCoord4fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fvEXT" symbol="gdk_gl_get_glMultiTexCoord4fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4fvSGIS" symbol="gdk_gl_get_glMultiTexCoord4fvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4hNV" symbol="gdk_gl_get_glMultiTexCoord4hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4hvNV" symbol="gdk_gl_get_glMultiTexCoord4hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4i" symbol="gdk_gl_get_glMultiTexCoord4i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4iARB" symbol="gdk_gl_get_glMultiTexCoord4iARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4iEXT" symbol="gdk_gl_get_glMultiTexCoord4iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4iSGIS" symbol="gdk_gl_get_glMultiTexCoord4iSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4iv" symbol="gdk_gl_get_glMultiTexCoord4iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4ivARB" symbol="gdk_gl_get_glMultiTexCoord4ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4ivEXT" symbol="gdk_gl_get_glMultiTexCoord4ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4ivSGIS" symbol="gdk_gl_get_glMultiTexCoord4ivSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4s" symbol="gdk_gl_get_glMultiTexCoord4s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4sARB" symbol="gdk_gl_get_glMultiTexCoord4sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4sEXT" symbol="gdk_gl_get_glMultiTexCoord4sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4sSGIS" symbol="gdk_gl_get_glMultiTexCoord4sSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4sv" symbol="gdk_gl_get_glMultiTexCoord4sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4svARB" symbol="gdk_gl_get_glMultiTexCoord4svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4svEXT" symbol="gdk_gl_get_glMultiTexCoord4svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoord4svSGIS" symbol="gdk_gl_get_glMultiTexCoord4svSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glMultiTexCoordPointerSGIS" symbol="gdk_gl_get_glMultiTexCoordPointerSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNewBufferRegion" symbol="gdk_gl_get_glNewBufferRegion">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNewObjectBufferATI" symbol="gdk_gl_get_glNewObjectBufferATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormal3fVertex3fSUN" symbol="gdk_gl_get_glNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormal3fVertex3fvSUN" symbol="gdk_gl_get_glNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormal3hNV" symbol="gdk_gl_get_glNormal3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormal3hvNV" symbol="gdk_gl_get_glNormal3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalPointerEXT" symbol="gdk_gl_get_glNormalPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalPointerListIBM" symbol="gdk_gl_get_glNormalPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalPointervINTEL" symbol="gdk_gl_get_glNormalPointervINTEL">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3bATI" symbol="gdk_gl_get_glNormalStream3bATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3bvATI" symbol="gdk_gl_get_glNormalStream3bvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3dATI" symbol="gdk_gl_get_glNormalStream3dATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3dvATI" symbol="gdk_gl_get_glNormalStream3dvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3fATI" symbol="gdk_gl_get_glNormalStream3fATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3fvATI" symbol="gdk_gl_get_glNormalStream3fvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3iATI" symbol="gdk_gl_get_glNormalStream3iATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3ivATI" symbol="gdk_gl_get_glNormalStream3ivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3sATI" symbol="gdk_gl_get_glNormalStream3sATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glNormalStream3svATI" symbol="gdk_gl_get_glNormalStream3svATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPNTrianglesfATI" symbol="gdk_gl_get_glPNTrianglesfATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPNTrianglesfATIX" symbol="gdk_gl_get_glPNTrianglesfATIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPNTrianglesiATI" symbol="gdk_gl_get_glPNTrianglesiATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPNTrianglesiATIX" symbol="gdk_gl_get_glPNTrianglesiATIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPassTexCoordATI" symbol="gdk_gl_get_glPassTexCoordATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelDataRangeNV" symbol="gdk_gl_get_glPixelDataRangeNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTexGenParameterfSGIS" symbol="gdk_gl_get_glPixelTexGenParameterfSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTexGenParameterfvSGIS" symbol="gdk_gl_get_glPixelTexGenParameterfvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTexGenParameteriSGIS" symbol="gdk_gl_get_glPixelTexGenParameteriSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTexGenParameterivSGIS" symbol="gdk_gl_get_glPixelTexGenParameterivSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTexGenSGIX" symbol="gdk_gl_get_glPixelTexGenSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTransformParameterfEXT" symbol="gdk_gl_get_glPixelTransformParameterfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTransformParameterfvEXT" symbol="gdk_gl_get_glPixelTransformParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTransformParameteriEXT" symbol="gdk_gl_get_glPixelTransformParameteriEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPixelTransformParameterivEXT" symbol="gdk_gl_get_glPixelTransformParameterivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterf" symbol="gdk_gl_get_glPointParameterf">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfARB" symbol="gdk_gl_get_glPointParameterfARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfEXT" symbol="gdk_gl_get_glPointParameterfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfSGIS" symbol="gdk_gl_get_glPointParameterfSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfv" symbol="gdk_gl_get_glPointParameterfv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfvARB" symbol="gdk_gl_get_glPointParameterfvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfvEXT" symbol="gdk_gl_get_glPointParameterfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterfvSGIS" symbol="gdk_gl_get_glPointParameterfvSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameteri" symbol="gdk_gl_get_glPointParameteri">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameteriNV" symbol="gdk_gl_get_glPointParameteriNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameteriv" symbol="gdk_gl_get_glPointParameteriv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPointParameterivNV" symbol="gdk_gl_get_glPointParameterivNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPollAsyncSGIX" symbol="gdk_gl_get_glPollAsyncSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPollInstrumentsSGIX" symbol="gdk_gl_get_glPollInstrumentsSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPolygonOffsetEXT" symbol="gdk_gl_get_glPolygonOffsetEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPrimitiveRestartIndexNV" symbol="gdk_gl_get_glPrimitiveRestartIndexNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPrimitiveRestartNV" symbol="gdk_gl_get_glPrimitiveRestartNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glPrioritizeTexturesEXT" symbol="gdk_gl_get_glPrioritizeTexturesEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramEnvParameter4dARB" symbol="gdk_gl_get_glProgramEnvParameter4dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramEnvParameter4dvARB" symbol="gdk_gl_get_glProgramEnvParameter4dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramEnvParameter4fARB" symbol="gdk_gl_get_glProgramEnvParameter4fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramEnvParameter4fvARB" symbol="gdk_gl_get_glProgramEnvParameter4fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramLocalParameter4dARB" symbol="gdk_gl_get_glProgramLocalParameter4dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramLocalParameter4dvARB" symbol="gdk_gl_get_glProgramLocalParameter4dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramLocalParameter4fARB" symbol="gdk_gl_get_glProgramLocalParameter4fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramLocalParameter4fvARB" symbol="gdk_gl_get_glProgramLocalParameter4fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramNamedParameter4dNV" symbol="gdk_gl_get_glProgramNamedParameter4dNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramNamedParameter4dvNV" symbol="gdk_gl_get_glProgramNamedParameter4dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramNamedParameter4fNV" symbol="gdk_gl_get_glProgramNamedParameter4fNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramNamedParameter4fvNV" symbol="gdk_gl_get_glProgramNamedParameter4fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramParameter4dNV" symbol="gdk_gl_get_glProgramParameter4dNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramParameter4dvNV" symbol="gdk_gl_get_glProgramParameter4dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramParameter4fNV" symbol="gdk_gl_get_glProgramParameter4fNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramParameter4fvNV" symbol="gdk_gl_get_glProgramParameter4fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramParameters4dvNV" symbol="gdk_gl_get_glProgramParameters4dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramParameters4fvNV" symbol="gdk_gl_get_glProgramParameters4fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glProgramStringARB" symbol="gdk_gl_get_glProgramStringARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReadBufferRegion" symbol="gdk_gl_get_glReadBufferRegion">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReadInstrumentsSGIX" symbol="gdk_gl_get_glReadInstrumentsSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReferencePlaneSGIX" symbol="gdk_gl_get_glReferencePlaneSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodePointerSUN" symbol="gdk_gl_get_glReplacementCodePointerSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeubSUN" symbol="gdk_gl_get_glReplacementCodeubSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeubvSUN" symbol="gdk_gl_get_glReplacementCodeubvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiColor3fVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiColor3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiColor3fVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiColor3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiColor4fNormal3fVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiColor4fNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiColor4fNormal3fVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiColor4fNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiColor4ubVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiColor4ubVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiColor4ubVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiColor4ubVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiNormal3fVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiNormal3fVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiSUN" symbol="gdk_gl_get_glReplacementCodeuiSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiTexCoord2fVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiTexCoord2fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiTexCoord2fVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiTexCoord2fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiVertex3fSUN" symbol="gdk_gl_get_glReplacementCodeuiVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuiVertex3fvSUN" symbol="gdk_gl_get_glReplacementCodeuiVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeuivSUN" symbol="gdk_gl_get_glReplacementCodeuivSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeusSUN" symbol="gdk_gl_get_glReplacementCodeusSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glReplacementCodeusvSUN" symbol="gdk_gl_get_glReplacementCodeusvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glRequestResidentProgramsNV" symbol="gdk_gl_get_glRequestResidentProgramsNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glResetHistogram" symbol="gdk_gl_get_glResetHistogram">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glResetHistogramEXT" symbol="gdk_gl_get_glResetHistogramEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glResetMinmax" symbol="gdk_gl_get_glResetMinmax">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glResetMinmaxEXT" symbol="gdk_gl_get_glResetMinmaxEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glResizeBuffersMESA" symbol="gdk_gl_get_glResizeBuffersMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSampleCoverage" symbol="gdk_gl_get_glSampleCoverage">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSampleCoverageARB" symbol="gdk_gl_get_glSampleCoverageARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSampleMapATI" symbol="gdk_gl_get_glSampleMapATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSampleMaskEXT" symbol="gdk_gl_get_glSampleMaskEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSampleMaskSGIS" symbol="gdk_gl_get_glSampleMaskSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSamplePatternEXT" symbol="gdk_gl_get_glSamplePatternEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSamplePatternSGIS" symbol="gdk_gl_get_glSamplePatternSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3b" symbol="gdk_gl_get_glSecondaryColor3b">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3bEXT" symbol="gdk_gl_get_glSecondaryColor3bEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3bv" symbol="gdk_gl_get_glSecondaryColor3bv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3bvEXT" symbol="gdk_gl_get_glSecondaryColor3bvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3d" symbol="gdk_gl_get_glSecondaryColor3d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3dEXT" symbol="gdk_gl_get_glSecondaryColor3dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3dv" symbol="gdk_gl_get_glSecondaryColor3dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3dvEXT" symbol="gdk_gl_get_glSecondaryColor3dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3f" symbol="gdk_gl_get_glSecondaryColor3f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3fEXT" symbol="gdk_gl_get_glSecondaryColor3fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3fv" symbol="gdk_gl_get_glSecondaryColor3fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3fvEXT" symbol="gdk_gl_get_glSecondaryColor3fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3hNV" symbol="gdk_gl_get_glSecondaryColor3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3hvNV" symbol="gdk_gl_get_glSecondaryColor3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3i" symbol="gdk_gl_get_glSecondaryColor3i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3iEXT" symbol="gdk_gl_get_glSecondaryColor3iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3iv" symbol="gdk_gl_get_glSecondaryColor3iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3ivEXT" symbol="gdk_gl_get_glSecondaryColor3ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3s" symbol="gdk_gl_get_glSecondaryColor3s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3sEXT" symbol="gdk_gl_get_glSecondaryColor3sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3sv" symbol="gdk_gl_get_glSecondaryColor3sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3svEXT" symbol="gdk_gl_get_glSecondaryColor3svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3ub" symbol="gdk_gl_get_glSecondaryColor3ub">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3ubEXT" symbol="gdk_gl_get_glSecondaryColor3ubEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3ubv" symbol="gdk_gl_get_glSecondaryColor3ubv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3ubvEXT" symbol="gdk_gl_get_glSecondaryColor3ubvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3ui" symbol="gdk_gl_get_glSecondaryColor3ui">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3uiEXT" symbol="gdk_gl_get_glSecondaryColor3uiEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3uiv" symbol="gdk_gl_get_glSecondaryColor3uiv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3uivEXT" symbol="gdk_gl_get_glSecondaryColor3uivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3us" symbol="gdk_gl_get_glSecondaryColor3us">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3usEXT" symbol="gdk_gl_get_glSecondaryColor3usEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3usv" symbol="gdk_gl_get_glSecondaryColor3usv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColor3usvEXT" symbol="gdk_gl_get_glSecondaryColor3usvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColorPointer" symbol="gdk_gl_get_glSecondaryColorPointer">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColorPointerEXT" symbol="gdk_gl_get_glSecondaryColorPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSecondaryColorPointerListIBM" symbol="gdk_gl_get_glSecondaryColorPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSelectTextureCoordSetEXT" symbol="gdk_gl_get_glSelectTextureCoordSetEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSelectTextureCoordSetSGIS" symbol="gdk_gl_get_glSelectTextureCoordSetSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSelectTextureEXT" symbol="gdk_gl_get_glSelectTextureEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSelectTextureSGIS" symbol="gdk_gl_get_glSelectTextureSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSelectTextureTransformEXT" symbol="gdk_gl_get_glSelectTextureTransformEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSeparableFilter2D" symbol="gdk_gl_get_glSeparableFilter2D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSeparableFilter2DEXT" symbol="gdk_gl_get_glSeparableFilter2DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSetFenceAPPLE" symbol="gdk_gl_get_glSetFenceAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSetFenceNV" symbol="gdk_gl_get_glSetFenceNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSetFragmentShaderConstantATI" symbol="gdk_gl_get_glSetFragmentShaderConstantATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSetInvariantEXT" symbol="gdk_gl_get_glSetInvariantEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSetLocalConstantEXT" symbol="gdk_gl_get_glSetLocalConstantEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glShaderOp1EXT" symbol="gdk_gl_get_glShaderOp1EXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glShaderOp2EXT" symbol="gdk_gl_get_glShaderOp2EXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glShaderOp3EXT" symbol="gdk_gl_get_glShaderOp3EXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSharpenTexFuncSGIS" symbol="gdk_gl_get_glSharpenTexFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSpriteParameterfSGIX" symbol="gdk_gl_get_glSpriteParameterfSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSpriteParameterfvSGIX" symbol="gdk_gl_get_glSpriteParameterfvSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSpriteParameteriSGIX" symbol="gdk_gl_get_glSpriteParameteriSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSpriteParameterivSGIX" symbol="gdk_gl_get_glSpriteParameterivSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glStartInstrumentsSGIX" symbol="gdk_gl_get_glStartInstrumentsSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glStencilFuncSeparateATI" symbol="gdk_gl_get_glStencilFuncSeparateATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glStencilOpSeparateATI" symbol="gdk_gl_get_glStencilOpSeparateATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glStopInstrumentsSGIX" symbol="gdk_gl_get_glStopInstrumentsSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glSwizzleEXT" symbol="gdk_gl_get_glSwizzleEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTagSampleBufferSGIX" symbol="gdk_gl_get_glTagSampleBufferSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3bEXT" symbol="gdk_gl_get_glTangent3bEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3bvEXT" symbol="gdk_gl_get_glTangent3bvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3dEXT" symbol="gdk_gl_get_glTangent3dEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3dvEXT" symbol="gdk_gl_get_glTangent3dvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3fEXT" symbol="gdk_gl_get_glTangent3fEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3fvEXT" symbol="gdk_gl_get_glTangent3fvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3iEXT" symbol="gdk_gl_get_glTangent3iEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3ivEXT" symbol="gdk_gl_get_glTangent3ivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3sEXT" symbol="gdk_gl_get_glTangent3sEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangent3svEXT" symbol="gdk_gl_get_glTangent3svEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTangentPointerEXT" symbol="gdk_gl_get_glTangentPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTbufferMask3DFX" symbol="gdk_gl_get_glTbufferMask3DFX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTestFenceAPPLE" symbol="gdk_gl_get_glTestFenceAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTestFenceNV" symbol="gdk_gl_get_glTestFenceNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTestObjectAPPLE" symbol="gdk_gl_get_glTestObjectAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexBumpParameterfvATI" symbol="gdk_gl_get_glTexBumpParameterfvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexBumpParameterivATI" symbol="gdk_gl_get_glTexBumpParameterivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord1hNV" symbol="gdk_gl_get_glTexCoord1hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord1hvNV" symbol="gdk_gl_get_glTexCoord1hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fColor3fVertex3fSUN" symbol="gdk_gl_get_glTexCoord2fColor3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fColor3fVertex3fvSUN" symbol="gdk_gl_get_glTexCoord2fColor3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fColor4fNormal3fVertex3fSUN" symbol="gdk_gl_get_glTexCoord2fColor4fNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fColor4fNormal3fVertex3fvSUN" symbol="gdk_gl_get_glTexCoord2fColor4fNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fColor4ubVertex3fSUN" symbol="gdk_gl_get_glTexCoord2fColor4ubVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fColor4ubVertex3fvSUN" symbol="gdk_gl_get_glTexCoord2fColor4ubVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fNormal3fVertex3fSUN" symbol="gdk_gl_get_glTexCoord2fNormal3fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fNormal3fVertex3fvSUN" symbol="gdk_gl_get_glTexCoord2fNormal3fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fVertex3fSUN" symbol="gdk_gl_get_glTexCoord2fVertex3fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2fVertex3fvSUN" symbol="gdk_gl_get_glTexCoord2fVertex3fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2hNV" symbol="gdk_gl_get_glTexCoord2hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord2hvNV" symbol="gdk_gl_get_glTexCoord2hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord3hNV" symbol="gdk_gl_get_glTexCoord3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord3hvNV" symbol="gdk_gl_get_glTexCoord3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord4fColor4fNormal3fVertex4fSUN" symbol="gdk_gl_get_glTexCoord4fColor4fNormal3fVertex4fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord4fColor4fNormal3fVertex4fvSUN" symbol="gdk_gl_get_glTexCoord4fColor4fNormal3fVertex4fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord4fVertex4fSUN" symbol="gdk_gl_get_glTexCoord4fVertex4fSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord4fVertex4fvSUN" symbol="gdk_gl_get_glTexCoord4fVertex4fvSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord4hNV" symbol="gdk_gl_get_glTexCoord4hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoord4hvNV" symbol="gdk_gl_get_glTexCoord4hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoordPointerEXT" symbol="gdk_gl_get_glTexCoordPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoordPointerListIBM" symbol="gdk_gl_get_glTexCoordPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexCoordPointervINTEL" symbol="gdk_gl_get_glTexCoordPointervINTEL">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexFilterFuncSGIS" symbol="gdk_gl_get_glTexFilterFuncSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexImage3D" symbol="gdk_gl_get_glTexImage3D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexImage3DEXT" symbol="gdk_gl_get_glTexImage3DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexImage4DSGIS" symbol="gdk_gl_get_glTexImage4DSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexSubImage1DEXT" symbol="gdk_gl_get_glTexSubImage1DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexSubImage2DEXT" symbol="gdk_gl_get_glTexSubImage2DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexSubImage3D" symbol="gdk_gl_get_glTexSubImage3D">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexSubImage3DEXT" symbol="gdk_gl_get_glTexSubImage3DEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTexSubImage4DSGIS" symbol="gdk_gl_get_glTexSubImage4DSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTextureColorMaskSGIS" symbol="gdk_gl_get_glTextureColorMaskSGIS">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTextureFogSGIX" symbol="gdk_gl_get_glTextureFogSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTextureLightEXT" symbol="gdk_gl_get_glTextureLightEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTextureMaterialEXT" symbol="gdk_gl_get_glTextureMaterialEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTextureNormalEXT" symbol="gdk_gl_get_glTextureNormalEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTextureRangeAPPLE" symbol="gdk_gl_get_glTextureRangeAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glTrackMatrixNV" symbol="gdk_gl_get_glTrackMatrixNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glUnlockArraysEXT" symbol="gdk_gl_get_glUnlockArraysEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glUnmapBufferARB" symbol="gdk_gl_get_glUnmapBufferARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glUnmapObjectBufferATI" symbol="gdk_gl_get_glUnmapObjectBufferATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glUpdateObjectBufferATI" symbol="gdk_gl_get_glUpdateObjectBufferATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glValidBackBufferHint" symbol="gdk_gl_get_glValidBackBufferHint">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantArrayObjectATI" symbol="gdk_gl_get_glVariantArrayObjectATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantPointerEXT" symbol="gdk_gl_get_glVariantPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantbvEXT" symbol="gdk_gl_get_glVariantbvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantdvEXT" symbol="gdk_gl_get_glVariantdvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantfvEXT" symbol="gdk_gl_get_glVariantfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantivEXT" symbol="gdk_gl_get_glVariantivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantsvEXT" symbol="gdk_gl_get_glVariantsvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantubvEXT" symbol="gdk_gl_get_glVariantubvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantuivEXT" symbol="gdk_gl_get_glVariantuivEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVariantusvEXT" symbol="gdk_gl_get_glVariantusvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertex2hNV" symbol="gdk_gl_get_glVertex2hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertex2hvNV" symbol="gdk_gl_get_glVertex2hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertex3hNV" symbol="gdk_gl_get_glVertex3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertex3hvNV" symbol="gdk_gl_get_glVertex3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertex4hNV" symbol="gdk_gl_get_glVertex4hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertex4hvNV" symbol="gdk_gl_get_glVertex4hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexArrayParameteriAPPLE" symbol="gdk_gl_get_glVertexArrayParameteriAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexArrayRangeAPPLE" symbol="gdk_gl_get_glVertexArrayRangeAPPLE">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexArrayRangeNV" symbol="gdk_gl_get_glVertexArrayRangeNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1dARB" symbol="gdk_gl_get_glVertexAttrib1dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1dNV" symbol="gdk_gl_get_glVertexAttrib1dNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1dvARB" symbol="gdk_gl_get_glVertexAttrib1dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1dvNV" symbol="gdk_gl_get_glVertexAttrib1dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1fARB" symbol="gdk_gl_get_glVertexAttrib1fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1fNV" symbol="gdk_gl_get_glVertexAttrib1fNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1fvARB" symbol="gdk_gl_get_glVertexAttrib1fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1fvNV" symbol="gdk_gl_get_glVertexAttrib1fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1hNV" symbol="gdk_gl_get_glVertexAttrib1hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1hvNV" symbol="gdk_gl_get_glVertexAttrib1hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1sARB" symbol="gdk_gl_get_glVertexAttrib1sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1sNV" symbol="gdk_gl_get_glVertexAttrib1sNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1svARB" symbol="gdk_gl_get_glVertexAttrib1svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib1svNV" symbol="gdk_gl_get_glVertexAttrib1svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2dARB" symbol="gdk_gl_get_glVertexAttrib2dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2dNV" symbol="gdk_gl_get_glVertexAttrib2dNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2dvARB" symbol="gdk_gl_get_glVertexAttrib2dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2dvNV" symbol="gdk_gl_get_glVertexAttrib2dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2fARB" symbol="gdk_gl_get_glVertexAttrib2fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2fNV" symbol="gdk_gl_get_glVertexAttrib2fNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2fvARB" symbol="gdk_gl_get_glVertexAttrib2fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2fvNV" symbol="gdk_gl_get_glVertexAttrib2fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2hNV" symbol="gdk_gl_get_glVertexAttrib2hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2hvNV" symbol="gdk_gl_get_glVertexAttrib2hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2sARB" symbol="gdk_gl_get_glVertexAttrib2sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2sNV" symbol="gdk_gl_get_glVertexAttrib2sNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2svARB" symbol="gdk_gl_get_glVertexAttrib2svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib2svNV" symbol="gdk_gl_get_glVertexAttrib2svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3dARB" symbol="gdk_gl_get_glVertexAttrib3dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3dNV" symbol="gdk_gl_get_glVertexAttrib3dNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3dvARB" symbol="gdk_gl_get_glVertexAttrib3dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3dvNV" symbol="gdk_gl_get_glVertexAttrib3dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3fARB" symbol="gdk_gl_get_glVertexAttrib3fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3fNV" symbol="gdk_gl_get_glVertexAttrib3fNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3fvARB" symbol="gdk_gl_get_glVertexAttrib3fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3fvNV" symbol="gdk_gl_get_glVertexAttrib3fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3hNV" symbol="gdk_gl_get_glVertexAttrib3hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3hvNV" symbol="gdk_gl_get_glVertexAttrib3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3sARB" symbol="gdk_gl_get_glVertexAttrib3sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3sNV" symbol="gdk_gl_get_glVertexAttrib3sNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3svARB" symbol="gdk_gl_get_glVertexAttrib3svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib3svNV" symbol="gdk_gl_get_glVertexAttrib3svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NbvARB" symbol="gdk_gl_get_glVertexAttrib4NbvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NivARB" symbol="gdk_gl_get_glVertexAttrib4NivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NsvARB" symbol="gdk_gl_get_glVertexAttrib4NsvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NubARB" symbol="gdk_gl_get_glVertexAttrib4NubARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NubvARB" symbol="gdk_gl_get_glVertexAttrib4NubvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NuivARB" symbol="gdk_gl_get_glVertexAttrib4NuivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4NusvARB" symbol="gdk_gl_get_glVertexAttrib4NusvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4bvARB" symbol="gdk_gl_get_glVertexAttrib4bvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4dARB" symbol="gdk_gl_get_glVertexAttrib4dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4dNV" symbol="gdk_gl_get_glVertexAttrib4dNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4dvARB" symbol="gdk_gl_get_glVertexAttrib4dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4dvNV" symbol="gdk_gl_get_glVertexAttrib4dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4fARB" symbol="gdk_gl_get_glVertexAttrib4fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4fNV" symbol="gdk_gl_get_glVertexAttrib4fNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4fvARB" symbol="gdk_gl_get_glVertexAttrib4fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4fvNV" symbol="gdk_gl_get_glVertexAttrib4fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4hNV" symbol="gdk_gl_get_glVertexAttrib4hNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4hvNV" symbol="gdk_gl_get_glVertexAttrib4hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4ivARB" symbol="gdk_gl_get_glVertexAttrib4ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4sARB" symbol="gdk_gl_get_glVertexAttrib4sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4sNV" symbol="gdk_gl_get_glVertexAttrib4sNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4svARB" symbol="gdk_gl_get_glVertexAttrib4svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4svNV" symbol="gdk_gl_get_glVertexAttrib4svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4ubNV" symbol="gdk_gl_get_glVertexAttrib4ubNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4ubvARB" symbol="gdk_gl_get_glVertexAttrib4ubvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4ubvNV" symbol="gdk_gl_get_glVertexAttrib4ubvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4uivARB" symbol="gdk_gl_get_glVertexAttrib4uivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttrib4usvARB" symbol="gdk_gl_get_glVertexAttrib4usvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribArrayObjectATI" symbol="gdk_gl_get_glVertexAttribArrayObjectATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribPointerARB" symbol="gdk_gl_get_glVertexAttribPointerARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribPointerNV" symbol="gdk_gl_get_glVertexAttribPointerNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs1dvNV" symbol="gdk_gl_get_glVertexAttribs1dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs1fvNV" symbol="gdk_gl_get_glVertexAttribs1fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs1hvNV" symbol="gdk_gl_get_glVertexAttribs1hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs1svNV" symbol="gdk_gl_get_glVertexAttribs1svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs2dvNV" symbol="gdk_gl_get_glVertexAttribs2dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs2fvNV" symbol="gdk_gl_get_glVertexAttribs2fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs2hvNV" symbol="gdk_gl_get_glVertexAttribs2hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs2svNV" symbol="gdk_gl_get_glVertexAttribs2svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs3dvNV" symbol="gdk_gl_get_glVertexAttribs3dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs3fvNV" symbol="gdk_gl_get_glVertexAttribs3fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs3hvNV" symbol="gdk_gl_get_glVertexAttribs3hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs3svNV" symbol="gdk_gl_get_glVertexAttribs3svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs4dvNV" symbol="gdk_gl_get_glVertexAttribs4dvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs4fvNV" symbol="gdk_gl_get_glVertexAttribs4fvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs4hvNV" symbol="gdk_gl_get_glVertexAttribs4hvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs4svNV" symbol="gdk_gl_get_glVertexAttribs4svNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexAttribs4ubvNV" symbol="gdk_gl_get_glVertexAttribs4ubvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexBlendARB" symbol="gdk_gl_get_glVertexBlendARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexBlendEnvfATI" symbol="gdk_gl_get_glVertexBlendEnvfATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexBlendEnviATI" symbol="gdk_gl_get_glVertexBlendEnviATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexPointerEXT" symbol="gdk_gl_get_glVertexPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexPointerListIBM" symbol="gdk_gl_get_glVertexPointerListIBM">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexPointervINTEL" symbol="gdk_gl_get_glVertexPointervINTEL">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1dATI" symbol="gdk_gl_get_glVertexStream1dATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1dvATI" symbol="gdk_gl_get_glVertexStream1dvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1fATI" symbol="gdk_gl_get_glVertexStream1fATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1fvATI" symbol="gdk_gl_get_glVertexStream1fvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1iATI" symbol="gdk_gl_get_glVertexStream1iATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1ivATI" symbol="gdk_gl_get_glVertexStream1ivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1sATI" symbol="gdk_gl_get_glVertexStream1sATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream1svATI" symbol="gdk_gl_get_glVertexStream1svATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2dATI" symbol="gdk_gl_get_glVertexStream2dATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2dvATI" symbol="gdk_gl_get_glVertexStream2dvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2fATI" symbol="gdk_gl_get_glVertexStream2fATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2fvATI" symbol="gdk_gl_get_glVertexStream2fvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2iATI" symbol="gdk_gl_get_glVertexStream2iATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2ivATI" symbol="gdk_gl_get_glVertexStream2ivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2sATI" symbol="gdk_gl_get_glVertexStream2sATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream2svATI" symbol="gdk_gl_get_glVertexStream2svATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3dATI" symbol="gdk_gl_get_glVertexStream3dATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3dvATI" symbol="gdk_gl_get_glVertexStream3dvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3fATI" symbol="gdk_gl_get_glVertexStream3fATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3fvATI" symbol="gdk_gl_get_glVertexStream3fvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3iATI" symbol="gdk_gl_get_glVertexStream3iATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3ivATI" symbol="gdk_gl_get_glVertexStream3ivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3sATI" symbol="gdk_gl_get_glVertexStream3sATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream3svATI" symbol="gdk_gl_get_glVertexStream3svATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4dATI" symbol="gdk_gl_get_glVertexStream4dATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4dvATI" symbol="gdk_gl_get_glVertexStream4dvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4fATI" symbol="gdk_gl_get_glVertexStream4fATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4fvATI" symbol="gdk_gl_get_glVertexStream4fvATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4iATI" symbol="gdk_gl_get_glVertexStream4iATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4ivATI" symbol="gdk_gl_get_glVertexStream4ivATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4sATI" symbol="gdk_gl_get_glVertexStream4sATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexStream4svATI" symbol="gdk_gl_get_glVertexStream4svATI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexWeightPointerEXT" symbol="gdk_gl_get_glVertexWeightPointerEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexWeightfEXT" symbol="gdk_gl_get_glVertexWeightfEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexWeightfvEXT" symbol="gdk_gl_get_glVertexWeightfvEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexWeighthNV" symbol="gdk_gl_get_glVertexWeighthNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glVertexWeighthvNV" symbol="gdk_gl_get_glVertexWeighthvNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightPointerARB" symbol="gdk_gl_get_glWeightPointerARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightbvARB" symbol="gdk_gl_get_glWeightbvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightdvARB" symbol="gdk_gl_get_glWeightdvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightfvARB" symbol="gdk_gl_get_glWeightfvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightivARB" symbol="gdk_gl_get_glWeightivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightsvARB" symbol="gdk_gl_get_glWeightsvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightubvARB" symbol="gdk_gl_get_glWeightubvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightuivARB" symbol="gdk_gl_get_glWeightuivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWeightusvARB" symbol="gdk_gl_get_glWeightusvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowBackBufferHint" symbol="gdk_gl_get_glWindowBackBufferHint">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2d" symbol="gdk_gl_get_glWindowPos2d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2dARB" symbol="gdk_gl_get_glWindowPos2dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2dMESA" symbol="gdk_gl_get_glWindowPos2dMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2dv" symbol="gdk_gl_get_glWindowPos2dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2dvARB" symbol="gdk_gl_get_glWindowPos2dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2dvMESA" symbol="gdk_gl_get_glWindowPos2dvMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2f" symbol="gdk_gl_get_glWindowPos2f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2fARB" symbol="gdk_gl_get_glWindowPos2fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2fMESA" symbol="gdk_gl_get_glWindowPos2fMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2fv" symbol="gdk_gl_get_glWindowPos2fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2fvARB" symbol="gdk_gl_get_glWindowPos2fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2fvMESA" symbol="gdk_gl_get_glWindowPos2fvMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2i" symbol="gdk_gl_get_glWindowPos2i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2iARB" symbol="gdk_gl_get_glWindowPos2iARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2iMESA" symbol="gdk_gl_get_glWindowPos2iMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2iv" symbol="gdk_gl_get_glWindowPos2iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2ivARB" symbol="gdk_gl_get_glWindowPos2ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2ivMESA" symbol="gdk_gl_get_glWindowPos2ivMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2s" symbol="gdk_gl_get_glWindowPos2s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2sARB" symbol="gdk_gl_get_glWindowPos2sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2sMESA" symbol="gdk_gl_get_glWindowPos2sMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2sv" symbol="gdk_gl_get_glWindowPos2sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2svARB" symbol="gdk_gl_get_glWindowPos2svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos2svMESA" symbol="gdk_gl_get_glWindowPos2svMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3d" symbol="gdk_gl_get_glWindowPos3d">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3dARB" symbol="gdk_gl_get_glWindowPos3dARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3dMESA" symbol="gdk_gl_get_glWindowPos3dMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3dv" symbol="gdk_gl_get_glWindowPos3dv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3dvARB" symbol="gdk_gl_get_glWindowPos3dvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3dvMESA" symbol="gdk_gl_get_glWindowPos3dvMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3f" symbol="gdk_gl_get_glWindowPos3f">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3fARB" symbol="gdk_gl_get_glWindowPos3fARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3fMESA" symbol="gdk_gl_get_glWindowPos3fMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3fv" symbol="gdk_gl_get_glWindowPos3fv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3fvARB" symbol="gdk_gl_get_glWindowPos3fvARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3fvMESA" symbol="gdk_gl_get_glWindowPos3fvMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3i" symbol="gdk_gl_get_glWindowPos3i">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3iARB" symbol="gdk_gl_get_glWindowPos3iARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3iMESA" symbol="gdk_gl_get_glWindowPos3iMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3iv" symbol="gdk_gl_get_glWindowPos3iv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3ivARB" symbol="gdk_gl_get_glWindowPos3ivARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3ivMESA" symbol="gdk_gl_get_glWindowPos3ivMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3s" symbol="gdk_gl_get_glWindowPos3s">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3sARB" symbol="gdk_gl_get_glWindowPos3sARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3sMESA" symbol="gdk_gl_get_glWindowPos3sMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3sv" symbol="gdk_gl_get_glWindowPos3sv">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3svARB" symbol="gdk_gl_get_glWindowPos3svARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos3svMESA" symbol="gdk_gl_get_glWindowPos3svMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4dMESA" symbol="gdk_gl_get_glWindowPos4dMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4dvMESA" symbol="gdk_gl_get_glWindowPos4dvMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4fMESA" symbol="gdk_gl_get_glWindowPos4fMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4fvMESA" symbol="gdk_gl_get_glWindowPos4fvMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4iMESA" symbol="gdk_gl_get_glWindowPos4iMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4ivMESA" symbol="gdk_gl_get_glWindowPos4ivMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4sMESA" symbol="gdk_gl_get_glWindowPos4sMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWindowPos4svMESA" symbol="gdk_gl_get_glWindowPos4svMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glWriteMaskEXT" symbol="gdk_gl_get_glWriteMaskEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXAllocateMemoryNV" symbol="gdk_gl_get_glXAllocateMemoryNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXBindChannelToWindowSGIX" symbol="gdk_gl_get_glXBindChannelToWindowSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXBindSwapBarrierSGIX" symbol="gdk_gl_get_glXBindSwapBarrierSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXChannelRectSGIX" symbol="gdk_gl_get_glXChannelRectSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXChannelRectSyncSGIX" symbol="gdk_gl_get_glXChannelRectSyncSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXChooseFBConfig" symbol="gdk_gl_get_glXChooseFBConfig">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXChooseFBConfigSGIX" symbol="gdk_gl_get_glXChooseFBConfigSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCopySubBufferMESA" symbol="gdk_gl_get_glXCopySubBufferMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreateContextWithConfigSGIX" symbol="gdk_gl_get_glXCreateContextWithConfigSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreateGLXPbufferSGIX" symbol="gdk_gl_get_glXCreateGLXPbufferSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreateGLXPixmapMESA" symbol="gdk_gl_get_glXCreateGLXPixmapMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreateGLXPixmapWithConfigSGIX" symbol="gdk_gl_get_glXCreateGLXPixmapWithConfigSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreateNewContext" symbol="gdk_gl_get_glXCreateNewContext">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreatePbuffer" symbol="gdk_gl_get_glXCreatePbuffer">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreatePixmap" symbol="gdk_gl_get_glXCreatePixmap">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCreateWindow" symbol="gdk_gl_get_glXCreateWindow">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXCushionSGI" symbol="gdk_gl_get_glXCushionSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXDestroyGLXPbufferSGIX" symbol="gdk_gl_get_glXDestroyGLXPbufferSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXDestroyPbuffer" symbol="gdk_gl_get_glXDestroyPbuffer">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXDestroyPixmap" symbol="gdk_gl_get_glXDestroyPixmap">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXDestroyWindow" symbol="gdk_gl_get_glXDestroyWindow">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXFreeContextEXT" symbol="gdk_gl_get_glXFreeContextEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXFreeMemoryNV" symbol="gdk_gl_get_glXFreeMemoryNV">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetAGPOffsetMESA" symbol="gdk_gl_get_glXGetAGPOffsetMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetContextIDEXT" symbol="gdk_gl_get_glXGetContextIDEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetCurrentDisplay" symbol="gdk_gl_get_glXGetCurrentDisplay">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetCurrentDisplayEXT" symbol="gdk_gl_get_glXGetCurrentDisplayEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetCurrentReadDrawable" symbol="gdk_gl_get_glXGetCurrentReadDrawable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetCurrentReadDrawableSGI" symbol="gdk_gl_get_glXGetCurrentReadDrawableSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetFBConfigAttrib" symbol="gdk_gl_get_glXGetFBConfigAttrib">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetFBConfigAttribSGIX" symbol="gdk_gl_get_glXGetFBConfigAttribSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetFBConfigFromVisualSGIX" symbol="gdk_gl_get_glXGetFBConfigFromVisualSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetFBConfigs" symbol="gdk_gl_get_glXGetFBConfigs">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetMscRateOML" symbol="gdk_gl_get_glXGetMscRateOML">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetProcAddress" symbol="gdk_gl_get_glXGetProcAddress">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetProcAddressARB" symbol="gdk_gl_get_glXGetProcAddressARB">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetSelectedEvent" symbol="gdk_gl_get_glXGetSelectedEvent">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetSelectedEventSGIX" symbol="gdk_gl_get_glXGetSelectedEventSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetSyncValuesOML" symbol="gdk_gl_get_glXGetSyncValuesOML">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetTransparentIndexSUN" symbol="gdk_gl_get_glXGetTransparentIndexSUN">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetVideoSyncSGI" symbol="gdk_gl_get_glXGetVideoSyncSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetVisualFromFBConfig" symbol="gdk_gl_get_glXGetVisualFromFBConfig">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXGetVisualFromFBConfigSGIX" symbol="gdk_gl_get_glXGetVisualFromFBConfigSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXImportContextEXT" symbol="gdk_gl_get_glXImportContextEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXJoinSwapGroupSGIX" symbol="gdk_gl_get_glXJoinSwapGroupSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXMakeContextCurrent" symbol="gdk_gl_get_glXMakeContextCurrent">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXMakeCurrentReadSGI" symbol="gdk_gl_get_glXMakeCurrentReadSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryChannelDeltasSGIX" symbol="gdk_gl_get_glXQueryChannelDeltasSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryChannelRectSGIX" symbol="gdk_gl_get_glXQueryChannelRectSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryContext" symbol="gdk_gl_get_glXQueryContext">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryContextInfoEXT" symbol="gdk_gl_get_glXQueryContextInfoEXT">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryDrawable" symbol="gdk_gl_get_glXQueryDrawable">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryGLXPbufferSGIX" symbol="gdk_gl_get_glXQueryGLXPbufferSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXQueryMaxSwapBarriersSGIX" symbol="gdk_gl_get_glXQueryMaxSwapBarriersSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXReleaseBuffersMESA" symbol="gdk_gl_get_glXReleaseBuffersMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXSelectEvent" symbol="gdk_gl_get_glXSelectEvent">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXSelectEventSGIX" symbol="gdk_gl_get_glXSelectEventSGIX">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXSet3DfxModeMESA" symbol="gdk_gl_get_glXSet3DfxModeMESA">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXSwapBuffersMscOML" symbol="gdk_gl_get_glXSwapBuffersMscOML">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXSwapIntervalSGI" symbol="gdk_gl_get_glXSwapIntervalSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXWaitForMscOML" symbol="gdk_gl_get_glXWaitForMscOML">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXWaitForSbcOML" symbol="gdk_gl_get_glXWaitForSbcOML">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_glXWaitVideoSyncSGI" symbol="gdk_gl_get_glXWaitVideoSyncSGI">
			<return-type type="GdkGLProc"/>
		</function>
		<function name="gl_get_proc_address" symbol="gdk_gl_get_proc_address">
			<return-type type="GdkGLProc"/>
			<parameters>
				<parameter name="proc_name" type="char*"/>
			</parameters>
		</function>
		<function name="gl_init" symbol="gdk_gl_init">
			<return-type type="void"/>
			<parameters>
				<parameter name="argc" type="int*"/>
				<parameter name="argv" type="char***"/>
			</parameters>
		</function>
		<function name="gl_init_check" symbol="gdk_gl_init_check">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="argc" type="int*"/>
				<parameter name="argv" type="char***"/>
			</parameters>
		</function>
		<function name="gl_parse_args" symbol="gdk_gl_parse_args">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="argc" type="int*"/>
				<parameter name="argv" type="char***"/>
			</parameters>
		</function>
		<function name="gl_query_extension" symbol="gdk_gl_query_extension">
			<return-type type="gboolean"/>
		</function>
		<function name="gl_query_extension_for_display" symbol="gdk_gl_query_extension_for_display">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="display" type="GdkDisplay*"/>
			</parameters>
		</function>
		<function name="gl_query_gl_extension" symbol="gdk_gl_query_gl_extension">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="extension" type="char*"/>
			</parameters>
		</function>
		<function name="gl_query_version" symbol="gdk_gl_query_version">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="major" type="int*"/>
				<parameter name="minor" type="int*"/>
			</parameters>
		</function>
		<function name="gl_query_version_for_display" symbol="gdk_gl_query_version_for_display">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="display" type="GdkDisplay*"/>
				<parameter name="major" type="int*"/>
				<parameter name="minor" type="int*"/>
			</parameters>
		</function>
		<function name="pixmap_get_gl_pixmap" symbol="gdk_pixmap_get_gl_pixmap">
			<return-type type="GdkGLPixmap*"/>
			<parameters>
				<parameter name="pixmap" type="GdkPixmap*"/>
			</parameters>
		</function>
		<function name="pixmap_is_gl_capable" symbol="gdk_pixmap_is_gl_capable">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="pixmap" type="GdkPixmap*"/>
			</parameters>
		</function>
		<function name="pixmap_set_gl_capability" symbol="gdk_pixmap_set_gl_capability">
			<return-type type="GdkGLPixmap*"/>
			<parameters>
				<parameter name="pixmap" type="GdkPixmap*"/>
				<parameter name="glconfig" type="GdkGLConfig*"/>
				<parameter name="attrib_list" type="int*"/>
			</parameters>
		</function>
		<function name="pixmap_unset_gl_capability" symbol="gdk_pixmap_unset_gl_capability">
			<return-type type="void"/>
			<parameters>
				<parameter name="pixmap" type="GdkPixmap*"/>
			</parameters>
		</function>
		<function name="window_get_gl_window" symbol="gdk_window_get_gl_window">
			<return-type type="GdkGLWindow*"/>
			<parameters>
				<parameter name="window" type="GdkWindow*"/>
			</parameters>
		</function>
		<function name="window_is_gl_capable" symbol="gdk_window_is_gl_capable">
			<return-type type="gboolean"/>
			<parameters>
				<parameter name="window" type="GdkWindow*"/>
			</parameters>
		</function>
		<function name="window_set_gl_capability" symbol="gdk_window_set_gl_capability">
			<return-type type="GdkGLWindow*"/>
			<parameters>
				<parameter name="window" type="GdkWindow*"/>
				<parameter name="glconfig" type="GdkGLConfig*"/>
				<parameter name="attrib_list" type="int*"/>
			</parameters>
		</function>
		<function name="window_unset_gl_capability" symbol="gdk_window_unset_gl_capability">
			<return-type type="void"/>
			<parameters>
				<parameter name="window" type="GdkWindow*"/>
			</parameters>
		</function>
		<callback name="GdkGLProc">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glActiveStencilFaceEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glActiveStencilFaceNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glActiveTexture">
			<return-type type="void"/>
			<parameters>
				<parameter name="texture" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glActiveTextureARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="texture" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAddSwapHintRectWIN">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAlphaFragmentOp1ATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="dst" type="GLuint"/>
				<parameter name="dstMod" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg1Rep" type="GLuint"/>
				<parameter name="arg1Mod" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAlphaFragmentOp2ATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="dst" type="GLuint"/>
				<parameter name="dstMod" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg1Rep" type="GLuint"/>
				<parameter name="arg1Mod" type="GLuint"/>
				<parameter name="arg2" type="GLuint"/>
				<parameter name="arg2Rep" type="GLuint"/>
				<parameter name="arg2Mod" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAlphaFragmentOp3ATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="dst" type="GLuint"/>
				<parameter name="dstMod" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg1Rep" type="GLuint"/>
				<parameter name="arg1Mod" type="GLuint"/>
				<parameter name="arg2" type="GLuint"/>
				<parameter name="arg2Rep" type="GLuint"/>
				<parameter name="arg2Mod" type="GLuint"/>
				<parameter name="arg3" type="GLuint"/>
				<parameter name="arg3Rep" type="GLuint"/>
				<parameter name="arg3Mod" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glApplyTextureEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAreProgramsResidentNV">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="programs" type="GLuint*"/>
				<parameter name="residences" type="GLboolean*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAreTexturesResidentEXT">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="textures" type="GLuint*"/>
				<parameter name="residences" type="GLboolean*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glArrayElementEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="i" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glArrayObjectATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="array" type="GLenum"/>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="buffer" type="GLuint"/>
				<parameter name="offset" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glAsyncMarkerSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="marker" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBeginFragmentShaderATI">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glBeginOcclusionQueryNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBeginSceneEXT">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glBeginVertexShaderEXT">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glBindBufferARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="buffer" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindFragmentShaderATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindLightParameterEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="value" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindMaterialParameterEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="value" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindParameterEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="value" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindProgramARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="program" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindProgramNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindTexGenParameterEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="unit" type="GLenum"/>
				<parameter name="coord" type="GLenum"/>
				<parameter name="value" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindTextureEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="texture" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindTextureUnitParameterEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="unit" type="GLenum"/>
				<parameter name="value" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindVertexArrayAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="array" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBindVertexShaderEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3bEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="bx" type="GLbyte"/>
				<parameter name="by" type="GLbyte"/>
				<parameter name="bz" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3bvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="bx" type="GLdouble"/>
				<parameter name="by" type="GLdouble"/>
				<parameter name="bz" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="bx" type="GLfloat"/>
				<parameter name="by" type="GLfloat"/>
				<parameter name="bz" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="bx" type="GLint"/>
				<parameter name="by" type="GLint"/>
				<parameter name="bz" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="bx" type="GLshort"/>
				<parameter name="by" type="GLshort"/>
				<parameter name="bz" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormal3svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBinormalPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendColor">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLclampf"/>
				<parameter name="green" type="GLclampf"/>
				<parameter name="blue" type="GLclampf"/>
				<parameter name="alpha" type="GLclampf"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendColorEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLclampf"/>
				<parameter name="green" type="GLclampf"/>
				<parameter name="blue" type="GLclampf"/>
				<parameter name="alpha" type="GLclampf"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendEquation">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendEquationEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendEquationSeparateATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="equationRGB" type="GLenum"/>
				<parameter name="equationAlpha" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendFuncSeparate">
			<return-type type="void"/>
			<parameters>
				<parameter name="sfactorRGB" type="GLenum"/>
				<parameter name="dfactorRGB" type="GLenum"/>
				<parameter name="sfactorAlpha" type="GLenum"/>
				<parameter name="dfactorAlpha" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendFuncSeparateEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="sfactorRGB" type="GLenum"/>
				<parameter name="dfactorRGB" type="GLenum"/>
				<parameter name="sfactorAlpha" type="GLenum"/>
				<parameter name="dfactorAlpha" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBlendFuncSeparateINGR">
			<return-type type="void"/>
			<parameters>
				<parameter name="sfactorRGB" type="GLenum"/>
				<parameter name="dfactorRGB" type="GLenum"/>
				<parameter name="sfactorAlpha" type="GLenum"/>
				<parameter name="dfactorAlpha" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBufferDataARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="size" type="GLsizeiptrARB"/>
				<parameter name="data" type="GLvoid*"/>
				<parameter name="usage" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glBufferRegionEnabled">
			<return-type type="GLuint"/>
		</callback>
		<callback name="GdkGLProc_glBufferSubDataARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="offset" type="GLintptrARB"/>
				<parameter name="size" type="GLsizeiptrARB"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glClientActiveTexture">
			<return-type type="void"/>
			<parameters>
				<parameter name="texture" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glClientActiveTextureARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="texture" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glClientActiveVertexStreamATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLhalfNV"/>
				<parameter name="green" type="GLhalfNV"/>
				<parameter name="blue" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4fNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="a" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4fNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLhalfNV"/>
				<parameter name="green" type="GLhalfNV"/>
				<parameter name="blue" type="GLhalfNV"/>
				<parameter name="alpha" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4ubVertex2fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="r" type="GLubyte"/>
				<parameter name="g" type="GLubyte"/>
				<parameter name="b" type="GLubyte"/>
				<parameter name="a" type="GLubyte"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4ubVertex2fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="c" type="GLubyte*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4ubVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="r" type="GLubyte"/>
				<parameter name="g" type="GLubyte"/>
				<parameter name="b" type="GLubyte"/>
				<parameter name="a" type="GLubyte"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColor4ubVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="c" type="GLubyte*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorFragmentOp1ATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="dst" type="GLuint"/>
				<parameter name="dstMask" type="GLuint"/>
				<parameter name="dstMod" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg1Rep" type="GLuint"/>
				<parameter name="arg1Mod" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorFragmentOp2ATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="dst" type="GLuint"/>
				<parameter name="dstMask" type="GLuint"/>
				<parameter name="dstMod" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg1Rep" type="GLuint"/>
				<parameter name="arg1Mod" type="GLuint"/>
				<parameter name="arg2" type="GLuint"/>
				<parameter name="arg2Rep" type="GLuint"/>
				<parameter name="arg2Mod" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorFragmentOp3ATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="dst" type="GLuint"/>
				<parameter name="dstMask" type="GLuint"/>
				<parameter name="dstMod" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg1Rep" type="GLuint"/>
				<parameter name="arg1Mod" type="GLuint"/>
				<parameter name="arg2" type="GLuint"/>
				<parameter name="arg2Rep" type="GLuint"/>
				<parameter name="arg2Mod" type="GLuint"/>
				<parameter name="arg3" type="GLuint"/>
				<parameter name="arg3Rep" type="GLuint"/>
				<parameter name="arg3Mod" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorPointervINTEL">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorSubTable">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="start" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorSubTableEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="start" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTable">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="table" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTableEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalFormat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="table" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTableParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTableParameterfvSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTableParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTableParameterivSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glColorTableSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="table" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerInputNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="portion" type="GLenum"/>
				<parameter name="variable" type="GLenum"/>
				<parameter name="input" type="GLenum"/>
				<parameter name="mapping" type="GLenum"/>
				<parameter name="componentUsage" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerOutputNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="portion" type="GLenum"/>
				<parameter name="abOutput" type="GLenum"/>
				<parameter name="cdOutput" type="GLenum"/>
				<parameter name="sumOutput" type="GLenum"/>
				<parameter name="scale" type="GLenum"/>
				<parameter name="bias" type="GLenum"/>
				<parameter name="abDotProduct" type="GLboolean"/>
				<parameter name="cdDotProduct" type="GLboolean"/>
				<parameter name="muxSum" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerParameterfNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerParameteriNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCombinerStageParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexImage1D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexImage1DARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexImage2D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexImage2DARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexImage3D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexImage3DARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexSubImage1D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexSubImage1DARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexSubImage2D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexSubImage2DARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexSubImage3D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCompressedTexSubImage3DARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="imageSize" type="GLsizei"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionFilter1D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="image" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionFilter1DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="image" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionFilter2D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="image" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionFilter2DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="image" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameterf">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameterfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameteri">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameteriEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glConvolutionParameterivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyColorSubTable">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="start" type="GLsizei"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyColorSubTableEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="start" type="GLsizei"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyColorTable">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyColorTableSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyConvolutionFilter1D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyConvolutionFilter1DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyConvolutionFilter2D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyConvolutionFilter2DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyTexImage1DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyTexImage2DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyTexSubImage1DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyTexSubImage2DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyTexSubImage3D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCopyTexSubImage3DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCullParameterdvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCullParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glCurrentPaletteMatrixARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeformSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="mask" type="GLbitfield"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeformationMap3dSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="u1" type="GLdouble"/>
				<parameter name="u2" type="GLdouble"/>
				<parameter name="ustride" type="GLint"/>
				<parameter name="uorder" type="GLint"/>
				<parameter name="v1" type="GLdouble"/>
				<parameter name="v2" type="GLdouble"/>
				<parameter name="vstride" type="GLint"/>
				<parameter name="vorder" type="GLint"/>
				<parameter name="w1" type="GLdouble"/>
				<parameter name="w2" type="GLdouble"/>
				<parameter name="wstride" type="GLint"/>
				<parameter name="worder" type="GLint"/>
				<parameter name="points" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeformationMap3fSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="u1" type="GLfloat"/>
				<parameter name="u2" type="GLfloat"/>
				<parameter name="ustride" type="GLint"/>
				<parameter name="uorder" type="GLint"/>
				<parameter name="v1" type="GLfloat"/>
				<parameter name="v2" type="GLfloat"/>
				<parameter name="vstride" type="GLint"/>
				<parameter name="vorder" type="GLint"/>
				<parameter name="w1" type="GLfloat"/>
				<parameter name="w2" type="GLfloat"/>
				<parameter name="wstride" type="GLint"/>
				<parameter name="worder" type="GLint"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteAsyncMarkersSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="marker" type="GLuint"/>
				<parameter name="range" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteBufferRegion">
			<return-type type="void"/>
			<parameters>
				<parameter name="region" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteBuffersARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="buffers" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteFencesAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="fences" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteFencesNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="fences" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteFragmentShaderATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteOcclusionQueriesNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="ids" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteProgramsARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="programs" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteProgramsNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="programs" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteTexturesEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="textures" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteVertexArraysAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="arrays" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDeleteVertexShaderEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDepthBoundsEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="zmin" type="GLclampd"/>
				<parameter name="zmax" type="GLclampd"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDetailTexFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDisableVariantClientStateEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDisableVertexAttribAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDisableVertexAttribArrayARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawArraysEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawBufferRegion">
			<return-type type="void"/>
			<parameters>
				<parameter name="region" type="GLuint"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="xDest" type="GLint"/>
				<parameter name="yDest" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawBuffersATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="bufs" type="GLenum*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawElementArrayAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawElementArrayATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawElementArrayNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawMeshArraysSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="width" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawRangeElementArrayAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawRangeElementArrayATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawRangeElementArrayNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawRangeElements">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="indices" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glDrawRangeElementsEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="indices" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glEdgeFlagPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="pointer" type="GLboolean*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glEdgeFlagPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLboolean**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glElementPointerAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glElementPointerATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glElementPointerNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glEnableVariantClientStateEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glEnableVertexAttribAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glEnableVertexAttribArrayARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glEndFragmentShaderATI">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glEndOcclusionQueryNV">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glEndSceneEXT">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glEndVertexShaderEXT">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glEvalMapsNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glExecuteProgramNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="id" type="GLuint"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glExtractComponentEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="res" type="GLuint"/>
				<parameter name="src" type="GLuint"/>
				<parameter name="num" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3b">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLbyte"/>
				<parameter name="ny" type="GLbyte"/>
				<parameter name="nz" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3bv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3d">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLdouble"/>
				<parameter name="ny" type="GLdouble"/>
				<parameter name="nz" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3f">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3i">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLint"/>
				<parameter name="ny" type="GLint"/>
				<parameter name="nz" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3s">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLshort"/>
				<parameter name="ny" type="GLshort"/>
				<parameter name="nz" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFacetNormal3sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFinalCombinerInputNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="variable" type="GLenum"/>
				<parameter name="input" type="GLenum"/>
				<parameter name="mapping" type="GLenum"/>
				<parameter name="componentUsage" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFinishAsyncSGIX">
			<return-type type="GLint"/>
			<parameters>
				<parameter name="markerp" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFinishFenceAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFinishFenceNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFinishObjectAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="object" type="GLenum"/>
				<parameter name="name" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFinishTextureSUNX">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glFlushPixelDataRangeNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFlushRasterSGIX">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glFlushStaticDataIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFlushVertexArrayRangeAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="length" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFlushVertexArrayRangeNV">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glFogCoordPointer">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordd">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoorddEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoorddv">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoorddvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordf">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="coord" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordhNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="fog" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogCoordhvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="fog" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFogFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentColorMaterialEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentColorMaterialSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModelfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModelfSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModelfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModelfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModeliEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModeliSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModelivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightModelivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightfSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightiEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightiSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentLightivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialfSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialiEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialiSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFragmentMaterialivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFrameZoomSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glFreeObjectBufferATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenAsyncMarkersSGIX">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="range" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenBuffersARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="buffers" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenFencesAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="fences" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenFencesNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="fences" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenFragmentShadersATI">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="range" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenOcclusionQueriesNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="ids" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenProgramsARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="programs" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenProgramsNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="programs" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenSymbolsEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="datatype" type="GLenum"/>
				<parameter name="storagetype" type="GLenum"/>
				<parameter name="range" type="GLenum"/>
				<parameter name="components" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenTexturesEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="textures" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenVertexArraysAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="arrays" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGenVertexShadersEXT">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="range" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetArrayObjectfvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="array" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetArrayObjectivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="array" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetBufferParameterivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetBufferPointervARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetBufferSubDataARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="offset" type="GLintptrARB"/>
				<parameter name="size" type="GLsizeiptrARB"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTable">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="table" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="data" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableParameterfvSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableParameterivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableParameterivSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetColorTableSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="table" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCombinerInputParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="portion" type="GLenum"/>
				<parameter name="variable" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCombinerInputParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="portion" type="GLenum"/>
				<parameter name="variable" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCombinerOutputParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="portion" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCombinerOutputParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="portion" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCombinerStageParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="stage" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCompressedTexImage">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="img" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetCompressedTexImageARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="img" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetConvolutionFilter">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="image" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetConvolutionFilterEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="image" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetConvolutionParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetConvolutionParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetConvolutionParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetConvolutionParameterivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetDetailTexFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFenceivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFinalCombinerInputParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="variable" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFinalCombinerInputParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="variable" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFogFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentLightfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentLightfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentLightivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentLightivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="light" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentMaterialfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentMaterialfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentMaterialivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetFragmentMaterialivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetHistogram">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="reset" type="GLboolean"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="values" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetHistogramEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="reset" type="GLboolean"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="values" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetHistogramParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetHistogramParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetHistogramParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetHistogramParameterivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetImageTransformParameterfvHP">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetImageTransformParameterivHP">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetInstrumentsSGIX">
			<return-type type="GLint"/>
		</callback>
		<callback name="GdkGLProc_glGetInvariantBooleanvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLboolean*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetInvariantFloatvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetInvariantIntegervEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetListParameterfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="list" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetListParameterivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="list" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetLocalConstantBooleanvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLboolean*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetLocalConstantFloatvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetLocalConstantIntegervEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMapAttribParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMapAttribParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMapControlPointsNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="ustride" type="GLsizei"/>
				<parameter name="vstride" type="GLsizei"/>
				<parameter name="packed" type="GLboolean"/>
				<parameter name="points" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMapParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMapParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMinmax">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="reset" type="GLboolean"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="values" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMinmaxEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="reset" type="GLboolean"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="values" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMinmaxParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMinmaxParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMinmaxParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetMinmaxParameterivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetObjectBufferfvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetObjectBufferivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetOcclusionQueryivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetOcclusionQueryuivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetPixelTexGenParameterfvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetPixelTexGenParameterivSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetPointervEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramEnvParameterdvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramEnvParameterfvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramLocalParameterdvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramLocalParameterfvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramNamedParameterdvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="name" type="GLubyte*"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramNamedParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="name" type="GLubyte*"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramParameterdvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramStringARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="string" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramStringNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="program" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetProgramivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetSeparableFilter">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="row" type="GLvoid*"/>
				<parameter name="column" type="GLvoid*"/>
				<parameter name="span" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetSeparableFilterEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="row" type="GLvoid*"/>
				<parameter name="column" type="GLvoid*"/>
				<parameter name="span" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetSharpenTexFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetTexBumpParameterfvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetTexBumpParameterivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetTexFilterFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="filter" type="GLenum"/>
				<parameter name="weights" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetTexParameterPointervAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetTrackMatrixivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="address" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVariantArrayObjectfvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVariantArrayObjectivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVariantBooleanvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLboolean*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVariantFloatvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVariantIntegervEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVariantPointervEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="value" type="GLenum"/>
				<parameter name="data" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribArrayObjectfvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribArrayObjectivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribPointervARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribPointervNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribdvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribdvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribfvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGetVertexAttribivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactorbSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactordSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactorfSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactoriSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactorsSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactorubSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLubyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactoruiSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glGlobalAlphaFactorusSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLushort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glHintPGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="mode" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glHistogram">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="sink" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glHistogramEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="sink" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIglooInterfaceSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glImageTransformParameterfHP">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glImageTransformParameterfvHP">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glImageTransformParameteriHP">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glImageTransformParameterivHP">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIndexFuncEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="func" type="GLenum"/>
				<parameter name="ref" type="GLclampf"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIndexMaterialEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIndexPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIndexPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glInsertComponentEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="res" type="GLuint"/>
				<parameter name="src" type="GLuint"/>
				<parameter name="num" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glInstrumentsBufferSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLsizei"/>
				<parameter name="buffer" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glInterleavedTextureCoordSetsEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsAsyncMarkerSGIX">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="marker" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsBufferARB">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsFenceAPPLE">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsFenceNV">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsObjectBufferATI">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsOcclusionQueryNV">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsProgramARB">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="program" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsProgramNV">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsTextureEXT">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="texture" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsVariantEnabledEXT">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="cap" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsVertexArrayAPPLE">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="array" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glIsVertexAttribEnabledAPPLE">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLightEnviEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLightEnviSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glListParameterfSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="list" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glListParameterfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="list" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glListParameteriSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="list" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glListParameterivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="list" type="GLuint"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLoadIdentityDeformationMapSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="mask" type="GLbitfield"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLoadProgramNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="program" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLoadTransposeMatrixd">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLoadTransposeMatrixdARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLoadTransposeMatrixf">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLoadTransposeMatrixfARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glLockArraysEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="first" type="GLint"/>
				<parameter name="count" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapBufferARB">
			<return-type type="GLvoid*"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="access" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapControlPointsNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="ustride" type="GLsizei"/>
				<parameter name="vstride" type="GLsizei"/>
				<parameter name="uorder" type="GLint"/>
				<parameter name="vorder" type="GLint"/>
				<parameter name="packed" type="GLboolean"/>
				<parameter name="points" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapObjectBufferATI">
			<return-type type="GLvoid*"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapParameterfvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapVertexAttrib1dAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="size" type="GLuint"/>
				<parameter name="u1" type="GLdouble"/>
				<parameter name="u2" type="GLdouble"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="order" type="GLint"/>
				<parameter name="points" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapVertexAttrib1fAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="size" type="GLuint"/>
				<parameter name="u1" type="GLfloat"/>
				<parameter name="u2" type="GLfloat"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="order" type="GLint"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapVertexAttrib2dAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="size" type="GLuint"/>
				<parameter name="u1" type="GLdouble"/>
				<parameter name="u2" type="GLdouble"/>
				<parameter name="ustride" type="GLint"/>
				<parameter name="uorder" type="GLint"/>
				<parameter name="v1" type="GLdouble"/>
				<parameter name="v2" type="GLdouble"/>
				<parameter name="vstride" type="GLint"/>
				<parameter name="vorder" type="GLint"/>
				<parameter name="points" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMapVertexAttrib2fAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="size" type="GLuint"/>
				<parameter name="u1" type="GLfloat"/>
				<parameter name="u2" type="GLfloat"/>
				<parameter name="ustride" type="GLint"/>
				<parameter name="uorder" type="GLint"/>
				<parameter name="v1" type="GLfloat"/>
				<parameter name="v2" type="GLfloat"/>
				<parameter name="vstride" type="GLint"/>
				<parameter name="vorder" type="GLint"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMatrixIndexPointerARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMatrixIndexubvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="indices" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMatrixIndexuivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="indices" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMatrixIndexusvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="indices" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMinmax">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="sink" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMinmaxEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="sink" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultTransposeMatrixd">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultTransposeMatrixdARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultTransposeMatrixf">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultTransposeMatrixfARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="m" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawArrays">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawArraysEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawArraysSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawElementArrayAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawElementArrayNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawElements">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="indices" type="GLvoid**"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawElementsEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="indices" type="GLvoid**"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawElementsSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="indices" type="GLvoid**"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawRangeElementArrayAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiDrawRangeElementArrayNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="start" type="GLuint"/>
				<parameter name="end" type="GLuint"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiModeDrawArraysIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
				<parameter name="first" type="GLint*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="primcount" type="GLsizei"/>
				<parameter name="modestride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiModeDrawElementsIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum*"/>
				<parameter name="count" type="GLsizei*"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="indices" type="GLvoid**"/>
				<parameter name="primcount" type="GLsizei"/>
				<parameter name="modestride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1d">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1dvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1f">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1fvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1i">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1iARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1iSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1ivSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1s">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1sSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord1svSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2d">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2dvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2f">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2fvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2i">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2iARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2iSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2ivSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2s">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2sSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord2svSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3d">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3dvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3f">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3fvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
				<parameter name="r" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3i">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3iARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3iSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3ivSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3s">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3sSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord3svSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4d">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
				<parameter name="q" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
				<parameter name="q" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
				<parameter name="q" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLdouble"/>
				<parameter name="t" type="GLdouble"/>
				<parameter name="r" type="GLdouble"/>
				<parameter name="q" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4dvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4f">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="q" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="q" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="q" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="q" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4fvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
				<parameter name="r" type="GLhalfNV"/>
				<parameter name="q" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4i">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
				<parameter name="q" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4iARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
				<parameter name="q" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
				<parameter name="q" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4iSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLint"/>
				<parameter name="t" type="GLint"/>
				<parameter name="r" type="GLint"/>
				<parameter name="q" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4ivSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4s">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
				<parameter name="q" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
				<parameter name="q" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
				<parameter name="q" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4sSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="s" type="GLshort"/>
				<parameter name="t" type="GLshort"/>
				<parameter name="r" type="GLshort"/>
				<parameter name="q" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoord4svSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glMultiTexCoordPointerSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="void*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNewBufferRegion">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="region" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNewObjectBufferATI">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="size" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
				<parameter name="usage" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormal3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLhalfNV"/>
				<parameter name="ny" type="GLhalfNV"/>
				<parameter name="nz" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormal3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalPointervINTEL">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3bATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="nx" type="GLbyte"/>
				<parameter name="ny" type="GLbyte"/>
				<parameter name="nz" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3bvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3dATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="nx" type="GLdouble"/>
				<parameter name="ny" type="GLdouble"/>
				<parameter name="nz" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3dvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3fATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3fvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3iATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="nx" type="GLint"/>
				<parameter name="ny" type="GLint"/>
				<parameter name="nz" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3ivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3sATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="nx" type="GLshort"/>
				<parameter name="ny" type="GLshort"/>
				<parameter name="nz" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glNormalStream3svATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPNTrianglesfATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPNTrianglesfATIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPNTrianglesiATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPNTrianglesiATIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPassTexCoordATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="dst" type="GLuint"/>
				<parameter name="coord" type="GLuint"/>
				<parameter name="swizzle" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelDataRangeNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="length" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTexGenParameterfSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTexGenParameterfvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTexGenParameteriSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTexGenParameterivSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTexGenSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTransformParameterfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTransformParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTransformParameteriEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPixelTransformParameterivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterf">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfv">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterfvSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameteri">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameteriNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameteriv">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPointParameterivNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPollAsyncSGIX">
			<return-type type="GLint"/>
			<parameters>
				<parameter name="markerp" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPollInstrumentsSGIX">
			<return-type type="GLint"/>
			<parameters>
				<parameter name="marker_p" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPolygonOffsetEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="factor" type="GLfloat"/>
				<parameter name="bias" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPrimitiveRestartIndexNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glPrimitiveRestartNV">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glPrioritizeTexturesEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="textures" type="GLuint*"/>
				<parameter name="priorities" type="GLclampf*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramEnvParameter4dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramEnvParameter4dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramEnvParameter4fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramEnvParameter4fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramLocalParameter4dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramLocalParameter4dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramLocalParameter4fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramLocalParameter4fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramNamedParameter4dNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="name" type="GLubyte*"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramNamedParameter4dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="name" type="GLubyte*"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramNamedParameter4fNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="name" type="GLubyte*"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramNamedParameter4fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="name" type="GLubyte*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramParameter4dNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramParameter4dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramParameter4fNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramParameter4fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramParameters4dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramParameters4fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glProgramStringARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="len" type="GLsizei"/>
				<parameter name="string" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReadBufferRegion">
			<return-type type="void"/>
			<parameters>
				<parameter name="region" type="GLuint"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReadInstrumentsSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="marker" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReferencePlaneSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="equation" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodePointerSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeubSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="code" type="GLubyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeubvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="code" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiColor3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiColor3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiColor4fNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="a" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiColor4fNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiColor4ubVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="r" type="GLubyte"/>
				<parameter name="g" type="GLubyte"/>
				<parameter name="b" type="GLubyte"/>
				<parameter name="a" type="GLubyte"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiColor4ubVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="c" type="GLubyte*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="code" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="a" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiTexCoord2fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiTexCoord2fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuiVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="rc" type="GLuint*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeuivSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="code" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeusSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="code" type="GLushort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glReplacementCodeusvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="code" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glRequestResidentProgramsNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="n" type="GLsizei"/>
				<parameter name="programs" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glResetHistogram">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glResetHistogramEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glResetMinmax">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glResetMinmaxEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glResizeBuffersMESA">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glSampleCoverage">
			<return-type type="void"/>
			<parameters>
				<parameter name="value" type="GLclampf"/>
				<parameter name="invert" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSampleCoverageARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="value" type="GLclampf"/>
				<parameter name="invert" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSampleMapATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="dst" type="GLuint"/>
				<parameter name="interp" type="GLuint"/>
				<parameter name="swizzle" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSampleMaskEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="value" type="GLclampf"/>
				<parameter name="invert" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSampleMaskSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="value" type="GLclampf"/>
				<parameter name="invert" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSamplePatternEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pattern" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSamplePatternSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="pattern" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3b">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLbyte"/>
				<parameter name="green" type="GLbyte"/>
				<parameter name="blue" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3bEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLbyte"/>
				<parameter name="green" type="GLbyte"/>
				<parameter name="blue" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3bv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3bvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3d">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLdouble"/>
				<parameter name="green" type="GLdouble"/>
				<parameter name="blue" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLdouble"/>
				<parameter name="green" type="GLdouble"/>
				<parameter name="blue" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3f">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLfloat"/>
				<parameter name="green" type="GLfloat"/>
				<parameter name="blue" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLfloat"/>
				<parameter name="green" type="GLfloat"/>
				<parameter name="blue" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLhalfNV"/>
				<parameter name="green" type="GLhalfNV"/>
				<parameter name="blue" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3i">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLint"/>
				<parameter name="green" type="GLint"/>
				<parameter name="blue" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLint"/>
				<parameter name="green" type="GLint"/>
				<parameter name="blue" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3s">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLshort"/>
				<parameter name="green" type="GLshort"/>
				<parameter name="blue" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLshort"/>
				<parameter name="green" type="GLshort"/>
				<parameter name="blue" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3ub">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLubyte"/>
				<parameter name="green" type="GLubyte"/>
				<parameter name="blue" type="GLubyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3ubEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLubyte"/>
				<parameter name="green" type="GLubyte"/>
				<parameter name="blue" type="GLubyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3ubv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3ubvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3ui">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLuint"/>
				<parameter name="green" type="GLuint"/>
				<parameter name="blue" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3uiEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLuint"/>
				<parameter name="green" type="GLuint"/>
				<parameter name="blue" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3uiv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3uivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3us">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLushort"/>
				<parameter name="green" type="GLushort"/>
				<parameter name="blue" type="GLushort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3usEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLushort"/>
				<parameter name="green" type="GLushort"/>
				<parameter name="blue" type="GLushort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3usv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColor3usvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColorPointer">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColorPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSecondaryColorPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSelectTextureCoordSetEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSelectTextureCoordSetSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSelectTextureEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSelectTextureSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSelectTextureTransformEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSeparableFilter2D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="row" type="GLvoid*"/>
				<parameter name="column" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSeparableFilter2DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="row" type="GLvoid*"/>
				<parameter name="column" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSetFenceAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSetFenceNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
				<parameter name="condition" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSetFragmentShaderConstantATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="dst" type="GLuint"/>
				<parameter name="value" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSetInvariantEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="addr" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSetLocalConstantEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="addr" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glShaderOp1EXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="res" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glShaderOp2EXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="res" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg2" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glShaderOp3EXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="op" type="GLenum"/>
				<parameter name="res" type="GLuint"/>
				<parameter name="arg1" type="GLuint"/>
				<parameter name="arg2" type="GLuint"/>
				<parameter name="arg3" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSharpenTexFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="points" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSpriteParameterfSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSpriteParameterfvSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSpriteParameteriSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSpriteParameterivSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="params" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glStartInstrumentsSGIX">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glStencilFuncSeparateATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="frontfunc" type="GLenum"/>
				<parameter name="backfunc" type="GLenum"/>
				<parameter name="ref" type="GLint"/>
				<parameter name="mask" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glStencilOpSeparateATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="sfail" type="GLenum"/>
				<parameter name="dpfail" type="GLenum"/>
				<parameter name="dppass" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glStopInstrumentsSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="marker" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glSwizzleEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="res" type="GLuint"/>
				<parameter name="in" type="GLuint"/>
				<parameter name="outX" type="GLenum"/>
				<parameter name="outY" type="GLenum"/>
				<parameter name="outZ" type="GLenum"/>
				<parameter name="outW" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTagSampleBufferSGIX">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glTangent3bEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="tx" type="GLbyte"/>
				<parameter name="ty" type="GLbyte"/>
				<parameter name="tz" type="GLbyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3bvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3dEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="tx" type="GLdouble"/>
				<parameter name="ty" type="GLdouble"/>
				<parameter name="tz" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3dvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3fEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="tx" type="GLfloat"/>
				<parameter name="ty" type="GLfloat"/>
				<parameter name="tz" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3fvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3iEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="tx" type="GLint"/>
				<parameter name="ty" type="GLint"/>
				<parameter name="tz" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3ivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3sEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="tx" type="GLshort"/>
				<parameter name="ty" type="GLshort"/>
				<parameter name="tz" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangent3svEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTangentPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTbufferMask3DFX">
			<return-type type="void"/>
			<parameters>
				<parameter name="mask" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTestFenceAPPLE">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTestFenceNV">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="fence" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTestObjectAPPLE">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="object" type="GLenum"/>
				<parameter name="name" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexBumpParameterfvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexBumpParameterivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord1hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord1hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fColor3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fColor3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fColor4fNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="a" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fColor4fNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fColor4ubVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="r" type="GLubyte"/>
				<parameter name="g" type="GLubyte"/>
				<parameter name="b" type="GLubyte"/>
				<parameter name="a" type="GLubyte"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fColor4ubVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="c" type="GLubyte*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fNormal3fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fNormal3fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fVertex3fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2fVertex3fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord2hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
				<parameter name="r" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord4fColor4fNormal3fVertex4fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="p" type="GLfloat"/>
				<parameter name="q" type="GLfloat"/>
				<parameter name="r" type="GLfloat"/>
				<parameter name="g" type="GLfloat"/>
				<parameter name="b" type="GLfloat"/>
				<parameter name="a" type="GLfloat"/>
				<parameter name="nx" type="GLfloat"/>
				<parameter name="ny" type="GLfloat"/>
				<parameter name="nz" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord4fColor4fNormal3fVertex4fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="c" type="GLfloat*"/>
				<parameter name="n" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord4fVertex4fSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLfloat"/>
				<parameter name="t" type="GLfloat"/>
				<parameter name="p" type="GLfloat"/>
				<parameter name="q" type="GLfloat"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord4fVertex4fvSUN">
			<return-type type="void"/>
			<parameters>
				<parameter name="tc" type="GLfloat*"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord4hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
				<parameter name="r" type="GLhalfNV"/>
				<parameter name="q" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoord4hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoordPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoordPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexCoordPointervINTEL">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexFilterFuncSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="filter" type="GLenum"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="weights" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexImage3D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexImage3DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexImage4DSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="internalformat" type="GLenum"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="size4d" type="GLsizei"/>
				<parameter name="border" type="GLint"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexSubImage1DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexSubImage2DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexSubImage3D">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexSubImage3DEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTexSubImage4DSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="level" type="GLint"/>
				<parameter name="xoffset" type="GLint"/>
				<parameter name="yoffset" type="GLint"/>
				<parameter name="zoffset" type="GLint"/>
				<parameter name="woffset" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
				<parameter name="depth" type="GLsizei"/>
				<parameter name="size4d" type="GLsizei"/>
				<parameter name="format" type="GLenum"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pixels" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTextureColorMaskSGIS">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLboolean"/>
				<parameter name="green" type="GLboolean"/>
				<parameter name="blue" type="GLboolean"/>
				<parameter name="alpha" type="GLboolean"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTextureFogSGIX">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTextureLightEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTextureMaterialEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="face" type="GLenum"/>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTextureNormalEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="mode" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTextureRangeAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="length" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glTrackMatrixNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
				<parameter name="address" type="GLuint"/>
				<parameter name="matrix" type="GLenum"/>
				<parameter name="transform" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glUnlockArraysEXT">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glUnmapBufferARB">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="target" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glUnmapObjectBufferATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glUpdateObjectBufferATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="buffer" type="GLuint"/>
				<parameter name="offset" type="GLuint"/>
				<parameter name="size" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
				<parameter name="preserve" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glValidBackBufferHint">
			<return-type type="GLboolean"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="width" type="GLsizei"/>
				<parameter name="height" type="GLsizei"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantArrayObjectATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="buffer" type="GLuint"/>
				<parameter name="offset" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLuint"/>
				<parameter name="addr" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantbvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantdvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantsvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantubvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantuivEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVariantusvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="id" type="GLuint"/>
				<parameter name="addr" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertex2hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertex2hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertex3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
				<parameter name="z" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertex3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertex4hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
				<parameter name="z" type="GLhalfNV"/>
				<parameter name="w" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertex4hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexArrayParameteriAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexArrayRangeAPPLE">
			<return-type type="void"/>
			<parameters>
				<parameter name="length" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexArrayRangeNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="length" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1dNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1fNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1sNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib1svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2dNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2fNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2sNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib2svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3dNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3fNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
				<parameter name="z" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3sNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib3svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NbvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NsvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NubARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLubyte"/>
				<parameter name="y" type="GLubyte"/>
				<parameter name="z" type="GLubyte"/>
				<parameter name="w" type="GLubyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NubvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NuivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4NusvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4bvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4dNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4fNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4hNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
				<parameter name="z" type="GLhalfNV"/>
				<parameter name="w" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
				<parameter name="w" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4sNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
				<parameter name="w" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4ubNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="x" type="GLubyte"/>
				<parameter name="y" type="GLubyte"/>
				<parameter name="z" type="GLubyte"/>
				<parameter name="w" type="GLubyte"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4ubvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4ubvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4uivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttrib4usvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="v" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribArrayObjectATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="normalized" type="GLboolean"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="buffer" type="GLuint"/>
				<parameter name="offset" type="GLuint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribPointerARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="normalized" type="GLboolean"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribPointerNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="fsize" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs1dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs1fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs1hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs1svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs2dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs2fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs2hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs2svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs3dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs3fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs3hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs3svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs4dvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs4fvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs4hvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="n" type="GLsizei"/>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs4svNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexAttribs4ubvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="index" type="GLuint"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="v" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexBlendARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="count" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexBlendEnvfATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexBlendEnviATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="pname" type="GLenum"/>
				<parameter name="param" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="count" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexPointerListIBM">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLint"/>
				<parameter name="pointer" type="GLvoid**"/>
				<parameter name="ptrstride" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexPointervINTEL">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="pointer" type="GLvoid**"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1dATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1dvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1fATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1fvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1iATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1ivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1sATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream1svATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2dATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2dvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2fATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2fvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2iATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2ivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2sATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream2svATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3dATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3dvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3fATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3fvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3iATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="z" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3ivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3sATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream3svATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4dATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4dvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4fATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4fvATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4iATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="z" type="GLint"/>
				<parameter name="w" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4ivATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4sATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
				<parameter name="w" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexStream4svATI">
			<return-type type="void"/>
			<parameters>
				<parameter name="stream" type="GLenum"/>
				<parameter name="coords" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexWeightPointerEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLsizei"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexWeightfEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="weight" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexWeightfvEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="weight" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexWeighthNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="weight" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glVertexWeighthvNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="weight" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightPointerARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="type" type="GLenum"/>
				<parameter name="stride" type="GLsizei"/>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightbvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLbyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightdvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightfvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightsvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightubvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLubyte*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightuivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLuint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWeightusvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="size" type="GLint"/>
				<parameter name="weights" type="GLushort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowBackBufferHint">
			<return-type type="void"/>
		</callback>
		<callback name="GdkGLProc_glWindowPos2d">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2dMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2dvMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2f">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2fMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2fvMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2i">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2iARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2iMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2ivMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2s">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2sMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos2svMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3d">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3dARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3dMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3dv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3dvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3dvMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3f">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3fARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3fMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3fv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3fvARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3fvMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3i">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="z" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3iARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="z" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3iMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="z" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3iv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3ivARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3ivMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3s">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3sARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3sMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3sv">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3svARB">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos3svMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4dMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLdouble"/>
				<parameter name="y" type="GLdouble"/>
				<parameter name="z" type="GLdouble"/>
				<parameter name="w" type="GLdouble"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4dvMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLdouble*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4fMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLfloat"/>
				<parameter name="y" type="GLfloat"/>
				<parameter name="z" type="GLfloat"/>
				<parameter name="w" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4fvMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLfloat*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4iMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLint"/>
				<parameter name="y" type="GLint"/>
				<parameter name="z" type="GLint"/>
				<parameter name="w" type="GLint"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4ivMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLint*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4sMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLshort"/>
				<parameter name="y" type="GLshort"/>
				<parameter name="z" type="GLshort"/>
				<parameter name="w" type="GLshort"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWindowPos4svMESA">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLshort*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glWriteMaskEXT">
			<return-type type="void"/>
			<parameters>
				<parameter name="res" type="GLuint"/>
				<parameter name="in" type="GLuint"/>
				<parameter name="outX" type="GLenum"/>
				<parameter name="outY" type="GLenum"/>
				<parameter name="outZ" type="GLenum"/>
				<parameter name="outW" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXAllocateMemoryNV">
			<return-type type="void*"/>
			<parameters>
				<parameter name="size" type="GLsizei"/>
				<parameter name="readfreq" type="GLfloat"/>
				<parameter name="writefreq" type="GLfloat"/>
				<parameter name="priority" type="GLfloat"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXBindChannelToWindowSGIX">
			<return-type type="int"/>
			<parameters>
				<parameter name="display" type="Display*"/>
				<parameter name="screen" type="int"/>
				<parameter name="channel" type="int"/>
				<parameter name="window" type="Window"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXChannelRectSGIX">
			<return-type type="int"/>
			<parameters>
				<parameter name="display" type="Display*"/>
				<parameter name="screen" type="int"/>
				<parameter name="channel" type="int"/>
				<parameter name="x" type="int"/>
				<parameter name="y" type="int"/>
				<parameter name="w" type="int"/>
				<parameter name="h" type="int"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXChannelRectSyncSGIX">
			<return-type type="int"/>
			<parameters>
				<parameter name="display" type="Display*"/>
				<parameter name="screen" type="int"/>
				<parameter name="channel" type="int"/>
				<parameter name="synctype" type="GLenum"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXCushionSGI">
			<return-type type="void"/>
			<parameters>
				<parameter name="dpy" type="Display*"/>
				<parameter name="window" type="Window"/>
				<parameter name="cushion" type="float"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXFreeMemoryNV">
			<return-type type="void"/>
			<parameters>
				<parameter name="pointer" type="void*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXGetAGPOffsetMESA">
			<return-type type="GLuint"/>
			<parameters>
				<parameter name="pointer" type="GLvoid*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXGetCurrentDisplay">
			<return-type type="Display*"/>
		</callback>
		<callback name="GdkGLProc_glXGetCurrentDisplayEXT">
			<return-type type="Display*"/>
		</callback>
		<callback name="GdkGLProc_glXGetTransparentIndexSUN">
			<return-type type="int"/>
			<parameters>
				<parameter name="dpy" type="Display*"/>
				<parameter name="overlay" type="Window"/>
				<parameter name="underlay" type="Window"/>
				<parameter name="pTransparentIndex" type="long*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXGetVideoSyncSGI">
			<return-type type="int"/>
			<parameters>
				<parameter name="count" type="unsigned*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXQueryChannelDeltasSGIX">
			<return-type type="int"/>
			<parameters>
				<parameter name="display" type="Display*"/>
				<parameter name="screen" type="int"/>
				<parameter name="channel" type="int"/>
				<parameter name="x" type="int*"/>
				<parameter name="y" type="int*"/>
				<parameter name="w" type="int*"/>
				<parameter name="h" type="int*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXQueryChannelRectSGIX">
			<return-type type="int"/>
			<parameters>
				<parameter name="display" type="Display*"/>
				<parameter name="screen" type="int"/>
				<parameter name="channel" type="int"/>
				<parameter name="dx" type="int*"/>
				<parameter name="dy" type="int*"/>
				<parameter name="dw" type="int*"/>
				<parameter name="dh" type="int*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXQueryMaxSwapBarriersSGIX">
			<return-type type="int"/>
			<parameters>
				<parameter name="dpy" type="Display*"/>
				<parameter name="screen" type="int"/>
				<parameter name="max" type="int*"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXSet3DfxModeMESA">
			<return-type type="int"/>
			<parameters>
				<parameter name="mode" type="int"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXSwapIntervalSGI">
			<return-type type="int"/>
			<parameters>
				<parameter name="interval" type="int"/>
			</parameters>
		</callback>
		<callback name="GdkGLProc_glXWaitVideoSyncSGI">
			<return-type type="int"/>
			<parameters>
				<parameter name="divisor" type="int"/>
				<parameter name="remainder" type="int"/>
				<parameter name="count" type="unsigned*"/>
			</parameters>
		</callback>
		<callback name="PFNGLBEGINFRAGMENTSHADERATIPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLBEGINSCENEEXTPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLBEGINVERTEXSHADEREXTPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLCOLOR3HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLhalfNV"/>
				<parameter name="green" type="GLhalfNV"/>
				<parameter name="blue" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLCOLOR3HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLCOLOR4HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLhalfNV"/>
				<parameter name="green" type="GLhalfNV"/>
				<parameter name="blue" type="GLhalfNV"/>
				<parameter name="alpha" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLCOLOR4HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLENDFRAGMENTSHADERATIPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLENDOCCLUSIONQUERYNVPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLENDSCENEEXTPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLENDVERTEXSHADEREXTPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLFINISHTEXTURESUNXPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLFLUSHRASTERSGIXPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLFLUSHVERTEXARRAYRANGENVPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLFOGCOORDHNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="fog" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLFOGCOORDHVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="fog" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLNORMAL3HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="nx" type="GLhalfNV"/>
				<parameter name="ny" type="GLhalfNV"/>
				<parameter name="nz" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLNORMAL3HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLPRIMITIVERESTARTNVPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLRESIZEBUFFERSMESAPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLSECONDARYCOLOR3HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="red" type="GLhalfNV"/>
				<parameter name="green" type="GLhalfNV"/>
				<parameter name="blue" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLSECONDARYCOLOR3HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLSTARTINSTRUMENTSSGIXPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLTAGSAMPLEBUFFERSGIXPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLTEXCOORD1HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD1HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD2HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD2HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD3HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
				<parameter name="r" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD3HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD4HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="s" type="GLhalfNV"/>
				<parameter name="t" type="GLhalfNV"/>
				<parameter name="r" type="GLhalfNV"/>
				<parameter name="q" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLTEXCOORD4HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLUNLOCKARRAYSEXTPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLVERTEX2HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEX2HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEX3HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
				<parameter name="z" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEX3HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEX4HNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="x" type="GLhalfNV"/>
				<parameter name="y" type="GLhalfNV"/>
				<parameter name="z" type="GLhalfNV"/>
				<parameter name="w" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEX4HVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="v" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEXWEIGHTHNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="weight" type="GLhalfNV"/>
			</parameters>
		</callback>
		<callback name="PFNGLVERTEXWEIGHTHVNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="weight" type="GLhalfNV*"/>
			</parameters>
		</callback>
		<callback name="PFNGLWINDOWBACKBUFFERHINTPROC">
			<return-type type="void"/>
		</callback>
		<callback name="PFNGLXFREEMEMORYNVPROC">
			<return-type type="void"/>
			<parameters>
				<parameter name="pointer" type="void*"/>
			</parameters>
		</callback>
		<callback name="PFNGLXGETVIDEOSYNCSGIPROC">
			<return-type type="int"/>
			<parameters>
				<parameter name="count" type="unsigned*"/>
			</parameters>
		</callback>
		<callback name="PFNGLXSWAPINTERVALSGIPROC">
			<return-type type="int"/>
			<parameters>
				<parameter name="interval" type="int"/>
			</parameters>
		</callback>
		<callback name="PFNGLXWAITVIDEOSYNCSGIPROC">
			<return-type type="int"/>
			<parameters>
				<parameter name="divisor" type="int"/>
				<parameter name="remainder" type="int"/>
				<parameter name="count" type="unsigned*"/>
			</parameters>
		</callback>
		<struct name="GLXFBConfigSGIX">
		</struct>
		<struct name="GLhalfNV">
		</struct>
		<struct name="GLintptrARB">
		</struct>
		<struct name="GLsizeiptrARB">
		</struct>
		<struct name="GdkGL_GLX_MESA_agp_offset">
			<field name="glXGetAGPOffsetMESA" type="GdkGLProc_glXGetAGPOffsetMESA"/>
		</struct>
		<struct name="GdkGL_GLX_MESA_set_3dfx_mode">
			<field name="glXSet3DfxModeMESA" type="GdkGLProc_glXSet3DfxModeMESA"/>
		</struct>
		<struct name="GdkGL_GLX_NV_vertex_array_range">
			<field name="glXAllocateMemoryNV" type="GdkGLProc_glXAllocateMemoryNV"/>
			<field name="glXFreeMemoryNV" type="GdkGLProc_glXFreeMemoryNV"/>
		</struct>
		<struct name="GdkGL_GLX_SGIX_pbuffer">
		</struct>
		<struct name="GdkGL_GLX_SGIX_video_resize">
			<field name="glXBindChannelToWindowSGIX" type="GdkGLProc_glXBindChannelToWindowSGIX"/>
			<field name="glXChannelRectSGIX" type="GdkGLProc_glXChannelRectSGIX"/>
			<field name="glXQueryChannelRectSGIX" type="GdkGLProc_glXQueryChannelRectSGIX"/>
			<field name="glXQueryChannelDeltasSGIX" type="GdkGLProc_glXQueryChannelDeltasSGIX"/>
			<field name="glXChannelRectSyncSGIX" type="GdkGLProc_glXChannelRectSyncSGIX"/>
		</struct>
		<struct name="GdkGL_GLX_SGI_cushion">
			<field name="glXCushionSGI" type="GdkGLProc_glXCushionSGI"/>
		</struct>
		<struct name="GdkGL_GLX_SGI_swap_control">
			<field name="glXSwapIntervalSGI" type="GdkGLProc_glXSwapIntervalSGI"/>
		</struct>
		<struct name="GdkGL_GLX_SGI_video_sync">
			<field name="glXGetVideoSyncSGI" type="GdkGLProc_glXGetVideoSyncSGI"/>
			<field name="glXWaitVideoSyncSGI" type="GdkGLProc_glXWaitVideoSyncSGI"/>
		</struct>
		<struct name="GdkGL_GLX_SUN_get_transparent_index">
			<field name="glXGetTransparentIndexSUN" type="GdkGLProc_glXGetTransparentIndexSUN"/>
		</struct>
		<struct name="GdkGL_GL_3DFX_tbuffer">
			<field name="glTbufferMask3DFX" type="GdkGLProc_glTbufferMask3DFX"/>
		</struct>
		<struct name="GdkGL_GL_APPLE_element_array">
			<field name="glElementPointerAPPLE" type="GdkGLProc_glElementPointerAPPLE"/>
			<field name="glDrawElementArrayAPPLE" type="GdkGLProc_glDrawElementArrayAPPLE"/>
			<field name="glDrawRangeElementArrayAPPLE" type="GdkGLProc_glDrawRangeElementArrayAPPLE"/>
			<field name="glMultiDrawElementArrayAPPLE" type="GdkGLProc_glMultiDrawElementArrayAPPLE"/>
			<field name="glMultiDrawRangeElementArrayAPPLE" type="GdkGLProc_glMultiDrawRangeElementArrayAPPLE"/>
		</struct>
		<struct name="GdkGL_GL_APPLE_fence">
			<field name="glGenFencesAPPLE" type="GdkGLProc_glGenFencesAPPLE"/>
			<field name="glDeleteFencesAPPLE" type="GdkGLProc_glDeleteFencesAPPLE"/>
			<field name="glSetFenceAPPLE" type="GdkGLProc_glSetFenceAPPLE"/>
			<field name="glIsFenceAPPLE" type="GdkGLProc_glIsFenceAPPLE"/>
			<field name="glTestFenceAPPLE" type="GdkGLProc_glTestFenceAPPLE"/>
			<field name="glFinishFenceAPPLE" type="GdkGLProc_glFinishFenceAPPLE"/>
			<field name="glTestObjectAPPLE" type="GdkGLProc_glTestObjectAPPLE"/>
			<field name="glFinishObjectAPPLE" type="GdkGLProc_glFinishObjectAPPLE"/>
		</struct>
		<struct name="GdkGL_GL_APPLE_texture_range">
			<field name="glTextureRangeAPPLE" type="GdkGLProc_glTextureRangeAPPLE"/>
			<field name="glGetTexParameterPointervAPPLE" type="GdkGLProc_glGetTexParameterPointervAPPLE"/>
		</struct>
		<struct name="GdkGL_GL_APPLE_vertex_array_object">
			<field name="glBindVertexArrayAPPLE" type="GdkGLProc_glBindVertexArrayAPPLE"/>
			<field name="glDeleteVertexArraysAPPLE" type="GdkGLProc_glDeleteVertexArraysAPPLE"/>
			<field name="glGenVertexArraysAPPLE" type="GdkGLProc_glGenVertexArraysAPPLE"/>
			<field name="glIsVertexArrayAPPLE" type="GdkGLProc_glIsVertexArrayAPPLE"/>
		</struct>
		<struct name="GdkGL_GL_APPLE_vertex_array_range">
			<field name="glVertexArrayRangeAPPLE" type="GdkGLProc_glVertexArrayRangeAPPLE"/>
			<field name="glFlushVertexArrayRangeAPPLE" type="GdkGLProc_glFlushVertexArrayRangeAPPLE"/>
			<field name="glVertexArrayParameteriAPPLE" type="GdkGLProc_glVertexArrayParameteriAPPLE"/>
		</struct>
		<struct name="GdkGL_GL_APPLE_vertex_program_evaluators">
			<field name="glEnableVertexAttribAPPLE" type="GdkGLProc_glEnableVertexAttribAPPLE"/>
			<field name="glDisableVertexAttribAPPLE" type="GdkGLProc_glDisableVertexAttribAPPLE"/>
			<field name="glIsVertexAttribEnabledAPPLE" type="GdkGLProc_glIsVertexAttribEnabledAPPLE"/>
			<field name="glMapVertexAttrib1dAPPLE" type="GdkGLProc_glMapVertexAttrib1dAPPLE"/>
			<field name="glMapVertexAttrib1fAPPLE" type="GdkGLProc_glMapVertexAttrib1fAPPLE"/>
			<field name="glMapVertexAttrib2dAPPLE" type="GdkGLProc_glMapVertexAttrib2dAPPLE"/>
			<field name="glMapVertexAttrib2fAPPLE" type="GdkGLProc_glMapVertexAttrib2fAPPLE"/>
		</struct>
		<struct name="GdkGL_GL_ARB_matrix_palette">
			<field name="glCurrentPaletteMatrixARB" type="GdkGLProc_glCurrentPaletteMatrixARB"/>
			<field name="glMatrixIndexubvARB" type="GdkGLProc_glMatrixIndexubvARB"/>
			<field name="glMatrixIndexusvARB" type="GdkGLProc_glMatrixIndexusvARB"/>
			<field name="glMatrixIndexuivARB" type="GdkGLProc_glMatrixIndexuivARB"/>
			<field name="glMatrixIndexPointerARB" type="GdkGLProc_glMatrixIndexPointerARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_multisample">
			<field name="glSampleCoverageARB" type="GdkGLProc_glSampleCoverageARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_multitexture">
			<field name="glActiveTextureARB" type="GdkGLProc_glActiveTextureARB"/>
			<field name="glClientActiveTextureARB" type="GdkGLProc_glClientActiveTextureARB"/>
			<field name="glMultiTexCoord1dARB" type="GdkGLProc_glMultiTexCoord1dARB"/>
			<field name="glMultiTexCoord1dvARB" type="GdkGLProc_glMultiTexCoord1dvARB"/>
			<field name="glMultiTexCoord1fARB" type="GdkGLProc_glMultiTexCoord1fARB"/>
			<field name="glMultiTexCoord1fvARB" type="GdkGLProc_glMultiTexCoord1fvARB"/>
			<field name="glMultiTexCoord1iARB" type="GdkGLProc_glMultiTexCoord1iARB"/>
			<field name="glMultiTexCoord1ivARB" type="GdkGLProc_glMultiTexCoord1ivARB"/>
			<field name="glMultiTexCoord1sARB" type="GdkGLProc_glMultiTexCoord1sARB"/>
			<field name="glMultiTexCoord1svARB" type="GdkGLProc_glMultiTexCoord1svARB"/>
			<field name="glMultiTexCoord2dARB" type="GdkGLProc_glMultiTexCoord2dARB"/>
			<field name="glMultiTexCoord2dvARB" type="GdkGLProc_glMultiTexCoord2dvARB"/>
			<field name="glMultiTexCoord2fARB" type="GdkGLProc_glMultiTexCoord2fARB"/>
			<field name="glMultiTexCoord2fvARB" type="GdkGLProc_glMultiTexCoord2fvARB"/>
			<field name="glMultiTexCoord2iARB" type="GdkGLProc_glMultiTexCoord2iARB"/>
			<field name="glMultiTexCoord2ivARB" type="GdkGLProc_glMultiTexCoord2ivARB"/>
			<field name="glMultiTexCoord2sARB" type="GdkGLProc_glMultiTexCoord2sARB"/>
			<field name="glMultiTexCoord2svARB" type="GdkGLProc_glMultiTexCoord2svARB"/>
			<field name="glMultiTexCoord3dARB" type="GdkGLProc_glMultiTexCoord3dARB"/>
			<field name="glMultiTexCoord3dvARB" type="GdkGLProc_glMultiTexCoord3dvARB"/>
			<field name="glMultiTexCoord3fARB" type="GdkGLProc_glMultiTexCoord3fARB"/>
			<field name="glMultiTexCoord3fvARB" type="GdkGLProc_glMultiTexCoord3fvARB"/>
			<field name="glMultiTexCoord3iARB" type="GdkGLProc_glMultiTexCoord3iARB"/>
			<field name="glMultiTexCoord3ivARB" type="GdkGLProc_glMultiTexCoord3ivARB"/>
			<field name="glMultiTexCoord3sARB" type="GdkGLProc_glMultiTexCoord3sARB"/>
			<field name="glMultiTexCoord3svARB" type="GdkGLProc_glMultiTexCoord3svARB"/>
			<field name="glMultiTexCoord4dARB" type="GdkGLProc_glMultiTexCoord4dARB"/>
			<field name="glMultiTexCoord4dvARB" type="GdkGLProc_glMultiTexCoord4dvARB"/>
			<field name="glMultiTexCoord4fARB" type="GdkGLProc_glMultiTexCoord4fARB"/>
			<field name="glMultiTexCoord4fvARB" type="GdkGLProc_glMultiTexCoord4fvARB"/>
			<field name="glMultiTexCoord4iARB" type="GdkGLProc_glMultiTexCoord4iARB"/>
			<field name="glMultiTexCoord4ivARB" type="GdkGLProc_glMultiTexCoord4ivARB"/>
			<field name="glMultiTexCoord4sARB" type="GdkGLProc_glMultiTexCoord4sARB"/>
			<field name="glMultiTexCoord4svARB" type="GdkGLProc_glMultiTexCoord4svARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_point_parameters">
			<field name="glPointParameterfARB" type="GdkGLProc_glPointParameterfARB"/>
			<field name="glPointParameterfvARB" type="GdkGLProc_glPointParameterfvARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_texture_compression">
			<field name="glCompressedTexImage3DARB" type="GdkGLProc_glCompressedTexImage3DARB"/>
			<field name="glCompressedTexImage2DARB" type="GdkGLProc_glCompressedTexImage2DARB"/>
			<field name="glCompressedTexImage1DARB" type="GdkGLProc_glCompressedTexImage1DARB"/>
			<field name="glCompressedTexSubImage3DARB" type="GdkGLProc_glCompressedTexSubImage3DARB"/>
			<field name="glCompressedTexSubImage2DARB" type="GdkGLProc_glCompressedTexSubImage2DARB"/>
			<field name="glCompressedTexSubImage1DARB" type="GdkGLProc_glCompressedTexSubImage1DARB"/>
			<field name="glGetCompressedTexImageARB" type="GdkGLProc_glGetCompressedTexImageARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_transpose_matrix">
			<field name="glLoadTransposeMatrixfARB" type="GdkGLProc_glLoadTransposeMatrixfARB"/>
			<field name="glLoadTransposeMatrixdARB" type="GdkGLProc_glLoadTransposeMatrixdARB"/>
			<field name="glMultTransposeMatrixfARB" type="GdkGLProc_glMultTransposeMatrixfARB"/>
			<field name="glMultTransposeMatrixdARB" type="GdkGLProc_glMultTransposeMatrixdARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_vertex_blend">
			<field name="glWeightbvARB" type="GdkGLProc_glWeightbvARB"/>
			<field name="glWeightsvARB" type="GdkGLProc_glWeightsvARB"/>
			<field name="glWeightivARB" type="GdkGLProc_glWeightivARB"/>
			<field name="glWeightfvARB" type="GdkGLProc_glWeightfvARB"/>
			<field name="glWeightdvARB" type="GdkGLProc_glWeightdvARB"/>
			<field name="glWeightubvARB" type="GdkGLProc_glWeightubvARB"/>
			<field name="glWeightusvARB" type="GdkGLProc_glWeightusvARB"/>
			<field name="glWeightuivARB" type="GdkGLProc_glWeightuivARB"/>
			<field name="glWeightPointerARB" type="GdkGLProc_glWeightPointerARB"/>
			<field name="glVertexBlendARB" type="GdkGLProc_glVertexBlendARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_vertex_buffer_object">
			<field name="glBindBufferARB" type="GdkGLProc_glBindBufferARB"/>
			<field name="glDeleteBuffersARB" type="GdkGLProc_glDeleteBuffersARB"/>
			<field name="glGenBuffersARB" type="GdkGLProc_glGenBuffersARB"/>
			<field name="glIsBufferARB" type="GdkGLProc_glIsBufferARB"/>
			<field name="glBufferDataARB" type="GdkGLProc_glBufferDataARB"/>
			<field name="glBufferSubDataARB" type="GdkGLProc_glBufferSubDataARB"/>
			<field name="glGetBufferSubDataARB" type="GdkGLProc_glGetBufferSubDataARB"/>
			<field name="glMapBufferARB" type="GdkGLProc_glMapBufferARB"/>
			<field name="glUnmapBufferARB" type="GdkGLProc_glUnmapBufferARB"/>
			<field name="glGetBufferParameterivARB" type="GdkGLProc_glGetBufferParameterivARB"/>
			<field name="glGetBufferPointervARB" type="GdkGLProc_glGetBufferPointervARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_vertex_program">
			<field name="glVertexAttrib1dARB" type="GdkGLProc_glVertexAttrib1dARB"/>
			<field name="glVertexAttrib1dvARB" type="GdkGLProc_glVertexAttrib1dvARB"/>
			<field name="glVertexAttrib1fARB" type="GdkGLProc_glVertexAttrib1fARB"/>
			<field name="glVertexAttrib1fvARB" type="GdkGLProc_glVertexAttrib1fvARB"/>
			<field name="glVertexAttrib1sARB" type="GdkGLProc_glVertexAttrib1sARB"/>
			<field name="glVertexAttrib1svARB" type="GdkGLProc_glVertexAttrib1svARB"/>
			<field name="glVertexAttrib2dARB" type="GdkGLProc_glVertexAttrib2dARB"/>
			<field name="glVertexAttrib2dvARB" type="GdkGLProc_glVertexAttrib2dvARB"/>
			<field name="glVertexAttrib2fARB" type="GdkGLProc_glVertexAttrib2fARB"/>
			<field name="glVertexAttrib2fvARB" type="GdkGLProc_glVertexAttrib2fvARB"/>
			<field name="glVertexAttrib2sARB" type="GdkGLProc_glVertexAttrib2sARB"/>
			<field name="glVertexAttrib2svARB" type="GdkGLProc_glVertexAttrib2svARB"/>
			<field name="glVertexAttrib3dARB" type="GdkGLProc_glVertexAttrib3dARB"/>
			<field name="glVertexAttrib3dvARB" type="GdkGLProc_glVertexAttrib3dvARB"/>
			<field name="glVertexAttrib3fARB" type="GdkGLProc_glVertexAttrib3fARB"/>
			<field name="glVertexAttrib3fvARB" type="GdkGLProc_glVertexAttrib3fvARB"/>
			<field name="glVertexAttrib3sARB" type="GdkGLProc_glVertexAttrib3sARB"/>
			<field name="glVertexAttrib3svARB" type="GdkGLProc_glVertexAttrib3svARB"/>
			<field name="glVertexAttrib4NbvARB" type="GdkGLProc_glVertexAttrib4NbvARB"/>
			<field name="glVertexAttrib4NivARB" type="GdkGLProc_glVertexAttrib4NivARB"/>
			<field name="glVertexAttrib4NsvARB" type="GdkGLProc_glVertexAttrib4NsvARB"/>
			<field name="glVertexAttrib4NubARB" type="GdkGLProc_glVertexAttrib4NubARB"/>
			<field name="glVertexAttrib4NubvARB" type="GdkGLProc_glVertexAttrib4NubvARB"/>
			<field name="glVertexAttrib4NuivARB" type="GdkGLProc_glVertexAttrib4NuivARB"/>
			<field name="glVertexAttrib4NusvARB" type="GdkGLProc_glVertexAttrib4NusvARB"/>
			<field name="glVertexAttrib4bvARB" type="GdkGLProc_glVertexAttrib4bvARB"/>
			<field name="glVertexAttrib4dARB" type="GdkGLProc_glVertexAttrib4dARB"/>
			<field name="glVertexAttrib4dvARB" type="GdkGLProc_glVertexAttrib4dvARB"/>
			<field name="glVertexAttrib4fARB" type="GdkGLProc_glVertexAttrib4fARB"/>
			<field name="glVertexAttrib4fvARB" type="GdkGLProc_glVertexAttrib4fvARB"/>
			<field name="glVertexAttrib4ivARB" type="GdkGLProc_glVertexAttrib4ivARB"/>
			<field name="glVertexAttrib4sARB" type="GdkGLProc_glVertexAttrib4sARB"/>
			<field name="glVertexAttrib4svARB" type="GdkGLProc_glVertexAttrib4svARB"/>
			<field name="glVertexAttrib4ubvARB" type="GdkGLProc_glVertexAttrib4ubvARB"/>
			<field name="glVertexAttrib4uivARB" type="GdkGLProc_glVertexAttrib4uivARB"/>
			<field name="glVertexAttrib4usvARB" type="GdkGLProc_glVertexAttrib4usvARB"/>
			<field name="glVertexAttribPointerARB" type="GdkGLProc_glVertexAttribPointerARB"/>
			<field name="glEnableVertexAttribArrayARB" type="GdkGLProc_glEnableVertexAttribArrayARB"/>
			<field name="glDisableVertexAttribArrayARB" type="GdkGLProc_glDisableVertexAttribArrayARB"/>
			<field name="glProgramStringARB" type="GdkGLProc_glProgramStringARB"/>
			<field name="glBindProgramARB" type="GdkGLProc_glBindProgramARB"/>
			<field name="glDeleteProgramsARB" type="GdkGLProc_glDeleteProgramsARB"/>
			<field name="glGenProgramsARB" type="GdkGLProc_glGenProgramsARB"/>
			<field name="glProgramEnvParameter4dARB" type="GdkGLProc_glProgramEnvParameter4dARB"/>
			<field name="glProgramEnvParameter4dvARB" type="GdkGLProc_glProgramEnvParameter4dvARB"/>
			<field name="glProgramEnvParameter4fARB" type="GdkGLProc_glProgramEnvParameter4fARB"/>
			<field name="glProgramEnvParameter4fvARB" type="GdkGLProc_glProgramEnvParameter4fvARB"/>
			<field name="glProgramLocalParameter4dARB" type="GdkGLProc_glProgramLocalParameter4dARB"/>
			<field name="glProgramLocalParameter4dvARB" type="GdkGLProc_glProgramLocalParameter4dvARB"/>
			<field name="glProgramLocalParameter4fARB" type="GdkGLProc_glProgramLocalParameter4fARB"/>
			<field name="glProgramLocalParameter4fvARB" type="GdkGLProc_glProgramLocalParameter4fvARB"/>
			<field name="glGetProgramEnvParameterdvARB" type="GdkGLProc_glGetProgramEnvParameterdvARB"/>
			<field name="glGetProgramEnvParameterfvARB" type="GdkGLProc_glGetProgramEnvParameterfvARB"/>
			<field name="glGetProgramLocalParameterdvARB" type="GdkGLProc_glGetProgramLocalParameterdvARB"/>
			<field name="glGetProgramLocalParameterfvARB" type="GdkGLProc_glGetProgramLocalParameterfvARB"/>
			<field name="glGetProgramivARB" type="GdkGLProc_glGetProgramivARB"/>
			<field name="glGetProgramStringARB" type="GdkGLProc_glGetProgramStringARB"/>
			<field name="glGetVertexAttribdvARB" type="GdkGLProc_glGetVertexAttribdvARB"/>
			<field name="glGetVertexAttribfvARB" type="GdkGLProc_glGetVertexAttribfvARB"/>
			<field name="glGetVertexAttribivARB" type="GdkGLProc_glGetVertexAttribivARB"/>
			<field name="glGetVertexAttribPointervARB" type="GdkGLProc_glGetVertexAttribPointervARB"/>
			<field name="glIsProgramARB" type="GdkGLProc_glIsProgramARB"/>
		</struct>
		<struct name="GdkGL_GL_ARB_window_pos">
			<field name="glWindowPos2dARB" type="GdkGLProc_glWindowPos2dARB"/>
			<field name="glWindowPos2dvARB" type="GdkGLProc_glWindowPos2dvARB"/>
			<field name="glWindowPos2fARB" type="GdkGLProc_glWindowPos2fARB"/>
			<field name="glWindowPos2fvARB" type="GdkGLProc_glWindowPos2fvARB"/>
			<field name="glWindowPos2iARB" type="GdkGLProc_glWindowPos2iARB"/>
			<field name="glWindowPos2ivARB" type="GdkGLProc_glWindowPos2ivARB"/>
			<field name="glWindowPos2sARB" type="GdkGLProc_glWindowPos2sARB"/>
			<field name="glWindowPos2svARB" type="GdkGLProc_glWindowPos2svARB"/>
			<field name="glWindowPos3dARB" type="GdkGLProc_glWindowPos3dARB"/>
			<field name="glWindowPos3dvARB" type="GdkGLProc_glWindowPos3dvARB"/>
			<field name="glWindowPos3fARB" type="GdkGLProc_glWindowPos3fARB"/>
			<field name="glWindowPos3fvARB" type="GdkGLProc_glWindowPos3fvARB"/>
			<field name="glWindowPos3iARB" type="GdkGLProc_glWindowPos3iARB"/>
			<field name="glWindowPos3ivARB" type="GdkGLProc_glWindowPos3ivARB"/>
			<field name="glWindowPos3sARB" type="GdkGLProc_glWindowPos3sARB"/>
			<field name="glWindowPos3svARB" type="GdkGLProc_glWindowPos3svARB"/>
		</struct>
		<struct name="GdkGL_GL_ATIX_pn_triangles">
			<field name="glPNTrianglesiATIX" type="GdkGLProc_glPNTrianglesiATIX"/>
			<field name="glPNTrianglesfATIX" type="GdkGLProc_glPNTrianglesfATIX"/>
		</struct>
		<struct name="GdkGL_GL_ATI_blend_equation_separate">
			<field name="glBlendEquationSeparateATI" type="GdkGLProc_glBlendEquationSeparateATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_draw_buffers">
			<field name="glDrawBuffersATI" type="GdkGLProc_glDrawBuffersATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_element_array">
			<field name="glElementPointerATI" type="GdkGLProc_glElementPointerATI"/>
			<field name="glDrawElementArrayATI" type="GdkGLProc_glDrawElementArrayATI"/>
			<field name="glDrawRangeElementArrayATI" type="GdkGLProc_glDrawRangeElementArrayATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_envmap_bumpmap">
			<field name="glTexBumpParameterivATI" type="GdkGLProc_glTexBumpParameterivATI"/>
			<field name="glTexBumpParameterfvATI" type="GdkGLProc_glTexBumpParameterfvATI"/>
			<field name="glGetTexBumpParameterivATI" type="GdkGLProc_glGetTexBumpParameterivATI"/>
			<field name="glGetTexBumpParameterfvATI" type="GdkGLProc_glGetTexBumpParameterfvATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_fragment_shader">
			<field name="glGenFragmentShadersATI" type="GdkGLProc_glGenFragmentShadersATI"/>
			<field name="glBindFragmentShaderATI" type="GdkGLProc_glBindFragmentShaderATI"/>
			<field name="glDeleteFragmentShaderATI" type="GdkGLProc_glDeleteFragmentShaderATI"/>
			<field name="glBeginFragmentShaderATI" type="GdkGLProc_glBeginFragmentShaderATI"/>
			<field name="glEndFragmentShaderATI" type="GdkGLProc_glEndFragmentShaderATI"/>
			<field name="glPassTexCoordATI" type="GdkGLProc_glPassTexCoordATI"/>
			<field name="glSampleMapATI" type="GdkGLProc_glSampleMapATI"/>
			<field name="glColorFragmentOp1ATI" type="GdkGLProc_glColorFragmentOp1ATI"/>
			<field name="glColorFragmentOp2ATI" type="GdkGLProc_glColorFragmentOp2ATI"/>
			<field name="glColorFragmentOp3ATI" type="GdkGLProc_glColorFragmentOp3ATI"/>
			<field name="glAlphaFragmentOp1ATI" type="GdkGLProc_glAlphaFragmentOp1ATI"/>
			<field name="glAlphaFragmentOp2ATI" type="GdkGLProc_glAlphaFragmentOp2ATI"/>
			<field name="glAlphaFragmentOp3ATI" type="GdkGLProc_glAlphaFragmentOp3ATI"/>
			<field name="glSetFragmentShaderConstantATI" type="GdkGLProc_glSetFragmentShaderConstantATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_map_object_buffer">
			<field name="glMapObjectBufferATI" type="GdkGLProc_glMapObjectBufferATI"/>
			<field name="glUnmapObjectBufferATI" type="GdkGLProc_glUnmapObjectBufferATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_pn_triangles">
			<field name="glPNTrianglesiATI" type="GdkGLProc_glPNTrianglesiATI"/>
			<field name="glPNTrianglesfATI" type="GdkGLProc_glPNTrianglesfATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_separate_stencil">
			<field name="glStencilOpSeparateATI" type="GdkGLProc_glStencilOpSeparateATI"/>
			<field name="glStencilFuncSeparateATI" type="GdkGLProc_glStencilFuncSeparateATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_vertex_array_object">
			<field name="glNewObjectBufferATI" type="GdkGLProc_glNewObjectBufferATI"/>
			<field name="glIsObjectBufferATI" type="GdkGLProc_glIsObjectBufferATI"/>
			<field name="glUpdateObjectBufferATI" type="GdkGLProc_glUpdateObjectBufferATI"/>
			<field name="glGetObjectBufferfvATI" type="GdkGLProc_glGetObjectBufferfvATI"/>
			<field name="glGetObjectBufferivATI" type="GdkGLProc_glGetObjectBufferivATI"/>
			<field name="glFreeObjectBufferATI" type="GdkGLProc_glFreeObjectBufferATI"/>
			<field name="glArrayObjectATI" type="GdkGLProc_glArrayObjectATI"/>
			<field name="glGetArrayObjectfvATI" type="GdkGLProc_glGetArrayObjectfvATI"/>
			<field name="glGetArrayObjectivATI" type="GdkGLProc_glGetArrayObjectivATI"/>
			<field name="glVariantArrayObjectATI" type="GdkGLProc_glVariantArrayObjectATI"/>
			<field name="glGetVariantArrayObjectfvATI" type="GdkGLProc_glGetVariantArrayObjectfvATI"/>
			<field name="glGetVariantArrayObjectivATI" type="GdkGLProc_glGetVariantArrayObjectivATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_vertex_attrib_array_object">
			<field name="glVertexAttribArrayObjectATI" type="GdkGLProc_glVertexAttribArrayObjectATI"/>
			<field name="glGetVertexAttribArrayObjectfvATI" type="GdkGLProc_glGetVertexAttribArrayObjectfvATI"/>
			<field name="glGetVertexAttribArrayObjectivATI" type="GdkGLProc_glGetVertexAttribArrayObjectivATI"/>
		</struct>
		<struct name="GdkGL_GL_ATI_vertex_streams">
			<field name="glVertexStream1sATI" type="GdkGLProc_glVertexStream1sATI"/>
			<field name="glVertexStream1svATI" type="GdkGLProc_glVertexStream1svATI"/>
			<field name="glVertexStream1iATI" type="GdkGLProc_glVertexStream1iATI"/>
			<field name="glVertexStream1ivATI" type="GdkGLProc_glVertexStream1ivATI"/>
			<field name="glVertexStream1fATI" type="GdkGLProc_glVertexStream1fATI"/>
			<field name="glVertexStream1fvATI" type="GdkGLProc_glVertexStream1fvATI"/>
			<field name="glVertexStream1dATI" type="GdkGLProc_glVertexStream1dATI"/>
			<field name="glVertexStream1dvATI" type="GdkGLProc_glVertexStream1dvATI"/>
			<field name="glVertexStream2sATI" type="GdkGLProc_glVertexStream2sATI"/>
			<field name="glVertexStream2svATI" type="GdkGLProc_glVertexStream2svATI"/>
			<field name="glVertexStream2iATI" type="GdkGLProc_glVertexStream2iATI"/>
			<field name="glVertexStream2ivATI" type="GdkGLProc_glVertexStream2ivATI"/>
			<field name="glVertexStream2fATI" type="GdkGLProc_glVertexStream2fATI"/>
			<field name="glVertexStream2fvATI" type="GdkGLProc_glVertexStream2fvATI"/>
			<field name="glVertexStream2dATI" type="GdkGLProc_glVertexStream2dATI"/>
			<field name="glVertexStream2dvATI" type="GdkGLProc_glVertexStream2dvATI"/>
			<field name="glVertexStream3sATI" type="GdkGLProc_glVertexStream3sATI"/>
			<field name="glVertexStream3svATI" type="GdkGLProc_glVertexStream3svATI"/>
			<field name="glVertexStream3iATI" type="GdkGLProc_glVertexStream3iATI"/>
			<field name="glVertexStream3ivATI" type="GdkGLProc_glVertexStream3ivATI"/>
			<field name="glVertexStream3fATI" type="GdkGLProc_glVertexStream3fATI"/>
			<field name="glVertexStream3fvATI" type="GdkGLProc_glVertexStream3fvATI"/>
			<field name="glVertexStream3dATI" type="GdkGLProc_glVertexStream3dATI"/>
			<field name="glVertexStream3dvATI" type="GdkGLProc_glVertexStream3dvATI"/>
			<field name="glVertexStream4sATI" type="GdkGLProc_glVertexStream4sATI"/>
			<field name="glVertexStream4svATI" type="GdkGLProc_glVertexStream4svATI"/>
			<field name="glVertexStream4iATI" type="GdkGLProc_glVertexStream4iATI"/>
			<field name="glVertexStream4ivATI" type="GdkGLProc_glVertexStream4ivATI"/>
			<field name="glVertexStream4fATI" type="GdkGLProc_glVertexStream4fATI"/>
			<field name="glVertexStream4fvATI" type="GdkGLProc_glVertexStream4fvATI"/>
			<field name="glVertexStream4dATI" type="GdkGLProc_glVertexStream4dATI"/>
			<field name="glVertexStream4dvATI" type="GdkGLProc_glVertexStream4dvATI"/>
			<field name="glNormalStream3bATI" type="GdkGLProc_glNormalStream3bATI"/>
			<field name="glNormalStream3bvATI" type="GdkGLProc_glNormalStream3bvATI"/>
			<field name="glNormalStream3sATI" type="GdkGLProc_glNormalStream3sATI"/>
			<field name="glNormalStream3svATI" type="GdkGLProc_glNormalStream3svATI"/>
			<field name="glNormalStream3iATI" type="GdkGLProc_glNormalStream3iATI"/>
			<field name="glNormalStream3ivATI" type="GdkGLProc_glNormalStream3ivATI"/>
			<field name="glNormalStream3fATI" type="GdkGLProc_glNormalStream3fATI"/>
			<field name="glNormalStream3fvATI" type="GdkGLProc_glNormalStream3fvATI"/>
			<field name="glNormalStream3dATI" type="GdkGLProc_glNormalStream3dATI"/>
			<field name="glNormalStream3dvATI" type="GdkGLProc_glNormalStream3dvATI"/>
			<field name="glClientActiveVertexStreamATI" type="GdkGLProc_glClientActiveVertexStreamATI"/>
			<field name="glVertexBlendEnviATI" type="GdkGLProc_glVertexBlendEnviATI"/>
			<field name="glVertexBlendEnvfATI" type="GdkGLProc_glVertexBlendEnvfATI"/>
		</struct>
		<struct name="GdkGL_GL_Autodesk_facet_normal">
			<field name="glFacetNormal3b" type="GdkGLProc_glFacetNormal3b"/>
			<field name="glFacetNormal3d" type="GdkGLProc_glFacetNormal3d"/>
			<field name="glFacetNormal3f" type="GdkGLProc_glFacetNormal3f"/>
			<field name="glFacetNormal3i" type="GdkGLProc_glFacetNormal3i"/>
			<field name="glFacetNormal3s" type="GdkGLProc_glFacetNormal3s"/>
			<field name="glFacetNormal3bv" type="GdkGLProc_glFacetNormal3bv"/>
			<field name="glFacetNormal3dv" type="GdkGLProc_glFacetNormal3dv"/>
			<field name="glFacetNormal3fv" type="GdkGLProc_glFacetNormal3fv"/>
			<field name="glFacetNormal3iv" type="GdkGLProc_glFacetNormal3iv"/>
			<field name="glFacetNormal3sv" type="GdkGLProc_glFacetNormal3sv"/>
		</struct>
		<struct name="GdkGL_GL_Autodesk_valid_back_buffer_hint">
			<field name="glWindowBackBufferHint" type="GdkGLProc_glWindowBackBufferHint"/>
			<field name="glValidBackBufferHint" type="GdkGLProc_glValidBackBufferHint"/>
		</struct>
		<struct name="GdkGL_GL_EXT_blend_color">
			<field name="glBlendColorEXT" type="GdkGLProc_glBlendColorEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_blend_func_separate">
			<field name="glBlendFuncSeparateEXT" type="GdkGLProc_glBlendFuncSeparateEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_blend_minmax">
			<field name="glBlendEquationEXT" type="GdkGLProc_glBlendEquationEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_color_subtable">
			<field name="glColorSubTableEXT" type="GdkGLProc_glColorSubTableEXT"/>
			<field name="glCopyColorSubTableEXT" type="GdkGLProc_glCopyColorSubTableEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_compiled_vertex_array">
			<field name="glLockArraysEXT" type="GdkGLProc_glLockArraysEXT"/>
			<field name="glUnlockArraysEXT" type="GdkGLProc_glUnlockArraysEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_convolution">
			<field name="glConvolutionFilter1DEXT" type="GdkGLProc_glConvolutionFilter1DEXT"/>
			<field name="glConvolutionFilter2DEXT" type="GdkGLProc_glConvolutionFilter2DEXT"/>
			<field name="glConvolutionParameterfEXT" type="GdkGLProc_glConvolutionParameterfEXT"/>
			<field name="glConvolutionParameterfvEXT" type="GdkGLProc_glConvolutionParameterfvEXT"/>
			<field name="glConvolutionParameteriEXT" type="GdkGLProc_glConvolutionParameteriEXT"/>
			<field name="glConvolutionParameterivEXT" type="GdkGLProc_glConvolutionParameterivEXT"/>
			<field name="glCopyConvolutionFilter1DEXT" type="GdkGLProc_glCopyConvolutionFilter1DEXT"/>
			<field name="glCopyConvolutionFilter2DEXT" type="GdkGLProc_glCopyConvolutionFilter2DEXT"/>
			<field name="glGetConvolutionFilterEXT" type="GdkGLProc_glGetConvolutionFilterEXT"/>
			<field name="glGetConvolutionParameterfvEXT" type="GdkGLProc_glGetConvolutionParameterfvEXT"/>
			<field name="glGetConvolutionParameterivEXT" type="GdkGLProc_glGetConvolutionParameterivEXT"/>
			<field name="glGetSeparableFilterEXT" type="GdkGLProc_glGetSeparableFilterEXT"/>
			<field name="glSeparableFilter2DEXT" type="GdkGLProc_glSeparableFilter2DEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_coordinate_frame">
			<field name="glTangent3bEXT" type="GdkGLProc_glTangent3bEXT"/>
			<field name="glTangent3bvEXT" type="GdkGLProc_glTangent3bvEXT"/>
			<field name="glTangent3dEXT" type="GdkGLProc_glTangent3dEXT"/>
			<field name="glTangent3dvEXT" type="GdkGLProc_glTangent3dvEXT"/>
			<field name="glTangent3fEXT" type="GdkGLProc_glTangent3fEXT"/>
			<field name="glTangent3fvEXT" type="GdkGLProc_glTangent3fvEXT"/>
			<field name="glTangent3iEXT" type="GdkGLProc_glTangent3iEXT"/>
			<field name="glTangent3ivEXT" type="GdkGLProc_glTangent3ivEXT"/>
			<field name="glTangent3sEXT" type="GdkGLProc_glTangent3sEXT"/>
			<field name="glTangent3svEXT" type="GdkGLProc_glTangent3svEXT"/>
			<field name="glBinormal3bEXT" type="GdkGLProc_glBinormal3bEXT"/>
			<field name="glBinormal3bvEXT" type="GdkGLProc_glBinormal3bvEXT"/>
			<field name="glBinormal3dEXT" type="GdkGLProc_glBinormal3dEXT"/>
			<field name="glBinormal3dvEXT" type="GdkGLProc_glBinormal3dvEXT"/>
			<field name="glBinormal3fEXT" type="GdkGLProc_glBinormal3fEXT"/>
			<field name="glBinormal3fvEXT" type="GdkGLProc_glBinormal3fvEXT"/>
			<field name="glBinormal3iEXT" type="GdkGLProc_glBinormal3iEXT"/>
			<field name="glBinormal3ivEXT" type="GdkGLProc_glBinormal3ivEXT"/>
			<field name="glBinormal3sEXT" type="GdkGLProc_glBinormal3sEXT"/>
			<field name="glBinormal3svEXT" type="GdkGLProc_glBinormal3svEXT"/>
			<field name="glTangentPointerEXT" type="GdkGLProc_glTangentPointerEXT"/>
			<field name="glBinormalPointerEXT" type="GdkGLProc_glBinormalPointerEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_copy_texture">
			<field name="glCopyTexImage1DEXT" type="GdkGLProc_glCopyTexImage1DEXT"/>
			<field name="glCopyTexImage2DEXT" type="GdkGLProc_glCopyTexImage2DEXT"/>
			<field name="glCopyTexSubImage1DEXT" type="GdkGLProc_glCopyTexSubImage1DEXT"/>
			<field name="glCopyTexSubImage2DEXT" type="GdkGLProc_glCopyTexSubImage2DEXT"/>
			<field name="glCopyTexSubImage3DEXT" type="GdkGLProc_glCopyTexSubImage3DEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_cull_vertex">
			<field name="glCullParameterdvEXT" type="GdkGLProc_glCullParameterdvEXT"/>
			<field name="glCullParameterfvEXT" type="GdkGLProc_glCullParameterfvEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_depth_bounds_test">
			<field name="glDepthBoundsEXT" type="GdkGLProc_glDepthBoundsEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_draw_range_elements">
			<field name="glDrawRangeElementsEXT" type="GdkGLProc_glDrawRangeElementsEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_fog_coord">
			<field name="glFogCoordfEXT" type="GdkGLProc_glFogCoordfEXT"/>
			<field name="glFogCoordfvEXT" type="GdkGLProc_glFogCoordfvEXT"/>
			<field name="glFogCoorddEXT" type="GdkGLProc_glFogCoorddEXT"/>
			<field name="glFogCoorddvEXT" type="GdkGLProc_glFogCoorddvEXT"/>
			<field name="glFogCoordPointerEXT" type="GdkGLProc_glFogCoordPointerEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_fragment_lighting">
			<field name="glFragmentLightModelfEXT" type="GdkGLProc_glFragmentLightModelfEXT"/>
			<field name="glFragmentLightModelfvEXT" type="GdkGLProc_glFragmentLightModelfvEXT"/>
			<field name="glFragmentLightModeliEXT" type="GdkGLProc_glFragmentLightModeliEXT"/>
			<field name="glFragmentLightModelivEXT" type="GdkGLProc_glFragmentLightModelivEXT"/>
			<field name="glFragmentLightfEXT" type="GdkGLProc_glFragmentLightfEXT"/>
			<field name="glFragmentLightfvEXT" type="GdkGLProc_glFragmentLightfvEXT"/>
			<field name="glFragmentLightiEXT" type="GdkGLProc_glFragmentLightiEXT"/>
			<field name="glFragmentLightivEXT" type="GdkGLProc_glFragmentLightivEXT"/>
			<field name="glGetFragmentLightfvEXT" type="GdkGLProc_glGetFragmentLightfvEXT"/>
			<field name="glGetFragmentLightivEXT" type="GdkGLProc_glGetFragmentLightivEXT"/>
			<field name="glFragmentMaterialfEXT" type="GdkGLProc_glFragmentMaterialfEXT"/>
			<field name="glFragmentMaterialfvEXT" type="GdkGLProc_glFragmentMaterialfvEXT"/>
			<field name="glFragmentMaterialiEXT" type="GdkGLProc_glFragmentMaterialiEXT"/>
			<field name="glFragmentMaterialivEXT" type="GdkGLProc_glFragmentMaterialivEXT"/>
			<field name="glFragmentColorMaterialEXT" type="GdkGLProc_glFragmentColorMaterialEXT"/>
			<field name="glGetFragmentMaterialfvEXT" type="GdkGLProc_glGetFragmentMaterialfvEXT"/>
			<field name="glGetFragmentMaterialivEXT" type="GdkGLProc_glGetFragmentMaterialivEXT"/>
			<field name="glLightEnviEXT" type="GdkGLProc_glLightEnviEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_histogram">
			<field name="glGetHistogramEXT" type="GdkGLProc_glGetHistogramEXT"/>
			<field name="glGetHistogramParameterfvEXT" type="GdkGLProc_glGetHistogramParameterfvEXT"/>
			<field name="glGetHistogramParameterivEXT" type="GdkGLProc_glGetHistogramParameterivEXT"/>
			<field name="glGetMinmaxEXT" type="GdkGLProc_glGetMinmaxEXT"/>
			<field name="glGetMinmaxParameterfvEXT" type="GdkGLProc_glGetMinmaxParameterfvEXT"/>
			<field name="glGetMinmaxParameterivEXT" type="GdkGLProc_glGetMinmaxParameterivEXT"/>
			<field name="glHistogramEXT" type="GdkGLProc_glHistogramEXT"/>
			<field name="glMinmaxEXT" type="GdkGLProc_glMinmaxEXT"/>
			<field name="glResetHistogramEXT" type="GdkGLProc_glResetHistogramEXT"/>
			<field name="glResetMinmaxEXT" type="GdkGLProc_glResetMinmaxEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_index_func">
			<field name="glIndexFuncEXT" type="GdkGLProc_glIndexFuncEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_index_material">
			<field name="glIndexMaterialEXT" type="GdkGLProc_glIndexMaterialEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_light_texture">
			<field name="glApplyTextureEXT" type="GdkGLProc_glApplyTextureEXT"/>
			<field name="glTextureLightEXT" type="GdkGLProc_glTextureLightEXT"/>
			<field name="glTextureMaterialEXT" type="GdkGLProc_glTextureMaterialEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_multi_draw_arrays">
			<field name="glMultiDrawArraysEXT" type="GdkGLProc_glMultiDrawArraysEXT"/>
			<field name="glMultiDrawElementsEXT" type="GdkGLProc_glMultiDrawElementsEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_multisample">
			<field name="glSampleMaskEXT" type="GdkGLProc_glSampleMaskEXT"/>
			<field name="glSamplePatternEXT" type="GdkGLProc_glSamplePatternEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_multitexture">
			<field name="glMultiTexCoord1dEXT" type="GdkGLProc_glMultiTexCoord1dEXT"/>
			<field name="glMultiTexCoord1dvEXT" type="GdkGLProc_glMultiTexCoord1dvEXT"/>
			<field name="glMultiTexCoord1fEXT" type="GdkGLProc_glMultiTexCoord1fEXT"/>
			<field name="glMultiTexCoord1fvEXT" type="GdkGLProc_glMultiTexCoord1fvEXT"/>
			<field name="glMultiTexCoord1iEXT" type="GdkGLProc_glMultiTexCoord1iEXT"/>
			<field name="glMultiTexCoord1ivEXT" type="GdkGLProc_glMultiTexCoord1ivEXT"/>
			<field name="glMultiTexCoord1sEXT" type="GdkGLProc_glMultiTexCoord1sEXT"/>
			<field name="glMultiTexCoord1svEXT" type="GdkGLProc_glMultiTexCoord1svEXT"/>
			<field name="glMultiTexCoord2dEXT" type="GdkGLProc_glMultiTexCoord2dEXT"/>
			<field name="glMultiTexCoord2dvEXT" type="GdkGLProc_glMultiTexCoord2dvEXT"/>
			<field name="glMultiTexCoord2fEXT" type="GdkGLProc_glMultiTexCoord2fEXT"/>
			<field name="glMultiTexCoord2fvEXT" type="GdkGLProc_glMultiTexCoord2fvEXT"/>
			<field name="glMultiTexCoord2iEXT" type="GdkGLProc_glMultiTexCoord2iEXT"/>
			<field name="glMultiTexCoord2ivEXT" type="GdkGLProc_glMultiTexCoord2ivEXT"/>
			<field name="glMultiTexCoord2sEXT" type="GdkGLProc_glMultiTexCoord2sEXT"/>
			<field name="glMultiTexCoord2svEXT" type="GdkGLProc_glMultiTexCoord2svEXT"/>
			<field name="glMultiTexCoord3dEXT" type="GdkGLProc_glMultiTexCoord3dEXT"/>
			<field name="glMultiTexCoord3dvEXT" type="GdkGLProc_glMultiTexCoord3dvEXT"/>
			<field name="glMultiTexCoord3fEXT" type="GdkGLProc_glMultiTexCoord3fEXT"/>
			<field name="glMultiTexCoord3fvEXT" type="GdkGLProc_glMultiTexCoord3fvEXT"/>
			<field name="glMultiTexCoord3iEXT" type="GdkGLProc_glMultiTexCoord3iEXT"/>
			<field name="glMultiTexCoord3ivEXT" type="GdkGLProc_glMultiTexCoord3ivEXT"/>
			<field name="glMultiTexCoord3sEXT" type="GdkGLProc_glMultiTexCoord3sEXT"/>
			<field name="glMultiTexCoord3svEXT" type="GdkGLProc_glMultiTexCoord3svEXT"/>
			<field name="glMultiTexCoord4dEXT" type="GdkGLProc_glMultiTexCoord4dEXT"/>
			<field name="glMultiTexCoord4dvEXT" type="GdkGLProc_glMultiTexCoord4dvEXT"/>
			<field name="glMultiTexCoord4fEXT" type="GdkGLProc_glMultiTexCoord4fEXT"/>
			<field name="glMultiTexCoord4fvEXT" type="GdkGLProc_glMultiTexCoord4fvEXT"/>
			<field name="glMultiTexCoord4iEXT" type="GdkGLProc_glMultiTexCoord4iEXT"/>
			<field name="glMultiTexCoord4ivEXT" type="GdkGLProc_glMultiTexCoord4ivEXT"/>
			<field name="glMultiTexCoord4sEXT" type="GdkGLProc_glMultiTexCoord4sEXT"/>
			<field name="glMultiTexCoord4svEXT" type="GdkGLProc_glMultiTexCoord4svEXT"/>
			<field name="glInterleavedTextureCoordSetsEXT" type="GdkGLProc_glInterleavedTextureCoordSetsEXT"/>
			<field name="glSelectTextureEXT" type="GdkGLProc_glSelectTextureEXT"/>
			<field name="glSelectTextureCoordSetEXT" type="GdkGLProc_glSelectTextureCoordSetEXT"/>
			<field name="glSelectTextureTransformEXT" type="GdkGLProc_glSelectTextureTransformEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_paletted_texture">
			<field name="glColorTableEXT" type="GdkGLProc_glColorTableEXT"/>
			<field name="glGetColorTableEXT" type="GdkGLProc_glGetColorTableEXT"/>
			<field name="glGetColorTableParameterivEXT" type="GdkGLProc_glGetColorTableParameterivEXT"/>
			<field name="glGetColorTableParameterfvEXT" type="GdkGLProc_glGetColorTableParameterfvEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_pixel_transform">
			<field name="glPixelTransformParameteriEXT" type="GdkGLProc_glPixelTransformParameteriEXT"/>
			<field name="glPixelTransformParameterfEXT" type="GdkGLProc_glPixelTransformParameterfEXT"/>
			<field name="glPixelTransformParameterivEXT" type="GdkGLProc_glPixelTransformParameterivEXT"/>
			<field name="glPixelTransformParameterfvEXT" type="GdkGLProc_glPixelTransformParameterfvEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_point_parameters">
			<field name="glPointParameterfEXT" type="GdkGLProc_glPointParameterfEXT"/>
			<field name="glPointParameterfvEXT" type="GdkGLProc_glPointParameterfvEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_polygon_offset">
			<field name="glPolygonOffsetEXT" type="GdkGLProc_glPolygonOffsetEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_scene_marker">
			<field name="glBeginSceneEXT" type="GdkGLProc_glBeginSceneEXT"/>
			<field name="glEndSceneEXT" type="GdkGLProc_glEndSceneEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_secondary_color">
			<field name="glSecondaryColor3bEXT" type="GdkGLProc_glSecondaryColor3bEXT"/>
			<field name="glSecondaryColor3bvEXT" type="GdkGLProc_glSecondaryColor3bvEXT"/>
			<field name="glSecondaryColor3dEXT" type="GdkGLProc_glSecondaryColor3dEXT"/>
			<field name="glSecondaryColor3dvEXT" type="GdkGLProc_glSecondaryColor3dvEXT"/>
			<field name="glSecondaryColor3fEXT" type="GdkGLProc_glSecondaryColor3fEXT"/>
			<field name="glSecondaryColor3fvEXT" type="GdkGLProc_glSecondaryColor3fvEXT"/>
			<field name="glSecondaryColor3iEXT" type="GdkGLProc_glSecondaryColor3iEXT"/>
			<field name="glSecondaryColor3ivEXT" type="GdkGLProc_glSecondaryColor3ivEXT"/>
			<field name="glSecondaryColor3sEXT" type="GdkGLProc_glSecondaryColor3sEXT"/>
			<field name="glSecondaryColor3svEXT" type="GdkGLProc_glSecondaryColor3svEXT"/>
			<field name="glSecondaryColor3ubEXT" type="GdkGLProc_glSecondaryColor3ubEXT"/>
			<field name="glSecondaryColor3ubvEXT" type="GdkGLProc_glSecondaryColor3ubvEXT"/>
			<field name="glSecondaryColor3uiEXT" type="GdkGLProc_glSecondaryColor3uiEXT"/>
			<field name="glSecondaryColor3uivEXT" type="GdkGLProc_glSecondaryColor3uivEXT"/>
			<field name="glSecondaryColor3usEXT" type="GdkGLProc_glSecondaryColor3usEXT"/>
			<field name="glSecondaryColor3usvEXT" type="GdkGLProc_glSecondaryColor3usvEXT"/>
			<field name="glSecondaryColorPointerEXT" type="GdkGLProc_glSecondaryColorPointerEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_stencil_two_side">
			<field name="glActiveStencilFaceEXT" type="GdkGLProc_glActiveStencilFaceEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_subtexture">
			<field name="glTexSubImage1DEXT" type="GdkGLProc_glTexSubImage1DEXT"/>
			<field name="glTexSubImage2DEXT" type="GdkGLProc_glTexSubImage2DEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_texture3D">
			<field name="glTexImage3DEXT" type="GdkGLProc_glTexImage3DEXT"/>
			<field name="glTexSubImage3DEXT" type="GdkGLProc_glTexSubImage3DEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_texture_object">
			<field name="glAreTexturesResidentEXT" type="GdkGLProc_glAreTexturesResidentEXT"/>
			<field name="glBindTextureEXT" type="GdkGLProc_glBindTextureEXT"/>
			<field name="glDeleteTexturesEXT" type="GdkGLProc_glDeleteTexturesEXT"/>
			<field name="glGenTexturesEXT" type="GdkGLProc_glGenTexturesEXT"/>
			<field name="glIsTextureEXT" type="GdkGLProc_glIsTextureEXT"/>
			<field name="glPrioritizeTexturesEXT" type="GdkGLProc_glPrioritizeTexturesEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_texture_perturb_normal">
			<field name="glTextureNormalEXT" type="GdkGLProc_glTextureNormalEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_vertex_array">
			<field name="glArrayElementEXT" type="GdkGLProc_glArrayElementEXT"/>
			<field name="glColorPointerEXT" type="GdkGLProc_glColorPointerEXT"/>
			<field name="glDrawArraysEXT" type="GdkGLProc_glDrawArraysEXT"/>
			<field name="glEdgeFlagPointerEXT" type="GdkGLProc_glEdgeFlagPointerEXT"/>
			<field name="glGetPointervEXT" type="GdkGLProc_glGetPointervEXT"/>
			<field name="glIndexPointerEXT" type="GdkGLProc_glIndexPointerEXT"/>
			<field name="glNormalPointerEXT" type="GdkGLProc_glNormalPointerEXT"/>
			<field name="glTexCoordPointerEXT" type="GdkGLProc_glTexCoordPointerEXT"/>
			<field name="glVertexPointerEXT" type="GdkGLProc_glVertexPointerEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_vertex_shader">
			<field name="glBeginVertexShaderEXT" type="GdkGLProc_glBeginVertexShaderEXT"/>
			<field name="glEndVertexShaderEXT" type="GdkGLProc_glEndVertexShaderEXT"/>
			<field name="glBindVertexShaderEXT" type="GdkGLProc_glBindVertexShaderEXT"/>
			<field name="glGenVertexShadersEXT" type="GdkGLProc_glGenVertexShadersEXT"/>
			<field name="glDeleteVertexShaderEXT" type="GdkGLProc_glDeleteVertexShaderEXT"/>
			<field name="glShaderOp1EXT" type="GdkGLProc_glShaderOp1EXT"/>
			<field name="glShaderOp2EXT" type="GdkGLProc_glShaderOp2EXT"/>
			<field name="glShaderOp3EXT" type="GdkGLProc_glShaderOp3EXT"/>
			<field name="glSwizzleEXT" type="GdkGLProc_glSwizzleEXT"/>
			<field name="glWriteMaskEXT" type="GdkGLProc_glWriteMaskEXT"/>
			<field name="glInsertComponentEXT" type="GdkGLProc_glInsertComponentEXT"/>
			<field name="glExtractComponentEXT" type="GdkGLProc_glExtractComponentEXT"/>
			<field name="glGenSymbolsEXT" type="GdkGLProc_glGenSymbolsEXT"/>
			<field name="glSetInvariantEXT" type="GdkGLProc_glSetInvariantEXT"/>
			<field name="glSetLocalConstantEXT" type="GdkGLProc_glSetLocalConstantEXT"/>
			<field name="glVariantbvEXT" type="GdkGLProc_glVariantbvEXT"/>
			<field name="glVariantsvEXT" type="GdkGLProc_glVariantsvEXT"/>
			<field name="glVariantivEXT" type="GdkGLProc_glVariantivEXT"/>
			<field name="glVariantfvEXT" type="GdkGLProc_glVariantfvEXT"/>
			<field name="glVariantdvEXT" type="GdkGLProc_glVariantdvEXT"/>
			<field name="glVariantubvEXT" type="GdkGLProc_glVariantubvEXT"/>
			<field name="glVariantusvEXT" type="GdkGLProc_glVariantusvEXT"/>
			<field name="glVariantuivEXT" type="GdkGLProc_glVariantuivEXT"/>
			<field name="glVariantPointerEXT" type="GdkGLProc_glVariantPointerEXT"/>
			<field name="glEnableVariantClientStateEXT" type="GdkGLProc_glEnableVariantClientStateEXT"/>
			<field name="glDisableVariantClientStateEXT" type="GdkGLProc_glDisableVariantClientStateEXT"/>
			<field name="glBindLightParameterEXT" type="GdkGLProc_glBindLightParameterEXT"/>
			<field name="glBindMaterialParameterEXT" type="GdkGLProc_glBindMaterialParameterEXT"/>
			<field name="glBindTexGenParameterEXT" type="GdkGLProc_glBindTexGenParameterEXT"/>
			<field name="glBindTextureUnitParameterEXT" type="GdkGLProc_glBindTextureUnitParameterEXT"/>
			<field name="glBindParameterEXT" type="GdkGLProc_glBindParameterEXT"/>
			<field name="glIsVariantEnabledEXT" type="GdkGLProc_glIsVariantEnabledEXT"/>
			<field name="glGetVariantBooleanvEXT" type="GdkGLProc_glGetVariantBooleanvEXT"/>
			<field name="glGetVariantIntegervEXT" type="GdkGLProc_glGetVariantIntegervEXT"/>
			<field name="glGetVariantFloatvEXT" type="GdkGLProc_glGetVariantFloatvEXT"/>
			<field name="glGetVariantPointervEXT" type="GdkGLProc_glGetVariantPointervEXT"/>
			<field name="glGetInvariantBooleanvEXT" type="GdkGLProc_glGetInvariantBooleanvEXT"/>
			<field name="glGetInvariantIntegervEXT" type="GdkGLProc_glGetInvariantIntegervEXT"/>
			<field name="glGetInvariantFloatvEXT" type="GdkGLProc_glGetInvariantFloatvEXT"/>
			<field name="glGetLocalConstantBooleanvEXT" type="GdkGLProc_glGetLocalConstantBooleanvEXT"/>
			<field name="glGetLocalConstantIntegervEXT" type="GdkGLProc_glGetLocalConstantIntegervEXT"/>
			<field name="glGetLocalConstantFloatvEXT" type="GdkGLProc_glGetLocalConstantFloatvEXT"/>
		</struct>
		<struct name="GdkGL_GL_EXT_vertex_weighting">
			<field name="glVertexWeightfEXT" type="GdkGLProc_glVertexWeightfEXT"/>
			<field name="glVertexWeightfvEXT" type="GdkGLProc_glVertexWeightfvEXT"/>
			<field name="glVertexWeightPointerEXT" type="GdkGLProc_glVertexWeightPointerEXT"/>
		</struct>
		<struct name="GdkGL_GL_HP_image_transform">
			<field name="glImageTransformParameteriHP" type="GdkGLProc_glImageTransformParameteriHP"/>
			<field name="glImageTransformParameterfHP" type="GdkGLProc_glImageTransformParameterfHP"/>
			<field name="glImageTransformParameterivHP" type="GdkGLProc_glImageTransformParameterivHP"/>
			<field name="glImageTransformParameterfvHP" type="GdkGLProc_glImageTransformParameterfvHP"/>
			<field name="glGetImageTransformParameterivHP" type="GdkGLProc_glGetImageTransformParameterivHP"/>
			<field name="glGetImageTransformParameterfvHP" type="GdkGLProc_glGetImageTransformParameterfvHP"/>
		</struct>
		<struct name="GdkGL_GL_IBM_multimode_draw_arrays">
			<field name="glMultiModeDrawArraysIBM" type="GdkGLProc_glMultiModeDrawArraysIBM"/>
			<field name="glMultiModeDrawElementsIBM" type="GdkGLProc_glMultiModeDrawElementsIBM"/>
		</struct>
		<struct name="GdkGL_GL_IBM_static_data">
			<field name="glFlushStaticDataIBM" type="GdkGLProc_glFlushStaticDataIBM"/>
		</struct>
		<struct name="GdkGL_GL_IBM_vertex_array_lists">
			<field name="glColorPointerListIBM" type="GdkGLProc_glColorPointerListIBM"/>
			<field name="glSecondaryColorPointerListIBM" type="GdkGLProc_glSecondaryColorPointerListIBM"/>
			<field name="glEdgeFlagPointerListIBM" type="GdkGLProc_glEdgeFlagPointerListIBM"/>
			<field name="glFogCoordPointerListIBM" type="GdkGLProc_glFogCoordPointerListIBM"/>
			<field name="glIndexPointerListIBM" type="GdkGLProc_glIndexPointerListIBM"/>
			<field name="glNormalPointerListIBM" type="GdkGLProc_glNormalPointerListIBM"/>
			<field name="glTexCoordPointerListIBM" type="GdkGLProc_glTexCoordPointerListIBM"/>
			<field name="glVertexPointerListIBM" type="GdkGLProc_glVertexPointerListIBM"/>
		</struct>
		<struct name="GdkGL_GL_INGR_blend_func_separate">
			<field name="glBlendFuncSeparateINGR" type="GdkGLProc_glBlendFuncSeparateINGR"/>
		</struct>
		<struct name="GdkGL_GL_INTEL_parallel_arrays">
			<field name="glVertexPointervINTEL" type="GdkGLProc_glVertexPointervINTEL"/>
			<field name="glNormalPointervINTEL" type="GdkGLProc_glNormalPointervINTEL"/>
			<field name="glColorPointervINTEL" type="GdkGLProc_glColorPointervINTEL"/>
			<field name="glTexCoordPointervINTEL" type="GdkGLProc_glTexCoordPointervINTEL"/>
		</struct>
		<struct name="GdkGL_GL_KTX_buffer_region">
			<field name="glBufferRegionEnabled" type="GdkGLProc_glBufferRegionEnabled"/>
			<field name="glNewBufferRegion" type="GdkGLProc_glNewBufferRegion"/>
			<field name="glDeleteBufferRegion" type="GdkGLProc_glDeleteBufferRegion"/>
			<field name="glReadBufferRegion" type="GdkGLProc_glReadBufferRegion"/>
			<field name="glDrawBufferRegion" type="GdkGLProc_glDrawBufferRegion"/>
		</struct>
		<struct name="GdkGL_GL_MESA_resize_buffers">
			<field name="glResizeBuffersMESA" type="GdkGLProc_glResizeBuffersMESA"/>
		</struct>
		<struct name="GdkGL_GL_MESA_window_pos">
			<field name="glWindowPos2dMESA" type="GdkGLProc_glWindowPos2dMESA"/>
			<field name="glWindowPos2dvMESA" type="GdkGLProc_glWindowPos2dvMESA"/>
			<field name="glWindowPos2fMESA" type="GdkGLProc_glWindowPos2fMESA"/>
			<field name="glWindowPos2fvMESA" type="GdkGLProc_glWindowPos2fvMESA"/>
			<field name="glWindowPos2iMESA" type="GdkGLProc_glWindowPos2iMESA"/>
			<field name="glWindowPos2ivMESA" type="GdkGLProc_glWindowPos2ivMESA"/>
			<field name="glWindowPos2sMESA" type="GdkGLProc_glWindowPos2sMESA"/>
			<field name="glWindowPos2svMESA" type="GdkGLProc_glWindowPos2svMESA"/>
			<field name="glWindowPos3dMESA" type="GdkGLProc_glWindowPos3dMESA"/>
			<field name="glWindowPos3dvMESA" type="GdkGLProc_glWindowPos3dvMESA"/>
			<field name="glWindowPos3fMESA" type="GdkGLProc_glWindowPos3fMESA"/>
			<field name="glWindowPos3fvMESA" type="GdkGLProc_glWindowPos3fvMESA"/>
			<field name="glWindowPos3iMESA" type="GdkGLProc_glWindowPos3iMESA"/>
			<field name="glWindowPos3ivMESA" type="GdkGLProc_glWindowPos3ivMESA"/>
			<field name="glWindowPos3sMESA" type="GdkGLProc_glWindowPos3sMESA"/>
			<field name="glWindowPos3svMESA" type="GdkGLProc_glWindowPos3svMESA"/>
			<field name="glWindowPos4dMESA" type="GdkGLProc_glWindowPos4dMESA"/>
			<field name="glWindowPos4dvMESA" type="GdkGLProc_glWindowPos4dvMESA"/>
			<field name="glWindowPos4fMESA" type="GdkGLProc_glWindowPos4fMESA"/>
			<field name="glWindowPos4fvMESA" type="GdkGLProc_glWindowPos4fvMESA"/>
			<field name="glWindowPos4iMESA" type="GdkGLProc_glWindowPos4iMESA"/>
			<field name="glWindowPos4ivMESA" type="GdkGLProc_glWindowPos4ivMESA"/>
			<field name="glWindowPos4sMESA" type="GdkGLProc_glWindowPos4sMESA"/>
			<field name="glWindowPos4svMESA" type="GdkGLProc_glWindowPos4svMESA"/>
		</struct>
		<struct name="GdkGL_GL_NV_element_array">
			<field name="glElementPointerNV" type="GdkGLProc_glElementPointerNV"/>
			<field name="glDrawElementArrayNV" type="GdkGLProc_glDrawElementArrayNV"/>
			<field name="glDrawRangeElementArrayNV" type="GdkGLProc_glDrawRangeElementArrayNV"/>
			<field name="glMultiDrawElementArrayNV" type="GdkGLProc_glMultiDrawElementArrayNV"/>
			<field name="glMultiDrawRangeElementArrayNV" type="GdkGLProc_glMultiDrawRangeElementArrayNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_evaluators">
			<field name="glMapControlPointsNV" type="GdkGLProc_glMapControlPointsNV"/>
			<field name="glMapParameterivNV" type="GdkGLProc_glMapParameterivNV"/>
			<field name="glMapParameterfvNV" type="GdkGLProc_glMapParameterfvNV"/>
			<field name="glGetMapControlPointsNV" type="GdkGLProc_glGetMapControlPointsNV"/>
			<field name="glGetMapParameterivNV" type="GdkGLProc_glGetMapParameterivNV"/>
			<field name="glGetMapParameterfvNV" type="GdkGLProc_glGetMapParameterfvNV"/>
			<field name="glGetMapAttribParameterivNV" type="GdkGLProc_glGetMapAttribParameterivNV"/>
			<field name="glGetMapAttribParameterfvNV" type="GdkGLProc_glGetMapAttribParameterfvNV"/>
			<field name="glEvalMapsNV" type="GdkGLProc_glEvalMapsNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_fence">
			<field name="glDeleteFencesNV" type="GdkGLProc_glDeleteFencesNV"/>
			<field name="glGenFencesNV" type="GdkGLProc_glGenFencesNV"/>
			<field name="glIsFenceNV" type="GdkGLProc_glIsFenceNV"/>
			<field name="glTestFenceNV" type="GdkGLProc_glTestFenceNV"/>
			<field name="glGetFenceivNV" type="GdkGLProc_glGetFenceivNV"/>
			<field name="glFinishFenceNV" type="GdkGLProc_glFinishFenceNV"/>
			<field name="glSetFenceNV" type="GdkGLProc_glSetFenceNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_fragment_program">
			<field name="glProgramNamedParameter4fNV" type="GdkGLProc_glProgramNamedParameter4fNV"/>
			<field name="glProgramNamedParameter4dNV" type="GdkGLProc_glProgramNamedParameter4dNV"/>
			<field name="glProgramNamedParameter4fvNV" type="GdkGLProc_glProgramNamedParameter4fvNV"/>
			<field name="glProgramNamedParameter4dvNV" type="GdkGLProc_glProgramNamedParameter4dvNV"/>
			<field name="glGetProgramNamedParameterfvNV" type="GdkGLProc_glGetProgramNamedParameterfvNV"/>
			<field name="glGetProgramNamedParameterdvNV" type="GdkGLProc_glGetProgramNamedParameterdvNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_half_float">
			<field name="glVertex2hNV" type="GdkGLProc_glVertex2hNV"/>
			<field name="glVertex2hvNV" type="GdkGLProc_glVertex2hvNV"/>
			<field name="glVertex3hNV" type="GdkGLProc_glVertex3hNV"/>
			<field name="glVertex3hvNV" type="GdkGLProc_glVertex3hvNV"/>
			<field name="glVertex4hNV" type="GdkGLProc_glVertex4hNV"/>
			<field name="glVertex4hvNV" type="GdkGLProc_glVertex4hvNV"/>
			<field name="glNormal3hNV" type="GdkGLProc_glNormal3hNV"/>
			<field name="glNormal3hvNV" type="GdkGLProc_glNormal3hvNV"/>
			<field name="glColor3hNV" type="GdkGLProc_glColor3hNV"/>
			<field name="glColor3hvNV" type="GdkGLProc_glColor3hvNV"/>
			<field name="glColor4hNV" type="GdkGLProc_glColor4hNV"/>
			<field name="glColor4hvNV" type="GdkGLProc_glColor4hvNV"/>
			<field name="glTexCoord1hNV" type="GdkGLProc_glTexCoord1hNV"/>
			<field name="glTexCoord1hvNV" type="GdkGLProc_glTexCoord1hvNV"/>
			<field name="glTexCoord2hNV" type="GdkGLProc_glTexCoord2hNV"/>
			<field name="glTexCoord2hvNV" type="GdkGLProc_glTexCoord2hvNV"/>
			<field name="glTexCoord3hNV" type="GdkGLProc_glTexCoord3hNV"/>
			<field name="glTexCoord3hvNV" type="GdkGLProc_glTexCoord3hvNV"/>
			<field name="glTexCoord4hNV" type="GdkGLProc_glTexCoord4hNV"/>
			<field name="glTexCoord4hvNV" type="GdkGLProc_glTexCoord4hvNV"/>
			<field name="glMultiTexCoord1hNV" type="GdkGLProc_glMultiTexCoord1hNV"/>
			<field name="glMultiTexCoord1hvNV" type="GdkGLProc_glMultiTexCoord1hvNV"/>
			<field name="glMultiTexCoord2hNV" type="GdkGLProc_glMultiTexCoord2hNV"/>
			<field name="glMultiTexCoord2hvNV" type="GdkGLProc_glMultiTexCoord2hvNV"/>
			<field name="glMultiTexCoord3hNV" type="GdkGLProc_glMultiTexCoord3hNV"/>
			<field name="glMultiTexCoord3hvNV" type="GdkGLProc_glMultiTexCoord3hvNV"/>
			<field name="glMultiTexCoord4hNV" type="GdkGLProc_glMultiTexCoord4hNV"/>
			<field name="glMultiTexCoord4hvNV" type="GdkGLProc_glMultiTexCoord4hvNV"/>
			<field name="glFogCoordhNV" type="GdkGLProc_glFogCoordhNV"/>
			<field name="glFogCoordhvNV" type="GdkGLProc_glFogCoordhvNV"/>
			<field name="glSecondaryColor3hNV" type="GdkGLProc_glSecondaryColor3hNV"/>
			<field name="glSecondaryColor3hvNV" type="GdkGLProc_glSecondaryColor3hvNV"/>
			<field name="glVertexWeighthNV" type="GdkGLProc_glVertexWeighthNV"/>
			<field name="glVertexWeighthvNV" type="GdkGLProc_glVertexWeighthvNV"/>
			<field name="glVertexAttrib1hNV" type="GdkGLProc_glVertexAttrib1hNV"/>
			<field name="glVertexAttrib1hvNV" type="GdkGLProc_glVertexAttrib1hvNV"/>
			<field name="glVertexAttrib2hNV" type="GdkGLProc_glVertexAttrib2hNV"/>
			<field name="glVertexAttrib2hvNV" type="GdkGLProc_glVertexAttrib2hvNV"/>
			<field name="glVertexAttrib3hNV" type="GdkGLProc_glVertexAttrib3hNV"/>
			<field name="glVertexAttrib3hvNV" type="GdkGLProc_glVertexAttrib3hvNV"/>
			<field name="glVertexAttrib4hNV" type="GdkGLProc_glVertexAttrib4hNV"/>
			<field name="glVertexAttrib4hvNV" type="GdkGLProc_glVertexAttrib4hvNV"/>
			<field name="glVertexAttribs1hvNV" type="GdkGLProc_glVertexAttribs1hvNV"/>
			<field name="glVertexAttribs2hvNV" type="GdkGLProc_glVertexAttribs2hvNV"/>
			<field name="glVertexAttribs3hvNV" type="GdkGLProc_glVertexAttribs3hvNV"/>
			<field name="glVertexAttribs4hvNV" type="GdkGLProc_glVertexAttribs4hvNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_occlusion_query">
			<field name="glGenOcclusionQueriesNV" type="GdkGLProc_glGenOcclusionQueriesNV"/>
			<field name="glDeleteOcclusionQueriesNV" type="GdkGLProc_glDeleteOcclusionQueriesNV"/>
			<field name="glIsOcclusionQueryNV" type="GdkGLProc_glIsOcclusionQueryNV"/>
			<field name="glBeginOcclusionQueryNV" type="GdkGLProc_glBeginOcclusionQueryNV"/>
			<field name="glEndOcclusionQueryNV" type="GdkGLProc_glEndOcclusionQueryNV"/>
			<field name="glGetOcclusionQueryivNV" type="GdkGLProc_glGetOcclusionQueryivNV"/>
			<field name="glGetOcclusionQueryuivNV" type="GdkGLProc_glGetOcclusionQueryuivNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_pixel_data_range">
			<field name="glPixelDataRangeNV" type="GdkGLProc_glPixelDataRangeNV"/>
			<field name="glFlushPixelDataRangeNV" type="GdkGLProc_glFlushPixelDataRangeNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_point_sprite">
			<field name="glPointParameteriNV" type="GdkGLProc_glPointParameteriNV"/>
			<field name="glPointParameterivNV" type="GdkGLProc_glPointParameterivNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_primitive_restart">
			<field name="glPrimitiveRestartNV" type="GdkGLProc_glPrimitiveRestartNV"/>
			<field name="glPrimitiveRestartIndexNV" type="GdkGLProc_glPrimitiveRestartIndexNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_register_combiners">
			<field name="glCombinerParameterfvNV" type="GdkGLProc_glCombinerParameterfvNV"/>
			<field name="glCombinerParameterfNV" type="GdkGLProc_glCombinerParameterfNV"/>
			<field name="glCombinerParameterivNV" type="GdkGLProc_glCombinerParameterivNV"/>
			<field name="glCombinerParameteriNV" type="GdkGLProc_glCombinerParameteriNV"/>
			<field name="glCombinerInputNV" type="GdkGLProc_glCombinerInputNV"/>
			<field name="glCombinerOutputNV" type="GdkGLProc_glCombinerOutputNV"/>
			<field name="glFinalCombinerInputNV" type="GdkGLProc_glFinalCombinerInputNV"/>
			<field name="glGetCombinerInputParameterfvNV" type="GdkGLProc_glGetCombinerInputParameterfvNV"/>
			<field name="glGetCombinerInputParameterivNV" type="GdkGLProc_glGetCombinerInputParameterivNV"/>
			<field name="glGetCombinerOutputParameterfvNV" type="GdkGLProc_glGetCombinerOutputParameterfvNV"/>
			<field name="glGetCombinerOutputParameterivNV" type="GdkGLProc_glGetCombinerOutputParameterivNV"/>
			<field name="glGetFinalCombinerInputParameterfvNV" type="GdkGLProc_glGetFinalCombinerInputParameterfvNV"/>
			<field name="glGetFinalCombinerInputParameterivNV" type="GdkGLProc_glGetFinalCombinerInputParameterivNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_register_combiners2">
			<field name="glCombinerStageParameterfvNV" type="GdkGLProc_glCombinerStageParameterfvNV"/>
			<field name="glGetCombinerStageParameterfvNV" type="GdkGLProc_glGetCombinerStageParameterfvNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_stencil_two_side">
			<field name="glActiveStencilFaceNV" type="GdkGLProc_glActiveStencilFaceNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_vertex_array_range">
			<field name="glFlushVertexArrayRangeNV" type="GdkGLProc_glFlushVertexArrayRangeNV"/>
			<field name="glVertexArrayRangeNV" type="GdkGLProc_glVertexArrayRangeNV"/>
		</struct>
		<struct name="GdkGL_GL_NV_vertex_program">
			<field name="glAreProgramsResidentNV" type="GdkGLProc_glAreProgramsResidentNV"/>
			<field name="glBindProgramNV" type="GdkGLProc_glBindProgramNV"/>
			<field name="glDeleteProgramsNV" type="GdkGLProc_glDeleteProgramsNV"/>
			<field name="glExecuteProgramNV" type="GdkGLProc_glExecuteProgramNV"/>
			<field name="glGenProgramsNV" type="GdkGLProc_glGenProgramsNV"/>
			<field name="glGetProgramParameterdvNV" type="GdkGLProc_glGetProgramParameterdvNV"/>
			<field name="glGetProgramParameterfvNV" type="GdkGLProc_glGetProgramParameterfvNV"/>
			<field name="glGetProgramivNV" type="GdkGLProc_glGetProgramivNV"/>
			<field name="glGetProgramStringNV" type="GdkGLProc_glGetProgramStringNV"/>
			<field name="glGetTrackMatrixivNV" type="GdkGLProc_glGetTrackMatrixivNV"/>
			<field name="glGetVertexAttribdvNV" type="GdkGLProc_glGetVertexAttribdvNV"/>
			<field name="glGetVertexAttribfvNV" type="GdkGLProc_glGetVertexAttribfvNV"/>
			<field name="glGetVertexAttribivNV" type="GdkGLProc_glGetVertexAttribivNV"/>
			<field name="glGetVertexAttribPointervNV" type="GdkGLProc_glGetVertexAttribPointervNV"/>
			<field name="glIsProgramNV" type="GdkGLProc_glIsProgramNV"/>
			<field name="glLoadProgramNV" type="GdkGLProc_glLoadProgramNV"/>
			<field name="glProgramParameter4dNV" type="GdkGLProc_glProgramParameter4dNV"/>
			<field name="glProgramParameter4dvNV" type="GdkGLProc_glProgramParameter4dvNV"/>
			<field name="glProgramParameter4fNV" type="GdkGLProc_glProgramParameter4fNV"/>
			<field name="glProgramParameter4fvNV" type="GdkGLProc_glProgramParameter4fvNV"/>
			<field name="glProgramParameters4dvNV" type="GdkGLProc_glProgramParameters4dvNV"/>
			<field name="glProgramParameters4fvNV" type="GdkGLProc_glProgramParameters4fvNV"/>
			<field name="glRequestResidentProgramsNV" type="GdkGLProc_glRequestResidentProgramsNV"/>
			<field name="glTrackMatrixNV" type="GdkGLProc_glTrackMatrixNV"/>
			<field name="glVertexAttribPointerNV" type="GdkGLProc_glVertexAttribPointerNV"/>
			<field name="glVertexAttrib1dNV" type="GdkGLProc_glVertexAttrib1dNV"/>
			<field name="glVertexAttrib1dvNV" type="GdkGLProc_glVertexAttrib1dvNV"/>
			<field name="glVertexAttrib1fNV" type="GdkGLProc_glVertexAttrib1fNV"/>
			<field name="glVertexAttrib1fvNV" type="GdkGLProc_glVertexAttrib1fvNV"/>
			<field name="glVertexAttrib1sNV" type="GdkGLProc_glVertexAttrib1sNV"/>
			<field name="glVertexAttrib1svNV" type="GdkGLProc_glVertexAttrib1svNV"/>
			<field name="glVertexAttrib2dNV" type="GdkGLProc_glVertexAttrib2dNV"/>
			<field name="glVertexAttrib2dvNV" type="GdkGLProc_glVertexAttrib2dvNV"/>
			<field name="glVertexAttrib2fNV" type="GdkGLProc_glVertexAttrib2fNV"/>
			<field name="glVertexAttrib2fvNV" type="GdkGLProc_glVertexAttrib2fvNV"/>
			<field name="glVertexAttrib2sNV" type="GdkGLProc_glVertexAttrib2sNV"/>
			<field name="glVertexAttrib2svNV" type="GdkGLProc_glVertexAttrib2svNV"/>
			<field name="glVertexAttrib3dNV" type="GdkGLProc_glVertexAttrib3dNV"/>
			<field name="glVertexAttrib3dvNV" type="GdkGLProc_glVertexAttrib3dvNV"/>
			<field name="glVertexAttrib3fNV" type="GdkGLProc_glVertexAttrib3fNV"/>
			<field name="glVertexAttrib3fvNV" type="GdkGLProc_glVertexAttrib3fvNV"/>
			<field name="glVertexAttrib3sNV" type="GdkGLProc_glVertexAttrib3sNV"/>
			<field name="glVertexAttrib3svNV" type="GdkGLProc_glVertexAttrib3svNV"/>
			<field name="glVertexAttrib4dNV" type="GdkGLProc_glVertexAttrib4dNV"/>
			<field name="glVertexAttrib4dvNV" type="GdkGLProc_glVertexAttrib4dvNV"/>
			<field name="glVertexAttrib4fNV" type="GdkGLProc_glVertexAttrib4fNV"/>
			<field name="glVertexAttrib4fvNV" type="GdkGLProc_glVertexAttrib4fvNV"/>
			<field name="glVertexAttrib4sNV" type="GdkGLProc_glVertexAttrib4sNV"/>
			<field name="glVertexAttrib4svNV" type="GdkGLProc_glVertexAttrib4svNV"/>
			<field name="glVertexAttrib4ubNV" type="GdkGLProc_glVertexAttrib4ubNV"/>
			<field name="glVertexAttrib4ubvNV" type="GdkGLProc_glVertexAttrib4ubvNV"/>
			<field name="glVertexAttribs1dvNV" type="GdkGLProc_glVertexAttribs1dvNV"/>
			<field name="glVertexAttribs1fvNV" type="GdkGLProc_glVertexAttribs1fvNV"/>
			<field name="glVertexAttribs1svNV" type="GdkGLProc_glVertexAttribs1svNV"/>
			<field name="glVertexAttribs2dvNV" type="GdkGLProc_glVertexAttribs2dvNV"/>
			<field name="glVertexAttribs2fvNV" type="GdkGLProc_glVertexAttribs2fvNV"/>
			<field name="glVertexAttribs2svNV" type="GdkGLProc_glVertexAttribs2svNV"/>
			<field name="glVertexAttribs3dvNV" type="GdkGLProc_glVertexAttribs3dvNV"/>
			<field name="glVertexAttribs3fvNV" type="GdkGLProc_glVertexAttribs3fvNV"/>
			<field name="glVertexAttribs3svNV" type="GdkGLProc_glVertexAttribs3svNV"/>
			<field name="glVertexAttribs4dvNV" type="GdkGLProc_glVertexAttribs4dvNV"/>
			<field name="glVertexAttribs4fvNV" type="GdkGLProc_glVertexAttribs4fvNV"/>
			<field name="glVertexAttribs4svNV" type="GdkGLProc_glVertexAttribs4svNV"/>
			<field name="glVertexAttribs4ubvNV" type="GdkGLProc_glVertexAttribs4ubvNV"/>
		</struct>
		<struct name="GdkGL_GL_PGI_misc_hints">
			<field name="glHintPGI" type="GdkGLProc_glHintPGI"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_detail_texture">
			<field name="glDetailTexFuncSGIS" type="GdkGLProc_glDetailTexFuncSGIS"/>
			<field name="glGetDetailTexFuncSGIS" type="GdkGLProc_glGetDetailTexFuncSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_fog_function">
			<field name="glFogFuncSGIS" type="GdkGLProc_glFogFuncSGIS"/>
			<field name="glGetFogFuncSGIS" type="GdkGLProc_glGetFogFuncSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_multisample">
			<field name="glSampleMaskSGIS" type="GdkGLProc_glSampleMaskSGIS"/>
			<field name="glSamplePatternSGIS" type="GdkGLProc_glSamplePatternSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_multitexture">
			<field name="glMultiTexCoord1dSGIS" type="GdkGLProc_glMultiTexCoord1dSGIS"/>
			<field name="glMultiTexCoord1dvSGIS" type="GdkGLProc_glMultiTexCoord1dvSGIS"/>
			<field name="glMultiTexCoord1fSGIS" type="GdkGLProc_glMultiTexCoord1fSGIS"/>
			<field name="glMultiTexCoord1fvSGIS" type="GdkGLProc_glMultiTexCoord1fvSGIS"/>
			<field name="glMultiTexCoord1iSGIS" type="GdkGLProc_glMultiTexCoord1iSGIS"/>
			<field name="glMultiTexCoord1ivSGIS" type="GdkGLProc_glMultiTexCoord1ivSGIS"/>
			<field name="glMultiTexCoord1sSGIS" type="GdkGLProc_glMultiTexCoord1sSGIS"/>
			<field name="glMultiTexCoord1svSGIS" type="GdkGLProc_glMultiTexCoord1svSGIS"/>
			<field name="glMultiTexCoord2dSGIS" type="GdkGLProc_glMultiTexCoord2dSGIS"/>
			<field name="glMultiTexCoord2dvSGIS" type="GdkGLProc_glMultiTexCoord2dvSGIS"/>
			<field name="glMultiTexCoord2fSGIS" type="GdkGLProc_glMultiTexCoord2fSGIS"/>
			<field name="glMultiTexCoord2fvSGIS" type="GdkGLProc_glMultiTexCoord2fvSGIS"/>
			<field name="glMultiTexCoord2iSGIS" type="GdkGLProc_glMultiTexCoord2iSGIS"/>
			<field name="glMultiTexCoord2ivSGIS" type="GdkGLProc_glMultiTexCoord2ivSGIS"/>
			<field name="glMultiTexCoord2sSGIS" type="GdkGLProc_glMultiTexCoord2sSGIS"/>
			<field name="glMultiTexCoord2svSGIS" type="GdkGLProc_glMultiTexCoord2svSGIS"/>
			<field name="glMultiTexCoord3dSGIS" type="GdkGLProc_glMultiTexCoord3dSGIS"/>
			<field name="glMultiTexCoord3dvSGIS" type="GdkGLProc_glMultiTexCoord3dvSGIS"/>
			<field name="glMultiTexCoord3fSGIS" type="GdkGLProc_glMultiTexCoord3fSGIS"/>
			<field name="glMultiTexCoord3fvSGIS" type="GdkGLProc_glMultiTexCoord3fvSGIS"/>
			<field name="glMultiTexCoord3iSGIS" type="GdkGLProc_glMultiTexCoord3iSGIS"/>
			<field name="glMultiTexCoord3ivSGIS" type="GdkGLProc_glMultiTexCoord3ivSGIS"/>
			<field name="glMultiTexCoord3sSGIS" type="GdkGLProc_glMultiTexCoord3sSGIS"/>
			<field name="glMultiTexCoord3svSGIS" type="GdkGLProc_glMultiTexCoord3svSGIS"/>
			<field name="glMultiTexCoord4dSGIS" type="GdkGLProc_glMultiTexCoord4dSGIS"/>
			<field name="glMultiTexCoord4dvSGIS" type="GdkGLProc_glMultiTexCoord4dvSGIS"/>
			<field name="glMultiTexCoord4fSGIS" type="GdkGLProc_glMultiTexCoord4fSGIS"/>
			<field name="glMultiTexCoord4fvSGIS" type="GdkGLProc_glMultiTexCoord4fvSGIS"/>
			<field name="glMultiTexCoord4iSGIS" type="GdkGLProc_glMultiTexCoord4iSGIS"/>
			<field name="glMultiTexCoord4ivSGIS" type="GdkGLProc_glMultiTexCoord4ivSGIS"/>
			<field name="glMultiTexCoord4sSGIS" type="GdkGLProc_glMultiTexCoord4sSGIS"/>
			<field name="glMultiTexCoord4svSGIS" type="GdkGLProc_glMultiTexCoord4svSGIS"/>
			<field name="glMultiTexCoordPointerSGIS" type="GdkGLProc_glMultiTexCoordPointerSGIS"/>
			<field name="glSelectTextureSGIS" type="GdkGLProc_glSelectTextureSGIS"/>
			<field name="glSelectTextureCoordSetSGIS" type="GdkGLProc_glSelectTextureCoordSetSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_pixel_texture">
			<field name="glPixelTexGenParameteriSGIS" type="GdkGLProc_glPixelTexGenParameteriSGIS"/>
			<field name="glPixelTexGenParameterivSGIS" type="GdkGLProc_glPixelTexGenParameterivSGIS"/>
			<field name="glPixelTexGenParameterfSGIS" type="GdkGLProc_glPixelTexGenParameterfSGIS"/>
			<field name="glPixelTexGenParameterfvSGIS" type="GdkGLProc_glPixelTexGenParameterfvSGIS"/>
			<field name="glGetPixelTexGenParameterivSGIS" type="GdkGLProc_glGetPixelTexGenParameterivSGIS"/>
			<field name="glGetPixelTexGenParameterfvSGIS" type="GdkGLProc_glGetPixelTexGenParameterfvSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_point_parameters">
			<field name="glPointParameterfSGIS" type="GdkGLProc_glPointParameterfSGIS"/>
			<field name="glPointParameterfvSGIS" type="GdkGLProc_glPointParameterfvSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_sharpen_texture">
			<field name="glSharpenTexFuncSGIS" type="GdkGLProc_glSharpenTexFuncSGIS"/>
			<field name="glGetSharpenTexFuncSGIS" type="GdkGLProc_glGetSharpenTexFuncSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_texture4D">
			<field name="glTexImage4DSGIS" type="GdkGLProc_glTexImage4DSGIS"/>
			<field name="glTexSubImage4DSGIS" type="GdkGLProc_glTexSubImage4DSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_texture_color_mask">
			<field name="glTextureColorMaskSGIS" type="GdkGLProc_glTextureColorMaskSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIS_texture_filter4">
			<field name="glGetTexFilterFuncSGIS" type="GdkGLProc_glGetTexFilterFuncSGIS"/>
			<field name="glTexFilterFuncSGIS" type="GdkGLProc_glTexFilterFuncSGIS"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_async">
			<field name="glAsyncMarkerSGIX" type="GdkGLProc_glAsyncMarkerSGIX"/>
			<field name="glFinishAsyncSGIX" type="GdkGLProc_glFinishAsyncSGIX"/>
			<field name="glPollAsyncSGIX" type="GdkGLProc_glPollAsyncSGIX"/>
			<field name="glGenAsyncMarkersSGIX" type="GdkGLProc_glGenAsyncMarkersSGIX"/>
			<field name="glDeleteAsyncMarkersSGIX" type="GdkGLProc_glDeleteAsyncMarkersSGIX"/>
			<field name="glIsAsyncMarkerSGIX" type="GdkGLProc_glIsAsyncMarkerSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_flush_raster">
			<field name="glFlushRasterSGIX" type="GdkGLProc_glFlushRasterSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_fog_texture">
			<field name="glTextureFogSGIX" type="GdkGLProc_glTextureFogSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_fragment_lighting">
			<field name="glFragmentColorMaterialSGIX" type="GdkGLProc_glFragmentColorMaterialSGIX"/>
			<field name="glFragmentLightfSGIX" type="GdkGLProc_glFragmentLightfSGIX"/>
			<field name="glFragmentLightfvSGIX" type="GdkGLProc_glFragmentLightfvSGIX"/>
			<field name="glFragmentLightiSGIX" type="GdkGLProc_glFragmentLightiSGIX"/>
			<field name="glFragmentLightivSGIX" type="GdkGLProc_glFragmentLightivSGIX"/>
			<field name="glFragmentLightModelfSGIX" type="GdkGLProc_glFragmentLightModelfSGIX"/>
			<field name="glFragmentLightModelfvSGIX" type="GdkGLProc_glFragmentLightModelfvSGIX"/>
			<field name="glFragmentLightModeliSGIX" type="GdkGLProc_glFragmentLightModeliSGIX"/>
			<field name="glFragmentLightModelivSGIX" type="GdkGLProc_glFragmentLightModelivSGIX"/>
			<field name="glFragmentMaterialfSGIX" type="GdkGLProc_glFragmentMaterialfSGIX"/>
			<field name="glFragmentMaterialfvSGIX" type="GdkGLProc_glFragmentMaterialfvSGIX"/>
			<field name="glFragmentMaterialiSGIX" type="GdkGLProc_glFragmentMaterialiSGIX"/>
			<field name="glFragmentMaterialivSGIX" type="GdkGLProc_glFragmentMaterialivSGIX"/>
			<field name="glGetFragmentLightfvSGIX" type="GdkGLProc_glGetFragmentLightfvSGIX"/>
			<field name="glGetFragmentLightivSGIX" type="GdkGLProc_glGetFragmentLightivSGIX"/>
			<field name="glGetFragmentMaterialfvSGIX" type="GdkGLProc_glGetFragmentMaterialfvSGIX"/>
			<field name="glGetFragmentMaterialivSGIX" type="GdkGLProc_glGetFragmentMaterialivSGIX"/>
			<field name="glLightEnviSGIX" type="GdkGLProc_glLightEnviSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_framezoom">
			<field name="glFrameZoomSGIX" type="GdkGLProc_glFrameZoomSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_igloo_interface">
			<field name="glIglooInterfaceSGIX" type="GdkGLProc_glIglooInterfaceSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_instruments">
			<field name="glGetInstrumentsSGIX" type="GdkGLProc_glGetInstrumentsSGIX"/>
			<field name="glInstrumentsBufferSGIX" type="GdkGLProc_glInstrumentsBufferSGIX"/>
			<field name="glPollInstrumentsSGIX" type="GdkGLProc_glPollInstrumentsSGIX"/>
			<field name="glReadInstrumentsSGIX" type="GdkGLProc_glReadInstrumentsSGIX"/>
			<field name="glStartInstrumentsSGIX" type="GdkGLProc_glStartInstrumentsSGIX"/>
			<field name="glStopInstrumentsSGIX" type="GdkGLProc_glStopInstrumentsSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_list_priority">
			<field name="glGetListParameterfvSGIX" type="GdkGLProc_glGetListParameterfvSGIX"/>
			<field name="glGetListParameterivSGIX" type="GdkGLProc_glGetListParameterivSGIX"/>
			<field name="glListParameterfSGIX" type="GdkGLProc_glListParameterfSGIX"/>
			<field name="glListParameterfvSGIX" type="GdkGLProc_glListParameterfvSGIX"/>
			<field name="glListParameteriSGIX" type="GdkGLProc_glListParameteriSGIX"/>
			<field name="glListParameterivSGIX" type="GdkGLProc_glListParameterivSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_pixel_texture">
			<field name="glPixelTexGenSGIX" type="GdkGLProc_glPixelTexGenSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_polynomial_ffd">
			<field name="glDeformationMap3dSGIX" type="GdkGLProc_glDeformationMap3dSGIX"/>
			<field name="glDeformationMap3fSGIX" type="GdkGLProc_glDeformationMap3fSGIX"/>
			<field name="glDeformSGIX" type="GdkGLProc_glDeformSGIX"/>
			<field name="glLoadIdentityDeformationMapSGIX" type="GdkGLProc_glLoadIdentityDeformationMapSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_reference_plane">
			<field name="glReferencePlaneSGIX" type="GdkGLProc_glReferencePlaneSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_sprite">
			<field name="glSpriteParameterfSGIX" type="GdkGLProc_glSpriteParameterfSGIX"/>
			<field name="glSpriteParameterfvSGIX" type="GdkGLProc_glSpriteParameterfvSGIX"/>
			<field name="glSpriteParameteriSGIX" type="GdkGLProc_glSpriteParameteriSGIX"/>
			<field name="glSpriteParameterivSGIX" type="GdkGLProc_glSpriteParameterivSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGIX_tag_sample_buffer">
			<field name="glTagSampleBufferSGIX" type="GdkGLProc_glTagSampleBufferSGIX"/>
		</struct>
		<struct name="GdkGL_GL_SGI_color_table">
			<field name="glColorTableSGI" type="GdkGLProc_glColorTableSGI"/>
			<field name="glColorTableParameterfvSGI" type="GdkGLProc_glColorTableParameterfvSGI"/>
			<field name="glColorTableParameterivSGI" type="GdkGLProc_glColorTableParameterivSGI"/>
			<field name="glCopyColorTableSGI" type="GdkGLProc_glCopyColorTableSGI"/>
			<field name="glGetColorTableSGI" type="GdkGLProc_glGetColorTableSGI"/>
			<field name="glGetColorTableParameterfvSGI" type="GdkGLProc_glGetColorTableParameterfvSGI"/>
			<field name="glGetColorTableParameterivSGI" type="GdkGLProc_glGetColorTableParameterivSGI"/>
		</struct>
		<struct name="GdkGL_GL_SUNX_constant_data">
			<field name="glFinishTextureSUNX" type="GdkGLProc_glFinishTextureSUNX"/>
		</struct>
		<struct name="GdkGL_GL_SUN_global_alpha">
			<field name="glGlobalAlphaFactorbSUN" type="GdkGLProc_glGlobalAlphaFactorbSUN"/>
			<field name="glGlobalAlphaFactorsSUN" type="GdkGLProc_glGlobalAlphaFactorsSUN"/>
			<field name="glGlobalAlphaFactoriSUN" type="GdkGLProc_glGlobalAlphaFactoriSUN"/>
			<field name="glGlobalAlphaFactorfSUN" type="GdkGLProc_glGlobalAlphaFactorfSUN"/>
			<field name="glGlobalAlphaFactordSUN" type="GdkGLProc_glGlobalAlphaFactordSUN"/>
			<field name="glGlobalAlphaFactorubSUN" type="GdkGLProc_glGlobalAlphaFactorubSUN"/>
			<field name="glGlobalAlphaFactorusSUN" type="GdkGLProc_glGlobalAlphaFactorusSUN"/>
			<field name="glGlobalAlphaFactoruiSUN" type="GdkGLProc_glGlobalAlphaFactoruiSUN"/>
		</struct>
		<struct name="GdkGL_GL_SUN_mesh_array">
			<field name="glDrawMeshArraysSUN" type="GdkGLProc_glDrawMeshArraysSUN"/>
		</struct>
		<struct name="GdkGL_GL_SUN_multi_draw_arrays">
			<field name="glMultiDrawArraysSUN" type="GdkGLProc_glMultiDrawArraysSUN"/>
			<field name="glMultiDrawElementsSUN" type="GdkGLProc_glMultiDrawElementsSUN"/>
		</struct>
		<struct name="GdkGL_GL_SUN_triangle_list">
			<field name="glReplacementCodeuiSUN" type="GdkGLProc_glReplacementCodeuiSUN"/>
			<field name="glReplacementCodeusSUN" type="GdkGLProc_glReplacementCodeusSUN"/>
			<field name="glReplacementCodeubSUN" type="GdkGLProc_glReplacementCodeubSUN"/>
			<field name="glReplacementCodeuivSUN" type="GdkGLProc_glReplacementCodeuivSUN"/>
			<field name="glReplacementCodeusvSUN" type="GdkGLProc_glReplacementCodeusvSUN"/>
			<field name="glReplacementCodeubvSUN" type="GdkGLProc_glReplacementCodeubvSUN"/>
			<field name="glReplacementCodePointerSUN" type="GdkGLProc_glReplacementCodePointerSUN"/>
		</struct>
		<struct name="GdkGL_GL_SUN_vertex">
			<field name="glColor4ubVertex2fSUN" type="GdkGLProc_glColor4ubVertex2fSUN"/>
			<field name="glColor4ubVertex2fvSUN" type="GdkGLProc_glColor4ubVertex2fvSUN"/>
			<field name="glColor4ubVertex3fSUN" type="GdkGLProc_glColor4ubVertex3fSUN"/>
			<field name="glColor4ubVertex3fvSUN" type="GdkGLProc_glColor4ubVertex3fvSUN"/>
			<field name="glColor3fVertex3fSUN" type="GdkGLProc_glColor3fVertex3fSUN"/>
			<field name="glColor3fVertex3fvSUN" type="GdkGLProc_glColor3fVertex3fvSUN"/>
			<field name="glNormal3fVertex3fSUN" type="GdkGLProc_glNormal3fVertex3fSUN"/>
			<field name="glNormal3fVertex3fvSUN" type="GdkGLProc_glNormal3fVertex3fvSUN"/>
			<field name="glColor4fNormal3fVertex3fSUN" type="GdkGLProc_glColor4fNormal3fVertex3fSUN"/>
			<field name="glColor4fNormal3fVertex3fvSUN" type="GdkGLProc_glColor4fNormal3fVertex3fvSUN"/>
			<field name="glTexCoord2fVertex3fSUN" type="GdkGLProc_glTexCoord2fVertex3fSUN"/>
			<field name="glTexCoord2fVertex3fvSUN" type="GdkGLProc_glTexCoord2fVertex3fvSUN"/>
			<field name="glTexCoord4fVertex4fSUN" type="GdkGLProc_glTexCoord4fVertex4fSUN"/>
			<field name="glTexCoord4fVertex4fvSUN" type="GdkGLProc_glTexCoord4fVertex4fvSUN"/>
			<field name="glTexCoord2fColor4ubVertex3fSUN" type="GdkGLProc_glTexCoord2fColor4ubVertex3fSUN"/>
			<field name="glTexCoord2fColor4ubVertex3fvSUN" type="GdkGLProc_glTexCoord2fColor4ubVertex3fvSUN"/>
			<field name="glTexCoord2fColor3fVertex3fSUN" type="GdkGLProc_glTexCoord2fColor3fVertex3fSUN"/>
			<field name="glTexCoord2fColor3fVertex3fvSUN" type="GdkGLProc_glTexCoord2fColor3fVertex3fvSUN"/>
			<field name="glTexCoord2fNormal3fVertex3fSUN" type="GdkGLProc_glTexCoord2fNormal3fVertex3fSUN"/>
			<field name="glTexCoord2fNormal3fVertex3fvSUN" type="GdkGLProc_glTexCoord2fNormal3fVertex3fvSUN"/>
			<field name="glTexCoord2fColor4fNormal3fVertex3fSUN" type="GdkGLProc_glTexCoord2fColor4fNormal3fVertex3fSUN"/>
			<field name="glTexCoord2fColor4fNormal3fVertex3fvSUN" type="GdkGLProc_glTexCoord2fColor4fNormal3fVertex3fvSUN"/>
			<field name="glTexCoord4fColor4fNormal3fVertex4fSUN" type="GdkGLProc_glTexCoord4fColor4fNormal3fVertex4fSUN"/>
			<field name="glTexCoord4fColor4fNormal3fVertex4fvSUN" type="GdkGLProc_glTexCoord4fColor4fNormal3fVertex4fvSUN"/>
			<field name="glReplacementCodeuiVertex3fSUN" type="GdkGLProc_glReplacementCodeuiVertex3fSUN"/>
			<field name="glReplacementCodeuiVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiVertex3fvSUN"/>
			<field name="glReplacementCodeuiColor4ubVertex3fSUN" type="GdkGLProc_glReplacementCodeuiColor4ubVertex3fSUN"/>
			<field name="glReplacementCodeuiColor4ubVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiColor4ubVertex3fvSUN"/>
			<field name="glReplacementCodeuiColor3fVertex3fSUN" type="GdkGLProc_glReplacementCodeuiColor3fVertex3fSUN"/>
			<field name="glReplacementCodeuiColor3fVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiColor3fVertex3fvSUN"/>
			<field name="glReplacementCodeuiNormal3fVertex3fSUN" type="GdkGLProc_glReplacementCodeuiNormal3fVertex3fSUN"/>
			<field name="glReplacementCodeuiNormal3fVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiNormal3fVertex3fvSUN"/>
			<field name="glReplacementCodeuiColor4fNormal3fVertex3fSUN" type="GdkGLProc_glReplacementCodeuiColor4fNormal3fVertex3fSUN"/>
			<field name="glReplacementCodeuiColor4fNormal3fVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiColor4fNormal3fVertex3fvSUN"/>
			<field name="glReplacementCodeuiTexCoord2fVertex3fSUN" type="GdkGLProc_glReplacementCodeuiTexCoord2fVertex3fSUN"/>
			<field name="glReplacementCodeuiTexCoord2fVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiTexCoord2fVertex3fvSUN"/>
			<field name="glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN" type="GdkGLProc_glReplacementCodeuiTexCoord2fNormal3fVertex3fSUN"/>
			<field name="glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiTexCoord2fNormal3fVertex3fvSUN"/>
			<field name="glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN" type="GdkGLProc_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fSUN"/>
			<field name="glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN" type="GdkGLProc_glReplacementCodeuiTexCoord2fColor4fNormal3fVertex3fvSUN"/>
		</struct>
		<struct name="GdkGL_GL_VERSION_1_2">
			<field name="glBlendColor" type="GdkGLProc_glBlendColor"/>
			<field name="glBlendEquation" type="GdkGLProc_glBlendEquation"/>
			<field name="glDrawRangeElements" type="GdkGLProc_glDrawRangeElements"/>
			<field name="glColorTable" type="GdkGLProc_glColorTable"/>
			<field name="glColorTableParameterfv" type="GdkGLProc_glColorTableParameterfv"/>
			<field name="glColorTableParameteriv" type="GdkGLProc_glColorTableParameteriv"/>
			<field name="glCopyColorTable" type="GdkGLProc_glCopyColorTable"/>
			<field name="glGetColorTable" type="GdkGLProc_glGetColorTable"/>
			<field name="glGetColorTableParameterfv" type="GdkGLProc_glGetColorTableParameterfv"/>
			<field name="glGetColorTableParameteriv" type="GdkGLProc_glGetColorTableParameteriv"/>
			<field name="glColorSubTable" type="GdkGLProc_glColorSubTable"/>
			<field name="glCopyColorSubTable" type="GdkGLProc_glCopyColorSubTable"/>
			<field name="glConvolutionFilter1D" type="GdkGLProc_glConvolutionFilter1D"/>
			<field name="glConvolutionFilter2D" type="GdkGLProc_glConvolutionFilter2D"/>
			<field name="glConvolutionParameterf" type="GdkGLProc_glConvolutionParameterf"/>
			<field name="glConvolutionParameterfv" type="GdkGLProc_glConvolutionParameterfv"/>
			<field name="glConvolutionParameteri" type="GdkGLProc_glConvolutionParameteri"/>
			<field name="glConvolutionParameteriv" type="GdkGLProc_glConvolutionParameteriv"/>
			<field name="glCopyConvolutionFilter1D" type="GdkGLProc_glCopyConvolutionFilter1D"/>
			<field name="glCopyConvolutionFilter2D" type="GdkGLProc_glCopyConvolutionFilter2D"/>
			<field name="glGetConvolutionFilter" type="GdkGLProc_glGetConvolutionFilter"/>
			<field name="glGetConvolutionParameterfv" type="GdkGLProc_glGetConvolutionParameterfv"/>
			<field name="glGetConvolutionParameteriv" type="GdkGLProc_glGetConvolutionParameteriv"/>
			<field name="glGetSeparableFilter" type="GdkGLProc_glGetSeparableFilter"/>
			<field name="glSeparableFilter2D" type="GdkGLProc_glSeparableFilter2D"/>
			<field name="glGetHistogram" type="GdkGLProc_glGetHistogram"/>
			<field name="glGetHistogramParameterfv" type="GdkGLProc_glGetHistogramParameterfv"/>
			<field name="glGetHistogramParameteriv" type="GdkGLProc_glGetHistogramParameteriv"/>
			<field name="glGetMinmax" type="GdkGLProc_glGetMinmax"/>
			<field name="glGetMinmaxParameterfv" type="GdkGLProc_glGetMinmaxParameterfv"/>
			<field name="glGetMinmaxParameteriv" type="GdkGLProc_glGetMinmaxParameteriv"/>
			<field name="glHistogram" type="GdkGLProc_glHistogram"/>
			<field name="glMinmax" type="GdkGLProc_glMinmax"/>
			<field name="glResetHistogram" type="GdkGLProc_glResetHistogram"/>
			<field name="glResetMinmax" type="GdkGLProc_glResetMinmax"/>
			<field name="glTexImage3D" type="GdkGLProc_glTexImage3D"/>
			<field name="glTexSubImage3D" type="GdkGLProc_glTexSubImage3D"/>
			<field name="glCopyTexSubImage3D" type="GdkGLProc_glCopyTexSubImage3D"/>
		</struct>
		<struct name="GdkGL_GL_VERSION_1_3">
			<field name="glActiveTexture" type="GdkGLProc_glActiveTexture"/>
			<field name="glClientActiveTexture" type="GdkGLProc_glClientActiveTexture"/>
			<field name="glMultiTexCoord1d" type="GdkGLProc_glMultiTexCoord1d"/>
			<field name="glMultiTexCoord1dv" type="GdkGLProc_glMultiTexCoord1dv"/>
			<field name="glMultiTexCoord1f" type="GdkGLProc_glMultiTexCoord1f"/>
			<field name="glMultiTexCoord1fv" type="GdkGLProc_glMultiTexCoord1fv"/>
			<field name="glMultiTexCoord1i" type="GdkGLProc_glMultiTexCoord1i"/>
			<field name="glMultiTexCoord1iv" type="GdkGLProc_glMultiTexCoord1iv"/>
			<field name="glMultiTexCoord1s" type="GdkGLProc_glMultiTexCoord1s"/>
			<field name="glMultiTexCoord1sv" type="GdkGLProc_glMultiTexCoord1sv"/>
			<field name="glMultiTexCoord2d" type="GdkGLProc_glMultiTexCoord2d"/>
			<field name="glMultiTexCoord2dv" type="GdkGLProc_glMultiTexCoord2dv"/>
			<field name="glMultiTexCoord2f" type="GdkGLProc_glMultiTexCoord2f"/>
			<field name="glMultiTexCoord2fv" type="GdkGLProc_glMultiTexCoord2fv"/>
			<field name="glMultiTexCoord2i" type="GdkGLProc_glMultiTexCoord2i"/>
			<field name="glMultiTexCoord2iv" type="GdkGLProc_glMultiTexCoord2iv"/>
			<field name="glMultiTexCoord2s" type="GdkGLProc_glMultiTexCoord2s"/>
			<field name="glMultiTexCoord2sv" type="GdkGLProc_glMultiTexCoord2sv"/>
			<field name="glMultiTexCoord3d" type="GdkGLProc_glMultiTexCoord3d"/>
			<field name="glMultiTexCoord3dv" type="GdkGLProc_glMultiTexCoord3dv"/>
			<field name="glMultiTexCoord3f" type="GdkGLProc_glMultiTexCoord3f"/>
			<field name="glMultiTexCoord3fv" type="GdkGLProc_glMultiTexCoord3fv"/>
			<field name="glMultiTexCoord3i" type="GdkGLProc_glMultiTexCoord3i"/>
			<field name="glMultiTexCoord3iv" type="GdkGLProc_glMultiTexCoord3iv"/>
			<field name="glMultiTexCoord3s" type="GdkGLProc_glMultiTexCoord3s"/>
			<field name="glMultiTexCoord3sv" type="GdkGLProc_glMultiTexCoord3sv"/>
			<field name="glMultiTexCoord4d" type="GdkGLProc_glMultiTexCoord4d"/>
			<field name="glMultiTexCoord4dv" type="GdkGLProc_glMultiTexCoord4dv"/>
			<field name="glMultiTexCoord4f" type="GdkGLProc_glMultiTexCoord4f"/>
			<field name="glMultiTexCoord4fv" type="GdkGLProc_glMultiTexCoord4fv"/>
			<field name="glMultiTexCoord4i" type="GdkGLProc_glMultiTexCoord4i"/>
			<field name="glMultiTexCoord4iv" type="GdkGLProc_glMultiTexCoord4iv"/>
			<field name="glMultiTexCoord4s" type="GdkGLProc_glMultiTexCoord4s"/>
			<field name="glMultiTexCoord4sv" type="GdkGLProc_glMultiTexCoord4sv"/>
			<field name="glLoadTransposeMatrixf" type="GdkGLProc_glLoadTransposeMatrixf"/>
			<field name="glLoadTransposeMatrixd" type="GdkGLProc_glLoadTransposeMatrixd"/>
			<field name="glMultTransposeMatrixf" type="GdkGLProc_glMultTransposeMatrixf"/>
			<field name="glMultTransposeMatrixd" type="GdkGLProc_glMultTransposeMatrixd"/>
			<field name="glSampleCoverage" type="GdkGLProc_glSampleCoverage"/>
			<field name="glCompressedTexImage3D" type="GdkGLProc_glCompressedTexImage3D"/>
			<field name="glCompressedTexImage2D" type="GdkGLProc_glCompressedTexImage2D"/>
			<field name="glCompressedTexImage1D" type="GdkGLProc_glCompressedTexImage1D"/>
			<field name="glCompressedTexSubImage3D" type="GdkGLProc_glCompressedTexSubImage3D"/>
			<field name="glCompressedTexSubImage2D" type="GdkGLProc_glCompressedTexSubImage2D"/>
			<field name="glCompressedTexSubImage1D" type="GdkGLProc_glCompressedTexSubImage1D"/>
			<field name="glGetCompressedTexImage" type="GdkGLProc_glGetCompressedTexImage"/>
		</struct>
		<struct name="GdkGL_GL_VERSION_1_4">
			<field name="glBlendFuncSeparate" type="GdkGLProc_glBlendFuncSeparate"/>
			<field name="glFogCoordf" type="GdkGLProc_glFogCoordf"/>
			<field name="glFogCoordfv" type="GdkGLProc_glFogCoordfv"/>
			<field name="glFogCoordd" type="GdkGLProc_glFogCoordd"/>
			<field name="glFogCoorddv" type="GdkGLProc_glFogCoorddv"/>
			<field name="glFogCoordPointer" type="GdkGLProc_glFogCoordPointer"/>
			<field name="glMultiDrawArrays" type="GdkGLProc_glMultiDrawArrays"/>
			<field name="glMultiDrawElements" type="GdkGLProc_glMultiDrawElements"/>
			<field name="glPointParameterf" type="GdkGLProc_glPointParameterf"/>
			<field name="glPointParameterfv" type="GdkGLProc_glPointParameterfv"/>
			<field name="glPointParameteri" type="GdkGLProc_glPointParameteri"/>
			<field name="glPointParameteriv" type="GdkGLProc_glPointParameteriv"/>
			<field name="glSecondaryColor3b" type="GdkGLProc_glSecondaryColor3b"/>
			<field name="glSecondaryColor3bv" type="GdkGLProc_glSecondaryColor3bv"/>
			<field name="glSecondaryColor3d" type="GdkGLProc_glSecondaryColor3d"/>
			<field name="glSecondaryColor3dv" type="GdkGLProc_glSecondaryColor3dv"/>
			<field name="glSecondaryColor3f" type="GdkGLProc_glSecondaryColor3f"/>
			<field name="glSecondaryColor3fv" type="GdkGLProc_glSecondaryColor3fv"/>
			<field name="glSecondaryColor3i" type="GdkGLProc_glSecondaryColor3i"/>
			<field name="glSecondaryColor3iv" type="GdkGLProc_glSecondaryColor3iv"/>
			<field name="glSecondaryColor3s" type="GdkGLProc_glSecondaryColor3s"/>
			<field name="glSecondaryColor3sv" type="GdkGLProc_glSecondaryColor3sv"/>
			<field name="glSecondaryColor3ub" type="GdkGLProc_glSecondaryColor3ub"/>
			<field name="glSecondaryColor3ubv" type="GdkGLProc_glSecondaryColor3ubv"/>
			<field name="glSecondaryColor3ui" type="GdkGLProc_glSecondaryColor3ui"/>
			<field name="glSecondaryColor3uiv" type="GdkGLProc_glSecondaryColor3uiv"/>
			<field name="glSecondaryColor3us" type="GdkGLProc_glSecondaryColor3us"/>
			<field name="glSecondaryColor3usv" type="GdkGLProc_glSecondaryColor3usv"/>
			<field name="glSecondaryColorPointer" type="GdkGLProc_glSecondaryColorPointer"/>
			<field name="glWindowPos2d" type="GdkGLProc_glWindowPos2d"/>
			<field name="glWindowPos2dv" type="GdkGLProc_glWindowPos2dv"/>
			<field name="glWindowPos2f" type="GdkGLProc_glWindowPos2f"/>
			<field name="glWindowPos2fv" type="GdkGLProc_glWindowPos2fv"/>
			<field name="glWindowPos2i" type="GdkGLProc_glWindowPos2i"/>
			<field name="glWindowPos2iv" type="GdkGLProc_glWindowPos2iv"/>
			<field name="glWindowPos2s" type="GdkGLProc_glWindowPos2s"/>
			<field name="glWindowPos2sv" type="GdkGLProc_glWindowPos2sv"/>
			<field name="glWindowPos3d" type="GdkGLProc_glWindowPos3d"/>
			<field name="glWindowPos3dv" type="GdkGLProc_glWindowPos3dv"/>
			<field name="glWindowPos3f" type="GdkGLProc_glWindowPos3f"/>
			<field name="glWindowPos3fv" type="GdkGLProc_glWindowPos3fv"/>
			<field name="glWindowPos3i" type="GdkGLProc_glWindowPos3i"/>
			<field name="glWindowPos3iv" type="GdkGLProc_glWindowPos3iv"/>
			<field name="glWindowPos3s" type="GdkGLProc_glWindowPos3s"/>
			<field name="glWindowPos3sv" type="GdkGLProc_glWindowPos3sv"/>
		</struct>
		<struct name="GdkGL_GL_WIN_swap_hint">
			<field name="glAddSwapHintRectWIN" type="GdkGLProc_glAddSwapHintRectWIN"/>
		</struct>
		<enum name="GdkGLConfigAttrib" type-name="GdkGLConfigAttrib" get-type="gdk_gl_config_attrib_get_type">
			<member name="GDK_GL_USE_GL" value="1"/>
			<member name="GDK_GL_BUFFER_SIZE" value="2"/>
			<member name="GDK_GL_LEVEL" value="3"/>
			<member name="GDK_GL_RGBA" value="4"/>
			<member name="GDK_GL_DOUBLEBUFFER" value="5"/>
			<member name="GDK_GL_STEREO" value="6"/>
			<member name="GDK_GL_AUX_BUFFERS" value="7"/>
			<member name="GDK_GL_RED_SIZE" value="8"/>
			<member name="GDK_GL_GREEN_SIZE" value="9"/>
			<member name="GDK_GL_BLUE_SIZE" value="10"/>
			<member name="GDK_GL_ALPHA_SIZE" value="11"/>
			<member name="GDK_GL_DEPTH_SIZE" value="12"/>
			<member name="GDK_GL_STENCIL_SIZE" value="13"/>
			<member name="GDK_GL_ACCUM_RED_SIZE" value="14"/>
			<member name="GDK_GL_ACCUM_GREEN_SIZE" value="15"/>
			<member name="GDK_GL_ACCUM_BLUE_SIZE" value="16"/>
			<member name="GDK_GL_ACCUM_ALPHA_SIZE" value="17"/>
			<member name="GDK_GL_CONFIG_CAVEAT" value="32"/>
			<member name="GDK_GL_X_VISUAL_TYPE" value="34"/>
			<member name="GDK_GL_TRANSPARENT_TYPE" value="35"/>
			<member name="GDK_GL_TRANSPARENT_INDEX_VALUE" value="36"/>
			<member name="GDK_GL_TRANSPARENT_RED_VALUE" value="37"/>
			<member name="GDK_GL_TRANSPARENT_GREEN_VALUE" value="38"/>
			<member name="GDK_GL_TRANSPARENT_BLUE_VALUE" value="39"/>
			<member name="GDK_GL_TRANSPARENT_ALPHA_VALUE" value="40"/>
			<member name="GDK_GL_DRAWABLE_TYPE" value="32784"/>
			<member name="GDK_GL_RENDER_TYPE" value="32785"/>
			<member name="GDK_GL_X_RENDERABLE" value="32786"/>
			<member name="GDK_GL_FBCONFIG_ID" value="32787"/>
			<member name="GDK_GL_MAX_PBUFFER_WIDTH" value="32790"/>
			<member name="GDK_GL_MAX_PBUFFER_HEIGHT" value="32791"/>
			<member name="GDK_GL_MAX_PBUFFER_PIXELS" value="32792"/>
			<member name="GDK_GL_VISUAL_ID" value="32779"/>
			<member name="GDK_GL_SCREEN" value="32780"/>
			<member name="GDK_GL_SAMPLE_BUFFERS" value="100000"/>
			<member name="GDK_GL_SAMPLES" value="100001"/>
		</enum>
		<enum name="GdkGLConfigCaveat" type-name="GdkGLConfigCaveat" get-type="gdk_gl_config_caveat_get_type">
			<member name="GDK_GL_CONFIG_CAVEAT_DONT_CARE" value="-1"/>
			<member name="GDK_GL_CONFIG_CAVEAT_NONE" value="32768"/>
			<member name="GDK_GL_SLOW_CONFIG" value="32769"/>
			<member name="GDK_GL_NON_CONFORMANT_CONFIG" value="32781"/>
		</enum>
		<enum name="GdkGLConfigError" type-name="GdkGLConfigError" get-type="gdk_gl_config_error_get_type">
			<member name="GDK_GL_BAD_SCREEN" value="1"/>
			<member name="GDK_GL_BAD_ATTRIBUTE" value="2"/>
			<member name="GDK_GL_NO_EXTENSION" value="3"/>
			<member name="GDK_GL_BAD_VISUAL" value="4"/>
			<member name="GDK_GL_BAD_CONTEXT" value="5"/>
			<member name="GDK_GL_BAD_VALUE" value="6"/>
			<member name="GDK_GL_BAD_ENUM" value="7"/>
		</enum>
		<enum name="GdkGLDebugFlag">
			<member name="GDK_GL_DEBUG_MISC" value="1"/>
			<member name="GDK_GL_DEBUG_FUNC" value="2"/>
			<member name="GDK_GL_DEBUG_IMPL" value="4"/>
		</enum>
		<enum name="GdkGLDrawableAttrib" type-name="GdkGLDrawableAttrib" get-type="gdk_gl_drawable_attrib_get_type">
			<member name="GDK_GL_PRESERVED_CONTENTS" value="32795"/>
			<member name="GDK_GL_LARGEST_PBUFFER" value="32796"/>
			<member name="GDK_GL_WIDTH" value="32797"/>
			<member name="GDK_GL_HEIGHT" value="32798"/>
			<member name="GDK_GL_EVENT_MASK" value="32799"/>
		</enum>
		<enum name="GdkGLDrawableType" type-name="GdkGLDrawableType" get-type="gdk_gl_drawable_type_get_type">
			<member name="GDK_GL_WINDOW" value="32802"/>
			<member name="GDK_GL_PBUFFER" value="32803"/>
		</enum>
		<enum name="GdkGLEventType" type-name="GdkGLEventType" get-type="gdk_gl_event_type_get_type">
			<member name="GDK_GL_DAMAGED" value="32800"/>
			<member name="GDK_GL_SAVED" value="32801"/>
		</enum>
		<enum name="GdkGLPbufferAttrib" type-name="GdkGLPbufferAttrib" get-type="gdk_gl_pbuffer_attrib_get_type">
			<member name="GDK_GL_PBUFFER_PRESERVED_CONTENTS" value="32795"/>
			<member name="GDK_GL_PBUFFER_LARGEST_PBUFFER" value="32796"/>
			<member name="GDK_GL_PBUFFER_HEIGHT" value="32832"/>
			<member name="GDK_GL_PBUFFER_WIDTH" value="32833"/>
		</enum>
		<enum name="GdkGLRenderType" type-name="GdkGLRenderType" get-type="gdk_gl_render_type_get_type">
			<member name="GDK_GL_RGBA_TYPE" value="32788"/>
			<member name="GDK_GL_COLOR_INDEX_TYPE" value="32789"/>
		</enum>
		<enum name="GdkGLTransparentType" type-name="GdkGLTransparentType" get-type="gdk_gl_transparent_type_get_type">
			<member name="GDK_GL_TRANSPARENT_NONE" value="32768"/>
			<member name="GDK_GL_TRANSPARENT_RGB" value="32776"/>
			<member name="GDK_GL_TRANSPARENT_INDEX" value="32777"/>
		</enum>
		<enum name="GdkGLVisualType" type-name="GdkGLVisualType" get-type="gdk_gl_visual_type_get_type">
			<member name="GDK_GL_VISUAL_TYPE_DONT_CARE" value="-1"/>
			<member name="GDK_GL_TRUE_COLOR" value="32770"/>
			<member name="GDK_GL_DIRECT_COLOR" value="32771"/>
			<member name="GDK_GL_PSEUDO_COLOR" value="32772"/>
			<member name="GDK_GL_STATIC_COLOR" value="32773"/>
			<member name="GDK_GL_GRAY_SCALE" value="32774"/>
			<member name="GDK_GL_STATIC_GRAY" value="32775"/>
		</enum>
		<flags name="GdkGLBufferMask" type-name="GdkGLBufferMask" get-type="gdk_gl_buffer_mask_get_type">
			<member name="GDK_GL_FRONT_LEFT_BUFFER_BIT" value="1"/>
			<member name="GDK_GL_FRONT_RIGHT_BUFFER_BIT" value="2"/>
			<member name="GDK_GL_BACK_LEFT_BUFFER_BIT" value="4"/>
			<member name="GDK_GL_BACK_RIGHT_BUFFER_BIT" value="8"/>
			<member name="GDK_GL_AUX_BUFFERS_BIT" value="16"/>
			<member name="GDK_GL_DEPTH_BUFFER_BIT" value="32"/>
			<member name="GDK_GL_STENCIL_BUFFER_BIT" value="64"/>
			<member name="GDK_GL_ACCUM_BUFFER_BIT" value="128"/>
		</flags>
		<flags name="GdkGLConfigMode" type-name="GdkGLConfigMode" get-type="gdk_gl_config_mode_get_type">
			<member name="GDK_GL_MODE_RGB" value="0"/>
			<member name="GDK_GL_MODE_RGBA" value="0"/>
			<member name="GDK_GL_MODE_INDEX" value="1"/>
			<member name="GDK_GL_MODE_SINGLE" value="0"/>
			<member name="GDK_GL_MODE_DOUBLE" value="2"/>
			<member name="GDK_GL_MODE_STEREO" value="4"/>
			<member name="GDK_GL_MODE_ALPHA" value="8"/>
			<member name="GDK_GL_MODE_DEPTH" value="16"/>
			<member name="GDK_GL_MODE_STENCIL" value="32"/>
			<member name="GDK_GL_MODE_ACCUM" value="64"/>
			<member name="GDK_GL_MODE_MULTISAMPLE" value="128"/>
		</flags>
		<flags name="GdkGLDrawableTypeMask" type-name="GdkGLDrawableTypeMask" get-type="gdk_gl_drawable_type_mask_get_type">
			<member name="GDK_GL_WINDOW_BIT" value="1"/>
			<member name="GDK_GL_PIXMAP_BIT" value="2"/>
			<member name="GDK_GL_PBUFFER_BIT" value="4"/>
		</flags>
		<flags name="GdkGLEventMask" type-name="GdkGLEventMask" get-type="gdk_gl_event_mask_get_type">
			<member name="GDK_GL_PBUFFER_CLOBBER_MASK" value="134217728"/>
		</flags>
		<flags name="GdkGLRenderTypeMask" type-name="GdkGLRenderTypeMask" get-type="gdk_gl_render_type_mask_get_type">
			<member name="GDK_GL_RGBA_BIT" value="1"/>
			<member name="GDK_GL_COLOR_INDEX_BIT" value="2"/>
		</flags>
		<object name="GdkGLConfig" parent="GObject" type-name="GdkGLConfig" get-type="gdk_gl_config_get_type">
			<method name="get_attrib" symbol="gdk_gl_config_get_attrib">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
					<parameter name="attribute" type="int"/>
					<parameter name="value" type="int*"/>
				</parameters>
			</method>
			<method name="get_colormap" symbol="gdk_gl_config_get_colormap">
				<return-type type="GdkColormap*"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="get_depth" symbol="gdk_gl_config_get_depth">
				<return-type type="gint"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="get_layer_plane" symbol="gdk_gl_config_get_layer_plane">
				<return-type type="gint"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="get_n_aux_buffers" symbol="gdk_gl_config_get_n_aux_buffers">
				<return-type type="gint"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="get_n_sample_buffers" symbol="gdk_gl_config_get_n_sample_buffers">
				<return-type type="gint"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="get_screen" symbol="gdk_gl_config_get_screen">
				<return-type type="GdkScreen*"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="get_visual" symbol="gdk_gl_config_get_visual">
				<return-type type="GdkVisual*"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="has_accum_buffer" symbol="gdk_gl_config_has_accum_buffer">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="has_alpha" symbol="gdk_gl_config_has_alpha">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="has_depth_buffer" symbol="gdk_gl_config_has_depth_buffer">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="has_stencil_buffer" symbol="gdk_gl_config_has_stencil_buffer">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="is_double_buffered" symbol="gdk_gl_config_is_double_buffered">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="is_rgba" symbol="gdk_gl_config_is_rgba">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<method name="is_stereo" symbol="gdk_gl_config_is_stereo">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="gdk_gl_config_new">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="attrib_list" type="int*"/>
				</parameters>
			</constructor>
			<constructor name="new_by_mode" symbol="gdk_gl_config_new_by_mode">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="mode" type="GdkGLConfigMode"/>
				</parameters>
			</constructor>
			<constructor name="new_by_mode_for_screen" symbol="gdk_gl_config_new_by_mode_for_screen">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="screen" type="GdkScreen*"/>
					<parameter name="mode" type="GdkGLConfigMode"/>
				</parameters>
			</constructor>
			<constructor name="new_for_screen" symbol="gdk_gl_config_new_for_screen">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="screen" type="GdkScreen*"/>
					<parameter name="attrib_list" type="int*"/>
				</parameters>
			</constructor>
			<field name="layer_plane" type="gint"/>
			<field name="n_aux_buffers" type="gint"/>
			<field name="n_sample_buffers" type="gint"/>
			<field name="is_rgba" type="guint"/>
			<field name="is_double_buffered" type="guint"/>
			<field name="as_single_mode" type="guint"/>
			<field name="is_stereo" type="guint"/>
			<field name="has_alpha" type="guint"/>
			<field name="has_depth_buffer" type="guint"/>
			<field name="has_stencil_buffer" type="guint"/>
			<field name="has_accum_buffer" type="guint"/>
		</object>
		<object name="GdkGLContext" parent="GObject" type-name="GdkGLContext" get-type="gdk_gl_context_get_type">
			<method name="copy" symbol="gdk_gl_context_copy">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
					<parameter name="src" type="GdkGLContext*"/>
					<parameter name="mask" type="unsigned"/>
				</parameters>
			</method>
			<method name="destroy" symbol="gdk_gl_context_destroy">
				<return-type type="void"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="get_current" symbol="gdk_gl_context_get_current">
				<return-type type="GdkGLContext*"/>
			</method>
			<method name="get_gl_config" symbol="gdk_gl_context_get_gl_config">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="get_gl_drawable" symbol="gdk_gl_context_get_gl_drawable">
				<return-type type="GdkGLDrawable*"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="get_render_type" symbol="gdk_gl_context_get_render_type">
				<return-type type="int"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="get_share_list" symbol="gdk_gl_context_get_share_list">
				<return-type type="GdkGLContext*"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="is_direct" symbol="gdk_gl_context_is_direct">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="gdk_gl_context_new">
				<return-type type="GdkGLContext*"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
					<parameter name="share_list" type="GdkGLContext*"/>
					<parameter name="direct" type="gboolean"/>
					<parameter name="render_type" type="int"/>
				</parameters>
			</constructor>
		</object>
		<object name="GdkGLPixmap" parent="GdkDrawable" type-name="GdkGLPixmap" get-type="gdk_gl_pixmap_get_type">
			<method name="destroy" symbol="gdk_gl_pixmap_destroy">
				<return-type type="void"/>
				<parameters>
					<parameter name="glpixmap" type="GdkGLPixmap*"/>
				</parameters>
			</method>
			<method name="get_pixmap" symbol="gdk_gl_pixmap_get_pixmap">
				<return-type type="GdkPixmap*"/>
				<parameters>
					<parameter name="glpixmap" type="GdkGLPixmap*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="gdk_gl_pixmap_new">
				<return-type type="GdkGLPixmap*"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
					<parameter name="pixmap" type="GdkPixmap*"/>
					<parameter name="attrib_list" type="int*"/>
				</parameters>
			</constructor>
			<field name="drawable" type="GdkDrawable*"/>
		</object>
		<object name="GdkGLWindow" parent="GdkDrawable" type-name="GdkGLWindow" get-type="gdk_gl_window_get_type">
			<method name="destroy" symbol="gdk_gl_window_destroy">
				<return-type type="void"/>
				<parameters>
					<parameter name="glwindow" type="GdkGLWindow*"/>
				</parameters>
			</method>
			<method name="get_window" symbol="gdk_gl_window_get_window">
				<return-type type="GdkWindow*"/>
				<parameters>
					<parameter name="glwindow" type="GdkGLWindow*"/>
				</parameters>
			</method>
			<constructor name="new" symbol="gdk_gl_window_new">
				<return-type type="GdkGLWindow*"/>
				<parameters>
					<parameter name="glconfig" type="GdkGLConfig*"/>
					<parameter name="window" type="GdkWindow*"/>
					<parameter name="attrib_list" type="int*"/>
				</parameters>
			</constructor>
			<field name="drawable" type="GdkDrawable*"/>
		</object>
		<interface name="GdkGLDrawable" type-name="GdkGLDrawable" get-type="gdk_gl_drawable_get_type">
			<method name="get_current" symbol="gdk_gl_drawable_get_current">
				<return-type type="GdkGLDrawable*"/>
			</method>
			<method name="get_gl_config" symbol="gdk_gl_drawable_get_gl_config">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</method>
			<method name="get_size" symbol="gdk_gl_drawable_get_size">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
					<parameter name="width" type="gint*"/>
					<parameter name="height" type="gint*"/>
				</parameters>
			</method>
			<method name="gl_begin" symbol="gdk_gl_drawable_gl_begin">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="gl_end" symbol="gdk_gl_drawable_gl_end">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</method>
			<method name="is_double_buffered" symbol="gdk_gl_drawable_is_double_buffered">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</method>
			<method name="make_current" symbol="gdk_gl_drawable_make_current">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</method>
			<method name="swap_buffers" symbol="gdk_gl_drawable_swap_buffers">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</method>
			<method name="wait_gdk" symbol="gdk_gl_drawable_wait_gdk">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</method>
			<method name="wait_gl" symbol="gdk_gl_drawable_wait_gl">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</method>
			<vfunc name="create_new_context">
				<return-type type="GdkGLContext*"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
					<parameter name="share_list" type="GdkGLContext*"/>
					<parameter name="direct" type="gboolean"/>
					<parameter name="render_type" type="int"/>
				</parameters>
			</vfunc>
			<vfunc name="get_gl_config">
				<return-type type="GdkGLConfig*"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</vfunc>
			<vfunc name="get_size">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
					<parameter name="width" type="gint*"/>
					<parameter name="height" type="gint*"/>
				</parameters>
			</vfunc>
			<vfunc name="gl_begin">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="draw" type="GdkGLDrawable*"/>
					<parameter name="read" type="GdkGLDrawable*"/>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</vfunc>
			<vfunc name="gl_end">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</vfunc>
			<vfunc name="is_double_buffered">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</vfunc>
			<vfunc name="make_context_current">
				<return-type type="gboolean"/>
				<parameters>
					<parameter name="draw" type="GdkGLDrawable*"/>
					<parameter name="read" type="GdkGLDrawable*"/>
					<parameter name="glcontext" type="GdkGLContext*"/>
				</parameters>
			</vfunc>
			<vfunc name="swap_buffers">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</vfunc>
			<vfunc name="wait_gdk">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</vfunc>
			<vfunc name="wait_gl">
				<return-type type="void"/>
				<parameters>
					<parameter name="gldrawable" type="GdkGLDrawable*"/>
				</parameters>
			</vfunc>
		</interface>
		<constant name="ERROR_INCOMPATIBLE_DEVICE_CONTEXTS_ARB" type="int" value="8276"/>
		<constant name="ERROR_INVALID_PIXEL_TYPE_ARB" type="int" value="8259"/>
		<constant name="ERROR_INVALID_PIXEL_TYPE_EXT" type="int" value="8259"/>
		<constant name="EXTENDED_RANGE_SGIS" type="int" value="34213"/>
		<constant name="GDKGLEXT_BINARY_AGE" type="int" value="0"/>
		<constant name="GDKGLEXT_INTERFACE_AGE" type="int" value="0"/>
		<constant name="GDKGLEXT_MAJOR_VERSION" type="int" value="1"/>
		<constant name="GDKGLEXT_MICRO_VERSION" type="int" value="0"/>
		<constant name="GDKGLEXT_MINOR_VERSION" type="int" value="2"/>
		<constant name="GDK_GL_ATTRIB_LIST_NONE" type="int" value="0"/>
		<constant name="GDK_GL_DONT_CARE" type="int" value="-1"/>
		<constant name="GDK_GL_NONE" type="int" value="32768"/>
		<constant name="GDK_GL_SUCCESS" type="int" value="0"/>
		<constant name="GLX_3DFX_FULLSCREEN_MODE_MESA" type="int" value="2"/>
		<constant name="GLX_3DFX_WINDOW_MODE_MESA" type="int" value="1"/>
		<constant name="GLX_ACCUM_BUFFER_BIT" type="int" value="128"/>
		<constant name="GLX_ACCUM_BUFFER_BIT_SGIX" type="int" value="128"/>
		<constant name="GLX_ARB_get_proc_address" type="int" value="1"/>
		<constant name="GLX_ARB_multisample" type="int" value="1"/>
		<constant name="GLX_AUX_BUFFERS_BIT" type="int" value="16"/>
		<constant name="GLX_AUX_BUFFERS_BIT_SGIX" type="int" value="16"/>
		<constant name="GLX_BACK_LEFT_BUFFER_BIT" type="int" value="4"/>
		<constant name="GLX_BACK_LEFT_BUFFER_BIT_SGIX" type="int" value="4"/>
		<constant name="GLX_BACK_RIGHT_BUFFER_BIT" type="int" value="8"/>
		<constant name="GLX_BACK_RIGHT_BUFFER_BIT_SGIX" type="int" value="8"/>
		<constant name="GLX_BLENDED_RGBA_SGIS" type="int" value="32805"/>
		<constant name="GLX_BUFFER_CLOBBER_MASK_SGIX" type="int" value="134217728"/>
		<constant name="GLX_COLOR_INDEX_BIT" type="int" value="2"/>
		<constant name="GLX_COLOR_INDEX_BIT_SGIX" type="int" value="2"/>
		<constant name="GLX_COLOR_INDEX_TYPE" type="int" value="32789"/>
		<constant name="GLX_COLOR_INDEX_TYPE_SGIX" type="int" value="32789"/>
		<constant name="GLX_CONFIG_CAVEAT" type="int" value="32"/>
		<constant name="GLX_DAMAGED" type="int" value="32800"/>
		<constant name="GLX_DAMAGED_SGIX" type="int" value="32800"/>
		<constant name="GLX_DEPTH_BUFFER_BIT" type="int" value="32"/>
		<constant name="GLX_DEPTH_BUFFER_BIT_SGIX" type="int" value="32"/>
		<constant name="GLX_DIGITAL_MEDIA_PBUFFER_SGIX" type="int" value="32804"/>
		<constant name="GLX_DIRECT_COLOR" type="int" value="32771"/>
		<constant name="GLX_DIRECT_COLOR_EXT" type="int" value="32771"/>
		<constant name="GLX_DONT_CARE" type="int" value="-1"/>
		<constant name="GLX_DRAWABLE_TYPE" type="int" value="32784"/>
		<constant name="GLX_DRAWABLE_TYPE_SGIX" type="int" value="32784"/>
		<constant name="GLX_EVENT_MASK" type="int" value="32799"/>
		<constant name="GLX_EVENT_MASK_SGIX" type="int" value="32799"/>
		<constant name="GLX_EXTENDED_RANGE_SGIS" type="int" value="0"/>
		<constant name="GLX_EXT_import_context" type="int" value="1"/>
		<constant name="GLX_EXT_visual_info" type="int" value="1"/>
		<constant name="GLX_EXT_visual_rating" type="int" value="1"/>
		<constant name="GLX_FBCONFIG_ID" type="int" value="32787"/>
		<constant name="GLX_FBCONFIG_ID_SGIX" type="int" value="32787"/>
		<constant name="GLX_FLOAT_COMPONENTS_NV" type="int" value="8368"/>
		<constant name="GLX_FRONT_LEFT_BUFFER_BIT" type="int" value="1"/>
		<constant name="GLX_FRONT_LEFT_BUFFER_BIT_SGIX" type="int" value="1"/>
		<constant name="GLX_FRONT_RIGHT_BUFFER_BIT" type="int" value="2"/>
		<constant name="GLX_FRONT_RIGHT_BUFFER_BIT_SGIX" type="int" value="2"/>
		<constant name="GLX_GLXEXT_VERSION" type="int" value="5"/>
		<constant name="GLX_GRAY_SCALE" type="int" value="32774"/>
		<constant name="GLX_GRAY_SCALE_EXT" type="int" value="32774"/>
		<constant name="GLX_HEIGHT" type="int" value="32798"/>
		<constant name="GLX_HEIGHT_SGIX" type="int" value="32798"/>
		<constant name="GLX_LARGEST_PBUFFER" type="int" value="32796"/>
		<constant name="GLX_LARGEST_PBUFFER_SGIX" type="int" value="32796"/>
		<constant name="GLX_MAX_ALPHA_SGIS" type="int" value="0"/>
		<constant name="GLX_MAX_BLUE_SGIS" type="int" value="0"/>
		<constant name="GLX_MAX_GREEN_SGIS" type="int" value="0"/>
		<constant name="GLX_MAX_PBUFFER_HEIGHT" type="int" value="32791"/>
		<constant name="GLX_MAX_PBUFFER_HEIGHT_SGIX" type="int" value="32791"/>
		<constant name="GLX_MAX_PBUFFER_PIXELS" type="int" value="32792"/>
		<constant name="GLX_MAX_PBUFFER_PIXELS_SGIX" type="int" value="32792"/>
		<constant name="GLX_MAX_PBUFFER_WIDTH" type="int" value="32790"/>
		<constant name="GLX_MAX_PBUFFER_WIDTH_SGIX" type="int" value="32790"/>
		<constant name="GLX_MAX_RED_SGIS" type="int" value="0"/>
		<constant name="GLX_MESA_agp_offset" type="int" value="1"/>
		<constant name="GLX_MESA_copy_sub_buffer" type="int" value="1"/>
		<constant name="GLX_MESA_pixmap_colormap" type="int" value="1"/>
		<constant name="GLX_MESA_release_buffers" type="int" value="1"/>
		<constant name="GLX_MESA_set_3dfx_mode" type="int" value="1"/>
		<constant name="GLX_MIN_ALPHA_SGIS" type="int" value="0"/>
		<constant name="GLX_MIN_BLUE_SGIS" type="int" value="0"/>
		<constant name="GLX_MIN_GREEN_SGIS" type="int" value="0"/>
		<constant name="GLX_MIN_RED_SGIS" type="int" value="0"/>
		<constant name="GLX_MULTISAMPLE_SUB_RECT_HEIGHT_SGIS" type="int" value="32807"/>
		<constant name="GLX_MULTISAMPLE_SUB_RECT_WIDTH_SGIS" type="int" value="32806"/>
		<constant name="GLX_NONE" type="int" value="32768"/>
		<constant name="GLX_NONE_EXT" type="int" value="32768"/>
		<constant name="GLX_NON_CONFORMANT_CONFIG" type="int" value="32781"/>
		<constant name="GLX_NON_CONFORMANT_VISUAL_EXT" type="int" value="32781"/>
		<constant name="GLX_NV_float_buffer" type="int" value="1"/>
		<constant name="GLX_NV_vertex_array_range" type="int" value="1"/>
		<constant name="GLX_OML_swap_method" type="int" value="1"/>
		<constant name="GLX_OML_sync_control" type="int" value="1"/>
		<constant name="GLX_OPTIMAL_PBUFFER_HEIGHT_SGIX" type="int" value="32794"/>
		<constant name="GLX_OPTIMAL_PBUFFER_WIDTH_SGIX" type="int" value="32793"/>
		<constant name="GLX_PBUFFER" type="int" value="32803"/>
		<constant name="GLX_PBUFFER_BIT" type="int" value="4"/>
		<constant name="GLX_PBUFFER_BIT_SGIX" type="int" value="4"/>
		<constant name="GLX_PBUFFER_CLOBBER_MASK" type="int" value="134217728"/>
		<constant name="GLX_PBUFFER_HEIGHT" type="int" value="32832"/>
		<constant name="GLX_PBUFFER_SGIX" type="int" value="32803"/>
		<constant name="GLX_PBUFFER_WIDTH" type="int" value="32833"/>
		<constant name="GLX_PIXMAP_BIT" type="int" value="2"/>
		<constant name="GLX_PIXMAP_BIT_SGIX" type="int" value="2"/>
		<constant name="GLX_PRESERVED_CONTENTS" type="int" value="32795"/>
		<constant name="GLX_PRESERVED_CONTENTS_SGIX" type="int" value="32795"/>
		<constant name="GLX_PSEUDO_COLOR" type="int" value="32772"/>
		<constant name="GLX_PSEUDO_COLOR_EXT" type="int" value="32772"/>
		<constant name="GLX_RENDER_TYPE" type="int" value="32785"/>
		<constant name="GLX_RENDER_TYPE_SGIX" type="int" value="32785"/>
		<constant name="GLX_RGBA_BIT" type="int" value="1"/>
		<constant name="GLX_RGBA_BIT_SGIX" type="int" value="1"/>
		<constant name="GLX_RGBA_TYPE" type="int" value="32788"/>
		<constant name="GLX_RGBA_TYPE_SGIX" type="int" value="32788"/>
		<constant name="GLX_SAMPLES" type="int" value="100001"/>
		<constant name="GLX_SAMPLES_3DFX" type="int" value="32849"/>
		<constant name="GLX_SAMPLES_ARB" type="int" value="100001"/>
		<constant name="GLX_SAMPLES_SGIS" type="int" value="100001"/>
		<constant name="GLX_SAMPLE_BUFFERS" type="int" value="100000"/>
		<constant name="GLX_SAMPLE_BUFFERS_3DFX" type="int" value="32848"/>
		<constant name="GLX_SAMPLE_BUFFERS_ARB" type="int" value="100000"/>
		<constant name="GLX_SAMPLE_BUFFERS_BIT_SGIX" type="int" value="256"/>
		<constant name="GLX_SAMPLE_BUFFERS_SGIS" type="int" value="100000"/>
		<constant name="GLX_SAVED" type="int" value="32801"/>
		<constant name="GLX_SAVED_SGIX" type="int" value="32801"/>
		<constant name="GLX_SCENE_REQUIRED_EXT" type="int" value="0"/>
		<constant name="GLX_SCREEN" type="int" value="32780"/>
		<constant name="GLX_SCREEN_EXT" type="int" value="32780"/>
		<constant name="GLX_SGIS_multisample" type="int" value="1"/>
		<constant name="GLX_SGIX_dmbuffer" type="int" value="1"/>
		<constant name="GLX_SGIX_fbconfig" type="int" value="1"/>
		<constant name="GLX_SGIX_pbuffer" type="int" value="1"/>
		<constant name="GLX_SGIX_swap_barrier" type="int" value="1"/>
		<constant name="GLX_SGIX_swap_group" type="int" value="1"/>
		<constant name="GLX_SGIX_video_resize" type="int" value="1"/>
		<constant name="GLX_SGIX_video_source" type="int" value="1"/>
		<constant name="GLX_SGIX_visual_select_group" type="int" value="1"/>
		<constant name="GLX_SGI_cushion" type="int" value="1"/>
		<constant name="GLX_SGI_make_current_read" type="int" value="1"/>
		<constant name="GLX_SGI_swap_control" type="int" value="1"/>
		<constant name="GLX_SGI_video_sync" type="int" value="1"/>
		<constant name="GLX_SHARE_CONTEXT_EXT" type="int" value="32778"/>
		<constant name="GLX_SLOW_CONFIG" type="int" value="32769"/>
		<constant name="GLX_SLOW_VISUAL_EXT" type="int" value="32769"/>
		<constant name="GLX_STATIC_COLOR" type="int" value="32773"/>
		<constant name="GLX_STATIC_COLOR_EXT" type="int" value="32773"/>
		<constant name="GLX_STATIC_GRAY" type="int" value="32775"/>
		<constant name="GLX_STATIC_GRAY_EXT" type="int" value="32775"/>
		<constant name="GLX_STENCIL_BUFFER_BIT" type="int" value="64"/>
		<constant name="GLX_STENCIL_BUFFER_BIT_SGIX" type="int" value="64"/>
		<constant name="GLX_SUN_get_transparent_index" type="int" value="1"/>
		<constant name="GLX_SWAP_COPY_OML" type="int" value="32866"/>
		<constant name="GLX_SWAP_EXCHANGE_OML" type="int" value="32865"/>
		<constant name="GLX_SWAP_METHOD_OML" type="int" value="32864"/>
		<constant name="GLX_SWAP_UNDEFINED_OML" type="int" value="32867"/>
		<constant name="GLX_SYNC_FRAME_SGIX" type="int" value="0"/>
		<constant name="GLX_SYNC_SWAP_SGIX" type="int" value="1"/>
		<constant name="GLX_TRANSPARENT_ALPHA_VALUE" type="int" value="40"/>
		<constant name="GLX_TRANSPARENT_ALPHA_VALUE_EXT" type="int" value="40"/>
		<constant name="GLX_TRANSPARENT_BLUE_VALUE" type="int" value="39"/>
		<constant name="GLX_TRANSPARENT_BLUE_VALUE_EXT" type="int" value="39"/>
		<constant name="GLX_TRANSPARENT_GREEN_VALUE" type="int" value="38"/>
		<constant name="GLX_TRANSPARENT_GREEN_VALUE_EXT" type="int" value="38"/>
		<constant name="GLX_TRANSPARENT_INDEX" type="int" value="32777"/>
		<constant name="GLX_TRANSPARENT_INDEX_EXT" type="int" value="32777"/>
		<constant name="GLX_TRANSPARENT_INDEX_VALUE" type="int" value="36"/>
		<constant name="GLX_TRANSPARENT_INDEX_VALUE_EXT" type="int" value="36"/>
		<constant name="GLX_TRANSPARENT_RED_VALUE" type="int" value="37"/>
		<constant name="GLX_TRANSPARENT_RED_VALUE_EXT" type="int" value="37"/>
		<constant name="GLX_TRANSPARENT_RGB" type="int" value="32776"/>
		<constant name="GLX_TRANSPARENT_RGB_EXT" type="int" value="32776"/>
		<constant name="GLX_TRANSPARENT_TYPE" type="int" value="35"/>
		<constant name="GLX_TRANSPARENT_TYPE_EXT" type="int" value="35"/>
		<constant name="GLX_TRUE_COLOR" type="int" value="32770"/>
		<constant name="GLX_TRUE_COLOR_EXT" type="int" value="32770"/>
		<constant name="GLX_VERSION_1_3" type="int" value="1"/>
		<constant name="GLX_VERSION_1_4" type="int" value="1"/>
		<constant name="GLX_VISUAL_CAVEAT_EXT" type="int" value="32"/>
		<constant name="GLX_VISUAL_ID" type="int" value="32779"/>
		<constant name="GLX_VISUAL_ID_EXT" type="int" value="32779"/>
		<constant name="GLX_VISUAL_SELECT_GROUP_SGIX" type="int" value="32808"/>
		<constant name="GLX_WIDTH" type="int" value="32797"/>
		<constant name="GLX_WIDTH_SGIX" type="int" value="32797"/>
		<constant name="GLX_WINDOW" type="int" value="32802"/>
		<constant name="GLX_WINDOW_BIT" type="int" value="1"/>
		<constant name="GLX_WINDOW_BIT_SGIX" type="int" value="1"/>
		<constant name="GLX_WINDOW_SGIX" type="int" value="32802"/>
		<constant name="GLX_X_RENDERABLE" type="int" value="32786"/>
		<constant name="GLX_X_RENDERABLE_SGIX" type="int" value="32786"/>
		<constant name="GLX_X_VISUAL_TYPE" type="int" value="34"/>
		<constant name="GLX_X_VISUAL_TYPE_EXT" type="int" value="34"/>
		<constant name="GL_1PASS_EXT" type="int" value="32929"/>
		<constant name="GL_1PASS_SGIS" type="int" value="32929"/>
		<constant name="GL_2PASS_0_EXT" type="int" value="32930"/>
		<constant name="GL_2PASS_0_SGIS" type="int" value="32930"/>
		<constant name="GL_2PASS_1_EXT" type="int" value="32931"/>
		<constant name="GL_2PASS_1_SGIS" type="int" value="32931"/>
		<constant name="GL_2X_BIT_ATI" type="int" value="1"/>
		<constant name="GL_3DFX_multisample" type="int" value="1"/>
		<constant name="GL_3DFX_tbuffer" type="int" value="1"/>
		<constant name="GL_3DFX_texture_compression_FXT1" type="int" value="1"/>
		<constant name="GL_422_AVERAGE_EXT" type="int" value="32974"/>
		<constant name="GL_422_EXT" type="int" value="32972"/>
		<constant name="GL_422_REV_AVERAGE_EXT" type="int" value="32975"/>
		<constant name="GL_422_REV_EXT" type="int" value="32973"/>
		<constant name="GL_4PASS_0_EXT" type="int" value="32932"/>
		<constant name="GL_4PASS_0_SGIS" type="int" value="32932"/>
		<constant name="GL_4PASS_1_EXT" type="int" value="32933"/>
		<constant name="GL_4PASS_1_SGIS" type="int" value="32933"/>
		<constant name="GL_4PASS_2_EXT" type="int" value="32934"/>
		<constant name="GL_4PASS_2_SGIS" type="int" value="32934"/>
		<constant name="GL_4PASS_3_EXT" type="int" value="32935"/>
		<constant name="GL_4PASS_3_SGIS" type="int" value="32935"/>
		<constant name="GL_4X_BIT_ATI" type="int" value="2"/>
		<constant name="GL_8X_BIT_ATI" type="int" value="4"/>
		<constant name="GL_ABGR_EXT" type="int" value="32768"/>
		<constant name="GL_ACTIVE_STENCIL_FACE_EXT" type="int" value="35089"/>
		<constant name="GL_ACTIVE_STENCIL_FACE_NV" type="int" value="35089"/>
		<constant name="GL_ACTIVE_TEXTURE" type="int" value="34016"/>
		<constant name="GL_ACTIVE_TEXTURE_ARB" type="int" value="34016"/>
		<constant name="GL_ACTIVE_VERTEX_UNITS_ARB" type="int" value="34469"/>
		<constant name="GL_ADD_ATI" type="int" value="35171"/>
		<constant name="GL_ADD_SIGNED" type="int" value="34164"/>
		<constant name="GL_ADD_SIGNED_ARB" type="int" value="34164"/>
		<constant name="GL_ADD_SIGNED_EXT" type="int" value="34164"/>
		<constant name="GL_ALIASED_LINE_WIDTH_RANGE" type="int" value="33902"/>
		<constant name="GL_ALIASED_POINT_SIZE_RANGE" type="int" value="33901"/>
		<constant name="GL_ALLOW_DRAW_FRG_HINT_PGI" type="int" value="107024"/>
		<constant name="GL_ALLOW_DRAW_MEM_HINT_PGI" type="int" value="107025"/>
		<constant name="GL_ALLOW_DRAW_OBJ_HINT_PGI" type="int" value="107022"/>
		<constant name="GL_ALLOW_DRAW_WIN_HINT_PGI" type="int" value="107023"/>
		<constant name="GL_ALL_COMPLETED_NV" type="int" value="34034"/>
		<constant name="GL_ALL_STATIC_DATA_IBM" type="int" value="103060"/>
		<constant name="GL_ALPHA12_EXT" type="int" value="32829"/>
		<constant name="GL_ALPHA16_EXT" type="int" value="32830"/>
		<constant name="GL_ALPHA16_EXTENDED_RANGE_SGIX" type="int" value="34292"/>
		<constant name="GL_ALPHA16_SIGNED_SGIX" type="int" value="34280"/>
		<constant name="GL_ALPHA4_EXT" type="int" value="32827"/>
		<constant name="GL_ALPHA8_EXT" type="int" value="32828"/>
		<constant name="GL_ALPHA_BLEND_EQUATION_ATI" type="int" value="34877"/>
		<constant name="GL_ALPHA_EXTENDED_RANGE_SGIX" type="int" value="34286"/>
		<constant name="GL_ALPHA_FLOAT16_APPLE" type="int" value="34844"/>
		<constant name="GL_ALPHA_FLOAT16_ATI" type="int" value="34844"/>
		<constant name="GL_ALPHA_FLOAT32_APPLE" type="int" value="34838"/>
		<constant name="GL_ALPHA_FLOAT32_ATI" type="int" value="34838"/>
		<constant name="GL_ALPHA_MAX_CLAMP_INGR" type="int" value="34151"/>
		<constant name="GL_ALPHA_MAX_SGIX" type="int" value="33569"/>
		<constant name="GL_ALPHA_MIN_CLAMP_INGR" type="int" value="34147"/>
		<constant name="GL_ALPHA_MIN_SGIX" type="int" value="33568"/>
		<constant name="GL_ALPHA_SIGNED_SGIX" type="int" value="34274"/>
		<constant name="GL_ALWAYS_FAST_HINT_PGI" type="int" value="107020"/>
		<constant name="GL_ALWAYS_SOFT_HINT_PGI" type="int" value="107021"/>
		<constant name="GL_APPLE_client_storage" type="int" value="1"/>
		<constant name="GL_APPLE_element_array" type="int" value="1"/>
		<constant name="GL_APPLE_fence" type="int" value="1"/>
		<constant name="GL_APPLE_float_pixels" type="int" value="1"/>
		<constant name="GL_APPLE_packed_pixels" type="int" value="1"/>
		<constant name="GL_APPLE_specular_vector" type="int" value="1"/>
		<constant name="GL_APPLE_texture_range" type="int" value="1"/>
		<constant name="GL_APPLE_transform_hint" type="int" value="1"/>
		<constant name="GL_APPLE_vertex_array_object" type="int" value="1"/>
		<constant name="GL_APPLE_vertex_array_range" type="int" value="1"/>
		<constant name="GL_APPLE_vertex_program_evaluators" type="int" value="1"/>
		<constant name="GL_APPLE_ycbcr_422" type="int" value="1"/>
		<constant name="GL_ARB_depth_texture" type="int" value="1"/>
		<constant name="GL_ARB_fragment_program" type="int" value="1"/>
		<constant name="GL_ARB_matrix_palette" type="int" value="1"/>
		<constant name="GL_ARB_multisample" type="int" value="1"/>
		<constant name="GL_ARB_multitexture" type="int" value="1"/>
		<constant name="GL_ARB_point_parameters" type="int" value="1"/>
		<constant name="GL_ARB_shadow" type="int" value="1"/>
		<constant name="GL_ARB_shadow_ambient" type="int" value="1"/>
		<constant name="GL_ARB_texture_border_clamp" type="int" value="1"/>
		<constant name="GL_ARB_texture_compression" type="int" value="1"/>
		<constant name="GL_ARB_texture_cube_map" type="int" value="1"/>
		<constant name="GL_ARB_texture_env_add" type="int" value="1"/>
		<constant name="GL_ARB_texture_env_combine" type="int" value="1"/>
		<constant name="GL_ARB_texture_env_crossbar" type="int" value="1"/>
		<constant name="GL_ARB_texture_env_dot3" type="int" value="1"/>
		<constant name="GL_ARB_texture_mirrored_repeat" type="int" value="1"/>
		<constant name="GL_ARB_transpose_matrix" type="int" value="1"/>
		<constant name="GL_ARB_vertex_blend" type="int" value="1"/>
		<constant name="GL_ARB_vertex_buffer_object" type="int" value="1"/>
		<constant name="GL_ARB_vertex_program" type="int" value="1"/>
		<constant name="GL_ARB_window_pos" type="int" value="1"/>
		<constant name="GL_ARRAY_BUFFER_ARB" type="int" value="34962"/>
		<constant name="GL_ARRAY_BUFFER_BINDING_ARB" type="int" value="34964"/>
		<constant name="GL_ARRAY_ELEMENT_LOCK_COUNT_EXT" type="int" value="33193"/>
		<constant name="GL_ARRAY_ELEMENT_LOCK_FIRST_EXT" type="int" value="33192"/>
		<constant name="GL_ARRAY_OBJECT_BUFFER_ATI" type="int" value="34662"/>
		<constant name="GL_ARRAY_OBJECT_OFFSET_ATI" type="int" value="34663"/>
		<constant name="GL_ASYNC_DRAW_PIXELS_SGIX" type="int" value="33629"/>
		<constant name="GL_ASYNC_HISTOGRAM_SGIX" type="int" value="33580"/>
		<constant name="GL_ASYNC_MARKER_SGIX" type="int" value="33577"/>
		<constant name="GL_ASYNC_READ_PIXELS_SGIX" type="int" value="33630"/>
		<constant name="GL_ASYNC_TEX_IMAGE_SGIX" type="int" value="33628"/>
		<constant name="GL_ATIX_pn_triangles" type="int" value="1"/>
		<constant name="GL_ATIX_point_sprites" type="int" value="1"/>
		<constant name="GL_ATIX_texture_env_combine3" type="int" value="1"/>
		<constant name="GL_ATIX_texture_env_route" type="int" value="1"/>
		<constant name="GL_ATIX_vertex_shader_output_point_size" type="int" value="1"/>
		<constant name="GL_ATI_blend_equation_separate" type="int" value="1"/>
		<constant name="GL_ATI_blend_weighted_minmax" type="int" value="1"/>
		<constant name="GL_ATI_draw_buffers" type="int" value="1"/>
		<constant name="GL_ATI_element_array" type="int" value="1"/>
		<constant name="GL_ATI_envmap_bumpmap" type="int" value="1"/>
		<constant name="GL_ATI_fragment_shader" type="int" value="1"/>
		<constant name="GL_ATI_map_object_buffer" type="int" value="1"/>
		<constant name="GL_ATI_pn_triangles" type="int" value="1"/>
		<constant name="GL_ATI_point_cull_mode" type="int" value="1"/>
		<constant name="GL_ATI_separate_stencil" type="int" value="1"/>
		<constant name="GL_ATI_text_fragment_shader" type="int" value="1"/>
		<constant name="GL_ATI_texture_env_combine3" type="int" value="1"/>
		<constant name="GL_ATI_texture_float" type="int" value="1"/>
		<constant name="GL_ATI_texture_mirror_once" type="int" value="1"/>
		<constant name="GL_ATI_vertex_array_object" type="int" value="1"/>
		<constant name="GL_ATI_vertex_attrib_array_object" type="int" value="1"/>
		<constant name="GL_ATI_vertex_streams" type="int" value="1"/>
		<constant name="GL_ATTENUATION_EXT" type="int" value="33613"/>
		<constant name="GL_ATTRIB_ARRAY_POINTER_NV" type="int" value="34373"/>
		<constant name="GL_ATTRIB_ARRAY_SIZE_NV" type="int" value="34339"/>
		<constant name="GL_ATTRIB_ARRAY_STRIDE_NV" type="int" value="34340"/>
		<constant name="GL_ATTRIB_ARRAY_TYPE_NV" type="int" value="34341"/>
		<constant name="GL_AVERAGE_EXT" type="int" value="33589"/>
		<constant name="GL_AVERAGE_HP" type="int" value="33120"/>
		<constant name="GL_Autodesk_facet_normal" type="int" value="1"/>
		<constant name="GL_Autodesk_valid_back_buffer_hint" type="int" value="1"/>
		<constant name="GL_BACK_NORMALS_HINT_PGI" type="int" value="107043"/>
		<constant name="GL_BGR" type="int" value="32992"/>
		<constant name="GL_BGRA" type="int" value="32993"/>
		<constant name="GL_BGRA_EXT" type="int" value="32993"/>
		<constant name="GL_BGR_EXT" type="int" value="32992"/>
		<constant name="GL_BIAS_BIT_ATI" type="int" value="8"/>
		<constant name="GL_BIAS_BY_NEGATIVE_ONE_HALF_NV" type="int" value="34113"/>
		<constant name="GL_BINORMAL_ARRAY_EXT" type="int" value="33850"/>
		<constant name="GL_BINORMAL_ARRAY_POINTER_EXT" type="int" value="33859"/>
		<constant name="GL_BINORMAL_ARRAY_STRIDE_EXT" type="int" value="33857"/>
		<constant name="GL_BINORMAL_ARRAY_TYPE_EXT" type="int" value="33856"/>
		<constant name="GL_BLEND_COLOR" type="int" value="32773"/>
		<constant name="GL_BLEND_COLOR_EXT" type="int" value="32773"/>
		<constant name="GL_BLEND_DST_ALPHA" type="int" value="32970"/>
		<constant name="GL_BLEND_DST_ALPHA_EXT" type="int" value="32970"/>
		<constant name="GL_BLEND_DST_RGB" type="int" value="32968"/>
		<constant name="GL_BLEND_DST_RGB_EXT" type="int" value="32968"/>
		<constant name="GL_BLEND_EQUATION" type="int" value="32777"/>
		<constant name="GL_BLEND_EQUATION_EXT" type="int" value="32777"/>
		<constant name="GL_BLEND_SRC_ALPHA" type="int" value="32971"/>
		<constant name="GL_BLEND_SRC_ALPHA_EXT" type="int" value="32971"/>
		<constant name="GL_BLEND_SRC_RGB" type="int" value="32969"/>
		<constant name="GL_BLEND_SRC_RGB_EXT" type="int" value="32969"/>
		<constant name="GL_BLUE_BIT_ATI" type="int" value="4"/>
		<constant name="GL_BLUE_MAX_CLAMP_INGR" type="int" value="34150"/>
		<constant name="GL_BLUE_MIN_CLAMP_INGR" type="int" value="34146"/>
		<constant name="GL_BUFFER_ACCESS_ARB" type="int" value="35003"/>
		<constant name="GL_BUFFER_MAPPED_ARB" type="int" value="35004"/>
		<constant name="GL_BUFFER_MAP_POINTER_ARB" type="int" value="35005"/>
		<constant name="GL_BUFFER_SIZE_ARB" type="int" value="34660"/>
		<constant name="GL_BUFFER_USAGE_ARB" type="int" value="34661"/>
		<constant name="GL_BUMP_ENVMAP_ATI" type="int" value="34683"/>
		<constant name="GL_BUMP_NUM_TEX_UNITS_ATI" type="int" value="34679"/>
		<constant name="GL_BUMP_ROT_MATRIX_ATI" type="int" value="34677"/>
		<constant name="GL_BUMP_ROT_MATRIX_SIZE_ATI" type="int" value="34678"/>
		<constant name="GL_BUMP_TARGET_ATI" type="int" value="34684"/>
		<constant name="GL_BUMP_TEX_UNITS_ATI" type="int" value="34680"/>
		<constant name="GL_CALLIGRAPHIC_FRAGMENT_SGIX" type="int" value="33155"/>
		<constant name="GL_CLAMP_TO_BORDER" type="int" value="33069"/>
		<constant name="GL_CLAMP_TO_BORDER_ARB" type="int" value="33069"/>
		<constant name="GL_CLAMP_TO_BORDER_SGIS" type="int" value="33069"/>
		<constant name="GL_CLAMP_TO_EDGE" type="int" value="33071"/>
		<constant name="GL_CLAMP_TO_EDGE_EXT" type="int" value="33071"/>
		<constant name="GL_CLAMP_TO_EDGE_SGI" type="int" value="33071"/>
		<constant name="GL_CLAMP_TO_EDGE_SGIS" type="int" value="33071"/>
		<constant name="GL_CLIENT_ACTIVE_TEXTURE" type="int" value="34017"/>
		<constant name="GL_CLIENT_ACTIVE_TEXTURE_ARB" type="int" value="34017"/>
		<constant name="GL_CLIP_FAR_HINT_PGI" type="int" value="107041"/>
		<constant name="GL_CLIP_NEAR_HINT_PGI" type="int" value="107040"/>
		<constant name="GL_CLIP_VOLUME_CLIPPING_HINT_EXT" type="int" value="33008"/>
		<constant name="GL_CMYKA_EXT" type="int" value="32781"/>
		<constant name="GL_CMYK_EXT" type="int" value="32780"/>
		<constant name="GL_CND0_ATI" type="int" value="35179"/>
		<constant name="GL_CND_ATI" type="int" value="35178"/>
		<constant name="GL_COLOR3_BIT_PGI" type="int" value="65536"/>
		<constant name="GL_COLOR4_BIT_PGI" type="int" value="131072"/>
		<constant name="GL_COLOR_ALPHA_PAIRING_ATI" type="int" value="35189"/>
		<constant name="GL_COLOR_ARRAY_BUFFER_BINDING_ARB" type="int" value="34968"/>
		<constant name="GL_COLOR_ARRAY_COUNT_EXT" type="int" value="32900"/>
		<constant name="GL_COLOR_ARRAY_EXT" type="int" value="32886"/>
		<constant name="GL_COLOR_ARRAY_LIST_IBM" type="int" value="103072"/>
		<constant name="GL_COLOR_ARRAY_LIST_STRIDE_IBM" type="int" value="103082"/>
		<constant name="GL_COLOR_ARRAY_PARALLEL_POINTERS_INTEL" type="int" value="33783"/>
		<constant name="GL_COLOR_ARRAY_POINTER_EXT" type="int" value="32912"/>
		<constant name="GL_COLOR_ARRAY_SIZE_EXT" type="int" value="32897"/>
		<constant name="GL_COLOR_ARRAY_STRIDE_EXT" type="int" value="32899"/>
		<constant name="GL_COLOR_ARRAY_TYPE_EXT" type="int" value="32898"/>
		<constant name="GL_COLOR_BIT_PATTERN_SGIX" type="int" value="0"/>
		<constant name="GL_COLOR_CLEAR_UNCLAMPED_VALUE_ATI" type="int" value="34869"/>
		<constant name="GL_COLOR_FLOAT_APPLE" type="int" value="35343"/>
		<constant name="GL_COLOR_INDEX12_EXT" type="int" value="32998"/>
		<constant name="GL_COLOR_INDEX16_EXT" type="int" value="32999"/>
		<constant name="GL_COLOR_INDEX1_EXT" type="int" value="32994"/>
		<constant name="GL_COLOR_INDEX2_EXT" type="int" value="32995"/>
		<constant name="GL_COLOR_INDEX4_EXT" type="int" value="32996"/>
		<constant name="GL_COLOR_INDEX8_EXT" type="int" value="32997"/>
		<constant name="GL_COLOR_MATRIX" type="int" value="32945"/>
		<constant name="GL_COLOR_MATRIX_SGI" type="int" value="32945"/>
		<constant name="GL_COLOR_MATRIX_STACK_DEPTH" type="int" value="32946"/>
		<constant name="GL_COLOR_MATRIX_STACK_DEPTH_SGI" type="int" value="32946"/>
		<constant name="GL_COLOR_SUM" type="int" value="33880"/>
		<constant name="GL_COLOR_SUM_ARB" type="int" value="33880"/>
		<constant name="GL_COLOR_SUM_CLAMP_NV" type="int" value="34127"/>
		<constant name="GL_COLOR_SUM_EXT" type="int" value="33880"/>
		<constant name="GL_COLOR_TABLE" type="int" value="32976"/>
		<constant name="GL_COLOR_TABLE_ALPHA_SIZE" type="int" value="32989"/>
		<constant name="GL_COLOR_TABLE_ALPHA_SIZE_SGI" type="int" value="32989"/>
		<constant name="GL_COLOR_TABLE_BIAS" type="int" value="32983"/>
		<constant name="GL_COLOR_TABLE_BIAS_SGI" type="int" value="32983"/>
		<constant name="GL_COLOR_TABLE_BLUE_SIZE" type="int" value="32988"/>
		<constant name="GL_COLOR_TABLE_BLUE_SIZE_SGI" type="int" value="32988"/>
		<constant name="GL_COLOR_TABLE_FORMAT" type="int" value="32984"/>
		<constant name="GL_COLOR_TABLE_FORMAT_SGI" type="int" value="32984"/>
		<constant name="GL_COLOR_TABLE_GREEN_SIZE" type="int" value="32987"/>
		<constant name="GL_COLOR_TABLE_GREEN_SIZE_SGI" type="int" value="32987"/>
		<constant name="GL_COLOR_TABLE_INTENSITY_SIZE" type="int" value="32991"/>
		<constant name="GL_COLOR_TABLE_INTENSITY_SIZE_SGI" type="int" value="32991"/>
		<constant name="GL_COLOR_TABLE_LUMINANCE_SIZE" type="int" value="32990"/>
		<constant name="GL_COLOR_TABLE_LUMINANCE_SIZE_SGI" type="int" value="32990"/>
		<constant name="GL_COLOR_TABLE_RED_SIZE" type="int" value="32986"/>
		<constant name="GL_COLOR_TABLE_RED_SIZE_SGI" type="int" value="32986"/>
		<constant name="GL_COLOR_TABLE_SCALE" type="int" value="32982"/>
		<constant name="GL_COLOR_TABLE_SCALE_SGI" type="int" value="32982"/>
		<constant name="GL_COLOR_TABLE_SGI" type="int" value="32976"/>
		<constant name="GL_COLOR_TABLE_WIDTH" type="int" value="32985"/>
		<constant name="GL_COLOR_TABLE_WIDTH_SGI" type="int" value="32985"/>
		<constant name="GL_COLOR_TO_TEXTURE_COORD_SGIX" type="int" value="0"/>
		<constant name="GL_COLOR_VALUE_SGIX" type="int" value="0"/>
		<constant name="GL_COMBINE" type="int" value="34160"/>
		<constant name="GL_COMBINE4_NV" type="int" value="34051"/>
		<constant name="GL_COMBINER0_NV" type="int" value="34128"/>
		<constant name="GL_COMBINER1_NV" type="int" value="34129"/>
		<constant name="GL_COMBINER2_NV" type="int" value="34130"/>
		<constant name="GL_COMBINER3_NV" type="int" value="34131"/>
		<constant name="GL_COMBINER4_NV" type="int" value="34132"/>
		<constant name="GL_COMBINER5_NV" type="int" value="34133"/>
		<constant name="GL_COMBINER6_NV" type="int" value="34134"/>
		<constant name="GL_COMBINER7_NV" type="int" value="34135"/>
		<constant name="GL_COMBINER_AB_DOT_PRODUCT_NV" type="int" value="34117"/>
		<constant name="GL_COMBINER_AB_OUTPUT_NV" type="int" value="34122"/>
		<constant name="GL_COMBINER_BIAS_NV" type="int" value="34121"/>
		<constant name="GL_COMBINER_CD_DOT_PRODUCT_NV" type="int" value="34118"/>
		<constant name="GL_COMBINER_CD_OUTPUT_NV" type="int" value="34123"/>
		<constant name="GL_COMBINER_COMPONENT_USAGE_NV" type="int" value="34116"/>
		<constant name="GL_COMBINER_INPUT_NV" type="int" value="34114"/>
		<constant name="GL_COMBINER_MAPPING_NV" type="int" value="34115"/>
		<constant name="GL_COMBINER_MUX_SUM_NV" type="int" value="34119"/>
		<constant name="GL_COMBINER_SCALE_NV" type="int" value="34120"/>
		<constant name="GL_COMBINER_SUM_OUTPUT_NV" type="int" value="34124"/>
		<constant name="GL_COMBINE_ALPHA" type="int" value="34162"/>
		<constant name="GL_COMBINE_ALPHA_ARB" type="int" value="34162"/>
		<constant name="GL_COMBINE_ALPHA_EXT" type="int" value="34162"/>
		<constant name="GL_COMBINE_ARB" type="int" value="34160"/>
		<constant name="GL_COMBINE_EXT" type="int" value="34160"/>
		<constant name="GL_COMBINE_RGB" type="int" value="34161"/>
		<constant name="GL_COMBINE_RGB_ARB" type="int" value="34161"/>
		<constant name="GL_COMBINE_RGB_EXT" type="int" value="34161"/>
		<constant name="GL_COMPARE_R_TO_TEXTURE" type="int" value="34894"/>
		<constant name="GL_COMPARE_R_TO_TEXTURE_ARB" type="int" value="34894"/>
		<constant name="GL_COMPRESSED_ALPHA" type="int" value="34025"/>
		<constant name="GL_COMPRESSED_ALPHA_ARB" type="int" value="34025"/>
		<constant name="GL_COMPRESSED_INTENSITY" type="int" value="34028"/>
		<constant name="GL_COMPRESSED_INTENSITY_ARB" type="int" value="34028"/>
		<constant name="GL_COMPRESSED_LUMINANCE" type="int" value="34026"/>
		<constant name="GL_COMPRESSED_LUMINANCE_ALPHA" type="int" value="34027"/>
		<constant name="GL_COMPRESSED_LUMINANCE_ALPHA_ARB" type="int" value="34027"/>
		<constant name="GL_COMPRESSED_LUMINANCE_ARB" type="int" value="34026"/>
		<constant name="GL_COMPRESSED_RGB" type="int" value="34029"/>
		<constant name="GL_COMPRESSED_RGBA" type="int" value="34030"/>
		<constant name="GL_COMPRESSED_RGBA_ARB" type="int" value="34030"/>
		<constant name="GL_COMPRESSED_RGBA_FXT1_3DFX" type="int" value="34481"/>
		<constant name="GL_COMPRESSED_RGBA_S3TC_DXT1_EXT" type="int" value="33777"/>
		<constant name="GL_COMPRESSED_RGBA_S3TC_DXT3_EXT" type="int" value="33778"/>
		<constant name="GL_COMPRESSED_RGBA_S3TC_DXT5_EXT" type="int" value="33779"/>
		<constant name="GL_COMPRESSED_RGB_ARB" type="int" value="34029"/>
		<constant name="GL_COMPRESSED_RGB_FXT1_3DFX" type="int" value="34480"/>
		<constant name="GL_COMPRESSED_RGB_S3TC_DXT1_EXT" type="int" value="33776"/>
		<constant name="GL_COMPRESSED_TEXTURE_FORMATS" type="int" value="34467"/>
		<constant name="GL_COMPRESSED_TEXTURE_FORMATS_ARB" type="int" value="34467"/>
		<constant name="GL_COMP_BIT_ATI" type="int" value="2"/>
		<constant name="GL_CONSERVE_MEMORY_HINT_PGI" type="int" value="107005"/>
		<constant name="GL_CONSTANT" type="int" value="34166"/>
		<constant name="GL_CONSTANT_ALPHA" type="int" value="32771"/>
		<constant name="GL_CONSTANT_ALPHA_EXT" type="int" value="32771"/>
		<constant name="GL_CONSTANT_ARB" type="int" value="34166"/>
		<constant name="GL_CONSTANT_BORDER" type="int" value="33105"/>
		<constant name="GL_CONSTANT_BORDER_HP" type="int" value="33105"/>
		<constant name="GL_CONSTANT_COLOR" type="int" value="32769"/>
		<constant name="GL_CONSTANT_COLOR0_NV" type="int" value="34090"/>
		<constant name="GL_CONSTANT_COLOR1_NV" type="int" value="34091"/>
		<constant name="GL_CONSTANT_COLOR_EXT" type="int" value="32769"/>
		<constant name="GL_CONSTANT_EXT" type="int" value="34166"/>
		<constant name="GL_CONST_EYE_NV" type="int" value="34533"/>
		<constant name="GL_CONVOLUTION_1D" type="int" value="32784"/>
		<constant name="GL_CONVOLUTION_1D_EXT" type="int" value="32784"/>
		<constant name="GL_CONVOLUTION_2D" type="int" value="32785"/>
		<constant name="GL_CONVOLUTION_2D_EXT" type="int" value="32785"/>
		<constant name="GL_CONVOLUTION_BORDER_COLOR" type="int" value="33108"/>
		<constant name="GL_CONVOLUTION_BORDER_COLOR_HP" type="int" value="33108"/>
		<constant name="GL_CONVOLUTION_BORDER_MODE" type="int" value="32787"/>
		<constant name="GL_CONVOLUTION_BORDER_MODE_EXT" type="int" value="32787"/>
		<constant name="GL_CONVOLUTION_FILTER_BIAS" type="int" value="32789"/>
		<constant name="GL_CONVOLUTION_FILTER_BIAS_EXT" type="int" value="32789"/>
		<constant name="GL_CONVOLUTION_FILTER_SCALE" type="int" value="32788"/>
		<constant name="GL_CONVOLUTION_FILTER_SCALE_EXT" type="int" value="32788"/>
		<constant name="GL_CONVOLUTION_FORMAT" type="int" value="32791"/>
		<constant name="GL_CONVOLUTION_FORMAT_EXT" type="int" value="32791"/>
		<constant name="GL_CONVOLUTION_HEIGHT" type="int" value="32793"/>
		<constant name="GL_CONVOLUTION_HEIGHT_EXT" type="int" value="32793"/>
		<constant name="GL_CONVOLUTION_HINT_SGIX" type="int" value="33558"/>
		<constant name="GL_CONVOLUTION_WIDTH" type="int" value="32792"/>
		<constant name="GL_CONVOLUTION_WIDTH_EXT" type="int" value="32792"/>
		<constant name="GL_CON_0_ATI" type="int" value="35137"/>
		<constant name="GL_CON_10_ATI" type="int" value="35147"/>
		<constant name="GL_CON_11_ATI" type="int" value="35148"/>
		<constant name="GL_CON_12_ATI" type="int" value="35149"/>
		<constant name="GL_CON_13_ATI" type="int" value="35150"/>
		<constant name="GL_CON_14_ATI" type="int" value="35151"/>
		<constant name="GL_CON_15_ATI" type="int" value="35152"/>
		<constant name="GL_CON_16_ATI" type="int" value="35153"/>
		<constant name="GL_CON_17_ATI" type="int" value="35154"/>
		<constant name="GL_CON_18_ATI" type="int" value="35155"/>
		<constant name="GL_CON_19_ATI" type="int" value="35156"/>
		<constant name="GL_CON_1_ATI" type="int" value="35138"/>
		<constant name="GL_CON_20_ATI" type="int" value="35157"/>
		<constant name="GL_CON_21_ATI" type="int" value="35158"/>
		<constant name="GL_CON_22_ATI" type="int" value="35159"/>
		<constant name="GL_CON_23_ATI" type="int" value="35160"/>
		<constant name="GL_CON_24_ATI" type="int" value="35161"/>
		<constant name="GL_CON_25_ATI" type="int" value="35162"/>
		<constant name="GL_CON_26_ATI" type="int" value="35163"/>
		<constant name="GL_CON_27_ATI" type="int" value="35164"/>
		<constant name="GL_CON_28_ATI" type="int" value="35165"/>
		<constant name="GL_CON_29_ATI" type="int" value="35166"/>
		<constant name="GL_CON_2_ATI" type="int" value="35139"/>
		<constant name="GL_CON_30_ATI" type="int" value="35167"/>
		<constant name="GL_CON_31_ATI" type="int" value="35168"/>
		<constant name="GL_CON_3_ATI" type="int" value="35140"/>
		<constant name="GL_CON_4_ATI" type="int" value="35141"/>
		<constant name="GL_CON_5_ATI" type="int" value="35142"/>
		<constant name="GL_CON_6_ATI" type="int" value="35143"/>
		<constant name="GL_CON_7_ATI" type="int" value="35144"/>
		<constant name="GL_CON_8_ATI" type="int" value="35145"/>
		<constant name="GL_CON_9_ATI" type="int" value="35146"/>
		<constant name="GL_COORD_REPLACE_NV" type="int" value="34914"/>
		<constant name="GL_CUBIC_EXT" type="int" value="33588"/>
		<constant name="GL_CUBIC_HP" type="int" value="33119"/>
		<constant name="GL_CULL_FRAGMENT_NV" type="int" value="34535"/>
		<constant name="GL_CULL_MODES_NV" type="int" value="34528"/>
		<constant name="GL_CULL_VERTEX_EXT" type="int" value="33194"/>
		<constant name="GL_CULL_VERTEX_EYE_POSITION_EXT" type="int" value="33195"/>
		<constant name="GL_CULL_VERTEX_IBM" type="int" value="103050"/>
		<constant name="GL_CULL_VERTEX_OBJECT_POSITION_EXT" type="int" value="33196"/>
		<constant name="GL_CURRENT_ATTRIB_NV" type="int" value="34342"/>
		<constant name="GL_CURRENT_BINORMAL_EXT" type="int" value="33852"/>
		<constant name="GL_CURRENT_FOG_COORDINATE" type="int" value="33875"/>
		<constant name="GL_CURRENT_FOG_COORDINATE_EXT" type="int" value="33875"/>
		<constant name="GL_CURRENT_MATRIX_ARB" type="int" value="34369"/>
		<constant name="GL_CURRENT_MATRIX_INDEX_ARB" type="int" value="34885"/>
		<constant name="GL_CURRENT_MATRIX_NV" type="int" value="34369"/>
		<constant name="GL_CURRENT_MATRIX_STACK_DEPTH_ARB" type="int" value="34368"/>
		<constant name="GL_CURRENT_MATRIX_STACK_DEPTH_NV" type="int" value="34368"/>
		<constant name="GL_CURRENT_OCCLUSION_QUERY_ID_NV" type="int" value="34917"/>
		<constant name="GL_CURRENT_PALETTE_MATRIX_ARB" type="int" value="34883"/>
		<constant name="GL_CURRENT_RASTER_NORMAL_EXT" type="int" value="33798"/>
		<constant name="GL_CURRENT_RASTER_NORMAL_SGIX" type="int" value="33798"/>
		<constant name="GL_CURRENT_SECONDARY_COLOR" type="int" value="33881"/>
		<constant name="GL_CURRENT_SECONDARY_COLOR_EXT" type="int" value="33881"/>
		<constant name="GL_CURRENT_TANGENT_EXT" type="int" value="33851"/>
		<constant name="GL_CURRENT_VERTEX_ATTRIB_ARB" type="int" value="34342"/>
		<constant name="GL_CURRENT_VERTEX_EXT" type="int" value="34786"/>
		<constant name="GL_CURRENT_VERTEX_WEIGHT_EXT" type="int" value="34059"/>
		<constant name="GL_CURRENT_WEIGHT_ARB" type="int" value="34472"/>
		<constant name="GL_DECR_WRAP" type="int" value="34056"/>
		<constant name="GL_DECR_WRAP_EXT" type="int" value="34056"/>
		<constant name="GL_DEFORMATIONS_MASK_SGIX" type="int" value="33174"/>
		<constant name="GL_DEPENDENT_AR_TEXTURE_2D_NV" type="int" value="34537"/>
		<constant name="GL_DEPENDENT_GB_TEXTURE_2D_NV" type="int" value="34538"/>
		<constant name="GL_DEPENDENT_HILO_TEXTURE_2D_NV" type="int" value="34904"/>
		<constant name="GL_DEPENDENT_RGB_TEXTURE_3D_NV" type="int" value="34905"/>
		<constant name="GL_DEPENDENT_RGB_TEXTURE_CUBE_MAP_NV" type="int" value="34906"/>
		<constant name="GL_DEPTH_BOUNDS_EXT" type="int" value="34961"/>
		<constant name="GL_DEPTH_BOUNDS_TEST_EXT" type="int" value="34960"/>
		<constant name="GL_DEPTH_CLAMP_NV" type="int" value="34383"/>
		<constant name="GL_DEPTH_COMPONENT16" type="int" value="33189"/>
		<constant name="GL_DEPTH_COMPONENT16_ARB" type="int" value="33189"/>
		<constant name="GL_DEPTH_COMPONENT16_SGIX" type="int" value="33189"/>
		<constant name="GL_DEPTH_COMPONENT24" type="int" value="33190"/>
		<constant name="GL_DEPTH_COMPONENT24_ARB" type="int" value="33190"/>
		<constant name="GL_DEPTH_COMPONENT24_SGIX" type="int" value="33190"/>
		<constant name="GL_DEPTH_COMPONENT32" type="int" value="33191"/>
		<constant name="GL_DEPTH_COMPONENT32_ARB" type="int" value="33191"/>
		<constant name="GL_DEPTH_COMPONENT32_SGIX" type="int" value="33191"/>
		<constant name="GL_DEPTH_PASS_INSTRUMENT_COUNTERS_SGIX" type="int" value="33553"/>
		<constant name="GL_DEPTH_PASS_INSTRUMENT_MAX_SGIX" type="int" value="33554"/>
		<constant name="GL_DEPTH_PASS_INSTRUMENT_SGIX" type="int" value="33552"/>
		<constant name="GL_DEPTH_STENCIL_NV" type="int" value="34041"/>
		<constant name="GL_DEPTH_STENCIL_TO_BGRA_NV" type="int" value="34927"/>
		<constant name="GL_DEPTH_STENCIL_TO_RGBA_NV" type="int" value="34926"/>
		<constant name="GL_DEPTH_TEXTURE_MODE" type="int" value="34891"/>
		<constant name="GL_DEPTH_TEXTURE_MODE_ARB" type="int" value="34891"/>
		<constant name="GL_DETAIL_TEXTURE_2D_BINDING_SGIS" type="int" value="32918"/>
		<constant name="GL_DETAIL_TEXTURE_2D_SGIS" type="int" value="32917"/>
		<constant name="GL_DETAIL_TEXTURE_FUNC_POINTS_SGIS" type="int" value="32924"/>
		<constant name="GL_DETAIL_TEXTURE_LEVEL_SGIS" type="int" value="32922"/>
		<constant name="GL_DETAIL_TEXTURE_MODE_SGIS" type="int" value="32923"/>
		<constant name="GL_DISCARD_ATI" type="int" value="34659"/>
		<constant name="GL_DISCARD_NV" type="int" value="34096"/>
		<constant name="GL_DISTANCE_ATTENUATION_EXT" type="int" value="33065"/>
		<constant name="GL_DISTANCE_ATTENUATION_SGIS" type="int" value="33065"/>
		<constant name="GL_DOT2_ADD_ATI" type="int" value="35180"/>
		<constant name="GL_DOT3_ATI" type="int" value="35174"/>
		<constant name="GL_DOT3_RGB" type="int" value="34478"/>
		<constant name="GL_DOT3_RGBA" type="int" value="34479"/>
		<constant name="GL_DOT3_RGBA_ARB" type="int" value="34479"/>
		<constant name="GL_DOT3_RGBA_EXT" type="int" value="34625"/>
		<constant name="GL_DOT3_RGB_ARB" type="int" value="34478"/>
		<constant name="GL_DOT3_RGB_EXT" type="int" value="34624"/>
		<constant name="GL_DOT4_ATI" type="int" value="35175"/>
		<constant name="GL_DOT_PRODUCT_AFFINE_DEPTH_REPLACE_NV" type="int" value="34909"/>
		<constant name="GL_DOT_PRODUCT_CONST_EYE_REFLECT_CUBE_MAP_NV" type="int" value="34547"/>
		<constant name="GL_DOT_PRODUCT_DEPTH_REPLACE_NV" type="int" value="34541"/>
		<constant name="GL_DOT_PRODUCT_DIFFUSE_CUBE_MAP_NV" type="int" value="34545"/>
		<constant name="GL_DOT_PRODUCT_NV" type="int" value="34540"/>
		<constant name="GL_DOT_PRODUCT_PASS_THROUGH_NV" type="int" value="34907"/>
		<constant name="GL_DOT_PRODUCT_REFLECT_CUBE_MAP_NV" type="int" value="34546"/>
		<constant name="GL_DOT_PRODUCT_TEXTURE_1D_NV" type="int" value="34908"/>
		<constant name="GL_DOT_PRODUCT_TEXTURE_2D_NV" type="int" value="34542"/>
		<constant name="GL_DOT_PRODUCT_TEXTURE_3D_NV" type="int" value="34543"/>
		<constant name="GL_DOT_PRODUCT_TEXTURE_CUBE_MAP_NV" type="int" value="34544"/>
		<constant name="GL_DOT_PRODUCT_TEXTURE_RECTANGLE_NV" type="int" value="34382"/>
		<constant name="GL_DRAW_BUFFER0_ATI" type="int" value="34853"/>
		<constant name="GL_DRAW_BUFFER10_ATI" type="int" value="34863"/>
		<constant name="GL_DRAW_BUFFER11_ATI" type="int" value="34864"/>
		<constant name="GL_DRAW_BUFFER12_ATI" type="int" value="34865"/>
		<constant name="GL_DRAW_BUFFER13_ATI" type="int" value="34866"/>
		<constant name="GL_DRAW_BUFFER14_ATI" type="int" value="34867"/>
		<constant name="GL_DRAW_BUFFER15_ATI" type="int" value="34868"/>
		<constant name="GL_DRAW_BUFFER1_ATI" type="int" value="34854"/>
		<constant name="GL_DRAW_BUFFER2_ATI" type="int" value="34855"/>
		<constant name="GL_DRAW_BUFFER3_ATI" type="int" value="34856"/>
		<constant name="GL_DRAW_BUFFER4_ATI" type="int" value="34857"/>
		<constant name="GL_DRAW_BUFFER5_ATI" type="int" value="34858"/>
		<constant name="GL_DRAW_BUFFER6_ATI" type="int" value="34859"/>
		<constant name="GL_DRAW_BUFFER7_ATI" type="int" value="34860"/>
		<constant name="GL_DRAW_BUFFER8_ATI" type="int" value="34861"/>
		<constant name="GL_DRAW_BUFFER9_ATI" type="int" value="34862"/>
		<constant name="GL_DRAW_PIXELS_APPLE" type="int" value="35338"/>
		<constant name="GL_DSDT8_MAG8_INTENSITY8_NV" type="int" value="34571"/>
		<constant name="GL_DSDT8_MAG8_NV" type="int" value="34570"/>
		<constant name="GL_DSDT8_NV" type="int" value="34569"/>
		<constant name="GL_DSDT_MAG_INTENSITY_NV" type="int" value="34524"/>
		<constant name="GL_DSDT_MAG_NV" type="int" value="34550"/>
		<constant name="GL_DSDT_MAG_VIB_NV" type="int" value="34551"/>
		<constant name="GL_DSDT_NV" type="int" value="34549"/>
		<constant name="GL_DS_BIAS_NV" type="int" value="34582"/>
		<constant name="GL_DS_SCALE_NV" type="int" value="34576"/>
		<constant name="GL_DT_BIAS_NV" type="int" value="34583"/>
		<constant name="GL_DT_SCALE_NV" type="int" value="34577"/>
		<constant name="GL_DU8DV8_ATI" type="int" value="34682"/>
		<constant name="GL_DUAL_ALPHA12_SGIS" type="int" value="33042"/>
		<constant name="GL_DUAL_ALPHA16_SGIS" type="int" value="33043"/>
		<constant name="GL_DUAL_ALPHA4_SGIS" type="int" value="33040"/>
		<constant name="GL_DUAL_ALPHA8_SGIS" type="int" value="33041"/>
		<constant name="GL_DUAL_INTENSITY12_SGIS" type="int" value="33050"/>
		<constant name="GL_DUAL_INTENSITY16_SGIS" type="int" value="33051"/>
		<constant name="GL_DUAL_INTENSITY4_SGIS" type="int" value="33048"/>
		<constant name="GL_DUAL_INTENSITY8_SGIS" type="int" value="33049"/>
		<constant name="GL_DUAL_LUMINANCE12_SGIS" type="int" value="33046"/>
		<constant name="GL_DUAL_LUMINANCE16_SGIS" type="int" value="33047"/>
		<constant name="GL_DUAL_LUMINANCE4_SGIS" type="int" value="33044"/>
		<constant name="GL_DUAL_LUMINANCE8_SGIS" type="int" value="33045"/>
		<constant name="GL_DUAL_LUMINANCE_ALPHA4_SGIS" type="int" value="33052"/>
		<constant name="GL_DUAL_LUMINANCE_ALPHA8_SGIS" type="int" value="33053"/>
		<constant name="GL_DUAL_TEXTURE_SELECT_SGIS" type="int" value="33060"/>
		<constant name="GL_DUDV_ATI" type="int" value="34681"/>
		<constant name="GL_DYNAMIC_ATI" type="int" value="34657"/>
		<constant name="GL_DYNAMIC_COPY_ARB" type="int" value="35050"/>
		<constant name="GL_DYNAMIC_DRAW_ARB" type="int" value="35048"/>
		<constant name="GL_DYNAMIC_READ_ARB" type="int" value="35049"/>
		<constant name="GL_EDGEFLAG_BIT_PGI" type="int" value="262144"/>
		<constant name="GL_EDGE_FLAG_ARRAY_BUFFER_BINDING_ARB" type="int" value="34971"/>
		<constant name="GL_EDGE_FLAG_ARRAY_COUNT_EXT" type="int" value="32909"/>
		<constant name="GL_EDGE_FLAG_ARRAY_EXT" type="int" value="32889"/>
		<constant name="GL_EDGE_FLAG_ARRAY_LIST_IBM" type="int" value="103075"/>
		<constant name="GL_EDGE_FLAG_ARRAY_LIST_STRIDE_IBM" type="int" value="103085"/>
		<constant name="GL_EDGE_FLAG_ARRAY_POINTER_EXT" type="int" value="32915"/>
		<constant name="GL_EDGE_FLAG_ARRAY_STRIDE_EXT" type="int" value="32908"/>
		<constant name="GL_EIGHTH_BIT_ATI" type="int" value="32"/>
		<constant name="GL_ELEMENT_ARRAY_APPLE" type="int" value="34664"/>
		<constant name="GL_ELEMENT_ARRAY_ATI" type="int" value="34664"/>
		<constant name="GL_ELEMENT_ARRAY_BUFFER_ARB" type="int" value="34963"/>
		<constant name="GL_ELEMENT_ARRAY_BUFFER_BINDING_ARB" type="int" value="34965"/>
		<constant name="GL_ELEMENT_ARRAY_POINTER_APPLE" type="int" value="34666"/>
		<constant name="GL_ELEMENT_ARRAY_POINTER_ATI" type="int" value="34666"/>
		<constant name="GL_ELEMENT_ARRAY_POINTER_NV" type="int" value="34666"/>
		<constant name="GL_ELEMENT_ARRAY_TYPE_APPLE" type="int" value="34665"/>
		<constant name="GL_ELEMENT_ARRAY_TYPE_ATI" type="int" value="34665"/>
		<constant name="GL_ELEMENT_ARRAY_TYPE_NV" type="int" value="34665"/>
		<constant name="GL_EMBOSS_CONSTANT_NV" type="int" value="34142"/>
		<constant name="GL_EMBOSS_LIGHT_NV" type="int" value="34141"/>
		<constant name="GL_EMBOSS_MAP_NV" type="int" value="34143"/>
		<constant name="GL_EVAL_2D_NV" type="int" value="34496"/>
		<constant name="GL_EVAL_FRACTIONAL_TESSELLATION_NV" type="int" value="34501"/>
		<constant name="GL_EVAL_TRIANGULAR_2D_NV" type="int" value="34497"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB0_NV" type="int" value="34502"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB10_NV" type="int" value="34512"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB11_NV" type="int" value="34513"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB12_NV" type="int" value="34514"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB13_NV" type="int" value="34515"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB14_NV" type="int" value="34516"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB15_NV" type="int" value="34517"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB1_NV" type="int" value="34503"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB2_NV" type="int" value="34504"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB3_NV" type="int" value="34505"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB4_NV" type="int" value="34506"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB5_NV" type="int" value="34507"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB6_NV" type="int" value="34508"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB7_NV" type="int" value="34509"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB8_NV" type="int" value="34510"/>
		<constant name="GL_EVAL_VERTEX_ATTRIB9_NV" type="int" value="34511"/>
		<constant name="GL_EXPAND_NEGATE_NV" type="int" value="34105"/>
		<constant name="GL_EXPAND_NORMAL_NV" type="int" value="34104"/>
		<constant name="GL_EXT_422_pixels" type="int" value="1"/>
		<constant name="GL_EXT_abgr" type="int" value="1"/>
		<constant name="GL_EXT_bgra" type="int" value="1"/>
		<constant name="GL_EXT_blend_color" type="int" value="1"/>
		<constant name="GL_EXT_blend_func_separate" type="int" value="1"/>
		<constant name="GL_EXT_blend_logic_op" type="int" value="1"/>
		<constant name="GL_EXT_blend_minmax" type="int" value="1"/>
		<constant name="GL_EXT_blend_subtract" type="int" value="1"/>
		<constant name="GL_EXT_clip_volume_hint" type="int" value="1"/>
		<constant name="GL_EXT_cmyka" type="int" value="1"/>
		<constant name="GL_EXT_color_matrix" type="int" value="1"/>
		<constant name="GL_EXT_color_subtable" type="int" value="1"/>
		<constant name="GL_EXT_compiled_vertex_array" type="int" value="1"/>
		<constant name="GL_EXT_convolution" type="int" value="1"/>
		<constant name="GL_EXT_coordinate_frame" type="int" value="1"/>
		<constant name="GL_EXT_copy_texture" type="int" value="1"/>
		<constant name="GL_EXT_cull_vertex" type="int" value="1"/>
		<constant name="GL_EXT_depth_bounds_test" type="int" value="1"/>
		<constant name="GL_EXT_draw_range_elements" type="int" value="1"/>
		<constant name="GL_EXT_fog_coord" type="int" value="1"/>
		<constant name="GL_EXT_fragment_lighting" type="int" value="1"/>
		<constant name="GL_EXT_histogram" type="int" value="1"/>
		<constant name="GL_EXT_index_array_formats" type="int" value="1"/>
		<constant name="GL_EXT_index_func" type="int" value="1"/>
		<constant name="GL_EXT_index_material" type="int" value="1"/>
		<constant name="GL_EXT_index_texture" type="int" value="1"/>
		<constant name="GL_EXT_light_texture" type="int" value="1"/>
		<constant name="GL_EXT_misc_attribute" type="int" value="1"/>
		<constant name="GL_EXT_multi_draw_arrays" type="int" value="1"/>
		<constant name="GL_EXT_multisample" type="int" value="1"/>
		<constant name="GL_EXT_multitexture" type="int" value="1"/>
		<constant name="GL_EXT_packed_pixels" type="int" value="1"/>
		<constant name="GL_EXT_paletted_texture" type="int" value="1"/>
		<constant name="GL_EXT_pixel_transform" type="int" value="1"/>
		<constant name="GL_EXT_pixel_transform_color_table" type="int" value="1"/>
		<constant name="GL_EXT_point_parameters" type="int" value="1"/>
		<constant name="GL_EXT_polygon_offset" type="int" value="1"/>
		<constant name="GL_EXT_rescale_normal" type="int" value="1"/>
		<constant name="GL_EXT_secondary_color" type="int" value="1"/>
		<constant name="GL_EXT_separate_specular_color" type="int" value="1"/>
		<constant name="GL_EXT_shadow_funcs" type="int" value="1"/>
		<constant name="GL_EXT_shared_texture_palette" type="int" value="1"/>
		<constant name="GL_EXT_stencil_two_side" type="int" value="1"/>
		<constant name="GL_EXT_stencil_wrap" type="int" value="1"/>
		<constant name="GL_EXT_subtexture" type="int" value="1"/>
		<constant name="GL_EXT_texgen_reflection" type="int" value="1"/>
		<constant name="GL_EXT_texture" type="int" value="1"/>
		<constant name="GL_EXT_texture3D" type="int" value="1"/>
		<constant name="GL_EXT_texture_edge_clamp" type="int" value="1"/>
		<constant name="GL_EXT_texture_env_add" type="int" value="1"/>
		<constant name="GL_EXT_texture_env_combine" type="int" value="1"/>
		<constant name="GL_EXT_texture_env_dot3" type="int" value="1"/>
		<constant name="GL_EXT_texture_filter_anisotropic" type="int" value="1"/>
		<constant name="GL_EXT_texture_lod_bias" type="int" value="1"/>
		<constant name="GL_EXT_texture_object" type="int" value="1"/>
		<constant name="GL_EXT_texture_perturb_normal" type="int" value="1"/>
		<constant name="GL_EXT_texture_rectangle" type="int" value="1"/>
		<constant name="GL_EXT_vertex_array" type="int" value="1"/>
		<constant name="GL_EXT_vertex_shader" type="int" value="1"/>
		<constant name="GL_EXT_vertex_weighting" type="int" value="1"/>
		<constant name="GL_EYE_DISTANCE_TO_LINE_SGIS" type="int" value="33266"/>
		<constant name="GL_EYE_DISTANCE_TO_POINT_SGIS" type="int" value="33264"/>
		<constant name="GL_EYE_LINE_SGIS" type="int" value="33270"/>
		<constant name="GL_EYE_PLANE_ABSOLUTE_NV" type="int" value="34140"/>
		<constant name="GL_EYE_POINT_SGIS" type="int" value="33268"/>
		<constant name="GL_EYE_RADIAL_NV" type="int" value="34139"/>
		<constant name="GL_E_TIMES_F_NV" type="int" value="34097"/>
		<constant name="GL_FACET_NORMAL" type="int" value="34256"/>
		<constant name="GL_FENCE_APPLE" type="int" value="35339"/>
		<constant name="GL_FENCE_CONDITION_NV" type="int" value="34036"/>
		<constant name="GL_FENCE_STATUS_NV" type="int" value="34035"/>
		<constant name="GL_FILTER4_SGIS" type="int" value="33094"/>
		<constant name="GL_FLOAT_CLEAR_COLOR_VALUE_NV" type="int" value="34957"/>
		<constant name="GL_FLOAT_R16_NV" type="int" value="34948"/>
		<constant name="GL_FLOAT_R32_NV" type="int" value="34949"/>
		<constant name="GL_FLOAT_RG16_NV" type="int" value="34950"/>
		<constant name="GL_FLOAT_RG32_NV" type="int" value="34951"/>
		<constant name="GL_FLOAT_RGB16_NV" type="int" value="34952"/>
		<constant name="GL_FLOAT_RGB32_NV" type="int" value="34953"/>
		<constant name="GL_FLOAT_RGBA16_NV" type="int" value="34954"/>
		<constant name="GL_FLOAT_RGBA32_NV" type="int" value="34955"/>
		<constant name="GL_FLOAT_RGBA_MODE_NV" type="int" value="34958"/>
		<constant name="GL_FLOAT_RGBA_NV" type="int" value="34947"/>
		<constant name="GL_FLOAT_RGB_NV" type="int" value="34946"/>
		<constant name="GL_FLOAT_RG_NV" type="int" value="34945"/>
		<constant name="GL_FLOAT_R_NV" type="int" value="34944"/>
		<constant name="GL_FOG_COORDINATE" type="int" value="33873"/>
		<constant name="GL_FOG_COORDINATE_ARRAY" type="int" value="33879"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_BUFFER_BINDING_ARB" type="int" value="34973"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_EXT" type="int" value="33879"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_LIST_IBM" type="int" value="103076"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_LIST_STRIDE_IBM" type="int" value="103086"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_POINTER" type="int" value="33878"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_POINTER_EXT" type="int" value="33878"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_STRIDE" type="int" value="33877"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_STRIDE_EXT" type="int" value="33877"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_TYPE" type="int" value="33876"/>
		<constant name="GL_FOG_COORDINATE_ARRAY_TYPE_EXT" type="int" value="33876"/>
		<constant name="GL_FOG_COORDINATE_EXT" type="int" value="33873"/>
		<constant name="GL_FOG_COORDINATE_SOURCE" type="int" value="33872"/>
		<constant name="GL_FOG_COORDINATE_SOURCE_EXT" type="int" value="33872"/>
		<constant name="GL_FOG_DISTANCE_MODE_NV" type="int" value="34138"/>
		<constant name="GL_FOG_FUNC_POINTS_SGIS" type="int" value="33067"/>
		<constant name="GL_FOG_FUNC_SGIS" type="int" value="33066"/>
		<constant name="GL_FOG_OFFSET_SGIX" type="int" value="33176"/>
		<constant name="GL_FOG_OFFSET_VALUE_SGIX" type="int" value="33177"/>
		<constant name="GL_FOG_PATCHY_FACTOR_SGIX" type="int" value="0"/>
		<constant name="GL_FOG_SCALE_SGIX" type="int" value="33276"/>
		<constant name="GL_FOG_SCALE_VALUE_SGIX" type="int" value="33277"/>
		<constant name="GL_FOG_SPECULAR_TEXTURE_WIN" type="int" value="33004"/>
		<constant name="GL_FORCE_BLUE_TO_ONE_NV" type="int" value="34912"/>
		<constant name="GL_FORMAT_SUBSAMPLE_244_244_OML" type="int" value="35203"/>
		<constant name="GL_FORMAT_SUBSAMPLE_24_24_OML" type="int" value="35202"/>
		<constant name="GL_FRAGMENT_COLOR_EXT" type="int" value="33612"/>
		<constant name="GL_FRAGMENT_COLOR_MATERIAL_EXT" type="int" value="33793"/>
		<constant name="GL_FRAGMENT_COLOR_MATERIAL_FACE_EXT" type="int" value="33794"/>
		<constant name="GL_FRAGMENT_COLOR_MATERIAL_FACE_SGIX" type="int" value="33794"/>
		<constant name="GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_EXT" type="int" value="33795"/>
		<constant name="GL_FRAGMENT_COLOR_MATERIAL_PARAMETER_SGIX" type="int" value="33795"/>
		<constant name="GL_FRAGMENT_COLOR_MATERIAL_SGIX" type="int" value="33793"/>
		<constant name="GL_FRAGMENT_DEPTH" type="int" value="33874"/>
		<constant name="GL_FRAGMENT_DEPTH_EXT" type="int" value="33874"/>
		<constant name="GL_FRAGMENT_FOG_SGIX" type="int" value="0"/>
		<constant name="GL_FRAGMENT_LIGHT0_EXT" type="int" value="33804"/>
		<constant name="GL_FRAGMENT_LIGHT0_SGIX" type="int" value="33804"/>
		<constant name="GL_FRAGMENT_LIGHT1_EXT" type="int" value="33805"/>
		<constant name="GL_FRAGMENT_LIGHT1_SGIX" type="int" value="33805"/>
		<constant name="GL_FRAGMENT_LIGHT2_EXT" type="int" value="33806"/>
		<constant name="GL_FRAGMENT_LIGHT2_SGIX" type="int" value="33806"/>
		<constant name="GL_FRAGMENT_LIGHT3_EXT" type="int" value="33807"/>
		<constant name="GL_FRAGMENT_LIGHT3_SGIX" type="int" value="33807"/>
		<constant name="GL_FRAGMENT_LIGHT4_EXT" type="int" value="33808"/>
		<constant name="GL_FRAGMENT_LIGHT4_SGIX" type="int" value="33808"/>
		<constant name="GL_FRAGMENT_LIGHT5_EXT" type="int" value="33809"/>
		<constant name="GL_FRAGMENT_LIGHT5_SGIX" type="int" value="33809"/>
		<constant name="GL_FRAGMENT_LIGHT6_EXT" type="int" value="33810"/>
		<constant name="GL_FRAGMENT_LIGHT6_SGIX" type="int" value="33810"/>
		<constant name="GL_FRAGMENT_LIGHT7_EXT" type="int" value="33811"/>
		<constant name="GL_FRAGMENT_LIGHT7_SGIX" type="int" value="33811"/>
		<constant name="GL_FRAGMENT_LIGHTING_EXT" type="int" value="33792"/>
		<constant name="GL_FRAGMENT_LIGHTING_SGIX" type="int" value="33792"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_AMBIENT_EXT" type="int" value="33802"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_AMBIENT_SGIX" type="int" value="33802"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_EXT" type="int" value="33800"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_LOCAL_VIEWER_SGIX" type="int" value="33800"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_EXT" type="int" value="33803"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_NORMAL_INTERPOLATION_SGIX" type="int" value="33803"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_EXT" type="int" value="33801"/>
		<constant name="GL_FRAGMENT_LIGHT_MODEL_TWO_SIDE_SGIX" type="int" value="33801"/>
		<constant name="GL_FRAGMENT_MATERIAL_EXT" type="int" value="33609"/>
		<constant name="GL_FRAGMENT_NORMAL_EXT" type="int" value="33610"/>
		<constant name="GL_FRAGMENT_PROGRAM_ARB" type="int" value="34820"/>
		<constant name="GL_FRAGMENT_PROGRAM_BINDING_NV" type="int" value="34931"/>
		<constant name="GL_FRAGMENT_PROGRAM_NV" type="int" value="34928"/>
		<constant name="GL_FRAGMENT_SHADER_ATI" type="int" value="35104"/>
		<constant name="GL_FRAMEZOOM_FACTOR_SGIX" type="int" value="33164"/>
		<constant name="GL_FRAMEZOOM_SGIX" type="int" value="33163"/>
		<constant name="GL_FULL_RANGE_EXT" type="int" value="34785"/>
		<constant name="GL_FULL_STIPPLE_HINT_PGI" type="int" value="107033"/>
		<constant name="GL_FUNC_ADD" type="int" value="32774"/>
		<constant name="GL_FUNC_ADD_EXT" type="int" value="32774"/>
		<constant name="GL_FUNC_REVERSE_SUBTRACT" type="int" value="32779"/>
		<constant name="GL_FUNC_REVERSE_SUBTRACT_EXT" type="int" value="32779"/>
		<constant name="GL_FUNC_SUBTRACT" type="int" value="32778"/>
		<constant name="GL_FUNC_SUBTRACT_EXT" type="int" value="32778"/>
		<constant name="GL_GENERATE_MIPMAP" type="int" value="33169"/>
		<constant name="GL_GENERATE_MIPMAP_HINT" type="int" value="33170"/>
		<constant name="GL_GENERATE_MIPMAP_HINT_SGIS" type="int" value="33170"/>
		<constant name="GL_GENERATE_MIPMAP_SGIS" type="int" value="33169"/>
		<constant name="GL_GEOMETRY_DEFORMATION_BIT_SGIX" type="int" value="2"/>
		<constant name="GL_GEOMETRY_DEFORMATION_SGIX" type="int" value="33172"/>
		<constant name="GL_GLEXT_VERSION" type="int" value="18"/>
		<constant name="GL_GLOBAL_ALPHA_FACTOR_SUN" type="int" value="33242"/>
		<constant name="GL_GLOBAL_ALPHA_SUN" type="int" value="33241"/>
		<constant name="GL_GREEN_BIT_ATI" type="int" value="2"/>
		<constant name="GL_GREEN_MAX_CLAMP_INGR" type="int" value="34149"/>
		<constant name="GL_GREEN_MIN_CLAMP_INGR" type="int" value="34145"/>
		<constant name="GL_HALF_BIAS_NEGATE_NV" type="int" value="34107"/>
		<constant name="GL_HALF_BIAS_NORMAL_NV" type="int" value="34106"/>
		<constant name="GL_HALF_BIT_ATI" type="int" value="8"/>
		<constant name="GL_HALF_FLOAT_NV" type="int" value="5131"/>
		<constant name="GL_HILO16_NV" type="int" value="34552"/>
		<constant name="GL_HILO8_NV" type="int" value="34910"/>
		<constant name="GL_HILO_NV" type="int" value="34548"/>
		<constant name="GL_HISTOGRAM" type="int" value="32804"/>
		<constant name="GL_HISTOGRAM_ALPHA_SIZE" type="int" value="32811"/>
		<constant name="GL_HISTOGRAM_ALPHA_SIZE_EXT" type="int" value="32811"/>
		<constant name="GL_HISTOGRAM_BLUE_SIZE" type="int" value="32810"/>
		<constant name="GL_HISTOGRAM_BLUE_SIZE_EXT" type="int" value="32810"/>
		<constant name="GL_HISTOGRAM_EXT" type="int" value="32804"/>
		<constant name="GL_HISTOGRAM_FORMAT" type="int" value="32807"/>
		<constant name="GL_HISTOGRAM_FORMAT_EXT" type="int" value="32807"/>
		<constant name="GL_HISTOGRAM_GREEN_SIZE" type="int" value="32809"/>
		<constant name="GL_HISTOGRAM_GREEN_SIZE_EXT" type="int" value="32809"/>
		<constant name="GL_HISTOGRAM_LUMINANCE_SIZE" type="int" value="32812"/>
		<constant name="GL_HISTOGRAM_LUMINANCE_SIZE_EXT" type="int" value="32812"/>
		<constant name="GL_HISTOGRAM_RED_SIZE" type="int" value="32808"/>
		<constant name="GL_HISTOGRAM_RED_SIZE_EXT" type="int" value="32808"/>
		<constant name="GL_HISTOGRAM_SINK" type="int" value="32813"/>
		<constant name="GL_HISTOGRAM_SINK_EXT" type="int" value="32813"/>
		<constant name="GL_HISTOGRAM_WIDTH" type="int" value="32806"/>
		<constant name="GL_HISTOGRAM_WIDTH_EXT" type="int" value="32806"/>
		<constant name="GL_HI_BIAS_NV" type="int" value="34580"/>
		<constant name="GL_HI_SCALE_NV" type="int" value="34574"/>
		<constant name="GL_HP_convolution_border_modes" type="int" value="1"/>
		<constant name="GL_HP_image_transform" type="int" value="1"/>
		<constant name="GL_HP_occlusion_test" type="int" value="1"/>
		<constant name="GL_HP_texture_lighting" type="int" value="1"/>
		<constant name="GL_IBM_cull_vertex" type="int" value="1"/>
		<constant name="GL_IBM_multimode_draw_arrays" type="int" value="1"/>
		<constant name="GL_IBM_rasterpos_clip" type="int" value="1"/>
		<constant name="GL_IBM_static_data" type="int" value="1"/>
		<constant name="GL_IBM_vertex_array_lists" type="int" value="1"/>
		<constant name="GL_IDENTITY_NV" type="int" value="34346"/>
		<constant name="GL_IGNORE_BORDER_HP" type="int" value="33104"/>
		<constant name="GL_IMAGE_CUBIC_WEIGHT_HP" type="int" value="33118"/>
		<constant name="GL_IMAGE_MAG_FILTER_HP" type="int" value="33116"/>
		<constant name="GL_IMAGE_MIN_FILTER_HP" type="int" value="33117"/>
		<constant name="GL_IMAGE_ROTATE_ANGLE_HP" type="int" value="33113"/>
		<constant name="GL_IMAGE_ROTATE_ORIGIN_X_HP" type="int" value="33114"/>
		<constant name="GL_IMAGE_ROTATE_ORIGIN_Y_HP" type="int" value="33115"/>
		<constant name="GL_IMAGE_SCALE_X_HP" type="int" value="33109"/>
		<constant name="GL_IMAGE_SCALE_Y_HP" type="int" value="33110"/>
		<constant name="GL_IMAGE_TRANSFORM_2D_HP" type="int" value="33121"/>
		<constant name="GL_IMAGE_TRANSLATE_X_HP" type="int" value="33111"/>
		<constant name="GL_IMAGE_TRANSLATE_Y_HP" type="int" value="33112"/>
		<constant name="GL_INCR_WRAP" type="int" value="34055"/>
		<constant name="GL_INCR_WRAP_EXT" type="int" value="34055"/>
		<constant name="GL_INDEX_ARRAY_BUFFER_BINDING_ARB" type="int" value="34969"/>
		<constant name="GL_INDEX_ARRAY_COUNT_EXT" type="int" value="32903"/>
		<constant name="GL_INDEX_ARRAY_EXT" type="int" value="32887"/>
		<constant name="GL_INDEX_ARRAY_LIST_IBM" type="int" value="103073"/>
		<constant name="GL_INDEX_ARRAY_LIST_STRIDE_IBM" type="int" value="103083"/>
		<constant name="GL_INDEX_ARRAY_POINTER_EXT" type="int" value="32913"/>
		<constant name="GL_INDEX_ARRAY_STRIDE_EXT" type="int" value="32902"/>
		<constant name="GL_INDEX_ARRAY_TYPE_EXT" type="int" value="32901"/>
		<constant name="GL_INDEX_BIT_PGI" type="int" value="524288"/>
		<constant name="GL_INDEX_MATERIAL_EXT" type="int" value="33208"/>
		<constant name="GL_INDEX_MATERIAL_FACE_EXT" type="int" value="33210"/>
		<constant name="GL_INDEX_MATERIAL_PARAMETER_EXT" type="int" value="33209"/>
		<constant name="GL_INDEX_TEST_EXT" type="int" value="33205"/>
		<constant name="GL_INDEX_TEST_FUNC_EXT" type="int" value="33206"/>
		<constant name="GL_INDEX_TEST_REF_EXT" type="int" value="33207"/>
		<constant name="GL_INGR_blend_func_separate" type="int" value="1"/>
		<constant name="GL_INGR_color_clamp" type="int" value="1"/>
		<constant name="GL_INGR_interlace_read" type="int" value="1"/>
		<constant name="GL_INSTRUMENT_BUFFER_POINTER_SGIX" type="int" value="33152"/>
		<constant name="GL_INSTRUMENT_MEASUREMENTS_SGIX" type="int" value="33153"/>
		<constant name="GL_INTEL_parallel_arrays" type="int" value="1"/>
		<constant name="GL_INTENSITY12_EXT" type="int" value="32844"/>
		<constant name="GL_INTENSITY16_EXT" type="int" value="32845"/>
		<constant name="GL_INTENSITY16_EXTENDED_RANGE_SGIX" type="int" value="34294"/>
		<constant name="GL_INTENSITY16_SIGNED_SGIX" type="int" value="34282"/>
		<constant name="GL_INTENSITY4_EXT" type="int" value="32842"/>
		<constant name="GL_INTENSITY8_EXT" type="int" value="32843"/>
		<constant name="GL_INTENSITY_EXT" type="int" value="32841"/>
		<constant name="GL_INTENSITY_EXTENDED_RANGE_SGIX" type="int" value="34288"/>
		<constant name="GL_INTENSITY_FLOAT16_APPLE" type="int" value="34845"/>
		<constant name="GL_INTENSITY_FLOAT16_ATI" type="int" value="34845"/>
		<constant name="GL_INTENSITY_FLOAT32_APPLE" type="int" value="34839"/>
		<constant name="GL_INTENSITY_FLOAT32_ATI" type="int" value="34839"/>
		<constant name="GL_INTENSITY_SIGNED_SGIX" type="int" value="34276"/>
		<constant name="GL_INTERLACE_OML" type="int" value="35200"/>
		<constant name="GL_INTERLACE_READ_INGR" type="int" value="34152"/>
		<constant name="GL_INTERLACE_READ_OML" type="int" value="35201"/>
		<constant name="GL_INTERLACE_SGIX" type="int" value="32916"/>
		<constant name="GL_INTERPOLATE" type="int" value="34165"/>
		<constant name="GL_INTERPOLATE_ARB" type="int" value="34165"/>
		<constant name="GL_INTERPOLATE_EXT" type="int" value="34165"/>
		<constant name="GL_INVARIANT_DATATYPE_EXT" type="int" value="34795"/>
		<constant name="GL_INVARIANT_EXT" type="int" value="34754"/>
		<constant name="GL_INVARIANT_VALUE_EXT" type="int" value="34794"/>
		<constant name="GL_INVERSE_NV" type="int" value="34347"/>
		<constant name="GL_INVERSE_TRANSPOSE_NV" type="int" value="34349"/>
		<constant name="GL_INVERTED_SCREEN_W_REND" type="int" value="33937"/>
		<constant name="GL_IR_INSTRUMENT1_SGIX" type="int" value="33151"/>
		<constant name="GL_IUI_N3F_V2F_EXT" type="int" value="33199"/>
		<constant name="GL_IUI_N3F_V3F_EXT" type="int" value="33200"/>
		<constant name="GL_IUI_V2F_EXT" type="int" value="33197"/>
		<constant name="GL_IUI_V3F_EXT" type="int" value="33198"/>
		<constant name="GL_KTX_BACK_REGION" type="int" value="1"/>
		<constant name="GL_KTX_FRONT_REGION" type="int" value="0"/>
		<constant name="GL_KTX_STENCIL_REGION" type="int" value="3"/>
		<constant name="GL_KTX_Z_REGION" type="int" value="2"/>
		<constant name="GL_KTX_buffer_region" type="int" value="1"/>
		<constant name="GL_LERP_ATI" type="int" value="35177"/>
		<constant name="GL_LIGHT_ENV_MODE_EXT" type="int" value="33799"/>
		<constant name="GL_LIGHT_ENV_MODE_SGIX" type="int" value="33799"/>
		<constant name="GL_LIGHT_MODEL_COLOR_CONTROL" type="int" value="33272"/>
		<constant name="GL_LIGHT_MODEL_COLOR_CONTROL_EXT" type="int" value="33272"/>
		<constant name="GL_LIGHT_MODEL_SPECULAR_VECTOR_APPLE" type="int" value="34224"/>
		<constant name="GL_LINEAR_CLIPMAP_LINEAR_SGIX" type="int" value="33136"/>
		<constant name="GL_LINEAR_CLIPMAP_NEAREST_SGIX" type="int" value="33871"/>
		<constant name="GL_LINEAR_DETAIL_ALPHA_SGIS" type="int" value="32920"/>
		<constant name="GL_LINEAR_DETAIL_COLOR_SGIS" type="int" value="32921"/>
		<constant name="GL_LINEAR_DETAIL_SGIS" type="int" value="32919"/>
		<constant name="GL_LINEAR_SHARPEN_ALPHA_SGIS" type="int" value="32942"/>
		<constant name="GL_LINEAR_SHARPEN_COLOR_SGIS" type="int" value="32943"/>
		<constant name="GL_LINEAR_SHARPEN_SGIS" type="int" value="32941"/>
		<constant name="GL_LIST_PRIORITY_SGIX" type="int" value="33154"/>
		<constant name="GL_LOCAL_CONSTANT_DATATYPE_EXT" type="int" value="34797"/>
		<constant name="GL_LOCAL_CONSTANT_EXT" type="int" value="34755"/>
		<constant name="GL_LOCAL_CONSTANT_VALUE_EXT" type="int" value="34796"/>
		<constant name="GL_LOCAL_EXT" type="int" value="34756"/>
		<constant name="GL_LO_BIAS_NV" type="int" value="34581"/>
		<constant name="GL_LO_SCALE_NV" type="int" value="34575"/>
		<constant name="GL_LUMINANCE12_ALPHA12_EXT" type="int" value="32839"/>
		<constant name="GL_LUMINANCE12_ALPHA4_EXT" type="int" value="32838"/>
		<constant name="GL_LUMINANCE12_EXT" type="int" value="32833"/>
		<constant name="GL_LUMINANCE16_ALPHA16_EXT" type="int" value="32840"/>
		<constant name="GL_LUMINANCE16_ALPHA16_EXTENDED_RANGE_SGIX" type="int" value="34295"/>
		<constant name="GL_LUMINANCE16_ALPHA16_SIGNED_SGIX" type="int" value="34283"/>
		<constant name="GL_LUMINANCE16_EXT" type="int" value="32834"/>
		<constant name="GL_LUMINANCE16_EXTENDED_RANGE_SGIX" type="int" value="34293"/>
		<constant name="GL_LUMINANCE16_SIGNED_SGIX" type="int" value="34281"/>
		<constant name="GL_LUMINANCE4_ALPHA4_EXT" type="int" value="32835"/>
		<constant name="GL_LUMINANCE4_EXT" type="int" value="32831"/>
		<constant name="GL_LUMINANCE6_ALPHA2_EXT" type="int" value="32836"/>
		<constant name="GL_LUMINANCE8_ALPHA8_EXT" type="int" value="32837"/>
		<constant name="GL_LUMINANCE8_EXT" type="int" value="32832"/>
		<constant name="GL_LUMINANCE_ALPHA_EXTENDED_RANGE_SGIX" type="int" value="34289"/>
		<constant name="GL_LUMINANCE_ALPHA_FLOAT16_APPLE" type="int" value="34847"/>
		<constant name="GL_LUMINANCE_ALPHA_FLOAT16_ATI" type="int" value="34847"/>
		<constant name="GL_LUMINANCE_ALPHA_FLOAT32_APPLE" type="int" value="34841"/>
		<constant name="GL_LUMINANCE_ALPHA_FLOAT32_ATI" type="int" value="34841"/>
		<constant name="GL_LUMINANCE_ALPHA_SIGNED_SGIX" type="int" value="34277"/>
		<constant name="GL_LUMINANCE_EXTENDED_RANGE_SGIX" type="int" value="34287"/>
		<constant name="GL_LUMINANCE_FLOAT16_APPLE" type="int" value="34846"/>
		<constant name="GL_LUMINANCE_FLOAT16_ATI" type="int" value="34846"/>
		<constant name="GL_LUMINANCE_FLOAT32_APPLE" type="int" value="34840"/>
		<constant name="GL_LUMINANCE_FLOAT32_ATI" type="int" value="34840"/>
		<constant name="GL_LUMINANCE_SIGNED_SGIX" type="int" value="34275"/>
		<constant name="GL_MAD_ATI" type="int" value="35176"/>
		<constant name="GL_MAGNITUDE_BIAS_NV" type="int" value="34584"/>
		<constant name="GL_MAGNITUDE_SCALE_NV" type="int" value="34578"/>
		<constant name="GL_MAP1_BINORMAL_EXT" type="int" value="33862"/>
		<constant name="GL_MAP1_TANGENT_EXT" type="int" value="33860"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB0_4_NV" type="int" value="34400"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB10_4_NV" type="int" value="34410"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB11_4_NV" type="int" value="34411"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB12_4_NV" type="int" value="34412"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB13_4_NV" type="int" value="34413"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB14_4_NV" type="int" value="34414"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB15_4_NV" type="int" value="34415"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB1_4_NV" type="int" value="34401"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB2_4_NV" type="int" value="34402"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB3_4_NV" type="int" value="34403"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB4_4_NV" type="int" value="34404"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB5_4_NV" type="int" value="34405"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB6_4_NV" type="int" value="34406"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB7_4_NV" type="int" value="34407"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB8_4_NV" type="int" value="34408"/>
		<constant name="GL_MAP1_VERTEX_ATTRIB9_4_NV" type="int" value="34409"/>
		<constant name="GL_MAP2_BINORMAL_EXT" type="int" value="33863"/>
		<constant name="GL_MAP2_TANGENT_EXT" type="int" value="33861"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB0_4_NV" type="int" value="34416"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB10_4_NV" type="int" value="34426"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB11_4_NV" type="int" value="34427"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB12_4_NV" type="int" value="34428"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB13_4_NV" type="int" value="34429"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB14_4_NV" type="int" value="34430"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB15_4_NV" type="int" value="34431"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB1_4_NV" type="int" value="34417"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB2_4_NV" type="int" value="34418"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB3_4_NV" type="int" value="34419"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB4_4_NV" type="int" value="34420"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB5_4_NV" type="int" value="34421"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB6_4_NV" type="int" value="34422"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB7_4_NV" type="int" value="34423"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB8_4_NV" type="int" value="34424"/>
		<constant name="GL_MAP2_VERTEX_ATTRIB9_4_NV" type="int" value="34425"/>
		<constant name="GL_MAP_ATTRIB_U_ORDER_NV" type="int" value="34499"/>
		<constant name="GL_MAP_ATTRIB_V_ORDER_NV" type="int" value="34500"/>
		<constant name="GL_MAP_TESSELLATION_NV" type="int" value="34498"/>
		<constant name="GL_MATERIAL_SIDE_HINT_PGI" type="int" value="107052"/>
		<constant name="GL_MATRIX0_ARB" type="int" value="35008"/>
		<constant name="GL_MATRIX0_NV" type="int" value="34352"/>
		<constant name="GL_MATRIX10_ARB" type="int" value="35018"/>
		<constant name="GL_MATRIX11_ARB" type="int" value="35019"/>
		<constant name="GL_MATRIX12_ARB" type="int" value="35020"/>
		<constant name="GL_MATRIX13_ARB" type="int" value="35021"/>
		<constant name="GL_MATRIX14_ARB" type="int" value="35022"/>
		<constant name="GL_MATRIX15_ARB" type="int" value="35023"/>
		<constant name="GL_MATRIX16_ARB" type="int" value="35024"/>
		<constant name="GL_MATRIX17_ARB" type="int" value="35025"/>
		<constant name="GL_MATRIX18_ARB" type="int" value="35026"/>
		<constant name="GL_MATRIX19_ARB" type="int" value="35027"/>
		<constant name="GL_MATRIX1_ARB" type="int" value="35009"/>
		<constant name="GL_MATRIX1_NV" type="int" value="34353"/>
		<constant name="GL_MATRIX20_ARB" type="int" value="35028"/>
		<constant name="GL_MATRIX21_ARB" type="int" value="35029"/>
		<constant name="GL_MATRIX22_ARB" type="int" value="35030"/>
		<constant name="GL_MATRIX23_ARB" type="int" value="35031"/>
		<constant name="GL_MATRIX24_ARB" type="int" value="35032"/>
		<constant name="GL_MATRIX25_ARB" type="int" value="35033"/>
		<constant name="GL_MATRIX26_ARB" type="int" value="35034"/>
		<constant name="GL_MATRIX27_ARB" type="int" value="35035"/>
		<constant name="GL_MATRIX28_ARB" type="int" value="35036"/>
		<constant name="GL_MATRIX29_ARB" type="int" value="35037"/>
		<constant name="GL_MATRIX2_ARB" type="int" value="35010"/>
		<constant name="GL_MATRIX2_NV" type="int" value="34354"/>
		<constant name="GL_MATRIX30_ARB" type="int" value="35038"/>
		<constant name="GL_MATRIX31_ARB" type="int" value="35039"/>
		<constant name="GL_MATRIX3_ARB" type="int" value="35011"/>
		<constant name="GL_MATRIX3_NV" type="int" value="34355"/>
		<constant name="GL_MATRIX4_ARB" type="int" value="35012"/>
		<constant name="GL_MATRIX4_NV" type="int" value="34356"/>
		<constant name="GL_MATRIX5_ARB" type="int" value="35013"/>
		<constant name="GL_MATRIX5_NV" type="int" value="34357"/>
		<constant name="GL_MATRIX6_ARB" type="int" value="35014"/>
		<constant name="GL_MATRIX6_NV" type="int" value="34358"/>
		<constant name="GL_MATRIX7_ARB" type="int" value="35015"/>
		<constant name="GL_MATRIX7_NV" type="int" value="34359"/>
		<constant name="GL_MATRIX8_ARB" type="int" value="35016"/>
		<constant name="GL_MATRIX9_ARB" type="int" value="35017"/>
		<constant name="GL_MATRIX_EXT" type="int" value="34752"/>
		<constant name="GL_MATRIX_INDEX_ARRAY_ARB" type="int" value="34884"/>
		<constant name="GL_MATRIX_INDEX_ARRAY_POINTER_ARB" type="int" value="34889"/>
		<constant name="GL_MATRIX_INDEX_ARRAY_SIZE_ARB" type="int" value="34886"/>
		<constant name="GL_MATRIX_INDEX_ARRAY_STRIDE_ARB" type="int" value="34888"/>
		<constant name="GL_MATRIX_INDEX_ARRAY_TYPE_ARB" type="int" value="34887"/>
		<constant name="GL_MATRIX_PALETTE_ARB" type="int" value="34880"/>
		<constant name="GL_MAT_AMBIENT_AND_DIFFUSE_BIT_PGI" type="int" value="2097152"/>
		<constant name="GL_MAT_AMBIENT_BIT_PGI" type="int" value="1048576"/>
		<constant name="GL_MAT_COLOR_INDEXES_BIT_PGI" type="int" value="16777216"/>
		<constant name="GL_MAT_DIFFUSE_BIT_PGI" type="int" value="4194304"/>
		<constant name="GL_MAT_EMISSION_BIT_PGI" type="int" value="8388608"/>
		<constant name="GL_MAT_SHININESS_BIT_PGI" type="int" value="33554432"/>
		<constant name="GL_MAT_SPECULAR_BIT_PGI" type="int" value="67108864"/>
		<constant name="GL_MAX" type="int" value="32776"/>
		<constant name="GL_MAX_3D_TEXTURE_SIZE" type="int" value="32883"/>
		<constant name="GL_MAX_3D_TEXTURE_SIZE_EXT" type="int" value="32883"/>
		<constant name="GL_MAX_4D_TEXTURE_SIZE_SGIS" type="int" value="33080"/>
		<constant name="GL_MAX_ACTIVE_LIGHTS_EXT" type="int" value="33797"/>
		<constant name="GL_MAX_ACTIVE_LIGHTS_SGIX" type="int" value="33797"/>
		<constant name="GL_MAX_ASYNC_DRAW_PIXELS_SGIX" type="int" value="33632"/>
		<constant name="GL_MAX_ASYNC_HISTOGRAM_SGIX" type="int" value="33581"/>
		<constant name="GL_MAX_ASYNC_READ_PIXELS_SGIX" type="int" value="33633"/>
		<constant name="GL_MAX_ASYNC_TEX_IMAGE_SGIX" type="int" value="33631"/>
		<constant name="GL_MAX_CLIPMAP_DEPTH_SGIX" type="int" value="33143"/>
		<constant name="GL_MAX_CLIPMAP_VIRTUAL_DEPTH_SGIX" type="int" value="33144"/>
		<constant name="GL_MAX_COLOR_MATRIX_STACK_DEPTH" type="int" value="32947"/>
		<constant name="GL_MAX_COLOR_MATRIX_STACK_DEPTH_SGI" type="int" value="32947"/>
		<constant name="GL_MAX_CONVOLUTION_HEIGHT" type="int" value="32795"/>
		<constant name="GL_MAX_CONVOLUTION_HEIGHT_EXT" type="int" value="32795"/>
		<constant name="GL_MAX_CONVOLUTION_WIDTH" type="int" value="32794"/>
		<constant name="GL_MAX_CONVOLUTION_WIDTH_EXT" type="int" value="32794"/>
		<constant name="GL_MAX_CUBE_MAP_TEXTURE_SIZE" type="int" value="34076"/>
		<constant name="GL_MAX_CUBE_MAP_TEXTURE_SIZE_ARB" type="int" value="34076"/>
		<constant name="GL_MAX_CUBE_MAP_TEXTURE_SIZE_EXT" type="int" value="34076"/>
		<constant name="GL_MAX_DEFORMATION_ORDER_SGIX" type="int" value="33175"/>
		<constant name="GL_MAX_DRAW_BUFFERS_ATI" type="int" value="34852"/>
		<constant name="GL_MAX_ELEMENTS_INDICES" type="int" value="33001"/>
		<constant name="GL_MAX_ELEMENTS_INDICES_EXT" type="int" value="33001"/>
		<constant name="GL_MAX_ELEMENTS_VERTICES" type="int" value="33000"/>
		<constant name="GL_MAX_ELEMENTS_VERTICES_EXT" type="int" value="33000"/>
		<constant name="GL_MAX_EXT" type="int" value="32776"/>
		<constant name="GL_MAX_FOG_FUNC_POINTS_SGIS" type="int" value="33068"/>
		<constant name="GL_MAX_FRAGMENT_LIGHTS_EXT" type="int" value="33796"/>
		<constant name="GL_MAX_FRAGMENT_LIGHTS_SGIX" type="int" value="33796"/>
		<constant name="GL_MAX_FRAGMENT_PROGRAM_LOCAL_PARAMETERS_NV" type="int" value="34920"/>
		<constant name="GL_MAX_FRAMEZOOM_FACTOR_SGIX" type="int" value="33165"/>
		<constant name="GL_MAX_GENERAL_COMBINERS_NV" type="int" value="34125"/>
		<constant name="GL_MAX_INTENSITY_SGIS" type="int" value="34299"/>
		<constant name="GL_MAX_LUMINANCE_SGIS" type="int" value="34297"/>
		<constant name="GL_MAX_MAP_TESSELLATION_NV" type="int" value="34518"/>
		<constant name="GL_MAX_MATRIX_PALETTE_STACK_DEPTH_ARB" type="int" value="34881"/>
		<constant name="GL_MAX_OPTIMIZED_VERTEX_SHADER_INSTRUCTIONS_EXT" type="int" value="34762"/>
		<constant name="GL_MAX_OPTIMIZED_VERTEX_SHADER_INVARIANTS_EXT" type="int" value="34765"/>
		<constant name="GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCALS_EXT" type="int" value="34766"/>
		<constant name="GL_MAX_OPTIMIZED_VERTEX_SHADER_LOCAL_CONSTANTS_EXT" type="int" value="34764"/>
		<constant name="GL_MAX_OPTIMIZED_VERTEX_SHADER_VARIANTS_EXT" type="int" value="34763"/>
		<constant name="GL_MAX_PALETTE_MATRICES_ARB" type="int" value="34882"/>
		<constant name="GL_MAX_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT" type="int" value="33591"/>
		<constant name="GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATI" type="int" value="34801"/>
		<constant name="GL_MAX_PN_TRIANGLES_TESSELATION_LEVEL_ATIX" type="int" value="24721"/>
		<constant name="GL_MAX_PROGRAM_ADDRESS_REGISTERS_ARB" type="int" value="34993"/>
		<constant name="GL_MAX_PROGRAM_ALU_INSTRUCTIONS_ARB" type="int" value="34827"/>
		<constant name="GL_MAX_PROGRAM_ATTRIBS_ARB" type="int" value="34989"/>
		<constant name="GL_MAX_PROGRAM_ENV_PARAMETERS_ARB" type="int" value="34997"/>
		<constant name="GL_MAX_PROGRAM_INSTRUCTIONS_ARB" type="int" value="34977"/>
		<constant name="GL_MAX_PROGRAM_LOCAL_PARAMETERS_ARB" type="int" value="34996"/>
		<constant name="GL_MAX_PROGRAM_MATRICES_ARB" type="int" value="34351"/>
		<constant name="GL_MAX_PROGRAM_MATRIX_STACK_DEPTH_ARB" type="int" value="34350"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB" type="int" value="34995"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB" type="int" value="34830"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_ATTRIBS_ARB" type="int" value="34991"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_INSTRUCTIONS_ARB" type="int" value="34979"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_PARAMETERS_ARB" type="int" value="34987"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_TEMPORARIES_ARB" type="int" value="34983"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB" type="int" value="34832"/>
		<constant name="GL_MAX_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB" type="int" value="34831"/>
		<constant name="GL_MAX_PROGRAM_PARAMETERS_ARB" type="int" value="34985"/>
		<constant name="GL_MAX_PROGRAM_TEMPORARIES_ARB" type="int" value="34981"/>
		<constant name="GL_MAX_PROGRAM_TEX_INDIRECTIONS_ARB" type="int" value="34829"/>
		<constant name="GL_MAX_PROGRAM_TEX_INSTRUCTIONS_ARB" type="int" value="34828"/>
		<constant name="GL_MAX_RATIONAL_EVAL_ORDER_NV" type="int" value="34519"/>
		<constant name="GL_MAX_RECTANGLE_TEXTURE_SIZE_EXT" type="int" value="34040"/>
		<constant name="GL_MAX_RECTANGLE_TEXTURE_SIZE_NV" type="int" value="34040"/>
		<constant name="GL_MAX_SHININESS_NV" type="int" value="34052"/>
		<constant name="GL_MAX_SPOT_EXPONENT_NV" type="int" value="34053"/>
		<constant name="GL_MAX_TEXTURES_EXT" type="int" value="33731"/>
		<constant name="GL_MAX_TEXTURES_SGIS" type="int" value="33630"/>
		<constant name="GL_MAX_TEXTURE_COORDS_ARB" type="int" value="34929"/>
		<constant name="GL_MAX_TEXTURE_COORDS_NV" type="int" value="34929"/>
		<constant name="GL_MAX_TEXTURE_COORD_SETS_EXT" type="int" value="33732"/>
		<constant name="GL_MAX_TEXTURE_IMAGE_UNITS_ARB" type="int" value="34930"/>
		<constant name="GL_MAX_TEXTURE_IMAGE_UNITS_NV" type="int" value="34930"/>
		<constant name="GL_MAX_TEXTURE_LOD_BIAS" type="int" value="34045"/>
		<constant name="GL_MAX_TEXTURE_LOD_BIAS_EXT" type="int" value="34045"/>
		<constant name="GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT" type="int" value="34047"/>
		<constant name="GL_MAX_TEXTURE_UNITS" type="int" value="34018"/>
		<constant name="GL_MAX_TEXTURE_UNITS_ARB" type="int" value="34018"/>
		<constant name="GL_MAX_TRACK_MATRICES_NV" type="int" value="34351"/>
		<constant name="GL_MAX_TRACK_MATRIX_STACK_DEPTH_NV" type="int" value="34350"/>
		<constant name="GL_MAX_VERTEX_ARRAY_RANGE_ELEMENT_NV" type="int" value="34080"/>
		<constant name="GL_MAX_VERTEX_ATTRIBS_ARB" type="int" value="34921"/>
		<constant name="GL_MAX_VERTEX_HINT_PGI" type="int" value="107053"/>
		<constant name="GL_MAX_VERTEX_SHADER_INSTRUCTIONS_EXT" type="int" value="34757"/>
		<constant name="GL_MAX_VERTEX_SHADER_INVARIANTS_EXT" type="int" value="34759"/>
		<constant name="GL_MAX_VERTEX_SHADER_LOCALS_EXT" type="int" value="34761"/>
		<constant name="GL_MAX_VERTEX_SHADER_LOCAL_CONSTANTS_EXT" type="int" value="34760"/>
		<constant name="GL_MAX_VERTEX_SHADER_VARIANTS_EXT" type="int" value="34758"/>
		<constant name="GL_MAX_VERTEX_STREAMS_ATI" type="int" value="34667"/>
		<constant name="GL_MAX_VERTEX_UNITS_ARB" type="int" value="34468"/>
		<constant name="GL_MAX_WEIGHTED_ATI" type="int" value="34686"/>
		<constant name="GL_MESA_resize_buffers" type="int" value="1"/>
		<constant name="GL_MESA_window_pos" type="int" value="1"/>
		<constant name="GL_MIN" type="int" value="32775"/>
		<constant name="GL_MINMAX" type="int" value="32814"/>
		<constant name="GL_MINMAX_EXT" type="int" value="32814"/>
		<constant name="GL_MINMAX_FORMAT" type="int" value="32815"/>
		<constant name="GL_MINMAX_FORMAT_EXT" type="int" value="32815"/>
		<constant name="GL_MINMAX_SINK" type="int" value="32816"/>
		<constant name="GL_MINMAX_SINK_EXT" type="int" value="32816"/>
		<constant name="GL_MIN_EXT" type="int" value="32775"/>
		<constant name="GL_MIN_INTENSITY_SGIS" type="int" value="34298"/>
		<constant name="GL_MIN_LUMINANCE_SGIS" type="int" value="34296"/>
		<constant name="GL_MIN_WEIGHTED_ATI" type="int" value="34685"/>
		<constant name="GL_MIRRORED_REPEAT" type="int" value="33648"/>
		<constant name="GL_MIRRORED_REPEAT_ARB" type="int" value="33648"/>
		<constant name="GL_MIRRORED_REPEAT_IBM" type="int" value="33648"/>
		<constant name="GL_MIRROR_CLAMP_ATI" type="int" value="34626"/>
		<constant name="GL_MIRROR_CLAMP_TO_EDGE_ATI" type="int" value="34627"/>
		<constant name="GL_MODELVIEW0_ARB" type="int" value="5888"/>
		<constant name="GL_MODELVIEW10_ARB" type="int" value="34602"/>
		<constant name="GL_MODELVIEW11_ARB" type="int" value="34603"/>
		<constant name="GL_MODELVIEW12_ARB" type="int" value="34604"/>
		<constant name="GL_MODELVIEW13_ARB" type="int" value="34605"/>
		<constant name="GL_MODELVIEW14_ARB" type="int" value="34606"/>
		<constant name="GL_MODELVIEW15_ARB" type="int" value="34607"/>
		<constant name="GL_MODELVIEW16_ARB" type="int" value="34608"/>
		<constant name="GL_MODELVIEW17_ARB" type="int" value="34609"/>
		<constant name="GL_MODELVIEW18_ARB" type="int" value="34610"/>
		<constant name="GL_MODELVIEW19_ARB" type="int" value="34611"/>
		<constant name="GL_MODELVIEW1_ARB" type="int" value="34058"/>
		<constant name="GL_MODELVIEW1_EXT" type="int" value="34058"/>
		<constant name="GL_MODELVIEW1_MATRIX_EXT" type="int" value="34054"/>
		<constant name="GL_MODELVIEW1_STACK_DEPTH_EXT" type="int" value="34050"/>
		<constant name="GL_MODELVIEW20_ARB" type="int" value="34612"/>
		<constant name="GL_MODELVIEW21_ARB" type="int" value="34613"/>
		<constant name="GL_MODELVIEW22_ARB" type="int" value="34614"/>
		<constant name="GL_MODELVIEW23_ARB" type="int" value="34615"/>
		<constant name="GL_MODELVIEW24_ARB" type="int" value="34616"/>
		<constant name="GL_MODELVIEW25_ARB" type="int" value="34617"/>
		<constant name="GL_MODELVIEW26_ARB" type="int" value="34618"/>
		<constant name="GL_MODELVIEW27_ARB" type="int" value="34619"/>
		<constant name="GL_MODELVIEW28_ARB" type="int" value="34620"/>
		<constant name="GL_MODELVIEW29_ARB" type="int" value="34621"/>
		<constant name="GL_MODELVIEW2_ARB" type="int" value="34594"/>
		<constant name="GL_MODELVIEW30_ARB" type="int" value="34622"/>
		<constant name="GL_MODELVIEW31_ARB" type="int" value="34623"/>
		<constant name="GL_MODELVIEW3_ARB" type="int" value="34595"/>
		<constant name="GL_MODELVIEW4_ARB" type="int" value="34596"/>
		<constant name="GL_MODELVIEW5_ARB" type="int" value="34597"/>
		<constant name="GL_MODELVIEW6_ARB" type="int" value="34598"/>
		<constant name="GL_MODELVIEW7_ARB" type="int" value="34599"/>
		<constant name="GL_MODELVIEW8_ARB" type="int" value="34600"/>
		<constant name="GL_MODELVIEW9_ARB" type="int" value="34601"/>
		<constant name="GL_MODELVIEW_PROJECTION_NV" type="int" value="34345"/>
		<constant name="GL_MODULATE_ADD_ATI" type="int" value="34628"/>
		<constant name="GL_MODULATE_ADD_ATIX" type="int" value="34628"/>
		<constant name="GL_MODULATE_SIGNED_ADD_ATI" type="int" value="34629"/>
		<constant name="GL_MODULATE_SIGNED_ADD_ATIX" type="int" value="34629"/>
		<constant name="GL_MODULATE_SUBTRACT_ATI" type="int" value="34630"/>
		<constant name="GL_MODULATE_SUBTRACT_ATIX" type="int" value="34630"/>
		<constant name="GL_MOV_ATI" type="int" value="35169"/>
		<constant name="GL_MULTISAMPLE" type="int" value="32925"/>
		<constant name="GL_MULTISAMPLE_3DFX" type="int" value="34482"/>
		<constant name="GL_MULTISAMPLE_ARB" type="int" value="32925"/>
		<constant name="GL_MULTISAMPLE_BIT" type="int" value="536870912"/>
		<constant name="GL_MULTISAMPLE_BIT_3DFX" type="int" value="536870912"/>
		<constant name="GL_MULTISAMPLE_BIT_ARB" type="int" value="536870912"/>
		<constant name="GL_MULTISAMPLE_BIT_EXT" type="int" value="536870912"/>
		<constant name="GL_MULTISAMPLE_EXT" type="int" value="32925"/>
		<constant name="GL_MULTISAMPLE_FILTER_HINT_NV" type="int" value="34100"/>
		<constant name="GL_MULTISAMPLE_SGIS" type="int" value="32925"/>
		<constant name="GL_MUL_ATI" type="int" value="35172"/>
		<constant name="GL_MVP_MATRIX_EXT" type="int" value="34787"/>
		<constant name="GL_NATIVE_GRAPHICS_BEGIN_HINT_PGI" type="int" value="107011"/>
		<constant name="GL_NATIVE_GRAPHICS_END_HINT_PGI" type="int" value="107012"/>
		<constant name="GL_NATIVE_GRAPHICS_HANDLE_PGI" type="int" value="107010"/>
		<constant name="GL_NEAREST_CLIPMAP_LINEAR_SGIX" type="int" value="33870"/>
		<constant name="GL_NEAREST_CLIPMAP_NEAREST_SGIX" type="int" value="33869"/>
		<constant name="GL_NEGATE_BIT_ATI" type="int" value="4"/>
		<constant name="GL_NEGATIVE_ONE_EXT" type="int" value="34783"/>
		<constant name="GL_NEGATIVE_W_EXT" type="int" value="34780"/>
		<constant name="GL_NEGATIVE_X_EXT" type="int" value="34777"/>
		<constant name="GL_NEGATIVE_Y_EXT" type="int" value="34778"/>
		<constant name="GL_NEGATIVE_Z_EXT" type="int" value="34779"/>
		<constant name="GL_NORMALIZED_RANGE_EXT" type="int" value="34784"/>
		<constant name="GL_NORMAL_ARRAY_BUFFER_BINDING_ARB" type="int" value="34967"/>
		<constant name="GL_NORMAL_ARRAY_COUNT_EXT" type="int" value="32896"/>
		<constant name="GL_NORMAL_ARRAY_EXT" type="int" value="32885"/>
		<constant name="GL_NORMAL_ARRAY_LIST_IBM" type="int" value="103071"/>
		<constant name="GL_NORMAL_ARRAY_LIST_STRIDE_IBM" type="int" value="103081"/>
		<constant name="GL_NORMAL_ARRAY_PARALLEL_POINTERS_INTEL" type="int" value="33782"/>
		<constant name="GL_NORMAL_ARRAY_POINTER_EXT" type="int" value="32911"/>
		<constant name="GL_NORMAL_ARRAY_STRIDE_EXT" type="int" value="32895"/>
		<constant name="GL_NORMAL_ARRAY_TYPE_EXT" type="int" value="32894"/>
		<constant name="GL_NORMAL_BIT_PGI" type="int" value="134217728"/>
		<constant name="GL_NORMAL_MAP" type="int" value="34065"/>
		<constant name="GL_NORMAL_MAP_ARB" type="int" value="34065"/>
		<constant name="GL_NORMAL_MAP_EXT" type="int" value="34065"/>
		<constant name="GL_NORMAL_MAP_NV" type="int" value="34065"/>
		<constant name="GL_NUM_COMPRESSED_TEXTURE_FORMATS" type="int" value="34466"/>
		<constant name="GL_NUM_COMPRESSED_TEXTURE_FORMATS_ARB" type="int" value="34466"/>
		<constant name="GL_NUM_FRAGMENT_CONSTANTS_ATI" type="int" value="35183"/>
		<constant name="GL_NUM_FRAGMENT_REGISTERS_ATI" type="int" value="35182"/>
		<constant name="GL_NUM_GENERAL_COMBINERS_NV" type="int" value="34126"/>
		<constant name="GL_NUM_INPUT_INTERPOLATOR_COMPONENTS_ATI" type="int" value="35187"/>
		<constant name="GL_NUM_INSTRUCTIONS_PER_PASS_ATI" type="int" value="35185"/>
		<constant name="GL_NUM_INSTRUCTIONS_TOTAL_ATI" type="int" value="35186"/>
		<constant name="GL_NUM_LOOPBACK_COMPONENTS_ATI" type="int" value="35188"/>
		<constant name="GL_NUM_PASSES_ATI" type="int" value="35184"/>
		<constant name="GL_NV_blend_square" type="int" value="1"/>
		<constant name="GL_NV_copy_depth_to_color" type="int" value="1"/>
		<constant name="GL_NV_depth_clamp" type="int" value="1"/>
		<constant name="GL_NV_element_array" type="int" value="1"/>
		<constant name="GL_NV_evaluators" type="int" value="1"/>
		<constant name="GL_NV_fence" type="int" value="1"/>
		<constant name="GL_NV_float_buffer" type="int" value="1"/>
		<constant name="GL_NV_fog_distance" type="int" value="1"/>
		<constant name="GL_NV_fragment_program" type="int" value="1"/>
		<constant name="GL_NV_half_float" type="int" value="1"/>
		<constant name="GL_NV_light_max_exponent" type="int" value="1"/>
		<constant name="GL_NV_multisample_filter_hint" type="int" value="1"/>
		<constant name="GL_NV_occlusion_query" type="int" value="1"/>
		<constant name="GL_NV_packed_depth_stencil" type="int" value="1"/>
		<constant name="GL_NV_pixel_data_range" type="int" value="1"/>
		<constant name="GL_NV_point_sprite" type="int" value="1"/>
		<constant name="GL_NV_primitive_restart" type="int" value="1"/>
		<constant name="GL_NV_register_combiners" type="int" value="1"/>
		<constant name="GL_NV_register_combiners2" type="int" value="1"/>
		<constant name="GL_NV_stencil_two_side" type="int" value="1"/>
		<constant name="GL_NV_texgen_emboss" type="int" value="1"/>
		<constant name="GL_NV_texgen_reflection" type="int" value="1"/>
		<constant name="GL_NV_texture_compression_vtc" type="int" value="1"/>
		<constant name="GL_NV_texture_env_combine4" type="int" value="1"/>
		<constant name="GL_NV_texture_expand_normal" type="int" value="1"/>
		<constant name="GL_NV_texture_rectangle" type="int" value="1"/>
		<constant name="GL_NV_texture_shader" type="int" value="1"/>
		<constant name="GL_NV_texture_shader2" type="int" value="1"/>
		<constant name="GL_NV_texture_shader3" type="int" value="1"/>
		<constant name="GL_NV_vertex_array_range" type="int" value="1"/>
		<constant name="GL_NV_vertex_array_range2" type="int" value="1"/>
		<constant name="GL_NV_vertex_program" type="int" value="1"/>
		<constant name="GL_NV_vertex_program1_1" type="int" value="1"/>
		<constant name="GL_NV_vertex_program2" type="int" value="1"/>
		<constant name="GL_OBJECT_BUFFER_SIZE_ATI" type="int" value="34660"/>
		<constant name="GL_OBJECT_BUFFER_USAGE_ATI" type="int" value="34661"/>
		<constant name="GL_OBJECT_DISTANCE_TO_LINE_SGIS" type="int" value="33267"/>
		<constant name="GL_OBJECT_DISTANCE_TO_POINT_SGIS" type="int" value="33265"/>
		<constant name="GL_OBJECT_LINE_SGIS" type="int" value="33271"/>
		<constant name="GL_OBJECT_POINT_SGIS" type="int" value="33269"/>
		<constant name="GL_OCCLUSION_TEST_HP" type="int" value="33125"/>
		<constant name="GL_OCCLUSION_TEST_RESULT_HP" type="int" value="33126"/>
		<constant name="GL_OFFSET_HILO_PROJECTIVE_TEXTURE_2D_NV" type="int" value="34902"/>
		<constant name="GL_OFFSET_HILO_PROJECTIVE_TEXTURE_RECTANGLE_NV" type="int" value="34903"/>
		<constant name="GL_OFFSET_HILO_TEXTURE_2D_NV" type="int" value="34900"/>
		<constant name="GL_OFFSET_HILO_TEXTURE_RECTANGLE_NV" type="int" value="34901"/>
		<constant name="GL_OFFSET_PROJECTIVE_TEXTURE_2D_NV" type="int" value="34896"/>
		<constant name="GL_OFFSET_PROJECTIVE_TEXTURE_2D_SCALE_NV" type="int" value="34897"/>
		<constant name="GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_NV" type="int" value="34898"/>
		<constant name="GL_OFFSET_PROJECTIVE_TEXTURE_RECTANGLE_SCALE_NV" type="int" value="34899"/>
		<constant name="GL_OFFSET_TEXTURE_2D_NV" type="int" value="34536"/>
		<constant name="GL_OFFSET_TEXTURE_BIAS_NV" type="int" value="34531"/>
		<constant name="GL_OFFSET_TEXTURE_MATRIX_NV" type="int" value="34529"/>
		<constant name="GL_OFFSET_TEXTURE_RECTANGLE_NV" type="int" value="34380"/>
		<constant name="GL_OFFSET_TEXTURE_RECTANGLE_SCALE_NV" type="int" value="34381"/>
		<constant name="GL_OFFSET_TEXTURE_SCALE_NV" type="int" value="34530"/>
		<constant name="GL_OML_interlace" type="int" value="1"/>
		<constant name="GL_OML_resample" type="int" value="1"/>
		<constant name="GL_OML_subsample" type="int" value="1"/>
		<constant name="GL_ONE_EXT" type="int" value="34782"/>
		<constant name="GL_ONE_MINUS_CONSTANT_ALPHA" type="int" value="32772"/>
		<constant name="GL_ONE_MINUS_CONSTANT_ALPHA_EXT" type="int" value="32772"/>
		<constant name="GL_ONE_MINUS_CONSTANT_COLOR" type="int" value="32770"/>
		<constant name="GL_ONE_MINUS_CONSTANT_COLOR_EXT" type="int" value="32770"/>
		<constant name="GL_OPERAND0_ALPHA" type="int" value="34200"/>
		<constant name="GL_OPERAND0_ALPHA_ARB" type="int" value="34200"/>
		<constant name="GL_OPERAND0_ALPHA_EXT" type="int" value="34200"/>
		<constant name="GL_OPERAND0_RGB" type="int" value="34192"/>
		<constant name="GL_OPERAND0_RGB_ARB" type="int" value="34192"/>
		<constant name="GL_OPERAND0_RGB_EXT" type="int" value="34192"/>
		<constant name="GL_OPERAND1_ALPHA" type="int" value="34201"/>
		<constant name="GL_OPERAND1_ALPHA_ARB" type="int" value="34201"/>
		<constant name="GL_OPERAND1_ALPHA_EXT" type="int" value="34201"/>
		<constant name="GL_OPERAND1_RGB" type="int" value="34193"/>
		<constant name="GL_OPERAND1_RGB_ARB" type="int" value="34193"/>
		<constant name="GL_OPERAND1_RGB_EXT" type="int" value="34193"/>
		<constant name="GL_OPERAND2_ALPHA" type="int" value="34202"/>
		<constant name="GL_OPERAND2_ALPHA_ARB" type="int" value="34202"/>
		<constant name="GL_OPERAND2_ALPHA_EXT" type="int" value="34202"/>
		<constant name="GL_OPERAND2_RGB" type="int" value="34194"/>
		<constant name="GL_OPERAND2_RGB_ARB" type="int" value="34194"/>
		<constant name="GL_OPERAND2_RGB_EXT" type="int" value="34194"/>
		<constant name="GL_OPERAND3_ALPHA_NV" type="int" value="34203"/>
		<constant name="GL_OPERAND3_RGB_NV" type="int" value="34195"/>
		<constant name="GL_OP_ADD_EXT" type="int" value="34695"/>
		<constant name="GL_OP_CLAMP_EXT" type="int" value="34702"/>
		<constant name="GL_OP_CROSS_PRODUCT_EXT" type="int" value="34711"/>
		<constant name="GL_OP_DOT3_EXT" type="int" value="34692"/>
		<constant name="GL_OP_DOT4_EXT" type="int" value="34693"/>
		<constant name="GL_OP_EXP_BASE_2_EXT" type="int" value="34705"/>
		<constant name="GL_OP_FLOOR_EXT" type="int" value="34703"/>
		<constant name="GL_OP_FRAC_EXT" type="int" value="34697"/>
		<constant name="GL_OP_INDEX_EXT" type="int" value="34690"/>
		<constant name="GL_OP_LOG_BASE_2_EXT" type="int" value="34706"/>
		<constant name="GL_OP_MADD_EXT" type="int" value="34696"/>
		<constant name="GL_OP_MAX_EXT" type="int" value="34698"/>
		<constant name="GL_OP_MIN_EXT" type="int" value="34699"/>
		<constant name="GL_OP_MOV_EXT" type="int" value="34713"/>
		<constant name="GL_OP_MULTIPLY_MATRIX_EXT" type="int" value="34712"/>
		<constant name="GL_OP_MUL_EXT" type="int" value="34694"/>
		<constant name="GL_OP_NEGATE_EXT" type="int" value="34691"/>
		<constant name="GL_OP_POWER_EXT" type="int" value="34707"/>
		<constant name="GL_OP_RECIP_EXT" type="int" value="34708"/>
		<constant name="GL_OP_RECIP_SQRT_EXT" type="int" value="34709"/>
		<constant name="GL_OP_ROUND_EXT" type="int" value="34704"/>
		<constant name="GL_OP_SET_GE_EXT" type="int" value="34700"/>
		<constant name="GL_OP_SET_LT_EXT" type="int" value="34701"/>
		<constant name="GL_OP_SUB_EXT" type="int" value="34710"/>
		<constant name="GL_OUTPUT_COLOR0_EXT" type="int" value="34715"/>
		<constant name="GL_OUTPUT_COLOR1_EXT" type="int" value="34716"/>
		<constant name="GL_OUTPUT_FOG_EXT" type="int" value="34749"/>
		<constant name="GL_OUTPUT_POINT_SIZE_ATIX" type="int" value="24846"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD0_EXT" type="int" value="34717"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD10_EXT" type="int" value="34727"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD11_EXT" type="int" value="34728"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD12_EXT" type="int" value="34729"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD13_EXT" type="int" value="34730"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD14_EXT" type="int" value="34731"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD15_EXT" type="int" value="34732"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD16_EXT" type="int" value="34733"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD17_EXT" type="int" value="34734"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD18_EXT" type="int" value="34735"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD19_EXT" type="int" value="34736"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD1_EXT" type="int" value="34718"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD20_EXT" type="int" value="34737"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD21_EXT" type="int" value="34738"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD22_EXT" type="int" value="34739"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD23_EXT" type="int" value="34740"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD24_EXT" type="int" value="34741"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD25_EXT" type="int" value="34742"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD26_EXT" type="int" value="34743"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD27_EXT" type="int" value="34744"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD28_EXT" type="int" value="34745"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD29_EXT" type="int" value="34746"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD2_EXT" type="int" value="34719"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD30_EXT" type="int" value="34747"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD31_EXT" type="int" value="34748"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD3_EXT" type="int" value="34720"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD4_EXT" type="int" value="34721"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD5_EXT" type="int" value="34722"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD6_EXT" type="int" value="34723"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD7_EXT" type="int" value="34724"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD8_EXT" type="int" value="34725"/>
		<constant name="GL_OUTPUT_TEXTURE_COORD9_EXT" type="int" value="34726"/>
		<constant name="GL_OUTPUT_VERTEX_EXT" type="int" value="34714"/>
		<constant name="GL_PACK_CMYK_HINT_EXT" type="int" value="32782"/>
		<constant name="GL_PACK_IMAGE_DEPTH_SGIS" type="int" value="33073"/>
		<constant name="GL_PACK_IMAGE_HEIGHT" type="int" value="32876"/>
		<constant name="GL_PACK_IMAGE_HEIGHT_EXT" type="int" value="32876"/>
		<constant name="GL_PACK_RESAMPLE_OML" type="int" value="35204"/>
		<constant name="GL_PACK_RESAMPLE_SGIX" type="int" value="33836"/>
		<constant name="GL_PACK_SKIP_IMAGES" type="int" value="32875"/>
		<constant name="GL_PACK_SKIP_IMAGES_EXT" type="int" value="32875"/>
		<constant name="GL_PACK_SKIP_VOLUMES_SGIS" type="int" value="33072"/>
		<constant name="GL_PACK_SUBSAMPLE_RATE_SGIX" type="int" value="34208"/>
		<constant name="GL_PARALLEL_ARRAYS_INTEL" type="int" value="33780"/>
		<constant name="GL_PASS_THROUGH_NV" type="int" value="34534"/>
		<constant name="GL_PERTURB_EXT" type="int" value="34222"/>
		<constant name="GL_PER_STAGE_CONSTANTS_NV" type="int" value="34101"/>
		<constant name="GL_PGI_misc_hints" type="int" value="1"/>
		<constant name="GL_PGI_vertex_hints" type="int" value="1"/>
		<constant name="GL_PHONG_HINT_WIN" type="int" value="33003"/>
		<constant name="GL_PHONG_WIN" type="int" value="33002"/>
		<constant name="GL_PIXEL_COUNTER_BITS_NV" type="int" value="34916"/>
		<constant name="GL_PIXEL_COUNT_AVAILABLE_NV" type="int" value="34919"/>
		<constant name="GL_PIXEL_COUNT_NV" type="int" value="34918"/>
		<constant name="GL_PIXEL_CUBIC_WEIGHT_EXT" type="int" value="33587"/>
		<constant name="GL_PIXEL_FRAGMENT_ALPHA_SOURCE_SGIS" type="int" value="33621"/>
		<constant name="GL_PIXEL_FRAGMENT_RGB_SOURCE_SGIS" type="int" value="33620"/>
		<constant name="GL_PIXEL_GROUP_COLOR_SGIS" type="int" value="33622"/>
		<constant name="GL_PIXEL_MAG_FILTER_EXT" type="int" value="33585"/>
		<constant name="GL_PIXEL_MIN_FILTER_EXT" type="int" value="33586"/>
		<constant name="GL_PIXEL_SUBSAMPLE_2424_SGIX" type="int" value="34211"/>
		<constant name="GL_PIXEL_SUBSAMPLE_4242_SGIX" type="int" value="34212"/>
		<constant name="GL_PIXEL_SUBSAMPLE_4444_SGIX" type="int" value="34210"/>
		<constant name="GL_PIXEL_TEXTURE_SGIS" type="int" value="33619"/>
		<constant name="GL_PIXEL_TEX_GEN_ALPHA_LS_SGIX" type="int" value="33161"/>
		<constant name="GL_PIXEL_TEX_GEN_ALPHA_MS_SGIX" type="int" value="33162"/>
		<constant name="GL_PIXEL_TEX_GEN_ALPHA_NO_REPLACE_SGIX" type="int" value="33160"/>
		<constant name="GL_PIXEL_TEX_GEN_ALPHA_REPLACE_SGIX" type="int" value="33159"/>
		<constant name="GL_PIXEL_TEX_GEN_MODE_SGIX" type="int" value="33579"/>
		<constant name="GL_PIXEL_TEX_GEN_Q_CEILING_SGIX" type="int" value="33156"/>
		<constant name="GL_PIXEL_TEX_GEN_Q_FLOOR_SGIX" type="int" value="33158"/>
		<constant name="GL_PIXEL_TEX_GEN_Q_ROUND_SGIX" type="int" value="33157"/>
		<constant name="GL_PIXEL_TEX_GEN_SGIX" type="int" value="33081"/>
		<constant name="GL_PIXEL_TILE_BEST_ALIGNMENT_SGIX" type="int" value="33086"/>
		<constant name="GL_PIXEL_TILE_CACHE_INCREMENT_SGIX" type="int" value="33087"/>
		<constant name="GL_PIXEL_TILE_CACHE_SIZE_SGIX" type="int" value="33093"/>
		<constant name="GL_PIXEL_TILE_GRID_DEPTH_SGIX" type="int" value="33092"/>
		<constant name="GL_PIXEL_TILE_GRID_HEIGHT_SGIX" type="int" value="33091"/>
		<constant name="GL_PIXEL_TILE_GRID_WIDTH_SGIX" type="int" value="33090"/>
		<constant name="GL_PIXEL_TILE_HEIGHT_SGIX" type="int" value="33089"/>
		<constant name="GL_PIXEL_TILE_WIDTH_SGIX" type="int" value="33088"/>
		<constant name="GL_PIXEL_TRANSFORM_2D_EXT" type="int" value="33584"/>
		<constant name="GL_PIXEL_TRANSFORM_2D_MATRIX_EXT" type="int" value="33592"/>
		<constant name="GL_PIXEL_TRANSFORM_2D_STACK_DEPTH_EXT" type="int" value="33590"/>
		<constant name="GL_PN_TRIANGLES_ATI" type="int" value="34800"/>
		<constant name="GL_PN_TRIANGLES_ATIX" type="int" value="24720"/>
		<constant name="GL_PN_TRIANGLES_NORMAL_MODE_ATI" type="int" value="34803"/>
		<constant name="GL_PN_TRIANGLES_NORMAL_MODE_ATIX" type="int" value="24723"/>
		<constant name="GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATI" type="int" value="34807"/>
		<constant name="GL_PN_TRIANGLES_NORMAL_MODE_LINEAR_ATIX" type="int" value="24727"/>
		<constant name="GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATI" type="int" value="34808"/>
		<constant name="GL_PN_TRIANGLES_NORMAL_MODE_QUADRATIC_ATIX" type="int" value="24728"/>
		<constant name="GL_PN_TRIANGLES_POINT_MODE_ATI" type="int" value="34802"/>
		<constant name="GL_PN_TRIANGLES_POINT_MODE_ATIX" type="int" value="24722"/>
		<constant name="GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATI" type="int" value="34806"/>
		<constant name="GL_PN_TRIANGLES_POINT_MODE_CUBIC_ATIX" type="int" value="24726"/>
		<constant name="GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATI" type="int" value="34805"/>
		<constant name="GL_PN_TRIANGLES_POINT_MODE_LINEAR_ATIX" type="int" value="24725"/>
		<constant name="GL_PN_TRIANGLES_TESSELATION_LEVEL_ATI" type="int" value="34804"/>
		<constant name="GL_PN_TRIANGLES_TESSELATION_LEVEL_ATIX" type="int" value="24724"/>
		<constant name="GL_POINT_CULL_CENTER_ATI" type="int" value="24756"/>
		<constant name="GL_POINT_CULL_CLIP_ATI" type="int" value="24757"/>
		<constant name="GL_POINT_CULL_MODE_ATI" type="int" value="24755"/>
		<constant name="GL_POINT_DISTANCE_ATTENUATION" type="int" value="33065"/>
		<constant name="GL_POINT_DISTANCE_ATTENUATION_ARB" type="int" value="33065"/>
		<constant name="GL_POINT_FADE_THRESHOLD_SIZE" type="int" value="33064"/>
		<constant name="GL_POINT_FADE_THRESHOLD_SIZE_ARB" type="int" value="33064"/>
		<constant name="GL_POINT_FADE_THRESHOLD_SIZE_EXT" type="int" value="33064"/>
		<constant name="GL_POINT_FADE_THRESHOLD_SIZE_SGIS" type="int" value="33064"/>
		<constant name="GL_POINT_SIZE_MAX" type="int" value="33063"/>
		<constant name="GL_POINT_SIZE_MAX_ARB" type="int" value="33063"/>
		<constant name="GL_POINT_SIZE_MAX_EXT" type="int" value="33063"/>
		<constant name="GL_POINT_SIZE_MAX_SGIS" type="int" value="33063"/>
		<constant name="GL_POINT_SIZE_MIN" type="int" value="33062"/>
		<constant name="GL_POINT_SIZE_MIN_ARB" type="int" value="33062"/>
		<constant name="GL_POINT_SIZE_MIN_EXT" type="int" value="33062"/>
		<constant name="GL_POINT_SIZE_MIN_SGIS" type="int" value="33062"/>
		<constant name="GL_POINT_SPRITE_NV" type="int" value="34913"/>
		<constant name="GL_POINT_SPRITE_R_MODE_NV" type="int" value="34915"/>
		<constant name="GL_POLYGON_OFFSET_BIAS_EXT" type="int" value="32825"/>
		<constant name="GL_POLYGON_OFFSET_EXT" type="int" value="32823"/>
		<constant name="GL_POLYGON_OFFSET_FACTOR_EXT" type="int" value="32824"/>
		<constant name="GL_POST_COLOR_MATRIX_ALPHA_BIAS" type="int" value="32955"/>
		<constant name="GL_POST_COLOR_MATRIX_ALPHA_BIAS_SGI" type="int" value="32955"/>
		<constant name="GL_POST_COLOR_MATRIX_ALPHA_SCALE" type="int" value="32951"/>
		<constant name="GL_POST_COLOR_MATRIX_ALPHA_SCALE_SGI" type="int" value="32951"/>
		<constant name="GL_POST_COLOR_MATRIX_BLUE_BIAS" type="int" value="32954"/>
		<constant name="GL_POST_COLOR_MATRIX_BLUE_BIAS_SGI" type="int" value="32954"/>
		<constant name="GL_POST_COLOR_MATRIX_BLUE_SCALE" type="int" value="32950"/>
		<constant name="GL_POST_COLOR_MATRIX_BLUE_SCALE_SGI" type="int" value="32950"/>
		<constant name="GL_POST_COLOR_MATRIX_COLOR_TABLE" type="int" value="32978"/>
		<constant name="GL_POST_COLOR_MATRIX_COLOR_TABLE_SGI" type="int" value="32978"/>
		<constant name="GL_POST_COLOR_MATRIX_GREEN_BIAS" type="int" value="32953"/>
		<constant name="GL_POST_COLOR_MATRIX_GREEN_BIAS_SGI" type="int" value="32953"/>
		<constant name="GL_POST_COLOR_MATRIX_GREEN_SCALE" type="int" value="32949"/>
		<constant name="GL_POST_COLOR_MATRIX_GREEN_SCALE_SGI" type="int" value="32949"/>
		<constant name="GL_POST_COLOR_MATRIX_RED_BIAS" type="int" value="32952"/>
		<constant name="GL_POST_COLOR_MATRIX_RED_BIAS_SGI" type="int" value="32952"/>
		<constant name="GL_POST_COLOR_MATRIX_RED_SCALE" type="int" value="32948"/>
		<constant name="GL_POST_COLOR_MATRIX_RED_SCALE_SGI" type="int" value="32948"/>
		<constant name="GL_POST_CONVOLUTION_ALPHA_BIAS" type="int" value="32803"/>
		<constant name="GL_POST_CONVOLUTION_ALPHA_BIAS_EXT" type="int" value="32803"/>
		<constant name="GL_POST_CONVOLUTION_ALPHA_SCALE" type="int" value="32799"/>
		<constant name="GL_POST_CONVOLUTION_ALPHA_SCALE_EXT" type="int" value="32799"/>
		<constant name="GL_POST_CONVOLUTION_BLUE_BIAS" type="int" value="32802"/>
		<constant name="GL_POST_CONVOLUTION_BLUE_BIAS_EXT" type="int" value="32802"/>
		<constant name="GL_POST_CONVOLUTION_BLUE_SCALE" type="int" value="32798"/>
		<constant name="GL_POST_CONVOLUTION_BLUE_SCALE_EXT" type="int" value="32798"/>
		<constant name="GL_POST_CONVOLUTION_COLOR_TABLE" type="int" value="32977"/>
		<constant name="GL_POST_CONVOLUTION_COLOR_TABLE_SGI" type="int" value="32977"/>
		<constant name="GL_POST_CONVOLUTION_GREEN_BIAS" type="int" value="32801"/>
		<constant name="GL_POST_CONVOLUTION_GREEN_BIAS_EXT" type="int" value="32801"/>
		<constant name="GL_POST_CONVOLUTION_GREEN_SCALE" type="int" value="32797"/>
		<constant name="GL_POST_CONVOLUTION_GREEN_SCALE_EXT" type="int" value="32797"/>
		<constant name="GL_POST_CONVOLUTION_RED_BIAS" type="int" value="32800"/>
		<constant name="GL_POST_CONVOLUTION_RED_BIAS_EXT" type="int" value="32800"/>
		<constant name="GL_POST_CONVOLUTION_RED_SCALE" type="int" value="32796"/>
		<constant name="GL_POST_CONVOLUTION_RED_SCALE_EXT" type="int" value="32796"/>
		<constant name="GL_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP" type="int" value="33122"/>
		<constant name="GL_POST_TEXTURE_FILTER_BIAS_RANGE_SGIX" type="int" value="33147"/>
		<constant name="GL_POST_TEXTURE_FILTER_BIAS_SGIX" type="int" value="33145"/>
		<constant name="GL_POST_TEXTURE_FILTER_SCALE_RANGE_SGIX" type="int" value="33148"/>
		<constant name="GL_POST_TEXTURE_FILTER_SCALE_SGIX" type="int" value="33146"/>
		<constant name="GL_PREFER_DOUBLEBUFFER_HINT_PGI" type="int" value="107000"/>
		<constant name="GL_PRESERVE_ATI" type="int" value="34658"/>
		<constant name="GL_PREVIOUS" type="int" value="34168"/>
		<constant name="GL_PREVIOUS_ARB" type="int" value="34168"/>
		<constant name="GL_PREVIOUS_EXT" type="int" value="34168"/>
		<constant name="GL_PREVIOUS_TEXTURE_INPUT_NV" type="int" value="34532"/>
		<constant name="GL_PRIMARY_COLOR" type="int" value="34167"/>
		<constant name="GL_PRIMARY_COLOR_ARB" type="int" value="34167"/>
		<constant name="GL_PRIMARY_COLOR_EXT" type="int" value="34167"/>
		<constant name="GL_PRIMARY_COLOR_NV" type="int" value="34092"/>
		<constant name="GL_PRIMITIVE_RESTART_INDEX_NV" type="int" value="34137"/>
		<constant name="GL_PRIMITIVE_RESTART_NV" type="int" value="34136"/>
		<constant name="GL_PROGRAM_ADDRESS_REGISTERS_ARB" type="int" value="34992"/>
		<constant name="GL_PROGRAM_ALU_INSTRUCTIONS_ARB" type="int" value="34821"/>
		<constant name="GL_PROGRAM_ATTRIBS_ARB" type="int" value="34988"/>
		<constant name="GL_PROGRAM_BINDING_ARB" type="int" value="34423"/>
		<constant name="GL_PROGRAM_ERROR_POSITION_ARB" type="int" value="34379"/>
		<constant name="GL_PROGRAM_ERROR_POSITION_NV" type="int" value="34379"/>
		<constant name="GL_PROGRAM_ERROR_STRING_ARB" type="int" value="34932"/>
		<constant name="GL_PROGRAM_ERROR_STRING_NV" type="int" value="34932"/>
		<constant name="GL_PROGRAM_FORMAT_ARB" type="int" value="34934"/>
		<constant name="GL_PROGRAM_FORMAT_ASCII_ARB" type="int" value="34933"/>
		<constant name="GL_PROGRAM_INSTRUCTIONS_ARB" type="int" value="34976"/>
		<constant name="GL_PROGRAM_LENGTH_ARB" type="int" value="34343"/>
		<constant name="GL_PROGRAM_LENGTH_NV" type="int" value="34343"/>
		<constant name="GL_PROGRAM_NATIVE_ADDRESS_REGISTERS_ARB" type="int" value="34994"/>
		<constant name="GL_PROGRAM_NATIVE_ALU_INSTRUCTIONS_ARB" type="int" value="34824"/>
		<constant name="GL_PROGRAM_NATIVE_ATTRIBS_ARB" type="int" value="34990"/>
		<constant name="GL_PROGRAM_NATIVE_INSTRUCTIONS_ARB" type="int" value="34978"/>
		<constant name="GL_PROGRAM_NATIVE_PARAMETERS_ARB" type="int" value="34986"/>
		<constant name="GL_PROGRAM_NATIVE_TEMPORARIES_ARB" type="int" value="34982"/>
		<constant name="GL_PROGRAM_NATIVE_TEX_INDIRECTIONS_ARB" type="int" value="34826"/>
		<constant name="GL_PROGRAM_NATIVE_TEX_INSTRUCTIONS_ARB" type="int" value="34825"/>
		<constant name="GL_PROGRAM_PARAMETERS_ARB" type="int" value="34984"/>
		<constant name="GL_PROGRAM_PARAMETER_NV" type="int" value="34372"/>
		<constant name="GL_PROGRAM_RESIDENT_NV" type="int" value="34375"/>
		<constant name="GL_PROGRAM_STRING_ARB" type="int" value="34344"/>
		<constant name="GL_PROGRAM_STRING_NV" type="int" value="34344"/>
		<constant name="GL_PROGRAM_TARGET_NV" type="int" value="34374"/>
		<constant name="GL_PROGRAM_TEMPORARIES_ARB" type="int" value="34980"/>
		<constant name="GL_PROGRAM_TEX_INDIRECTIONS_ARB" type="int" value="34823"/>
		<constant name="GL_PROGRAM_TEX_INSTRUCTIONS_ARB" type="int" value="34822"/>
		<constant name="GL_PROGRAM_UNDER_NATIVE_LIMITS_ARB" type="int" value="34998"/>
		<constant name="GL_PROXY_COLOR_TABLE" type="int" value="32979"/>
		<constant name="GL_PROXY_COLOR_TABLE_SGI" type="int" value="32979"/>
		<constant name="GL_PROXY_HISTOGRAM" type="int" value="32805"/>
		<constant name="GL_PROXY_HISTOGRAM_EXT" type="int" value="32805"/>
		<constant name="GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE" type="int" value="32981"/>
		<constant name="GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE_SGI" type="int" value="32981"/>
		<constant name="GL_PROXY_POST_CONVOLUTION_COLOR_TABLE" type="int" value="32980"/>
		<constant name="GL_PROXY_POST_CONVOLUTION_COLOR_TABLE_SGI" type="int" value="32980"/>
		<constant name="GL_PROXY_POST_IMAGE_TRANSFORM_COLOR_TABLE_HP" type="int" value="33123"/>
		<constant name="GL_PROXY_TEXTURE_1D_EXT" type="int" value="32867"/>
		<constant name="GL_PROXY_TEXTURE_2D_EXT" type="int" value="32868"/>
		<constant name="GL_PROXY_TEXTURE_3D" type="int" value="32880"/>
		<constant name="GL_PROXY_TEXTURE_3D_EXT" type="int" value="32880"/>
		<constant name="GL_PROXY_TEXTURE_4D_SGIS" type="int" value="33077"/>
		<constant name="GL_PROXY_TEXTURE_COLOR_TABLE_SGI" type="int" value="32957"/>
		<constant name="GL_PROXY_TEXTURE_CUBE_MAP" type="int" value="34075"/>
		<constant name="GL_PROXY_TEXTURE_CUBE_MAP_ARB" type="int" value="34075"/>
		<constant name="GL_PROXY_TEXTURE_CUBE_MAP_EXT" type="int" value="34075"/>
		<constant name="GL_PROXY_TEXTURE_RECTANGLE_EXT" type="int" value="34039"/>
		<constant name="GL_PROXY_TEXTURE_RECTANGLE_NV" type="int" value="34039"/>
		<constant name="GL_QUAD_ALPHA4_SGIS" type="int" value="33054"/>
		<constant name="GL_QUAD_ALPHA8_SGIS" type="int" value="33055"/>
		<constant name="GL_QUAD_INTENSITY4_SGIS" type="int" value="33058"/>
		<constant name="GL_QUAD_INTENSITY8_SGIS" type="int" value="33059"/>
		<constant name="GL_QUAD_LUMINANCE4_SGIS" type="int" value="33056"/>
		<constant name="GL_QUAD_LUMINANCE8_SGIS" type="int" value="33057"/>
		<constant name="GL_QUAD_MESH_SUN" type="int" value="34324"/>
		<constant name="GL_QUAD_TEXTURE_SELECT_SGIS" type="int" value="33061"/>
		<constant name="GL_QUARTER_BIT_ATI" type="int" value="16"/>
		<constant name="GL_R1UI_C3F_V3F_SUN" type="int" value="34246"/>
		<constant name="GL_R1UI_C4F_N3F_V3F_SUN" type="int" value="34248"/>
		<constant name="GL_R1UI_C4UB_V3F_SUN" type="int" value="34245"/>
		<constant name="GL_R1UI_N3F_V3F_SUN" type="int" value="34247"/>
		<constant name="GL_R1UI_T2F_C4F_N3F_V3F_SUN" type="int" value="34251"/>
		<constant name="GL_R1UI_T2F_N3F_V3F_SUN" type="int" value="34250"/>
		<constant name="GL_R1UI_T2F_V3F_SUN" type="int" value="34249"/>
		<constant name="GL_R1UI_V3F_SUN" type="int" value="34244"/>
		<constant name="GL_RASTER_POSITION_UNCLIPPED_IBM" type="int" value="103010"/>
		<constant name="GL_READ_ONLY_ARB" type="int" value="35000"/>
		<constant name="GL_READ_PIXEL_DATA_RANGE_LENGTH_NV" type="int" value="34939"/>
		<constant name="GL_READ_PIXEL_DATA_RANGE_NV" type="int" value="34937"/>
		<constant name="GL_READ_PIXEL_DATA_RANGE_POINTER_NV" type="int" value="34941"/>
		<constant name="GL_READ_WRITE_ARB" type="int" value="35002"/>
		<constant name="GL_RECLAIM_MEMORY_HINT_PGI" type="int" value="107006"/>
		<constant name="GL_REDUCE" type="int" value="32790"/>
		<constant name="GL_REDUCE_EXT" type="int" value="32790"/>
		<constant name="GL_RED_BIT_ATI" type="int" value="1"/>
		<constant name="GL_RED_MAX_CLAMP_INGR" type="int" value="34148"/>
		<constant name="GL_RED_MIN_CLAMP_INGR" type="int" value="34144"/>
		<constant name="GL_REFERENCE_PLANE_EQUATION_SGIX" type="int" value="33150"/>
		<constant name="GL_REFERENCE_PLANE_SGIX" type="int" value="33149"/>
		<constant name="GL_REFLECTION_MAP" type="int" value="34066"/>
		<constant name="GL_REFLECTION_MAP_ARB" type="int" value="34066"/>
		<constant name="GL_REFLECTION_MAP_EXT" type="int" value="34066"/>
		<constant name="GL_REFLECTION_MAP_NV" type="int" value="34066"/>
		<constant name="GL_REGISTER_COMBINERS_NV" type="int" value="34082"/>
		<constant name="GL_REG_0_ATI" type="int" value="35105"/>
		<constant name="GL_REG_10_ATI" type="int" value="35115"/>
		<constant name="GL_REG_11_ATI" type="int" value="35116"/>
		<constant name="GL_REG_12_ATI" type="int" value="35117"/>
		<constant name="GL_REG_13_ATI" type="int" value="35118"/>
		<constant name="GL_REG_14_ATI" type="int" value="35119"/>
		<constant name="GL_REG_15_ATI" type="int" value="35120"/>
		<constant name="GL_REG_16_ATI" type="int" value="35121"/>
		<constant name="GL_REG_17_ATI" type="int" value="35122"/>
		<constant name="GL_REG_18_ATI" type="int" value="35123"/>
		<constant name="GL_REG_19_ATI" type="int" value="35124"/>
		<constant name="GL_REG_1_ATI" type="int" value="35106"/>
		<constant name="GL_REG_20_ATI" type="int" value="35125"/>
		<constant name="GL_REG_21_ATI" type="int" value="35126"/>
		<constant name="GL_REG_22_ATI" type="int" value="35127"/>
		<constant name="GL_REG_23_ATI" type="int" value="35128"/>
		<constant name="GL_REG_24_ATI" type="int" value="35129"/>
		<constant name="GL_REG_25_ATI" type="int" value="35130"/>
		<constant name="GL_REG_26_ATI" type="int" value="35131"/>
		<constant name="GL_REG_27_ATI" type="int" value="35132"/>
		<constant name="GL_REG_28_ATI" type="int" value="35133"/>
		<constant name="GL_REG_29_ATI" type="int" value="35134"/>
		<constant name="GL_REG_2_ATI" type="int" value="35107"/>
		<constant name="GL_REG_30_ATI" type="int" value="35135"/>
		<constant name="GL_REG_31_ATI" type="int" value="35136"/>
		<constant name="GL_REG_3_ATI" type="int" value="35108"/>
		<constant name="GL_REG_4_ATI" type="int" value="35109"/>
		<constant name="GL_REG_5_ATI" type="int" value="35110"/>
		<constant name="GL_REG_6_ATI" type="int" value="35111"/>
		<constant name="GL_REG_7_ATI" type="int" value="35112"/>
		<constant name="GL_REG_8_ATI" type="int" value="35113"/>
		<constant name="GL_REG_9_ATI" type="int" value="35114"/>
		<constant name="GL_REND_screen_coordinates" type="int" value="1"/>
		<constant name="GL_REPLACEMENT_CODE_ARRAY_POINTER_SUN" type="int" value="34243"/>
		<constant name="GL_REPLACEMENT_CODE_ARRAY_STRIDE_SUN" type="int" value="34242"/>
		<constant name="GL_REPLACEMENT_CODE_ARRAY_SUN" type="int" value="34240"/>
		<constant name="GL_REPLACEMENT_CODE_ARRAY_TYPE_SUN" type="int" value="34241"/>
		<constant name="GL_REPLACEMENT_CODE_SUN" type="int" value="33240"/>
		<constant name="GL_REPLACE_EXT" type="int" value="32866"/>
		<constant name="GL_REPLACE_MIDDLE_SUN" type="int" value="2"/>
		<constant name="GL_REPLACE_OLDEST_SUN" type="int" value="3"/>
		<constant name="GL_REPLICATE_BORDER" type="int" value="33107"/>
		<constant name="GL_REPLICATE_BORDER_HP" type="int" value="33107"/>
		<constant name="GL_RESAMPLE_AVERAGE_OML" type="int" value="35208"/>
		<constant name="GL_RESAMPLE_DECIMATE_OML" type="int" value="35209"/>
		<constant name="GL_RESAMPLE_DECIMATE_SGIX" type="int" value="33840"/>
		<constant name="GL_RESAMPLE_REPLICATE_OML" type="int" value="35206"/>
		<constant name="GL_RESAMPLE_REPLICATE_SGIX" type="int" value="33838"/>
		<constant name="GL_RESAMPLE_ZERO_FILL_OML" type="int" value="35207"/>
		<constant name="GL_RESAMPLE_ZERO_FILL_SGIX" type="int" value="33839"/>
		<constant name="GL_RESCALE_NORMAL" type="int" value="32826"/>
		<constant name="GL_RESCALE_NORMAL_EXT" type="int" value="32826"/>
		<constant name="GL_RESTART_SUN" type="int" value="1"/>
		<constant name="GL_RGB10_A2_EXT" type="int" value="32857"/>
		<constant name="GL_RGB10_EXT" type="int" value="32850"/>
		<constant name="GL_RGB12_EXT" type="int" value="32851"/>
		<constant name="GL_RGB16_EXT" type="int" value="32852"/>
		<constant name="GL_RGB16_EXTENDED_RANGE_SGIX" type="int" value="34290"/>
		<constant name="GL_RGB16_SIGNED_SGIX" type="int" value="34278"/>
		<constant name="GL_RGB2_EXT" type="int" value="32846"/>
		<constant name="GL_RGB4_EXT" type="int" value="32847"/>
		<constant name="GL_RGB4_S3TC" type="int" value="33697"/>
		<constant name="GL_RGB5_A1_EXT" type="int" value="32855"/>
		<constant name="GL_RGB5_EXT" type="int" value="32848"/>
		<constant name="GL_RGB8_EXT" type="int" value="32849"/>
		<constant name="GL_RGBA12_EXT" type="int" value="32858"/>
		<constant name="GL_RGBA16_EXT" type="int" value="32859"/>
		<constant name="GL_RGBA16_EXTENDED_RANGE_SGIX" type="int" value="34291"/>
		<constant name="GL_RGBA16_SIGNED_SGIX" type="int" value="34279"/>
		<constant name="GL_RGBA2_EXT" type="int" value="32853"/>
		<constant name="GL_RGBA4_EXT" type="int" value="32854"/>
		<constant name="GL_RGBA4_S3TC" type="int" value="33699"/>
		<constant name="GL_RGBA8_EXT" type="int" value="32856"/>
		<constant name="GL_RGBA_EXTENDED_RANGE_SGIX" type="int" value="34285"/>
		<constant name="GL_RGBA_FLOAT16_APPLE" type="int" value="34842"/>
		<constant name="GL_RGBA_FLOAT16_ATI" type="int" value="34842"/>
		<constant name="GL_RGBA_FLOAT32_APPLE" type="int" value="34836"/>
		<constant name="GL_RGBA_FLOAT32_ATI" type="int" value="34836"/>
		<constant name="GL_RGBA_S3TC" type="int" value="33698"/>
		<constant name="GL_RGBA_SIGNED_SGIX" type="int" value="34273"/>
		<constant name="GL_RGBA_UNSIGNED_DOT_PRODUCT_MAPPING_NV" type="int" value="34521"/>
		<constant name="GL_RGB_EXTENDED_RANGE_SGIX" type="int" value="34284"/>
		<constant name="GL_RGB_FLOAT16_APPLE" type="int" value="34843"/>
		<constant name="GL_RGB_FLOAT16_ATI" type="int" value="34843"/>
		<constant name="GL_RGB_FLOAT32_APPLE" type="int" value="34837"/>
		<constant name="GL_RGB_FLOAT32_ATI" type="int" value="34837"/>
		<constant name="GL_RGB_S3TC" type="int" value="33696"/>
		<constant name="GL_RGB_SCALE" type="int" value="34163"/>
		<constant name="GL_RGB_SCALE_ARB" type="int" value="34163"/>
		<constant name="GL_RGB_SCALE_EXT" type="int" value="34163"/>
		<constant name="GL_RGB_SIGNED_SGIX" type="int" value="34272"/>
		<constant name="GL_S3_s3tc" type="int" value="1"/>
		<constant name="GL_SAMPLES" type="int" value="32937"/>
		<constant name="GL_SAMPLES_3DFX" type="int" value="34484"/>
		<constant name="GL_SAMPLES_ARB" type="int" value="32937"/>
		<constant name="GL_SAMPLES_EXT" type="int" value="32937"/>
		<constant name="GL_SAMPLES_SGIS" type="int" value="32937"/>
		<constant name="GL_SAMPLE_ALPHA_TO_COVERAGE" type="int" value="32926"/>
		<constant name="GL_SAMPLE_ALPHA_TO_COVERAGE_ARB" type="int" value="32926"/>
		<constant name="GL_SAMPLE_ALPHA_TO_MASK_EXT" type="int" value="32926"/>
		<constant name="GL_SAMPLE_ALPHA_TO_MASK_SGIS" type="int" value="32926"/>
		<constant name="GL_SAMPLE_ALPHA_TO_ONE" type="int" value="32927"/>
		<constant name="GL_SAMPLE_ALPHA_TO_ONE_ARB" type="int" value="32927"/>
		<constant name="GL_SAMPLE_ALPHA_TO_ONE_EXT" type="int" value="32927"/>
		<constant name="GL_SAMPLE_ALPHA_TO_ONE_SGIS" type="int" value="32927"/>
		<constant name="GL_SAMPLE_BUFFERS" type="int" value="32936"/>
		<constant name="GL_SAMPLE_BUFFERS_3DFX" type="int" value="34483"/>
		<constant name="GL_SAMPLE_BUFFERS_ARB" type="int" value="32936"/>
		<constant name="GL_SAMPLE_BUFFERS_EXT" type="int" value="32936"/>
		<constant name="GL_SAMPLE_BUFFERS_SGIS" type="int" value="32936"/>
		<constant name="GL_SAMPLE_COVERAGE" type="int" value="32928"/>
		<constant name="GL_SAMPLE_COVERAGE_ARB" type="int" value="32928"/>
		<constant name="GL_SAMPLE_COVERAGE_INVERT" type="int" value="32939"/>
		<constant name="GL_SAMPLE_COVERAGE_INVERT_ARB" type="int" value="32939"/>
		<constant name="GL_SAMPLE_COVERAGE_VALUE" type="int" value="32938"/>
		<constant name="GL_SAMPLE_COVERAGE_VALUE_ARB" type="int" value="32938"/>
		<constant name="GL_SAMPLE_MASK_EXT" type="int" value="32928"/>
		<constant name="GL_SAMPLE_MASK_INVERT_EXT" type="int" value="32939"/>
		<constant name="GL_SAMPLE_MASK_INVERT_SGIS" type="int" value="32939"/>
		<constant name="GL_SAMPLE_MASK_SGIS" type="int" value="32928"/>
		<constant name="GL_SAMPLE_MASK_VALUE_EXT" type="int" value="32938"/>
		<constant name="GL_SAMPLE_MASK_VALUE_SGIS" type="int" value="32938"/>
		<constant name="GL_SAMPLE_PATTERN_EXT" type="int" value="32940"/>
		<constant name="GL_SAMPLE_PATTERN_SGIS" type="int" value="32940"/>
		<constant name="GL_SATURATE_BIT_ATI" type="int" value="64"/>
		<constant name="GL_SCALAR_EXT" type="int" value="34750"/>
		<constant name="GL_SCALEBIAS_HINT_SGIX" type="int" value="33570"/>
		<constant name="GL_SCALE_BY_FOUR_NV" type="int" value="34111"/>
		<constant name="GL_SCALE_BY_ONE_HALF_NV" type="int" value="34112"/>
		<constant name="GL_SCALE_BY_TWO_NV" type="int" value="34110"/>
		<constant name="GL_SCENE_REQUIRED_EXT" type="int" value="0"/>
		<constant name="GL_SCREEN_COORDINATES_REND" type="int" value="33936"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY" type="int" value="33886"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_BUFFER_BINDING_ARB" type="int" value="34972"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_EXT" type="int" value="33886"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_LIST_IBM" type="int" value="103077"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_LIST_STRIDE_IBM" type="int" value="103087"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_POINTER" type="int" value="33885"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_POINTER_EXT" type="int" value="33885"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_SIZE" type="int" value="33882"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_SIZE_EXT" type="int" value="33882"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_STRIDE" type="int" value="33884"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_STRIDE_EXT" type="int" value="33884"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_TYPE" type="int" value="33883"/>
		<constant name="GL_SECONDARY_COLOR_ARRAY_TYPE_EXT" type="int" value="33883"/>
		<constant name="GL_SECONDARY_COLOR_ATIX" type="int" value="34631"/>
		<constant name="GL_SECONDARY_COLOR_NV" type="int" value="34093"/>
		<constant name="GL_SECONDARY_INTERPOLATOR_ATI" type="int" value="35181"/>
		<constant name="GL_SELECTED_TEXTURE_COORD_SET_EXT" type="int" value="33729"/>
		<constant name="GL_SELECTED_TEXTURE_COORD_SET_SGIS" type="int" value="33629"/>
		<constant name="GL_SELECTED_TEXTURE_EXT" type="int" value="33728"/>
		<constant name="GL_SELECTED_TEXTURE_SGIS" type="int" value="33628"/>
		<constant name="GL_SELECTED_TEXTURE_TRANSFORM_EXT" type="int" value="33730"/>
		<constant name="GL_SEPARABLE_2D" type="int" value="32786"/>
		<constant name="GL_SEPARABLE_2D_EXT" type="int" value="32786"/>
		<constant name="GL_SEPARATE_SPECULAR_COLOR" type="int" value="33274"/>
		<constant name="GL_SEPARATE_SPECULAR_COLOR_EXT" type="int" value="33274"/>
		<constant name="GL_SGIS_color_range" type="int" value="1"/>
		<constant name="GL_SGIS_detail_texture" type="int" value="1"/>
		<constant name="GL_SGIS_fog_function" type="int" value="1"/>
		<constant name="GL_SGIS_generate_mipmap" type="int" value="1"/>
		<constant name="GL_SGIS_multisample" type="int" value="1"/>
		<constant name="GL_SGIS_multitexture" type="int" value="1"/>
		<constant name="GL_SGIS_pixel_texture" type="int" value="1"/>
		<constant name="GL_SGIS_point_line_texgen" type="int" value="1"/>
		<constant name="GL_SGIS_point_parameters" type="int" value="1"/>
		<constant name="GL_SGIS_sharpen_texture" type="int" value="1"/>
		<constant name="GL_SGIS_texture4D" type="int" value="1"/>
		<constant name="GL_SGIS_texture_border_clamp" type="int" value="1"/>
		<constant name="GL_SGIS_texture_color_mask" type="int" value="1"/>
		<constant name="GL_SGIS_texture_edge_clamp" type="int" value="1"/>
		<constant name="GL_SGIS_texture_filter4" type="int" value="1"/>
		<constant name="GL_SGIS_texture_lod" type="int" value="1"/>
		<constant name="GL_SGIX_async" type="int" value="1"/>
		<constant name="GL_SGIX_async_histogram" type="int" value="1"/>
		<constant name="GL_SGIX_async_pixel" type="int" value="1"/>
		<constant name="GL_SGIX_blend_alpha_minmax" type="int" value="1"/>
		<constant name="GL_SGIX_calligraphic_fragment" type="int" value="1"/>
		<constant name="GL_SGIX_clipmap" type="int" value="1"/>
		<constant name="GL_SGIX_convolution_accuracy" type="int" value="1"/>
		<constant name="GL_SGIX_depth_pass_instrument" type="int" value="1"/>
		<constant name="GL_SGIX_depth_texture" type="int" value="1"/>
		<constant name="GL_SGIX_flush_raster" type="int" value="1"/>
		<constant name="GL_SGIX_fog_offset" type="int" value="1"/>
		<constant name="GL_SGIX_fog_scale" type="int" value="1"/>
		<constant name="GL_SGIX_fragment_lighting" type="int" value="1"/>
		<constant name="GL_SGIX_framezoom" type="int" value="1"/>
		<constant name="GL_SGIX_igloo_interface" type="int" value="1"/>
		<constant name="GL_SGIX_instruments" type="int" value="1"/>
		<constant name="GL_SGIX_interlace" type="int" value="1"/>
		<constant name="GL_SGIX_ir_instrument1" type="int" value="1"/>
		<constant name="GL_SGIX_list_priority" type="int" value="1"/>
		<constant name="GL_SGIX_pixel_texture" type="int" value="1"/>
		<constant name="GL_SGIX_pixel_tiles" type="int" value="1"/>
		<constant name="GL_SGIX_polynomial_ffd" type="int" value="1"/>
		<constant name="GL_SGIX_reference_plane" type="int" value="1"/>
		<constant name="GL_SGIX_resample" type="int" value="1"/>
		<constant name="GL_SGIX_scalebias_hint" type="int" value="1"/>
		<constant name="GL_SGIX_shadow" type="int" value="1"/>
		<constant name="GL_SGIX_shadow_ambient" type="int" value="1"/>
		<constant name="GL_SGIX_sprite" type="int" value="1"/>
		<constant name="GL_SGIX_subsample" type="int" value="1"/>
		<constant name="GL_SGIX_tag_sample_buffer" type="int" value="1"/>
		<constant name="GL_SGIX_texture_add_env" type="int" value="1"/>
		<constant name="GL_SGIX_texture_coordinate_clamp" type="int" value="1"/>
		<constant name="GL_SGIX_texture_lod_bias" type="int" value="1"/>
		<constant name="GL_SGIX_texture_multi_buffer" type="int" value="1"/>
		<constant name="GL_SGIX_texture_range" type="int" value="1"/>
		<constant name="GL_SGIX_texture_scale_bias" type="int" value="1"/>
		<constant name="GL_SGIX_texture_select" type="int" value="1"/>
		<constant name="GL_SGIX_vertex_preclip" type="int" value="1"/>
		<constant name="GL_SGIX_vertex_preclip_hint" type="int" value="1"/>
		<constant name="GL_SGIX_ycrcb" type="int" value="1"/>
		<constant name="GL_SGIX_ycrcb_subsample" type="int" value="1"/>
		<constant name="GL_SGIX_ycrcba" type="int" value="1"/>
		<constant name="GL_SGI_color_table" type="int" value="1"/>
		<constant name="GL_SGI_texture_color_table" type="int" value="1"/>
		<constant name="GL_SGI_texture_edge_clamp" type="int" value="1"/>
		<constant name="GL_SHADER_CONSISTENT_NV" type="int" value="34525"/>
		<constant name="GL_SHADER_OPERATION_NV" type="int" value="34527"/>
		<constant name="GL_SHADOW_AMBIENT_SGIX" type="int" value="32959"/>
		<constant name="GL_SHADOW_ATTENUATION_EXT" type="int" value="33614"/>
		<constant name="GL_SHARED_TEXTURE_PALETTE_EXT" type="int" value="33275"/>
		<constant name="GL_SHARPEN_TEXTURE_FUNC_POINTS_SGIS" type="int" value="32944"/>
		<constant name="GL_SIGNED_ALPHA8_NV" type="int" value="34566"/>
		<constant name="GL_SIGNED_ALPHA_NV" type="int" value="34565"/>
		<constant name="GL_SIGNED_HILO16_NV" type="int" value="34554"/>
		<constant name="GL_SIGNED_HILO8_NV" type="int" value="34911"/>
		<constant name="GL_SIGNED_HILO_NV" type="int" value="34553"/>
		<constant name="GL_SIGNED_IDENTITY_NV" type="int" value="34108"/>
		<constant name="GL_SIGNED_INTENSITY8_NV" type="int" value="34568"/>
		<constant name="GL_SIGNED_INTENSITY_NV" type="int" value="34567"/>
		<constant name="GL_SIGNED_LUMINANCE8_ALPHA8_NV" type="int" value="34564"/>
		<constant name="GL_SIGNED_LUMINANCE8_NV" type="int" value="34562"/>
		<constant name="GL_SIGNED_LUMINANCE_ALPHA_NV" type="int" value="34563"/>
		<constant name="GL_SIGNED_LUMINANCE_NV" type="int" value="34561"/>
		<constant name="GL_SIGNED_NEGATE_NV" type="int" value="34109"/>
		<constant name="GL_SIGNED_RGB8_NV" type="int" value="34559"/>
		<constant name="GL_SIGNED_RGB8_UNSIGNED_ALPHA8_NV" type="int" value="34573"/>
		<constant name="GL_SIGNED_RGBA8_NV" type="int" value="34556"/>
		<constant name="GL_SIGNED_RGBA_NV" type="int" value="34555"/>
		<constant name="GL_SIGNED_RGB_NV" type="int" value="34558"/>
		<constant name="GL_SIGNED_RGB_UNSIGNED_ALPHA_NV" type="int" value="34572"/>
		<constant name="GL_SINGLE_COLOR" type="int" value="33273"/>
		<constant name="GL_SINGLE_COLOR_EXT" type="int" value="33273"/>
		<constant name="GL_SLICE_ACCUM_SUN" type="int" value="34252"/>
		<constant name="GL_SMOOTH_LINE_WIDTH_GRANULARITY" type="int" value="2851"/>
		<constant name="GL_SMOOTH_LINE_WIDTH_RANGE" type="int" value="2850"/>
		<constant name="GL_SMOOTH_POINT_SIZE_GRANULARITY" type="int" value="2835"/>
		<constant name="GL_SMOOTH_POINT_SIZE_RANGE" type="int" value="2834"/>
		<constant name="GL_SOURCE0_ALPHA" type="int" value="34184"/>
		<constant name="GL_SOURCE0_ALPHA_ARB" type="int" value="34184"/>
		<constant name="GL_SOURCE0_ALPHA_EXT" type="int" value="34184"/>
		<constant name="GL_SOURCE0_RGB" type="int" value="34176"/>
		<constant name="GL_SOURCE0_RGB_ARB" type="int" value="34176"/>
		<constant name="GL_SOURCE0_RGB_EXT" type="int" value="34176"/>
		<constant name="GL_SOURCE1_ALPHA" type="int" value="34185"/>
		<constant name="GL_SOURCE1_ALPHA_ARB" type="int" value="34185"/>
		<constant name="GL_SOURCE1_ALPHA_EXT" type="int" value="34185"/>
		<constant name="GL_SOURCE1_RGB" type="int" value="34177"/>
		<constant name="GL_SOURCE1_RGB_ARB" type="int" value="34177"/>
		<constant name="GL_SOURCE1_RGB_EXT" type="int" value="34177"/>
		<constant name="GL_SOURCE2_ALPHA" type="int" value="34186"/>
		<constant name="GL_SOURCE2_ALPHA_ARB" type="int" value="34186"/>
		<constant name="GL_SOURCE2_ALPHA_EXT" type="int" value="34186"/>
		<constant name="GL_SOURCE2_RGB" type="int" value="34178"/>
		<constant name="GL_SOURCE2_RGB_ARB" type="int" value="34178"/>
		<constant name="GL_SOURCE2_RGB_EXT" type="int" value="34178"/>
		<constant name="GL_SOURCE3_ALPHA_NV" type="int" value="34187"/>
		<constant name="GL_SOURCE3_RGB_NV" type="int" value="34179"/>
		<constant name="GL_SPARE0_NV" type="int" value="34094"/>
		<constant name="GL_SPARE0_PLUS_SECONDARY_COLOR_NV" type="int" value="34098"/>
		<constant name="GL_SPARE1_NV" type="int" value="34095"/>
		<constant name="GL_SPRITE_AXIAL_SGIX" type="int" value="33100"/>
		<constant name="GL_SPRITE_AXIS_SGIX" type="int" value="33098"/>
		<constant name="GL_SPRITE_EYE_ALIGNED_SGIX" type="int" value="33102"/>
		<constant name="GL_SPRITE_MODE_SGIX" type="int" value="33097"/>
		<constant name="GL_SPRITE_OBJECT_ALIGNED_SGIX" type="int" value="33101"/>
		<constant name="GL_SPRITE_SGIX" type="int" value="33096"/>
		<constant name="GL_SPRITE_TRANSLATION_SGIX" type="int" value="33099"/>
		<constant name="GL_STATIC_ATI" type="int" value="34656"/>
		<constant name="GL_STATIC_COPY_ARB" type="int" value="35046"/>
		<constant name="GL_STATIC_DRAW_ARB" type="int" value="35044"/>
		<constant name="GL_STATIC_READ_ARB" type="int" value="35045"/>
		<constant name="GL_STATIC_VERTEX_ARRAY_IBM" type="int" value="103061"/>
		<constant name="GL_STENCIL_BACK_FAIL_ATI" type="int" value="34817"/>
		<constant name="GL_STENCIL_BACK_FUNC_ATI" type="int" value="34816"/>
		<constant name="GL_STENCIL_BACK_PASS_DEPTH_FAIL_ATI" type="int" value="34818"/>
		<constant name="GL_STENCIL_BACK_PASS_DEPTH_PASS_ATI" type="int" value="34819"/>
		<constant name="GL_STENCIL_TEST_TWO_SIDE_EXT" type="int" value="35088"/>
		<constant name="GL_STENCIL_TEST_TWO_SIDE_NV" type="int" value="35088"/>
		<constant name="GL_STORAGE_CACHED_APPLE" type="int" value="34238"/>
		<constant name="GL_STORAGE_PRIVATE_APPLE" type="int" value="34237"/>
		<constant name="GL_STORAGE_SHARED_APPLE" type="int" value="34239"/>
		<constant name="GL_STREAM_COPY_ARB" type="int" value="35042"/>
		<constant name="GL_STREAM_DRAW_ARB" type="int" value="35040"/>
		<constant name="GL_STREAM_READ_ARB" type="int" value="35041"/>
		<constant name="GL_STRICT_DEPTHFUNC_HINT_PGI" type="int" value="107030"/>
		<constant name="GL_STRICT_LIGHTING_HINT_PGI" type="int" value="107031"/>
		<constant name="GL_STRICT_SCISSOR_HINT_PGI" type="int" value="107032"/>
		<constant name="GL_SUBTRACT" type="int" value="34023"/>
		<constant name="GL_SUBTRACT_ARB" type="int" value="34023"/>
		<constant name="GL_SUB_ATI" type="int" value="35173"/>
		<constant name="GL_SUNX_constant_data" type="int" value="1"/>
		<constant name="GL_SUN_convolution_border_modes" type="int" value="1"/>
		<constant name="GL_SUN_global_alpha" type="int" value="1"/>
		<constant name="GL_SUN_mesh_array" type="int" value="1"/>
		<constant name="GL_SUN_multi_draw_arrays" type="int" value="1"/>
		<constant name="GL_SUN_slice_accum" type="int" value="1"/>
		<constant name="GL_SUN_triangle_list" type="int" value="1"/>
		<constant name="GL_SUN_vertex" type="int" value="1"/>
		<constant name="GL_SWIZZLE_STQ_ATI" type="int" value="35191"/>
		<constant name="GL_SWIZZLE_STQ_DQ_ATI" type="int" value="35193"/>
		<constant name="GL_SWIZZLE_STRQ_ATI" type="int" value="35194"/>
		<constant name="GL_SWIZZLE_STRQ_DQ_ATI" type="int" value="35195"/>
		<constant name="GL_SWIZZLE_STR_ATI" type="int" value="35190"/>
		<constant name="GL_SWIZZLE_STR_DR_ATI" type="int" value="35192"/>
		<constant name="GL_T2F_IUI_N3F_V2F_EXT" type="int" value="33203"/>
		<constant name="GL_T2F_IUI_N3F_V3F_EXT" type="int" value="33204"/>
		<constant name="GL_T2F_IUI_V2F_EXT" type="int" value="33201"/>
		<constant name="GL_T2F_IUI_V3F_EXT" type="int" value="33202"/>
		<constant name="GL_TABLE_TOO_LARGE" type="int" value="32817"/>
		<constant name="GL_TABLE_TOO_LARGE_EXT" type="int" value="32817"/>
		<constant name="GL_TANGENT_ARRAY_EXT" type="int" value="33849"/>
		<constant name="GL_TANGENT_ARRAY_POINTER_EXT" type="int" value="33858"/>
		<constant name="GL_TANGENT_ARRAY_STRIDE_EXT" type="int" value="33855"/>
		<constant name="GL_TANGENT_ARRAY_TYPE_EXT" type="int" value="33854"/>
		<constant name="GL_TEXCOORD1_BIT_PGI" type="int" value="268435456"/>
		<constant name="GL_TEXCOORD2_BIT_PGI" type="int" value="536870912"/>
		<constant name="GL_TEXCOORD3_BIT_PGI" type="int" value="1073741824"/>
		<constant name="GL_TEXCOORD4_BIT_PGI" type="int" value="-2147483648"/>
		<constant name="GL_TEXTURE0" type="int" value="33984"/>
		<constant name="GL_TEXTURE0_ARB" type="int" value="33984"/>
		<constant name="GL_TEXTURE0_EXT" type="int" value="33734"/>
		<constant name="GL_TEXTURE0_SGIS" type="int" value="33631"/>
		<constant name="GL_TEXTURE1" type="int" value="33985"/>
		<constant name="GL_TEXTURE10" type="int" value="33994"/>
		<constant name="GL_TEXTURE10_ARB" type="int" value="33994"/>
		<constant name="GL_TEXTURE10_EXT" type="int" value="33744"/>
		<constant name="GL_TEXTURE10_SGIS" type="int" value="33641"/>
		<constant name="GL_TEXTURE11" type="int" value="33995"/>
		<constant name="GL_TEXTURE11_ARB" type="int" value="33995"/>
		<constant name="GL_TEXTURE11_EXT" type="int" value="33745"/>
		<constant name="GL_TEXTURE11_SGIS" type="int" value="33642"/>
		<constant name="GL_TEXTURE12" type="int" value="33996"/>
		<constant name="GL_TEXTURE12_ARB" type="int" value="33996"/>
		<constant name="GL_TEXTURE12_EXT" type="int" value="33746"/>
		<constant name="GL_TEXTURE12_SGIS" type="int" value="33643"/>
		<constant name="GL_TEXTURE13" type="int" value="33997"/>
		<constant name="GL_TEXTURE13_ARB" type="int" value="33997"/>
		<constant name="GL_TEXTURE13_EXT" type="int" value="33747"/>
		<constant name="GL_TEXTURE13_SGIS" type="int" value="33644"/>
		<constant name="GL_TEXTURE14" type="int" value="33998"/>
		<constant name="GL_TEXTURE14_ARB" type="int" value="33998"/>
		<constant name="GL_TEXTURE14_EXT" type="int" value="33748"/>
		<constant name="GL_TEXTURE14_SGIS" type="int" value="33645"/>
		<constant name="GL_TEXTURE15" type="int" value="33999"/>
		<constant name="GL_TEXTURE15_ARB" type="int" value="33999"/>
		<constant name="GL_TEXTURE15_EXT" type="int" value="33749"/>
		<constant name="GL_TEXTURE15_SGIS" type="int" value="33646"/>
		<constant name="GL_TEXTURE16" type="int" value="34000"/>
		<constant name="GL_TEXTURE16_ARB" type="int" value="34000"/>
		<constant name="GL_TEXTURE16_EXT" type="int" value="33750"/>
		<constant name="GL_TEXTURE16_SGIS" type="int" value="33647"/>
		<constant name="GL_TEXTURE17" type="int" value="34001"/>
		<constant name="GL_TEXTURE17_ARB" type="int" value="34001"/>
		<constant name="GL_TEXTURE17_EXT" type="int" value="33751"/>
		<constant name="GL_TEXTURE17_SGIS" type="int" value="33648"/>
		<constant name="GL_TEXTURE18" type="int" value="34002"/>
		<constant name="GL_TEXTURE18_ARB" type="int" value="34002"/>
		<constant name="GL_TEXTURE18_EXT" type="int" value="33752"/>
		<constant name="GL_TEXTURE18_SGIS" type="int" value="33649"/>
		<constant name="GL_TEXTURE19" type="int" value="34003"/>
		<constant name="GL_TEXTURE19_ARB" type="int" value="34003"/>
		<constant name="GL_TEXTURE19_EXT" type="int" value="33753"/>
		<constant name="GL_TEXTURE19_SGIS" type="int" value="33650"/>
		<constant name="GL_TEXTURE1_ARB" type="int" value="33985"/>
		<constant name="GL_TEXTURE1_EXT" type="int" value="33735"/>
		<constant name="GL_TEXTURE1_SGIS" type="int" value="33632"/>
		<constant name="GL_TEXTURE2" type="int" value="33986"/>
		<constant name="GL_TEXTURE20" type="int" value="34004"/>
		<constant name="GL_TEXTURE20_ARB" type="int" value="34004"/>
		<constant name="GL_TEXTURE20_EXT" type="int" value="33754"/>
		<constant name="GL_TEXTURE20_SGIS" type="int" value="33651"/>
		<constant name="GL_TEXTURE21" type="int" value="34005"/>
		<constant name="GL_TEXTURE21_ARB" type="int" value="34005"/>
		<constant name="GL_TEXTURE21_EXT" type="int" value="33755"/>
		<constant name="GL_TEXTURE21_SGIS" type="int" value="33652"/>
		<constant name="GL_TEXTURE22" type="int" value="34006"/>
		<constant name="GL_TEXTURE22_ARB" type="int" value="34006"/>
		<constant name="GL_TEXTURE22_EXT" type="int" value="33756"/>
		<constant name="GL_TEXTURE22_SGIS" type="int" value="33653"/>
		<constant name="GL_TEXTURE23" type="int" value="34007"/>
		<constant name="GL_TEXTURE23_ARB" type="int" value="34007"/>
		<constant name="GL_TEXTURE23_EXT" type="int" value="33757"/>
		<constant name="GL_TEXTURE23_SGIS" type="int" value="33654"/>
		<constant name="GL_TEXTURE24" type="int" value="34008"/>
		<constant name="GL_TEXTURE24_ARB" type="int" value="34008"/>
		<constant name="GL_TEXTURE24_EXT" type="int" value="33758"/>
		<constant name="GL_TEXTURE24_SGIS" type="int" value="33655"/>
		<constant name="GL_TEXTURE25" type="int" value="34009"/>
		<constant name="GL_TEXTURE25_ARB" type="int" value="34009"/>
		<constant name="GL_TEXTURE25_EXT" type="int" value="33759"/>
		<constant name="GL_TEXTURE25_SGIS" type="int" value="33656"/>
		<constant name="GL_TEXTURE26" type="int" value="34010"/>
		<constant name="GL_TEXTURE26_ARB" type="int" value="34010"/>
		<constant name="GL_TEXTURE26_EXT" type="int" value="33760"/>
		<constant name="GL_TEXTURE26_SGIS" type="int" value="33657"/>
		<constant name="GL_TEXTURE27" type="int" value="34011"/>
		<constant name="GL_TEXTURE27_ARB" type="int" value="34011"/>
		<constant name="GL_TEXTURE27_EXT" type="int" value="33761"/>
		<constant name="GL_TEXTURE27_SGIS" type="int" value="33658"/>
		<constant name="GL_TEXTURE28" type="int" value="34012"/>
		<constant name="GL_TEXTURE28_ARB" type="int" value="34012"/>
		<constant name="GL_TEXTURE28_EXT" type="int" value="33762"/>
		<constant name="GL_TEXTURE28_SGIS" type="int" value="33659"/>
		<constant name="GL_TEXTURE29" type="int" value="34013"/>
		<constant name="GL_TEXTURE29_ARB" type="int" value="34013"/>
		<constant name="GL_TEXTURE29_EXT" type="int" value="33763"/>
		<constant name="GL_TEXTURE29_SGIS" type="int" value="33660"/>
		<constant name="GL_TEXTURE2_ARB" type="int" value="33986"/>
		<constant name="GL_TEXTURE2_EXT" type="int" value="33736"/>
		<constant name="GL_TEXTURE2_SGIS" type="int" value="33633"/>
		<constant name="GL_TEXTURE3" type="int" value="33987"/>
		<constant name="GL_TEXTURE30" type="int" value="34014"/>
		<constant name="GL_TEXTURE30_ARB" type="int" value="34014"/>
		<constant name="GL_TEXTURE30_EXT" type="int" value="33764"/>
		<constant name="GL_TEXTURE30_SGIS" type="int" value="33661"/>
		<constant name="GL_TEXTURE31" type="int" value="34015"/>
		<constant name="GL_TEXTURE31_ARB" type="int" value="34015"/>
		<constant name="GL_TEXTURE31_EXT" type="int" value="33765"/>
		<constant name="GL_TEXTURE31_SGIS" type="int" value="33662"/>
		<constant name="GL_TEXTURE3_ARB" type="int" value="33987"/>
		<constant name="GL_TEXTURE3_EXT" type="int" value="33737"/>
		<constant name="GL_TEXTURE3_SGIS" type="int" value="33634"/>
		<constant name="GL_TEXTURE4" type="int" value="33988"/>
		<constant name="GL_TEXTURE4_ARB" type="int" value="33988"/>
		<constant name="GL_TEXTURE4_EXT" type="int" value="33738"/>
		<constant name="GL_TEXTURE4_SGIS" type="int" value="33635"/>
		<constant name="GL_TEXTURE5" type="int" value="33989"/>
		<constant name="GL_TEXTURE5_ARB" type="int" value="33989"/>
		<constant name="GL_TEXTURE5_EXT" type="int" value="33739"/>
		<constant name="GL_TEXTURE5_SGIS" type="int" value="33636"/>
		<constant name="GL_TEXTURE6" type="int" value="33990"/>
		<constant name="GL_TEXTURE6_ARB" type="int" value="33990"/>
		<constant name="GL_TEXTURE6_EXT" type="int" value="33740"/>
		<constant name="GL_TEXTURE6_SGIS" type="int" value="33637"/>
		<constant name="GL_TEXTURE7" type="int" value="33991"/>
		<constant name="GL_TEXTURE7_ARB" type="int" value="33991"/>
		<constant name="GL_TEXTURE7_EXT" type="int" value="33741"/>
		<constant name="GL_TEXTURE7_SGIS" type="int" value="33638"/>
		<constant name="GL_TEXTURE8" type="int" value="33992"/>
		<constant name="GL_TEXTURE8_ARB" type="int" value="33992"/>
		<constant name="GL_TEXTURE8_EXT" type="int" value="33742"/>
		<constant name="GL_TEXTURE8_SGIS" type="int" value="33639"/>
		<constant name="GL_TEXTURE9" type="int" value="33993"/>
		<constant name="GL_TEXTURE9_ARB" type="int" value="33993"/>
		<constant name="GL_TEXTURE9_EXT" type="int" value="33743"/>
		<constant name="GL_TEXTURE9_SGIS" type="int" value="33640"/>
		<constant name="GL_TEXTURE_1D_BINDING_EXT" type="int" value="32872"/>
		<constant name="GL_TEXTURE_2D_BINDING_EXT" type="int" value="32873"/>
		<constant name="GL_TEXTURE_3D" type="int" value="32879"/>
		<constant name="GL_TEXTURE_3D_BINDING_EXT" type="int" value="32874"/>
		<constant name="GL_TEXTURE_3D_EXT" type="int" value="32879"/>
		<constant name="GL_TEXTURE_4DSIZE_SGIS" type="int" value="33078"/>
		<constant name="GL_TEXTURE_4D_BINDING_SGIS" type="int" value="33103"/>
		<constant name="GL_TEXTURE_4D_SGIS" type="int" value="33076"/>
		<constant name="GL_TEXTURE_ALPHA_SIZE_EXT" type="int" value="32863"/>
		<constant name="GL_TEXTURE_APPLICATION_MODE_EXT" type="int" value="33615"/>
		<constant name="GL_TEXTURE_BASE_LEVEL" type="int" value="33084"/>
		<constant name="GL_TEXTURE_BASE_LEVEL_SGIS" type="int" value="33084"/>
		<constant name="GL_TEXTURE_BINDING_3D" type="int" value="32874"/>
		<constant name="GL_TEXTURE_BINDING_CUBE_MAP" type="int" value="34068"/>
		<constant name="GL_TEXTURE_BINDING_CUBE_MAP_ARB" type="int" value="34068"/>
		<constant name="GL_TEXTURE_BINDING_CUBE_MAP_EXT" type="int" value="34068"/>
		<constant name="GL_TEXTURE_BINDING_RECTANGLE_EXT" type="int" value="34038"/>
		<constant name="GL_TEXTURE_BINDING_RECTANGLE_NV" type="int" value="34038"/>
		<constant name="GL_TEXTURE_BLUE_SIZE_EXT" type="int" value="32862"/>
		<constant name="GL_TEXTURE_BORDER_VALUES_NV" type="int" value="34586"/>
		<constant name="GL_TEXTURE_CLIPMAP_CENTER_SGIX" type="int" value="33137"/>
		<constant name="GL_TEXTURE_CLIPMAP_DEPTH_SGIX" type="int" value="33142"/>
		<constant name="GL_TEXTURE_CLIPMAP_FRAME_SGIX" type="int" value="33138"/>
		<constant name="GL_TEXTURE_CLIPMAP_LOD_OFFSET_SGIX" type="int" value="33141"/>
		<constant name="GL_TEXTURE_CLIPMAP_OFFSET_SGIX" type="int" value="33139"/>
		<constant name="GL_TEXTURE_CLIPMAP_VIRTUAL_DEPTH_SGIX" type="int" value="33140"/>
		<constant name="GL_TEXTURE_COLOR_TABLE_SGI" type="int" value="32956"/>
		<constant name="GL_TEXTURE_COLOR_WRITEMASK_SGIS" type="int" value="33263"/>
		<constant name="GL_TEXTURE_COMPARE_FAIL_VALUE_ARB" type="int" value="32959"/>
		<constant name="GL_TEXTURE_COMPARE_FUNC" type="int" value="34893"/>
		<constant name="GL_TEXTURE_COMPARE_FUNC_ARB" type="int" value="34893"/>
		<constant name="GL_TEXTURE_COMPARE_MODE" type="int" value="34892"/>
		<constant name="GL_TEXTURE_COMPARE_MODE_ARB" type="int" value="34892"/>
		<constant name="GL_TEXTURE_COMPARE_OPERATOR_SGIX" type="int" value="33179"/>
		<constant name="GL_TEXTURE_COMPARE_SGIX" type="int" value="33178"/>
		<constant name="GL_TEXTURE_COMPRESSED" type="int" value="34465"/>
		<constant name="GL_TEXTURE_COMPRESSED_ARB" type="int" value="34465"/>
		<constant name="GL_TEXTURE_COMPRESSED_IMAGE_SIZE" type="int" value="34464"/>
		<constant name="GL_TEXTURE_COMPRESSED_IMAGE_SIZE_ARB" type="int" value="34464"/>
		<constant name="GL_TEXTURE_COMPRESSION_HINT" type="int" value="34031"/>
		<constant name="GL_TEXTURE_COMPRESSION_HINT_ARB" type="int" value="34031"/>
		<constant name="GL_TEXTURE_CONSTANT_DATA_SUNX" type="int" value="33238"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_BUFFER_BINDING_ARB" type="int" value="34970"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_COUNT_EXT" type="int" value="32907"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_EXT" type="int" value="32888"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_LIST_IBM" type="int" value="103074"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_LIST_STRIDE_IBM" type="int" value="103084"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_PARALLEL_POINTERS_INTEL" type="int" value="33784"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_POINTER_EXT" type="int" value="32914"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_SIZE_EXT" type="int" value="32904"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_STRIDE_EXT" type="int" value="32906"/>
		<constant name="GL_TEXTURE_COORD_ARRAY_TYPE_EXT" type="int" value="32905"/>
		<constant name="GL_TEXTURE_COORD_SET_SOURCE_SGIS" type="int" value="33635"/>
		<constant name="GL_TEXTURE_CUBE_MAP" type="int" value="34067"/>
		<constant name="GL_TEXTURE_CUBE_MAP_ARB" type="int" value="34067"/>
		<constant name="GL_TEXTURE_CUBE_MAP_EXT" type="int" value="34067"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_X" type="int" value="34070"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB" type="int" value="34070"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_X_EXT" type="int" value="34070"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_Y" type="int" value="34072"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB" type="int" value="34072"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_Y_EXT" type="int" value="34072"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_Z" type="int" value="34074"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB" type="int" value="34074"/>
		<constant name="GL_TEXTURE_CUBE_MAP_NEGATIVE_Z_EXT" type="int" value="34074"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_X" type="int" value="34069"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB" type="int" value="34069"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_X_EXT" type="int" value="34069"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_Y" type="int" value="34071"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB" type="int" value="34071"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_Y_EXT" type="int" value="34071"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_Z" type="int" value="34073"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB" type="int" value="34073"/>
		<constant name="GL_TEXTURE_CUBE_MAP_POSITIVE_Z_EXT" type="int" value="34073"/>
		<constant name="GL_TEXTURE_DEFORMATION_BIT_SGIX" type="int" value="1"/>
		<constant name="GL_TEXTURE_DEFORMATION_SGIX" type="int" value="33173"/>
		<constant name="GL_TEXTURE_DEPTH" type="int" value="32881"/>
		<constant name="GL_TEXTURE_DEPTH_EXT" type="int" value="32881"/>
		<constant name="GL_TEXTURE_DEPTH_SIZE" type="int" value="34890"/>
		<constant name="GL_TEXTURE_DEPTH_SIZE_ARB" type="int" value="34890"/>
		<constant name="GL_TEXTURE_DS_SIZE_NV" type="int" value="34589"/>
		<constant name="GL_TEXTURE_DT_SIZE_NV" type="int" value="34590"/>
		<constant name="GL_TEXTURE_ENV_BIAS_SGIX" type="int" value="32958"/>
		<constant name="GL_TEXTURE_ENV_COORD_SET_EXT" type="int" value="33733"/>
		<constant name="GL_TEXTURE_FILTER4_SIZE_SGIS" type="int" value="33095"/>
		<constant name="GL_TEXTURE_FILTER_CONTROL" type="int" value="34048"/>
		<constant name="GL_TEXTURE_FILTER_CONTROL_EXT" type="int" value="34048"/>
		<constant name="GL_TEXTURE_FLOAT_COMPONENTS_NV" type="int" value="34956"/>
		<constant name="GL_TEXTURE_FOG_SGIX" type="int" value="0"/>
		<constant name="GL_TEXTURE_GEQUAL_R_SGIX" type="int" value="33181"/>
		<constant name="GL_TEXTURE_GREEN_SIZE_EXT" type="int" value="32861"/>
		<constant name="GL_TEXTURE_HI_SIZE_NV" type="int" value="34587"/>
		<constant name="GL_TEXTURE_INDEX_SIZE_EXT" type="int" value="33005"/>
		<constant name="GL_TEXTURE_INTENSITY_SIZE_EXT" type="int" value="32865"/>
		<constant name="GL_TEXTURE_LEQUAL_R_SGIX" type="int" value="33180"/>
		<constant name="GL_TEXTURE_LIGHTING_MODE_HP" type="int" value="33127"/>
		<constant name="GL_TEXTURE_LIGHT_EXT" type="int" value="33616"/>
		<constant name="GL_TEXTURE_LOD_BIAS" type="int" value="34049"/>
		<constant name="GL_TEXTURE_LOD_BIAS_EXT" type="int" value="34049"/>
		<constant name="GL_TEXTURE_LOD_BIAS_R_SGIX" type="int" value="33168"/>
		<constant name="GL_TEXTURE_LOD_BIAS_S_SGIX" type="int" value="33166"/>
		<constant name="GL_TEXTURE_LOD_BIAS_T_SGIX" type="int" value="33167"/>
		<constant name="GL_TEXTURE_LO_SIZE_NV" type="int" value="34588"/>
		<constant name="GL_TEXTURE_LUMINANCE_SIZE_EXT" type="int" value="32864"/>
		<constant name="GL_TEXTURE_MAG_SIZE_NV" type="int" value="34591"/>
		<constant name="GL_TEXTURE_MATERIAL_FACE_EXT" type="int" value="33617"/>
		<constant name="GL_TEXTURE_MATERIAL_PARAMETER_EXT" type="int" value="33618"/>
		<constant name="GL_TEXTURE_MAX_ANISOTROPY_EXT" type="int" value="34046"/>
		<constant name="GL_TEXTURE_MAX_CLAMP_R_SGIX" type="int" value="33643"/>
		<constant name="GL_TEXTURE_MAX_CLAMP_S_SGIX" type="int" value="33641"/>
		<constant name="GL_TEXTURE_MAX_CLAMP_T_SGIX" type="int" value="33642"/>
		<constant name="GL_TEXTURE_MAX_LEVEL" type="int" value="33085"/>
		<constant name="GL_TEXTURE_MAX_LEVEL_SGIS" type="int" value="33085"/>
		<constant name="GL_TEXTURE_MAX_LOD" type="int" value="33083"/>
		<constant name="GL_TEXTURE_MAX_LOD_SGIS" type="int" value="33083"/>
		<constant name="GL_TEXTURE_MIN_LOD" type="int" value="33082"/>
		<constant name="GL_TEXTURE_MIN_LOD_SGIS" type="int" value="33082"/>
		<constant name="GL_TEXTURE_MULTI_BUFFER_HINT_SGIX" type="int" value="33070"/>
		<constant name="GL_TEXTURE_NORMAL_EXT" type="int" value="34223"/>
		<constant name="GL_TEXTURE_OUTPUT_ALPHA_ATIX" type="int" value="34633"/>
		<constant name="GL_TEXTURE_OUTPUT_RGB_ATIX" type="int" value="34632"/>
		<constant name="GL_TEXTURE_POST_SPECULAR_HP" type="int" value="33128"/>
		<constant name="GL_TEXTURE_PRE_SPECULAR_HP" type="int" value="33129"/>
		<constant name="GL_TEXTURE_PRIORITY_EXT" type="int" value="32870"/>
		<constant name="GL_TEXTURE_RANGE_LENGTH_APPLE" type="int" value="34231"/>
		<constant name="GL_TEXTURE_RANGE_POINTER_APPLE" type="int" value="34232"/>
		<constant name="GL_TEXTURE_RECTANGLE_EXT" type="int" value="34037"/>
		<constant name="GL_TEXTURE_RECTANGLE_NV" type="int" value="34037"/>
		<constant name="GL_TEXTURE_RED_SIZE_EXT" type="int" value="32860"/>
		<constant name="GL_TEXTURE_RESIDENT_EXT" type="int" value="32871"/>
		<constant name="GL_TEXTURE_SHADER_NV" type="int" value="34526"/>
		<constant name="GL_TEXTURE_STORAGE_HINT_APPLE" type="int" value="34236"/>
		<constant name="GL_TEXTURE_TOO_LARGE_EXT" type="int" value="32869"/>
		<constant name="GL_TEXTURE_UNSIGNED_REMAP_MODE_NV" type="int" value="34959"/>
		<constant name="GL_TEXTURE_WRAP_Q_SGIS" type="int" value="33079"/>
		<constant name="GL_TEXTURE_WRAP_R" type="int" value="32882"/>
		<constant name="GL_TEXTURE_WRAP_R_EXT" type="int" value="32882"/>
		<constant name="GL_TEXT_FRAGMENT_SHADER_ATI" type="int" value="33280"/>
		<constant name="GL_TRACK_MATRIX_NV" type="int" value="34376"/>
		<constant name="GL_TRACK_MATRIX_TRANSFORM_NV" type="int" value="34377"/>
		<constant name="GL_TRANSFORM_HINT_APPLE" type="int" value="34225"/>
		<constant name="GL_TRANSPOSE_COLOR_MATRIX" type="int" value="34022"/>
		<constant name="GL_TRANSPOSE_COLOR_MATRIX_ARB" type="int" value="34022"/>
		<constant name="GL_TRANSPOSE_CURRENT_MATRIX_ARB" type="int" value="34999"/>
		<constant name="GL_TRANSPOSE_MODELVIEW_MATRIX" type="int" value="34019"/>
		<constant name="GL_TRANSPOSE_MODELVIEW_MATRIX_ARB" type="int" value="34019"/>
		<constant name="GL_TRANSPOSE_NV" type="int" value="34348"/>
		<constant name="GL_TRANSPOSE_PROJECTION_MATRIX" type="int" value="34020"/>
		<constant name="GL_TRANSPOSE_PROJECTION_MATRIX_ARB" type="int" value="34020"/>
		<constant name="GL_TRANSPOSE_TEXTURE_MATRIX" type="int" value="34021"/>
		<constant name="GL_TRANSPOSE_TEXTURE_MATRIX_ARB" type="int" value="34021"/>
		<constant name="GL_TRIANGLE_LIST_SUN" type="int" value="33239"/>
		<constant name="GL_TRIANGLE_MESH_SUN" type="int" value="34325"/>
		<constant name="GL_TYPE_RGBA_FLOAT_ATI" type="int" value="34848"/>
		<constant name="GL_UNPACK_CLIENT_STORAGE_APPLE" type="int" value="34226"/>
		<constant name="GL_UNPACK_CMYK_HINT_EXT" type="int" value="32783"/>
		<constant name="GL_UNPACK_CONSTANT_DATA_SUNX" type="int" value="33237"/>
		<constant name="GL_UNPACK_IMAGE_DEPTH_SGIS" type="int" value="33075"/>
		<constant name="GL_UNPACK_IMAGE_HEIGHT" type="int" value="32878"/>
		<constant name="GL_UNPACK_IMAGE_HEIGHT_EXT" type="int" value="32878"/>
		<constant name="GL_UNPACK_RESAMPLE_OML" type="int" value="35205"/>
		<constant name="GL_UNPACK_RESAMPLE_SGIX" type="int" value="33837"/>
		<constant name="GL_UNPACK_SKIP_IMAGES" type="int" value="32877"/>
		<constant name="GL_UNPACK_SKIP_IMAGES_EXT" type="int" value="32877"/>
		<constant name="GL_UNPACK_SKIP_VOLUMES_SGIS" type="int" value="33074"/>
		<constant name="GL_UNPACK_SUBSAMPLE_RATE_SGIX" type="int" value="34209"/>
		<constant name="GL_UNSIGNED_BYTE_2_3_3_REV" type="int" value="33634"/>
		<constant name="GL_UNSIGNED_BYTE_3_3_2" type="int" value="32818"/>
		<constant name="GL_UNSIGNED_BYTE_3_3_2_EXT" type="int" value="32818"/>
		<constant name="GL_UNSIGNED_IDENTITY_NV" type="int" value="34102"/>
		<constant name="GL_UNSIGNED_INT_10_10_10_2" type="int" value="32822"/>
		<constant name="GL_UNSIGNED_INT_10_10_10_2_EXT" type="int" value="32822"/>
		<constant name="GL_UNSIGNED_INT_24_8_NV" type="int" value="34042"/>
		<constant name="GL_UNSIGNED_INT_2_10_10_10_REV" type="int" value="33640"/>
		<constant name="GL_UNSIGNED_INT_8_8_8_8" type="int" value="32821"/>
		<constant name="GL_UNSIGNED_INT_8_8_8_8_EXT" type="int" value="32821"/>
		<constant name="GL_UNSIGNED_INT_8_8_8_8_REV" type="int" value="33639"/>
		<constant name="GL_UNSIGNED_INT_8_8_S8_S8_REV_NV" type="int" value="34523"/>
		<constant name="GL_UNSIGNED_INT_S8_S8_8_8_NV" type="int" value="34522"/>
		<constant name="GL_UNSIGNED_INVERT_NV" type="int" value="34103"/>
		<constant name="GL_UNSIGNED_SHORT_1_5_5_5_REV" type="int" value="33638"/>
		<constant name="GL_UNSIGNED_SHORT_4_4_4_4" type="int" value="32819"/>
		<constant name="GL_UNSIGNED_SHORT_4_4_4_4_EXT" type="int" value="32819"/>
		<constant name="GL_UNSIGNED_SHORT_4_4_4_4_REV" type="int" value="33637"/>
		<constant name="GL_UNSIGNED_SHORT_5_5_5_1" type="int" value="32820"/>
		<constant name="GL_UNSIGNED_SHORT_5_5_5_1_EXT" type="int" value="32820"/>
		<constant name="GL_UNSIGNED_SHORT_5_6_5" type="int" value="33635"/>
		<constant name="GL_UNSIGNED_SHORT_5_6_5_REV" type="int" value="33636"/>
		<constant name="GL_UNSIGNED_SHORT_8_8_APPLE" type="int" value="34234"/>
		<constant name="GL_UNSIGNED_SHORT_8_8_REV_APPLE" type="int" value="34235"/>
		<constant name="GL_VARIABLE_A_NV" type="int" value="34083"/>
		<constant name="GL_VARIABLE_B_NV" type="int" value="34084"/>
		<constant name="GL_VARIABLE_C_NV" type="int" value="34085"/>
		<constant name="GL_VARIABLE_D_NV" type="int" value="34086"/>
		<constant name="GL_VARIABLE_E_NV" type="int" value="34087"/>
		<constant name="GL_VARIABLE_F_NV" type="int" value="34088"/>
		<constant name="GL_VARIABLE_G_NV" type="int" value="34089"/>
		<constant name="GL_VARIANT_ARRAY_EXT" type="int" value="34792"/>
		<constant name="GL_VARIANT_ARRAY_POINTER_EXT" type="int" value="34793"/>
		<constant name="GL_VARIANT_ARRAY_STRIDE_EXT" type="int" value="34790"/>
		<constant name="GL_VARIANT_ARRAY_TYPE_EXT" type="int" value="34791"/>
		<constant name="GL_VARIANT_DATATYPE_EXT" type="int" value="34789"/>
		<constant name="GL_VARIANT_EXT" type="int" value="34753"/>
		<constant name="GL_VARIANT_VALUE_EXT" type="int" value="34788"/>
		<constant name="GL_VECTOR_EXT" type="int" value="34751"/>
		<constant name="GL_VERSION_1_2" type="int" value="1"/>
		<constant name="GL_VERSION_1_3" type="int" value="1"/>
		<constant name="GL_VERSION_1_4" type="int" value="1"/>
		<constant name="GL_VERTEX23_BIT_PGI" type="int" value="4"/>
		<constant name="GL_VERTEX4_BIT_PGI" type="int" value="8"/>
		<constant name="GL_VERTEX_ARRAY_BINDING_APPLE" type="int" value="34229"/>
		<constant name="GL_VERTEX_ARRAY_BUFFER_BINDING_ARB" type="int" value="34966"/>
		<constant name="GL_VERTEX_ARRAY_COUNT_EXT" type="int" value="32893"/>
		<constant name="GL_VERTEX_ARRAY_EXT" type="int" value="32884"/>
		<constant name="GL_VERTEX_ARRAY_LIST_IBM" type="int" value="103070"/>
		<constant name="GL_VERTEX_ARRAY_LIST_STRIDE_IBM" type="int" value="103080"/>
		<constant name="GL_VERTEX_ARRAY_PARALLEL_POINTERS_INTEL" type="int" value="33781"/>
		<constant name="GL_VERTEX_ARRAY_POINTER_EXT" type="int" value="32910"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_APPLE" type="int" value="34077"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_LENGTH_APPLE" type="int" value="34078"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_LENGTH_NV" type="int" value="34078"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_NV" type="int" value="34077"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_POINTER_APPLE" type="int" value="34081"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_POINTER_NV" type="int" value="34081"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_VALID_NV" type="int" value="34079"/>
		<constant name="GL_VERTEX_ARRAY_RANGE_WITHOUT_FLUSH_NV" type="int" value="34099"/>
		<constant name="GL_VERTEX_ARRAY_SIZE_EXT" type="int" value="32890"/>
		<constant name="GL_VERTEX_ARRAY_STORAGE_HINT_APPLE" type="int" value="34079"/>
		<constant name="GL_VERTEX_ARRAY_STRIDE_EXT" type="int" value="32892"/>
		<constant name="GL_VERTEX_ARRAY_TYPE_EXT" type="int" value="32891"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY0_NV" type="int" value="34384"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY10_NV" type="int" value="34394"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY11_NV" type="int" value="34395"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY12_NV" type="int" value="34396"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY13_NV" type="int" value="34397"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY14_NV" type="int" value="34398"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY15_NV" type="int" value="34399"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY1_NV" type="int" value="34385"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY2_NV" type="int" value="34386"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY3_NV" type="int" value="34387"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY4_NV" type="int" value="34388"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY5_NV" type="int" value="34389"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY6_NV" type="int" value="34390"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY7_NV" type="int" value="34391"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY8_NV" type="int" value="34392"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY9_NV" type="int" value="34393"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING_ARB" type="int" value="34975"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_ENABLED_ARB" type="int" value="34338"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_NORMALIZED_ARB" type="int" value="34922"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_POINTER_ARB" type="int" value="34373"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_SIZE_ARB" type="int" value="34339"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_STRIDE_ARB" type="int" value="34340"/>
		<constant name="GL_VERTEX_ATTRIB_ARRAY_TYPE_ARB" type="int" value="34341"/>
		<constant name="GL_VERTEX_ATTRIB_MAP1_ARB" type="int" value="35328"/>
		<constant name="GL_VERTEX_ATTRIB_MAP1_COEFF_ARB" type="int" value="35331"/>
		<constant name="GL_VERTEX_ATTRIB_MAP1_DOMAIN_ARB" type="int" value="35333"/>
		<constant name="GL_VERTEX_ATTRIB_MAP1_ORDER_ARB" type="int" value="35332"/>
		<constant name="GL_VERTEX_ATTRIB_MAP1_SIZE_ARB" type="int" value="35330"/>
		<constant name="GL_VERTEX_ATTRIB_MAP2_ARB" type="int" value="35329"/>
		<constant name="GL_VERTEX_ATTRIB_MAP2_COEFF_ARB" type="int" value="35335"/>
		<constant name="GL_VERTEX_ATTRIB_MAP2_DOMAIN_ARB" type="int" value="35337"/>
		<constant name="GL_VERTEX_ATTRIB_MAP2_ORDER_ARB" type="int" value="35336"/>
		<constant name="GL_VERTEX_ATTRIB_MAP2_SIZE_ARB" type="int" value="35334"/>
		<constant name="GL_VERTEX_BLEND_ARB" type="int" value="34471"/>
		<constant name="GL_VERTEX_CONSISTENT_HINT_PGI" type="int" value="107051"/>
		<constant name="GL_VERTEX_DATA_HINT_PGI" type="int" value="107050"/>
		<constant name="GL_VERTEX_PRECLIP_HINT_SGIX" type="int" value="33775"/>
		<constant name="GL_VERTEX_PRECLIP_SGIX" type="int" value="33774"/>
		<constant name="GL_VERTEX_PROGRAM_ARB" type="int" value="34336"/>
		<constant name="GL_VERTEX_PROGRAM_BINDING_NV" type="int" value="34378"/>
		<constant name="GL_VERTEX_PROGRAM_NV" type="int" value="34336"/>
		<constant name="GL_VERTEX_PROGRAM_POINT_SIZE_ARB" type="int" value="34370"/>
		<constant name="GL_VERTEX_PROGRAM_POINT_SIZE_NV" type="int" value="34370"/>
		<constant name="GL_VERTEX_PROGRAM_TWO_SIDE_ARB" type="int" value="34371"/>
		<constant name="GL_VERTEX_PROGRAM_TWO_SIDE_NV" type="int" value="34371"/>
		<constant name="GL_VERTEX_SHADER_BINDING_EXT" type="int" value="34689"/>
		<constant name="GL_VERTEX_SHADER_EXT" type="int" value="34688"/>
		<constant name="GL_VERTEX_SHADER_INSTRUCTIONS_EXT" type="int" value="34767"/>
		<constant name="GL_VERTEX_SHADER_INVARIANTS_EXT" type="int" value="34769"/>
		<constant name="GL_VERTEX_SHADER_LOCALS_EXT" type="int" value="34771"/>
		<constant name="GL_VERTEX_SHADER_LOCAL_CONSTANTS_EXT" type="int" value="34770"/>
		<constant name="GL_VERTEX_SHADER_OPTIMIZED_EXT" type="int" value="34772"/>
		<constant name="GL_VERTEX_SHADER_VARIANTS_EXT" type="int" value="34768"/>
		<constant name="GL_VERTEX_SOURCE_ATI" type="int" value="34676"/>
		<constant name="GL_VERTEX_STATE_PROGRAM_NV" type="int" value="34337"/>
		<constant name="GL_VERTEX_STREAM0_ATI" type="int" value="34668"/>
		<constant name="GL_VERTEX_STREAM1_ATI" type="int" value="34669"/>
		<constant name="GL_VERTEX_STREAM2_ATI" type="int" value="34670"/>
		<constant name="GL_VERTEX_STREAM3_ATI" type="int" value="34671"/>
		<constant name="GL_VERTEX_STREAM4_ATI" type="int" value="34672"/>
		<constant name="GL_VERTEX_STREAM5_ATI" type="int" value="34673"/>
		<constant name="GL_VERTEX_STREAM6_ATI" type="int" value="34674"/>
		<constant name="GL_VERTEX_STREAM7_ATI" type="int" value="34675"/>
		<constant name="GL_VERTEX_WEIGHTING_EXT" type="int" value="34057"/>
		<constant name="GL_VERTEX_WEIGHT_ARRAY_EXT" type="int" value="34060"/>
		<constant name="GL_VERTEX_WEIGHT_ARRAY_POINTER_EXT" type="int" value="34064"/>
		<constant name="GL_VERTEX_WEIGHT_ARRAY_SIZE_EXT" type="int" value="34061"/>
		<constant name="GL_VERTEX_WEIGHT_ARRAY_STRIDE_EXT" type="int" value="34063"/>
		<constant name="GL_VERTEX_WEIGHT_ARRAY_TYPE_EXT" type="int" value="34062"/>
		<constant name="GL_VIBRANCE_BIAS_NV" type="int" value="34585"/>
		<constant name="GL_VIBRANCE_SCALE_NV" type="int" value="34579"/>
		<constant name="GL_WEIGHT_ARRAY_ARB" type="int" value="34477"/>
		<constant name="GL_WEIGHT_ARRAY_BUFFER_BINDING_ARB" type="int" value="34974"/>
		<constant name="GL_WEIGHT_ARRAY_POINTER_ARB" type="int" value="34476"/>
		<constant name="GL_WEIGHT_ARRAY_SIZE_ARB" type="int" value="34475"/>
		<constant name="GL_WEIGHT_ARRAY_STRIDE_ARB" type="int" value="34474"/>
		<constant name="GL_WEIGHT_ARRAY_TYPE_ARB" type="int" value="34473"/>
		<constant name="GL_WEIGHT_SUM_UNITY_ARB" type="int" value="34470"/>
		<constant name="GL_WIDE_LINE_HINT_PGI" type="int" value="107042"/>
		<constant name="GL_WIN_phong_shading" type="int" value="1"/>
		<constant name="GL_WIN_specular_fog" type="int" value="1"/>
		<constant name="GL_WIN_swap_hint" type="int" value="1"/>
		<constant name="GL_WRAP_BORDER_SUN" type="int" value="33236"/>
		<constant name="GL_WRITE_ONLY_ARB" type="int" value="35001"/>
		<constant name="GL_WRITE_PIXEL_DATA_RANGE_LENGTH_NV" type="int" value="34938"/>
		<constant name="GL_WRITE_PIXEL_DATA_RANGE_NV" type="int" value="34936"/>
		<constant name="GL_WRITE_PIXEL_DATA_RANGE_POINTER_NV" type="int" value="34940"/>
		<constant name="GL_W_EXT" type="int" value="34776"/>
		<constant name="GL_X_EXT" type="int" value="34773"/>
		<constant name="GL_YCBCR_422_APPLE" type="int" value="34233"/>
		<constant name="GL_YCRCBA_SGIX" type="int" value="33561"/>
		<constant name="GL_YCRCB_422_SGIX" type="int" value="33211"/>
		<constant name="GL_YCRCB_444_SGIX" type="int" value="33212"/>
		<constant name="GL_YCRCB_SGIX" type="int" value="33560"/>
		<constant name="GL_Y_EXT" type="int" value="34774"/>
		<constant name="GL_ZERO_EXT" type="int" value="34781"/>
		<constant name="GL_Z_EXT" type="int" value="34775"/>
		<constant name="MAX_ALPHA_SGIS" type="int" value="34221"/>
		<constant name="MAX_BLUE_SGIS" type="int" value="34219"/>
		<constant name="MAX_GREEN_SGIS" type="int" value="34217"/>
		<constant name="MAX_RED_SGIS" type="int" value="34215"/>
		<constant name="MIN_ALPHA_SGIS" type="int" value="34220"/>
		<constant name="MIN_BLUE_SGIS" type="int" value="34218"/>
		<constant name="MIN_GREEN_SGIS" type="int" value="34216"/>
		<constant name="MIN_RED_SGIS" type="int" value="34214"/>
		<constant name="WGL_3DFX_multisample" type="int" value="1"/>
		<constant name="WGL_ACCELERATION_ARB" type="int" value="8195"/>
		<constant name="WGL_ACCELERATION_EXT" type="int" value="8195"/>
		<constant name="WGL_ACCUM_ALPHA_BITS_ARB" type="int" value="8225"/>
		<constant name="WGL_ACCUM_ALPHA_BITS_EXT" type="int" value="8225"/>
		<constant name="WGL_ACCUM_BITS_ARB" type="int" value="8221"/>
		<constant name="WGL_ACCUM_BITS_EXT" type="int" value="8221"/>
		<constant name="WGL_ACCUM_BLUE_BITS_ARB" type="int" value="8224"/>
		<constant name="WGL_ACCUM_BLUE_BITS_EXT" type="int" value="8224"/>
		<constant name="WGL_ACCUM_GREEN_BITS_ARB" type="int" value="8223"/>
		<constant name="WGL_ACCUM_GREEN_BITS_EXT" type="int" value="8223"/>
		<constant name="WGL_ACCUM_RED_BITS_ARB" type="int" value="8222"/>
		<constant name="WGL_ACCUM_RED_BITS_EXT" type="int" value="8222"/>
		<constant name="WGL_ALPHA_BITS_ARB" type="int" value="8219"/>
		<constant name="WGL_ALPHA_BITS_EXT" type="int" value="8219"/>
		<constant name="WGL_ALPHA_SHIFT_ARB" type="int" value="8220"/>
		<constant name="WGL_ALPHA_SHIFT_EXT" type="int" value="8220"/>
		<constant name="WGL_ARB_buffer_region" type="int" value="1"/>
		<constant name="WGL_ARB_extensions_string" type="int" value="1"/>
		<constant name="WGL_ARB_make_current_read" type="int" value="1"/>
		<constant name="WGL_ARB_multisample" type="int" value="1"/>
		<constant name="WGL_ARB_pbuffer" type="int" value="1"/>
		<constant name="WGL_ARB_pixel_format" type="int" value="1"/>
		<constant name="WGL_ARB_render_texture" type="int" value="1"/>
		<constant name="WGL_ATI_pixel_format_float" type="int" value="1"/>
		<constant name="WGL_AUX0_ARB" type="int" value="8327"/>
		<constant name="WGL_AUX1_ARB" type="int" value="8328"/>
		<constant name="WGL_AUX2_ARB" type="int" value="8329"/>
		<constant name="WGL_AUX3_ARB" type="int" value="8330"/>
		<constant name="WGL_AUX4_ARB" type="int" value="8331"/>
		<constant name="WGL_AUX5_ARB" type="int" value="8332"/>
		<constant name="WGL_AUX6_ARB" type="int" value="8333"/>
		<constant name="WGL_AUX7_ARB" type="int" value="8334"/>
		<constant name="WGL_AUX8_ARB" type="int" value="8335"/>
		<constant name="WGL_AUX9_ARB" type="int" value="8336"/>
		<constant name="WGL_AUX_BUFFERS_ARB" type="int" value="8228"/>
		<constant name="WGL_AUX_BUFFERS_EXT" type="int" value="8228"/>
		<constant name="WGL_BACK_COLOR_BUFFER_BIT_ARB" type="int" value="2"/>
		<constant name="WGL_BACK_LEFT_ARB" type="int" value="8325"/>
		<constant name="WGL_BACK_RIGHT_ARB" type="int" value="8326"/>
		<constant name="WGL_BIND_TO_TEXTURE_DEPTH_NV" type="int" value="8355"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_DEPTH_NV" type="int" value="8356"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGBA_NV" type="int" value="8372"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RGB_NV" type="int" value="8371"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_RG_NV" type="int" value="8370"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_FLOAT_R_NV" type="int" value="8369"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_RGBA_NV" type="int" value="8353"/>
		<constant name="WGL_BIND_TO_TEXTURE_RECTANGLE_RGB_NV" type="int" value="8352"/>
		<constant name="WGL_BIND_TO_TEXTURE_RGBA_ARB" type="int" value="8305"/>
		<constant name="WGL_BIND_TO_TEXTURE_RGB_ARB" type="int" value="8304"/>
		<constant name="WGL_BLUE_BITS_ARB" type="int" value="8217"/>
		<constant name="WGL_BLUE_BITS_EXT" type="int" value="8217"/>
		<constant name="WGL_BLUE_SHIFT_ARB" type="int" value="8218"/>
		<constant name="WGL_BLUE_SHIFT_EXT" type="int" value="8218"/>
		<constant name="WGL_COLOR_BITS_ARB" type="int" value="8212"/>
		<constant name="WGL_COLOR_BITS_EXT" type="int" value="8212"/>
		<constant name="WGL_CUBE_MAP_FACE_ARB" type="int" value="8316"/>
		<constant name="WGL_DEPTH_BITS_ARB" type="int" value="8226"/>
		<constant name="WGL_DEPTH_BITS_EXT" type="int" value="8226"/>
		<constant name="WGL_DEPTH_BUFFER_BIT_ARB" type="int" value="4"/>
		<constant name="WGL_DEPTH_COMPONENT_NV" type="int" value="8359"/>
		<constant name="WGL_DEPTH_FLOAT_EXT" type="int" value="8256"/>
		<constant name="WGL_DEPTH_TEXTURE_FORMAT_NV" type="int" value="8357"/>
		<constant name="WGL_DIGITAL_VIDEO_CURSOR_ALPHA_FRAMEBUFFER_I3D" type="int" value="8272"/>
		<constant name="WGL_DIGITAL_VIDEO_CURSOR_ALPHA_VALUE_I3D" type="int" value="8273"/>
		<constant name="WGL_DIGITAL_VIDEO_CURSOR_INCLUDED_I3D" type="int" value="8274"/>
		<constant name="WGL_DIGITAL_VIDEO_GAMMA_CORRECTED_I3D" type="int" value="8275"/>
		<constant name="WGL_DOUBLE_BUFFER_ARB" type="int" value="8209"/>
		<constant name="WGL_DOUBLE_BUFFER_EXT" type="int" value="8209"/>
		<constant name="WGL_DRAW_TO_BITMAP_ARB" type="int" value="8194"/>
		<constant name="WGL_DRAW_TO_BITMAP_EXT" type="int" value="8194"/>
		<constant name="WGL_DRAW_TO_PBUFFER_ARB" type="int" value="8237"/>
		<constant name="WGL_DRAW_TO_PBUFFER_EXT" type="int" value="8237"/>
		<constant name="WGL_DRAW_TO_WINDOW_ARB" type="int" value="8193"/>
		<constant name="WGL_DRAW_TO_WINDOW_EXT" type="int" value="8193"/>
		<constant name="WGL_EXT_depth_float" type="int" value="1"/>
		<constant name="WGL_EXT_display_color_table" type="int" value="1"/>
		<constant name="WGL_EXT_extensions_string" type="int" value="1"/>
		<constant name="WGL_EXT_make_current_read" type="int" value="1"/>
		<constant name="WGL_EXT_multisample" type="int" value="1"/>
		<constant name="WGL_EXT_pbuffer" type="int" value="1"/>
		<constant name="WGL_EXT_pixel_format" type="int" value="1"/>
		<constant name="WGL_EXT_swap_control" type="int" value="1"/>
		<constant name="WGL_FLOAT_COMPONENTS_NV" type="int" value="8368"/>
		<constant name="WGL_FRONT_COLOR_BUFFER_BIT_ARB" type="int" value="1"/>
		<constant name="WGL_FRONT_LEFT_ARB" type="int" value="8323"/>
		<constant name="WGL_FRONT_RIGHT_ARB" type="int" value="8324"/>
		<constant name="WGL_FULL_ACCELERATION_ARB" type="int" value="8231"/>
		<constant name="WGL_FULL_ACCELERATION_EXT" type="int" value="8231"/>
		<constant name="WGL_GAMMA_EXCLUDE_DESKTOP_I3D" type="int" value="8271"/>
		<constant name="WGL_GAMMA_TABLE_SIZE_I3D" type="int" value="8270"/>
		<constant name="WGL_GENERIC_ACCELERATION_ARB" type="int" value="8230"/>
		<constant name="WGL_GENERIC_ACCELERATION_EXT" type="int" value="8230"/>
		<constant name="WGL_GENLOCK_SOURCE_DIGITAL_FIELD_I3D" type="int" value="8265"/>
		<constant name="WGL_GENLOCK_SOURCE_DIGITAL_SYNC_I3D" type="int" value="8264"/>
		<constant name="WGL_GENLOCK_SOURCE_EDGE_BOTH_I3D" type="int" value="8268"/>
		<constant name="WGL_GENLOCK_SOURCE_EDGE_FALLING_I3D" type="int" value="8266"/>
		<constant name="WGL_GENLOCK_SOURCE_EDGE_RISING_I3D" type="int" value="8267"/>
		<constant name="WGL_GENLOCK_SOURCE_EXTENAL_FIELD_I3D" type="int" value="8262"/>
		<constant name="WGL_GENLOCK_SOURCE_EXTENAL_SYNC_I3D" type="int" value="8261"/>
		<constant name="WGL_GENLOCK_SOURCE_EXTENAL_TTL_I3D" type="int" value="8263"/>
		<constant name="WGL_GENLOCK_SOURCE_MULTIVIEW_I3D" type="int" value="8260"/>
		<constant name="WGL_GREEN_BITS_ARB" type="int" value="8215"/>
		<constant name="WGL_GREEN_BITS_EXT" type="int" value="8215"/>
		<constant name="WGL_GREEN_SHIFT_ARB" type="int" value="8216"/>
		<constant name="WGL_GREEN_SHIFT_EXT" type="int" value="8216"/>
		<constant name="WGL_I3D_digital_video_control" type="int" value="1"/>
		<constant name="WGL_I3D_gamma" type="int" value="1"/>
		<constant name="WGL_I3D_genlock" type="int" value="1"/>
		<constant name="WGL_I3D_image_buffer" type="int" value="1"/>
		<constant name="WGL_I3D_swap_frame_lock" type="int" value="1"/>
		<constant name="WGL_I3D_swap_frame_usage" type="int" value="1"/>
		<constant name="WGL_IMAGE_BUFFER_LOCK_I3D" type="int" value="2"/>
		<constant name="WGL_IMAGE_BUFFER_MIN_ACCESS_I3D" type="int" value="1"/>
		<constant name="WGL_MAX_PBUFFER_HEIGHT_ARB" type="int" value="8240"/>
		<constant name="WGL_MAX_PBUFFER_HEIGHT_EXT" type="int" value="8240"/>
		<constant name="WGL_MAX_PBUFFER_PIXELS_ARB" type="int" value="8238"/>
		<constant name="WGL_MAX_PBUFFER_PIXELS_EXT" type="int" value="8238"/>
		<constant name="WGL_MAX_PBUFFER_WIDTH_ARB" type="int" value="8239"/>
		<constant name="WGL_MAX_PBUFFER_WIDTH_EXT" type="int" value="8239"/>
		<constant name="WGL_MIPMAP_LEVEL_ARB" type="int" value="8315"/>
		<constant name="WGL_MIPMAP_TEXTURE_ARB" type="int" value="8308"/>
		<constant name="WGL_NEED_PALETTE_ARB" type="int" value="8196"/>
		<constant name="WGL_NEED_PALETTE_EXT" type="int" value="8196"/>
		<constant name="WGL_NEED_SYSTEM_PALETTE_ARB" type="int" value="8197"/>
		<constant name="WGL_NEED_SYSTEM_PALETTE_EXT" type="int" value="8197"/>
		<constant name="WGL_NO_ACCELERATION_ARB" type="int" value="8229"/>
		<constant name="WGL_NO_ACCELERATION_EXT" type="int" value="8229"/>
		<constant name="WGL_NO_TEXTURE_ARB" type="int" value="8311"/>
		<constant name="WGL_NUMBER_OVERLAYS_ARB" type="int" value="8200"/>
		<constant name="WGL_NUMBER_OVERLAYS_EXT" type="int" value="8200"/>
		<constant name="WGL_NUMBER_PIXEL_FORMATS_ARB" type="int" value="8192"/>
		<constant name="WGL_NUMBER_PIXEL_FORMATS_EXT" type="int" value="8192"/>
		<constant name="WGL_NUMBER_UNDERLAYS_ARB" type="int" value="8201"/>
		<constant name="WGL_NUMBER_UNDERLAYS_EXT" type="int" value="8201"/>
		<constant name="WGL_NV_vertex_array_range" type="int" value="1"/>
		<constant name="WGL_OML_sync_control" type="int" value="1"/>
		<constant name="WGL_OPTIMAL_PBUFFER_HEIGHT_EXT" type="int" value="8242"/>
		<constant name="WGL_OPTIMAL_PBUFFER_WIDTH_EXT" type="int" value="8241"/>
		<constant name="WGL_PBUFFER_HEIGHT_ARB" type="int" value="8245"/>
		<constant name="WGL_PBUFFER_HEIGHT_EXT" type="int" value="8245"/>
		<constant name="WGL_PBUFFER_LARGEST_ARB" type="int" value="8243"/>
		<constant name="WGL_PBUFFER_LARGEST_EXT" type="int" value="8243"/>
		<constant name="WGL_PBUFFER_LOST_ARB" type="int" value="8246"/>
		<constant name="WGL_PBUFFER_WIDTH_ARB" type="int" value="8244"/>
		<constant name="WGL_PBUFFER_WIDTH_EXT" type="int" value="8244"/>
		<constant name="WGL_PIXEL_TYPE_ARB" type="int" value="8211"/>
		<constant name="WGL_PIXEL_TYPE_EXT" type="int" value="8211"/>
		<constant name="WGL_RED_BITS_ARB" type="int" value="8213"/>
		<constant name="WGL_RED_BITS_EXT" type="int" value="8213"/>
		<constant name="WGL_RED_SHIFT_ARB" type="int" value="8214"/>
		<constant name="WGL_RED_SHIFT_EXT" type="int" value="8214"/>
		<constant name="WGL_SAMPLES_3DFX" type="int" value="8289"/>
		<constant name="WGL_SAMPLES_ARB" type="int" value="8258"/>
		<constant name="WGL_SAMPLES_EXT" type="int" value="8258"/>
		<constant name="WGL_SAMPLE_BUFFERS_3DFX" type="int" value="8288"/>
		<constant name="WGL_SAMPLE_BUFFERS_ARB" type="int" value="8257"/>
		<constant name="WGL_SAMPLE_BUFFERS_EXT" type="int" value="8257"/>
		<constant name="WGL_SHARE_ACCUM_ARB" type="int" value="8206"/>
		<constant name="WGL_SHARE_ACCUM_EXT" type="int" value="8206"/>
		<constant name="WGL_SHARE_DEPTH_ARB" type="int" value="8204"/>
		<constant name="WGL_SHARE_DEPTH_EXT" type="int" value="8204"/>
		<constant name="WGL_SHARE_STENCIL_ARB" type="int" value="8205"/>
		<constant name="WGL_SHARE_STENCIL_EXT" type="int" value="8205"/>
		<constant name="WGL_STENCIL_BITS_ARB" type="int" value="8227"/>
		<constant name="WGL_STENCIL_BITS_EXT" type="int" value="8227"/>
		<constant name="WGL_STENCIL_BUFFER_BIT_ARB" type="int" value="8"/>
		<constant name="WGL_STEREO_ARB" type="int" value="8210"/>
		<constant name="WGL_STEREO_EXT" type="int" value="8210"/>
		<constant name="WGL_SUPPORT_GDI_ARB" type="int" value="8207"/>
		<constant name="WGL_SUPPORT_GDI_EXT" type="int" value="8207"/>
		<constant name="WGL_SUPPORT_OPENGL_ARB" type="int" value="8208"/>
		<constant name="WGL_SUPPORT_OPENGL_EXT" type="int" value="8208"/>
		<constant name="WGL_SWAP_COPY_ARB" type="int" value="8233"/>
		<constant name="WGL_SWAP_COPY_EXT" type="int" value="8233"/>
		<constant name="WGL_SWAP_EXCHANGE_ARB" type="int" value="8232"/>
		<constant name="WGL_SWAP_EXCHANGE_EXT" type="int" value="8232"/>
		<constant name="WGL_SWAP_LAYER_BUFFERS_ARB" type="int" value="8198"/>
		<constant name="WGL_SWAP_LAYER_BUFFERS_EXT" type="int" value="8198"/>
		<constant name="WGL_SWAP_METHOD_ARB" type="int" value="8199"/>
		<constant name="WGL_SWAP_METHOD_EXT" type="int" value="8199"/>
		<constant name="WGL_SWAP_UNDEFINED_ARB" type="int" value="8234"/>
		<constant name="WGL_SWAP_UNDEFINED_EXT" type="int" value="8234"/>
		<constant name="WGL_TEXTURE_1D_ARB" type="int" value="8313"/>
		<constant name="WGL_TEXTURE_2D_ARB" type="int" value="8314"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_ARB" type="int" value="8312"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_NEGATIVE_X_ARB" type="int" value="8318"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_NEGATIVE_Y_ARB" type="int" value="8320"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_NEGATIVE_Z_ARB" type="int" value="8322"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_POSITIVE_X_ARB" type="int" value="8317"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_POSITIVE_Y_ARB" type="int" value="8319"/>
		<constant name="WGL_TEXTURE_CUBE_MAP_POSITIVE_Z_ARB" type="int" value="8321"/>
		<constant name="WGL_TEXTURE_DEPTH_COMPONENT_NV" type="int" value="8358"/>
		<constant name="WGL_TEXTURE_FLOAT_RGBA_NV" type="int" value="8376"/>
		<constant name="WGL_TEXTURE_FLOAT_RGB_NV" type="int" value="8375"/>
		<constant name="WGL_TEXTURE_FLOAT_RG_NV" type="int" value="8374"/>
		<constant name="WGL_TEXTURE_FLOAT_R_NV" type="int" value="8373"/>
		<constant name="WGL_TEXTURE_FORMAT_ARB" type="int" value="8306"/>
		<constant name="WGL_TEXTURE_RECTANGLE_NV" type="int" value="8354"/>
		<constant name="WGL_TEXTURE_RGBA_ARB" type="int" value="8310"/>
		<constant name="WGL_TEXTURE_RGB_ARB" type="int" value="8309"/>
		<constant name="WGL_TEXTURE_TARGET_ARB" type="int" value="8307"/>
		<constant name="WGL_TRANSPARENT_ALPHA_VALUE_ARB" type="int" value="8250"/>
		<constant name="WGL_TRANSPARENT_ARB" type="int" value="8202"/>
		<constant name="WGL_TRANSPARENT_BLUE_VALUE_ARB" type="int" value="8249"/>
		<constant name="WGL_TRANSPARENT_EXT" type="int" value="8202"/>
		<constant name="WGL_TRANSPARENT_GREEN_VALUE_ARB" type="int" value="8248"/>
		<constant name="WGL_TRANSPARENT_INDEX_VALUE_ARB" type="int" value="8251"/>
		<constant name="WGL_TRANSPARENT_RED_VALUE_ARB" type="int" value="8247"/>
		<constant name="WGL_TRANSPARENT_VALUE_EXT" type="int" value="8203"/>
		<constant name="WGL_TYPE_COLORINDEX_ARB" type="int" value="8236"/>
		<constant name="WGL_TYPE_COLORINDEX_EXT" type="int" value="8236"/>
		<constant name="WGL_TYPE_RGBA_ARB" type="int" value="8235"/>
		<constant name="WGL_TYPE_RGBA_EXT" type="int" value="8235"/>
		<constant name="WGL_TYPE_RGBA_FLOAT_ATI" type="int" value="8608"/>
		<constant name="WGL_WGLEXT_VERSION" type="int" value="4"/>
		<constant name="WIN32_LEAN_AND_MEAN" type="int" value="1"/>
	</namespace>
</api>
