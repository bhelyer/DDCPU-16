// D import file generated from 'derelict\opengl\extloader.d'
module derelict.opengl.extloader;
private 
{
    import derelict.opengl.extfuncs;
    import derelict.opengl.gltypes;
    import derelict.opengl.glfuncs;
    import derelict.util.compat;
    import derelict.util.exception;
    version (darwin)
{
    version = CGL;
}
else
{
    version (OSX)
{
    version = CGL;
}
else
{
    version (linux)
{
    version = GLX;
}
else
{
    version (freebsd)
{
    version = GLX;
}
else
{
    version (FreeBSD)
{
    version = GLX;
}
}
}
}
}
    version (Windows)
{
    import derelict.opengl.wgl;
    import derelict.util.wintypes;
}
    version (GLX)
{
    import derelict.opengl.glx;
}
    version (CGL)
{
    import derelict.opengl.cgl;
    import derelict.opengl.gl;
}
}
version = DerelictGL_ALL;
version (DerelictGL_ALL)
{
    version = DerelictGL_ARB;
    version = DerelictGL_EXT;
    version = DerelictGL_NV;
    version = DerelictGL_ATI;
    version = DerelictGL_AMD;
    version = DerelictGL_SGI;
    version = DerelictGL_SGIS;
    version = DerelictGL_SGIX;
    version = DerelictGL_HP;
    version = DerelictGL_PGI;
    version = DerelictGL_IBM;
    version = DerelictGL_WIN;
    version = DerelictGL_INTEL;
    version = DerelictGL_REND;
    version = DerelictGL_APPLE;
    version = DerelictGL_SUNX;
    version = DerelictGL_SUN;
    version = DerelictGL_INGR;
    version = DerelictGL_MESA;
    version = DerelictGL_3DFX;
    version = DerelictGL_OML;
    version = DerelictGL_S3;
    version = DerelictGL_OES;
    version = DerelictGL_GREMEDY;
    version = DerelictGL_MESAX;
    version = DerelictGL_I3D;
    version = DerelictGL_3DL;
}
private 
{
    string extStr;
    version (Windows)
{
    string winExtStr;
}
    GLExtensionState[string] loaded;
}
package 
{
    void extLoadAll()
{
extLoadCommon();
extLoadPlatform();
}
    string[] getLoadedExtensionNames();
    string[] getNotLoadedExtensionNames();
    bool extIsSupported(string extName);
    GLExtensionState extGetState(string extName)
{
GLExtensionState* state = extName in loaded;
return state !is null ? *state : GLExtensionState.DerelictUnsupported;
}
}
private 
{
    void extLoadCommon();
    void extLoadPlatform();
    bool bindExtFunc(void** ptr, string funcName);
    version (DerelictGL_ARB)
{
    GLExtensionState load_GL_ARB_multitexture();
    GLExtensionState load_GL_ARB_transpose_matrix();
    GLExtensionState load_GL_ARB_multisample();
    GLExtensionState load_GL_ARB_texture_env_add();
    GLExtensionState load_GL_ARB_texture_cube_map();
    GLExtensionState load_GL_ARB_texture_compression();
    GLExtensionState load_GL_ARB_texture_border_clamp();
    GLExtensionState load_GL_ARB_point_parameters();
    GLExtensionState load_GL_ARB_vertex_blend();
    GLExtensionState load_GL_ARB_matrix_palette();
    GLExtensionState load_GL_ARB_texture_env_combine();
    GLExtensionState load_GL_ARB_texture_env_crossbar();
    GLExtensionState load_GL_ARB_texture_env_dot3();
    GLExtensionState load_GL_ARB_texture_mirrored_repeat();
    GLExtensionState load_GL_ARB_depth_texture();
    GLExtensionState load_GL_ARB_shadow();
    GLExtensionState load_GL_ARB_shadow_ambient();
    GLExtensionState load_GL_ARB_window_pos();
    GLExtensionState load_GL_ARB_vertex_program();
    GLExtensionState load_GL_ARB_fragment_program();
    GLExtensionState load_GL_ARB_vertex_buffer_object();
    GLExtensionState load_GL_ARB_occlusion_query();
    GLExtensionState load_GL_ARB_shader_objects();
    GLExtensionState load_GL_ARB_vertex_shader();
    GLExtensionState load_GL_ARB_fragment_shader();
    GLExtensionState load_GL_ARB_shading_language_100();
    GLExtensionState load_GL_ARB_texture_non_power_of_two();
    GLExtensionState load_GL_ARB_point_sprite();
    GLExtensionState load_GL_ARB_fragment_program_shadow();
    GLExtensionState load_GL_ARB_draw_buffers();
    GLExtensionState load_GL_ARB_texture_rectangle();
    GLExtensionState load_GL_ARB_color_buffer_float();
    GLExtensionState load_GL_ARB_half_float_pixel();
    GLExtensionState load_GL_ARB_texture_float();
    GLExtensionState load_GL_ARB_pixel_buffer_object();
    GLExtensionState load_GL_ARB_depth_buffer_float();
    GLExtensionState load_GL_ARB_draw_instanced();
    GLExtensionState load_GL_ARB_framebuffer_object();
    GLExtensionState load_GL_ARB_framebuffer_sRGB();
    GLExtensionState load_GL_ARB_geometry_shader4();
    GLExtensionState load_GL_ARB_half_float_vertex();
    GLExtensionState load_GL_ARB_imaging();
    GLExtensionState load_GL_ARB_instanced_arrays();
    GLExtensionState load_GL_ARB_map_buffer_range();
    GLExtensionState load_GL_ARB_texture_buffer_object();
    GLExtensionState load_GL_ARB_texture_compression_rgtc();
    GLExtensionState load_GL_ARB_texture_rg();
    GLExtensionState load_GL_ARB_vertex_array_object();
    GLExtensionState load_GL_ARB_copy_buffer();
    GLExtensionState load_GL_ARB_uniform_buffer_object();
    GLExtensionState load_GL_ARB_vertex_array_bgra();
    GLExtensionState load_GL_ARB_draw_elements_base_vertex();
    GLExtensionState load_GL_ARB_vertex_attrib_64bit();
    GLExtensionState load_GL_ARB_provoking_vertex();
    GLExtensionState load_GL_ARB_sync();
    GLExtensionState load_GL_ARB_texture_multisample();
    GLExtensionState load_GL_ARB_viewport_array();
    GLExtensionState load_GL_ARB_cl_event();
    GLExtensionState load_GL_ARB_debug_output();
    GLExtensionState load_GL_ARB_robustness();
    GLExtensionState load_GL_ARB_shader_stencil_export();
    GLExtensionState load_GL_ARB_compatibility();
    GLExtensionState load_GL_ARB_depth_clamp();
    GLExtensionState load_GL_ARB_blend_func_extended();
    GLExtensionState load_GL_ARB_sampler_objects();
    GLExtensionState load_GL_ARB_timer_query();
    GLExtensionState load_GL_ARB_vertex_type_2_10_10_10_rev();
}
    version (DerelictGL_EXT)
{
    GLExtensionState load_GL_EXT_abgr();
    GLExtensionState load_GL_EXT_blend_color();
    GLExtensionState load_GL_EXT_polygon_offset();
    GLExtensionState load_GL_EXT_texture();
    GLExtensionState load_GL_EXT_texture3D();
    GLExtensionState load_GL_EXT_subtexture();
    GLExtensionState load_GL_EXT_copy_texture();
    GLExtensionState load_GL_EXT_histogram();
    GLExtensionState load_GL_EXT_convolution();
    GLExtensionState load_GL_EXT_cmyka();
    GLExtensionState load_GL_EXT_texture_object();
    GLExtensionState load_GL_EXT_packed_pixels();
    GLExtensionState load_GL_EXT_rescale_normal();
    GLExtensionState load_GL_EXT_vertex_array();
    GLExtensionState load_GL_EXT_misc_attribute();
    GLExtensionState load_GL_EXT_blend_minmax();
    GLExtensionState load_GL_EXT_blend_subtract();
    GLExtensionState load_GL_EXT_blend_logic_op();
    GLExtensionState load_GL_EXT_point_parameters();
    GLExtensionState load_GL_EXT_color_subtable();
    GLExtensionState load_GL_EXT_paletted_texture();
    GLExtensionState load_GL_EXT_clip_volume_hint();
    GLExtensionState load_GL_EXT_index_texture();
    GLExtensionState load_GL_EXT_index_material();
    GLExtensionState load_GL_EXT_index_func();
    GLExtensionState load_GL_EXT_index_array_formats();
    GLExtensionState load_GL_EXT_compiled_vertex_array();
    GLExtensionState load_GL_EXT_cull_vertex();
    GLExtensionState load_GL_EXT_draw_range_elements();
    GLExtensionState load_GL_EXT_light_texture();
    GLExtensionState load_GL_EXT_bgra();
    GLExtensionState load_GL_EXT_pixel_transform();
    GLExtensionState load_GL_EXT_pixel_transform_color_table();
    GLExtensionState load_GL_EXT_shared_texture_palette();
    GLExtensionState load_GL_EXT_separate_specular_color();
    GLExtensionState load_GL_EXT_secondary_color();
    GLExtensionState load_GL_EXT_texture_perturb_normal();
    GLExtensionState load_GL_EXT_multi_draw_arrays();
    GLExtensionState load_GL_EXT_fog_coord();
    GLExtensionState load_GL_EXT_coordinate_frame();
    GLExtensionState load_GL_EXT_blend_func_separate();
    GLExtensionState load_GL_EXT_texture_env_combine();
    GLExtensionState load_GL_EXT_stencil_wrap();
    GLExtensionState load_GL_EXT_422_pixels();
    GLExtensionState load_GL_EXT_texture_cube_map();
    GLExtensionState load_GL_EXT_texture_env_add();
    GLExtensionState load_GL_EXT_texture_lod_bias();
    GLExtensionState load_GL_EXT_texture_filter_anisotropic();
    GLExtensionState load_GL_EXT_vertex_weighting();
    GLExtensionState load_GL_EXT_texture_compression_s3tc();
    GLExtensionState load_GL_EXT_multisample();
    GLExtensionState load_GL_EXT_texture_env_dot3();
    GLExtensionState load_GL_EXT_vertex_shader();
    GLExtensionState load_GL_EXT_shadow_funcs();
    GLExtensionState load_GL_EXT_stencil_two_side();
    GLExtensionState load_GL_EXT_depth_bounds_test();
    GLExtensionState load_GL_EXT_texture_mirror_clamp();
    GLExtensionState load_GL_EXT_blend_equation_separate();
    GLExtensionState load_GL_EXT_pixel_buffer_object();
    GLExtensionState load_GL_EXT_framebuffer_object();
    GLExtensionState load_GL_EXT_packed_depth_stencil();
    GLExtensionState load_GL_EXT_stencil_clear_tag();
    GLExtensionState load_GL_EXT_texture_sRGB();
    GLExtensionState load_GL_EXT_framebuffer_blit();
    GLExtensionState load_GL_EXT_framebuffer_multisample();
    GLExtensionState load_GL_EXT_timer_query();
    GLExtensionState load_GL_EXT_gpu_program_parameters();
    GLExtensionState load_GL_EXT_geometry_shader4();
    GLExtensionState load_GL_EXT_gpu_shader4();
    GLExtensionState load_GL_EXT_draw_instanced();
    GLExtensionState load_GL_EXT_packed_float();
    GLExtensionState load_GL_EXT_texture_array();
    GLExtensionState load_GL_EXT_texture_buffer_object();
    GLExtensionState load_GL_EXT_texture_compression_latc();
    GLExtensionState load_GL_EXT_texture_compression_rgtc();
    GLExtensionState load_GL_EXT_texture_shared_exponent();
    GLExtensionState load_GL_EXT_framebuffer_sRGB();
    GLExtensionState load_GL_EXT_draw_buffers2();
    GLExtensionState load_GL_EXT_bindable_uniform();
    GLExtensionState load_GL_EXT_texture_integer();
    GLExtensionState load_GL_EXT_transform_feedback();
    GLExtensionState load_GL_EXT_direct_state_access();
    GLExtensionState load_GL_EXT_vertex_array_bgra();
    GLExtensionState load_GL_EXT_texture_swizzle();
    GLExtensionState load_GL_EXT_provoking_vertex();
    GLExtensionState load_GL_EXT_texture_snorm();
    GLExtensionState load_GL_EXT_separate_shader_objects();
}
    version (DerelictGL_NV)
{
    GLExtensionState load_GL_NV_texgen_reflection();
    GLExtensionState load_GL_NV_light_max_exponent();
    GLExtensionState load_GL_NV_vertex_array_range();
    GLExtensionState load_GL_NV_register_combiners();
    GLExtensionState load_GL_NV_fog_distance();
    GLExtensionState load_GL_NV_texgen_emboss();
    GLExtensionState load_GL_NV_blend_square();
    GLExtensionState load_GL_NV_texture_env_combine4();
    GLExtensionState load_GL_NV_fence();
    GLExtensionState load_GL_NV_evaluators();
    GLExtensionState load_GL_NV_packed_depth_stencil();
    GLExtensionState load_GL_NV_register_combiners2();
    GLExtensionState load_GL_NV_texture_compression_vtc();
    GLExtensionState load_GL_NV_texture_rectangle();
    GLExtensionState load_GL_NV_texture_shader();
    GLExtensionState load_GL_NV_texture_shader2();
    GLExtensionState load_GL_NV_vertex_array_range2();
    GLExtensionState load_GL_NV_vertex_program();
    GLExtensionState load_GL_NV_copy_depth_to_color();
    GLExtensionState load_GL_NV_multisample_filter_hint();
    GLExtensionState load_GL_NV_depth_clamp();
    GLExtensionState load_GL_NV_occlusion_query();
    GLExtensionState load_GL_NV_point_sprite();
    GLExtensionState load_GL_NV_texture_shader3();
    GLExtensionState load_GL_NV_vertex_program1_1();
    GLExtensionState load_GL_NV_float_buffer();
    GLExtensionState load_GL_NV_fragment_program();
    GLExtensionState load_GL_NV_half_float();
    GLExtensionState load_GL_NV_pixel_data_range();
    GLExtensionState load_GL_NV_primitive_restart();
    GLExtensionState load_GL_NV_texture_expand_normal();
    GLExtensionState load_GL_NV_vertex_program2();
    GLExtensionState load_GL_NV_fragment_program_option();
    GLExtensionState load_GL_NV_fragment_program2();
    GLExtensionState load_GL_NV_vertex_program2_option();
    GLExtensionState load_GL_NV_vertex_program3();
    GLExtensionState load_GL_NV_gpu_program4();
    GLExtensionState load_GL_NV_geometry_program4();
    GLExtensionState load_GL_NV_vertex_program4();
    GLExtensionState load_GL_NV_depth_buffer_float();
    GLExtensionState load_GL_NV_fragment_program4();
    GLExtensionState load_GL_NV_framebuffer_multisample_coverage();
    GLExtensionState load_GL_NV_geometry_shader4();
    GLExtensionState load_GL_NV_transform_feedback();
    GLExtensionState load_GL_NV_conditional_render();
    GLExtensionState load_GL_NV_present_video();
    GLExtensionState load_GL_NV_explicit_multisample();
    GLExtensionState load_GL_NV_transform_feedback2();
    GLExtensionState load_GL_NV_video_capture();
    GLExtensionState load_GL_NV_copy_image();
    GLExtensionState load_GL_NV_parameter_buffer_object2();
    GLExtensionState load_GL_NV_shader_buffer_load();
    GLExtensionState load_GL_NV_vertex_buffer_unified_memory();
    GLExtensionState load_GL_NV_texture_barrier();
}
    version (DerelictGL_ATI)
{
    GLExtensionState load_GL_ATI_texture_mirror_once();
    GLExtensionState load_GL_ATI_envmap_bumpmap();
    GLExtensionState load_GL_ATI_fragment_shader();
    GLExtensionState load_GL_ATI_pn_triangles();
    GLExtensionState load_GL_ATI_vertex_array_object();
    GLExtensionState load_GL_ATI_vertex_streams();
    GLExtensionState load_GL_ATI_element_array();
    GLExtensionState load_GL_ATI_text_fragment_shader();
    GLExtensionState load_GL_ATI_draw_buffers();
    GLExtensionState load_GL_ATI_pixel_format_float();
    GLExtensionState load_GL_ATI_texture_env_combine3();
    GLExtensionState load_GL_ATI_texture_float();
    GLExtensionState load_GL_ATI_map_object_buffer();
    GLExtensionState load_GL_ATI_separate_stencil();
    GLExtensionState load_GL_ATI_vertex_attrib_array_object();
    GLExtensionState load_GL_ATI_meminfo();
}
    version (DerelictGL_AMD)
{
    GLExtensionState load_GL_AMD_performance_monitor();
    GLExtensionState load_GL_AMD_texture_texture4();
    GLExtensionState load_GL_AMD_vertex_shader_tesselator();
    GLExtensionState load_GL_AMD_draw_buffers_blend();
}
    version (DerelictGL_SGI)
{
    GLExtensionState load_GL_SGI_color_matrix();
    GLExtensionState load_GL_SGI_color_table();
    GLExtensionState load_GL_SGI_texture_color_table();
}
    version (DerelictGL_SGIS)
{
    GLExtensionState load_GL_SGIS_texture_filter4();
    GLExtensionState load_GL_SGIS_pixel_texture();
    GLExtensionState load_GL_SGIS_texture4D();
    GLExtensionState load_GL_SGIS_detail_texture();
    GLExtensionState load_GL_SGIS_sharpen_texture();
    GLExtensionState load_GL_SGIS_texture_lod();
    GLExtensionState load_GL_SGIS_multisample();
    GLExtensionState load_GL_SGIS_generate_mipmap();
    GLExtensionState load_GL_SGIS_texture_edge_clamp();
    GLExtensionState load_GL_SGIS_texture_border_clamp();
    GLExtensionState load_GL_SGIS_texture_select();
    GLExtensionState load_GL_SGIS_point_parameters();
    GLExtensionState load_GL_SGIS_fog_function();
    GLExtensionState load_GL_SGIS_point_line_texgen();
    GLExtensionState load_GL_SGIS_texture_color_mask();
}
    version (DerelictGL_SGIX)
{
    GLExtensionState load_GL_SGIX_pixel_texture();
    GLExtensionState load_GL_SGIX_clipmap();
    GLExtensionState load_GL_SGIX_shadow();
    GLExtensionState load_GL_SGIX_interlace();
    GLExtensionState load_GL_SGIX_pixel_tiles();
    GLExtensionState load_GL_SGIX_sprite();
    GLExtensionState load_GL_SGIX_texture_multi_buffer();
    GLExtensionState load_GL_SGIX_instruments();
    GLExtensionState load_GL_SGIX_texture_scale_bias();
    GLExtensionState load_GL_SGIX_framezoom();
    GLExtensionState load_GL_SGIX_tag_sample_buffer();
    GLExtensionState load_GL_SGIX_polynomial_ffd();
    GLExtensionState load_GL_SGIX_reference_plane();
    GLExtensionState load_GL_SGIX_flush_raster();
    GLExtensionState load_GL_SGIX_depth_texture();
    GLExtensionState load_GL_SGIX_fog_offset();
    GLExtensionState load_GL_SGIX_texture_add_env();
    GLExtensionState load_GL_SGIX_list_priority();
    GLExtensionState load_GL_SGIX_ir_instrument1();
    GLExtensionState load_GL_SGIX_calligraphic_fragment();
    GLExtensionState load_GL_SGIX_texture_lod_bias();
    GLExtensionState load_GL_SGIX_shadow_ambient();
    GLExtensionState load_GL_SGIX_ycrcb();
    GLExtensionState load_GL_SGIX_fragment_lighting();
    GLExtensionState load_GL_SGIX_blend_alpha_minmax();
    GLExtensionState load_GL_SGIX_impact_pixel_texture();
    GLExtensionState load_GL_SGIX_async();
    GLExtensionState load_GL_SGIX_async_pixel();
    GLExtensionState load_GL_SGIX_async_histogram();
    GLExtensionState load_GL_SGIX_fog_scale();
    GLExtensionState load_GL_SGIX_subsample();
    GLExtensionState load_GL_SGIX_ycrcb_subsample();
    GLExtensionState load_GL_SGIX_ycrcba();
    GLExtensionState load_GL_SGIX_depth_pass_instrument();
    GLExtensionState load_GL_SGIX_vertex_preclip();
    GLExtensionState load_GL_SGIX_convolution_accuracy();
    GLExtensionState load_GL_SGIX_resample();
    GLExtensionState load_GL_SGIX_texture_coordinate_clamp();
    GLExtensionState load_GL_SGIX_scalebias_hint();
}
    version (DerelictGL_HP)
{
    GLExtensionState load_GL_HP_image_transform();
    GLExtensionState load_GL_HP_convolution_border_modes();
    GLExtensionState load_GL_HP_texture_lighting();
    GLExtensionState load_GL_HP_occlusion_test();
}
    version (DerelictGL_PGI)
{
    GLExtensionState load_GL_PGI_vertex_hints();
    GLExtensionState load_GL_PGI_misc_hints();
}
    version (DerelictGL_IBM)
{
    GLExtensionState load_GL_IBM_rasterpos_clip();
    GLExtensionState load_GL_IBM_cull_vertex();
    GLExtensionState load_GL_IBM_multimode_draw_arrays();
    GLExtensionState load_GL_IBM_vertex_array_lists();
    GLExtensionState load_GL_IBM_texture_mirrored_repeat();
}
    version (DerelictGL_WIN)
{
    GLExtensionState load_GL_WIN_phong_shading();
    GLExtensionState load_GL_WIN_specular_fog();
}
    version (DerelictGL_INTEL)
{
    GLExtensionState load_GL_INTEL_parallel_arrays();
}
    version (DerelictGL_REND)
{
    GLExtensionState load_GL_REND_screen_coordinates();
}
    version (DerelictGL_APPLE)
{
    GLExtensionState load_GL_APPLE_specular_vector();
    GLExtensionState load_GL_APPLE_transform_hint();
    GLExtensionState load_GL_APPLE_client_storage();
    GLExtensionState load_GL_APPLE_element_array();
    GLExtensionState load_GL_APPLE_fence();
    GLExtensionState load_GL_APPLE_vertex_array_object();
    GLExtensionState load_GL_APPLE_vertex_array_range();
    GLExtensionState load_GL_APPLE_ycbcr_422();
    GLExtensionState load_GL_APPLE_flush_buffer_range();
    GLExtensionState load_GL_APPLE_texture_range();
    GLExtensionState load_GL_APPLE_float_pixels();
    GLExtensionState load_GL_APPLE_vertex_program_evaluators();
    GLExtensionState load_GL_APPLE_aux_depth_stencil();
    GLExtensionState load_GL_APPLE_object_purgeable();
    GLExtensionState load_GL_APPLE_row_bytes();
    GLExtensionState load_GL_APPLE_rgb_422();
}
    version (DerelictGL_SUNX)
{
    GLExtensionState load_GL_SUNX_constant_data();
}
    version (DerelictGL_SUN)
{
    GLExtensionState load_GL_SUN_global_alpha();
    GLExtensionState load_GL_SUN_triangle_list();
    GLExtensionState load_GL_SUN_vertex();
    GLExtensionState load_GL_SUN_convolution_border_modes();
    GLExtensionState load_GL_SUN_mesh_array();
    GLExtensionState load_GL_SUN_slice_accum();
}
    version (DerelictGL_INGR)
{
    GLExtensionState load_GL_INGR_color_clamp();
    GLExtensionState load_GL_INGR_interlace_read();
}
    version (DerelictGL_MESA)
{
    GLExtensionState load_GL_MESA_resize_buffers();
    GLExtensionState load_GL_MESA_window_pos();
    GLExtensionState load_GL_MESA_pack_invert();
    GLExtensionState load_GL_MESA_ycbcr_texture();
}
    version (DerelictGL_3DFX)
{
    GLExtensionState load_GL_3DFX_texture_compression_FXT1();
    GLExtensionState load_GL_3DFX_multisample();
    GLExtensionState load_GL_3DFX_tbuffer();
}
    version (DerelictGL_OML)
{
    GLExtensionState load_GL_OML_interlace();
    GLExtensionState load_GL_OML_subsample();
    GLExtensionState load_GL_OML_resample();
}
    version (DerelictGL_S3)
{
    GLExtensionState load_GL_S3_s3tc();
}
    version (DerelictGL_OES)
{
    GLExtensionState load_GL_OES_read_format();
}
    version (DerelictGL_GREMEDY)
{
    GLExtensionState load_GL_GREMEDY_string_marker();
    GLExtensionState load_GL_GREMEDY_frame_terminator();
}
    version (DerelictGL_MESAX)
{
    GLExtensionState load_GL_MESAX_texture_stack();
}
    version (Windows)
{
    GLExtensionState load_WGL_ARB_extensions_string();
    GLExtensionState load_WGL_EXT_extensions_string();
    version (DerelictGL_ARB)
{
    GLExtensionState load_WGL_ARB_buffer_region();
    GLExtensionState load_WGL_ARB_multisample();
    GLExtensionState load_WGL_ARB_pixel_format();
    GLExtensionState load_WGL_ARB_make_current_read();
    GLExtensionState load_WGL_ARB_pbuffer();
    GLExtensionState load_WGL_ARB_render_texture();
    GLExtensionState load_WGL_ARB_pixel_format_float();
    GLExtensionState load_WGL_ARB_create_context();
    GLExtensionState load_WGL_ARB_framebuffer_sRGB();
    GLExtensionState load_WGL_ARB_create_context_profile();
}
    version (DerelictGL_EXT)
{
    GLExtensionState load_WGL_EXT_depth_float();
    GLExtensionState load_WGL_EXT_display_color_table();
    GLExtensionState load_WGL_EXT_framebuffer_sRGB();
    GLExtensionState load_WGL_EXT_make_current_read();
    GLExtensionState load_WGL_EXT_multisample();
    GLExtensionState load_WGL_EXT_pbuffer();
    GLExtensionState load_WGL_EXT_pixel_format();
    GLExtensionState load_WGL_EXT_pixel_format_packed_float();
    GLExtensionState load_WGL_EXT_swap_control();
}
    version (DerelictGL_NV)
{
    GLExtensionState load_WGL_NV_copy_image();
    GLExtensionState load_WGL_NV_float_buffer();
    GLExtensionState load_WGL_NV_gpu_affinity();
    GLExtensionState load_WGL_NV_multisample_coverage();
    GLExtensionState load_WGL_NV_present_video();
    GLExtensionState load_WGL_NV_render_depth_texture();
    GLExtensionState load_WGL_NV_render_texture_rectangle();
    GLExtensionState load_WGL_NV_swap_group();
    GLExtensionState load_WGL_NV_vertex_array_range();
    GLExtensionState load_WGL_NV_video_output();
}
    version (DerelictGL_ATI)
{
    GLExtensionState load_WGL_ATI_pixel_format_float();
    GLExtensionState load_WGL_ATI_render_texture_rectangle();
}
    version (DerelictGL_AMD)
{
    GLExtensionState load_WGL_AMD_gpu_association();
}
    version (DerelictGL_I3D)
{
    GLExtensionState load_WGL_I3D_digital_video_control();
    GLExtensionState load_WGL_I3D_gamma();
    GLExtensionState load_WGL_I3D_genlock();
    GLExtensionState load_WGL_I3D_image_buffer();
    GLExtensionState load_WGL_I3D_swap_frame_lock();
    GLExtensionState load_WGL_I3D_swap_frame_usage();
}
    version (DerelictGL_OML)
{
    GLExtensionState load_WGL_OML_sync_control();
}
    version (DerelictGL_3DFX)
{
    GLExtensionState load_WGL_3DFX_multisample();
}
    version (DerelictGL_3DL)
{
    GLExtensionState load_WGL_3DL_stereo_control();
}
}
}
