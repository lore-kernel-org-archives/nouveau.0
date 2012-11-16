From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 57211] New: nvidia GTS 360M: hangs during boot
Date: Fri, 16 Nov 2012 22:55:14 +0000
Message-ID: <bug-57211-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1904222486=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1904222486==
Content-Type: multipart/alternative; boundary="1353106514.3A1BFF41.22060"; charset="us-ascii"


--1353106514.3A1BFF41.22060
Date: Fri, 16 Nov 2012 22:55:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D57211

          Priority: medium
            Bug ID: 57211
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nvidia GTS 360M: hangs during boot
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: raymondmeester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Since Ubuntu/Mint 11.04 and every version thereafter when booting I see only
artifacts on the screen. I need to blacklist nouveau to boot to the desktop=
 and
install nvidia-current. I rather would use nouveau of course.=20

In Ubuntu 12.10 this is the output during boot:

[   68.480329] [drm] nouveau 0000:01:00.0: PGRAPH  TLB flush idle timout fa=
il:
0x011fde03 0x00145b4d 0x0000002d 0X0034db40
[   70.481621] [drm] nouveau 0000:01:00.0: PGRAPH  TLB flush idle timout fa=
il:
0x011fde03 0x00145b4d 0x0000002d 0X0034db40
[   73.482102] [drm] nouveau 0000:01:00.0: failed to idle channel 3.
[   122.606202] [drm] nouveau 0000:01:00.0: failed to idle channel 2.


I found that a lot of users with the same grahpical card have the same issue
during several releases of ubuntu and linux mint. Here are some related lin=
ks:=20=20

http://www.youtube.com/watch?v=3D5XBN3qXfjcA&noredirect=3D1
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nouveau/+bug/6=
89507
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/657736
https://bugs.launchpad.net/wubi/+bug/775552=20=20=20=20
http://ubuntuforums.org/showthread.php?t=3D1838567
http://ubuntuforums.org/showthread.php?t=3D1838842



My system details


General

ASUS G51J
GeForce GTS 360M
NVA3 (GT215)
NV50 Family


Details

Graphics
    Monitor
            Name    Generic PnP Monitor on NVIDIA GeForce GTS 360M
            Current Resolution    1920x1080 pixels
            Work Resolution    1920x1032 pixels
            State    enabled, primary
            Monitor Width    1920
            Monitor Height    1080
            Monitor BPP    32 bits per pixel
            Monitor Frequency    60 Hz
            Device    \\.\DISPLAY1\Monitor0
        GeForce GTS 360M
            GPU    GT215
            Device ID    10DE-0CB1
            Revision    A3
            Subvendor    ASUStek Computer Inc (1043)
            Current Performance Level    Level 3
            Current GPU Clock    550 MHz
            Current Memory Clock    1800 MHz
            Current Shader Clock    1323 MHz
            Die Size    133 nm=C2=B2
            Release Date    Nov 17, 2009
            DirectX Support    10.1
            OpenGL Support    4.1
            Bus Interface    PCI Express x1
            Temperature    79 =C2=B0C
            ForceWare version    187.66
            BIOS Version    70.15.39.00.04
            ROPs    8
            Shaders    96 unified
            Physical Memory    1024 MB
            Virtual Memory    2816 MB
                Count of performance levels : 3
                        Level 1 - "Default"
                            GPU Clock    135 MHz
                            Memory Clock    135 MHz
                            Shader Clock    270 MHz
                        Level 2 - "2D Desktop"
                            GPU Clock    405 MHz
                            Memory Clock    324 MHz
                            Shader Clock    810 MHz
                        Level 3 - "3D Applications"
                            GPU Clock    550 MHz
                            Memory Clock    1800 MHz
                            Shader Clock    1323 MHz
        OpenGL
            Version    3.1 NVIDIA 187.66
            Vendor    NVIDIA Corporation
            Renderer    GeForce GTS 360M/PCI/SSE2
            GLU Version    1.2.2.0 Microsoft Corporation
                Values
                    GL_MAX_LIGHTS    8
                    GL_MAX_TEXTURE_SIZE    8192
                    GL_MAX_TEXTURE_STACK_DEPTH    10
                GL Extensions
                    GL_ARB_color_buffer_float
                    GL_ARB_copy_buffer
                    GL_ARB_compatibility
                    GL_ARB_depth_buffer_float
                    GL_ARB_depth_texture
                    GL_ARB_draw_buffers
                    GL_ARB_draw_instanced
                    GL_ARB_fragment_program
                    GL_ARB_fragment_program_shadow
                    GL_ARB_fragment_shader
                    GL_ARB_half_float_pixel
                    GL_ARB_half_float_vertex
                    GL_ARB_framebuffer_object
                    GL_ARB_geometry_shader4
                    GL_ARB_imaging
                    GL_ARB_map_buffer_range
                    GL_ARB_multisample
                    GL_ARB_multitexture
                    GL_ARB_occlusion_query
                    GL_ARB_pixel_buffer_object
                    GL_ARB_point_parameters
                    GL_ARB_point_sprite
                    GL_ARB_shadow
                    GL_ARB_shader_objects
                    GL_ARB_shading_language_100
                    GL_ARB_texture_border_clamp
                    GL_ARB_texture_buffer_object
                    GL_ARB_texture_compression
                    GL_ARB_texture_cube_map
                    GL_ARB_texture_env_add
                    GL_ARB_texture_env_combine
                    GL_ARB_texture_env_dot3
                    GL_ARB_texture_float
                    GL_ARB_texture_mirrored_repeat
                    GL_ARB_texture_non_power_of_two
                    GL_ARB_texture_rectangle
                    GL_ARB_texture_rg
                    GL_ARB_transpose_matrix
                    GL_ARB_vertex_array_object
                    GL_ARB_vertex_buffer_object
                    GL_ARB_vertex_program
                    GL_ARB_vertex_shader
                    GL_ARB_window_pos
                    GL_ATI_draw_buffers
                    GL_ATI_texture_float
                    GL_ATI_texture_mirror_once
                    GL_S3_s3tc
                    GL_EXT_texture_env_add
                    GL_EXT_abgr
                    GL_EXT_bgra
                    GL_EXT_blend_color
                    GL_EXT_blend_equation_separate
                    GL_EXT_blend_func_separate
                    GL_EXT_blend_minmax
                    GL_EXT_blend_subtract
                    GL_EXT_compiled_vertex_array
                    GL_EXT_Cg_shader
                    GL_EXT_bindable_uniform
                    GL_EXT_depth_bounds_test
                    GL_EXT_direct_state_access
                    GL_EXT_draw_buffers2
                    GL_EXT_draw_instanced
                    GL_EXT_draw_range_elements
                    GL_EXT_fog_coord
                    GL_EXT_framebuffer_blit
                    GL_EXT_framebuffer_multisample
                    GL_EXT_framebuffer_object
                    GL_EXTX_framebuffer_mixed_formats
                    GL_EXT_framebuffer_sRGB
                    GL_EXT_geometry_shader4
                    GL_EXT_gpu_program_parameters
                    GL_EXT_gpu_shader4
                    GL_EXT_multi_draw_arrays
                    GL_EXT_packed_depth_stencil
                    GL_EXT_packed_float
                    GL_EXT_packed_pixels
                    GL_EXT_pixel_buffer_object
                    GL_EXT_point_parameters
                    GL_EXT_provoking_vertex
                    GL_EXT_rescale_normal
                    GL_EXT_secondary_color
                    GL_EXT_separate_specular_color
                    GL_EXT_shadow_funcs
                    GL_EXT_stencil_two_side
                    GL_EXT_stencil_wrap
                    GL_EXT_texture3D
                    GL_EXT_texture_array
                    GL_EXT_texture_buffer_object
                    GL_EXT_texture_compression_latc
                    GL_EXT_texture_compression_rgtc
                    GL_EXT_texture_compression_s3tc
                    GL_EXT_texture_cube_map
                    GL_EXT_texture_edge_clamp
                    GL_EXT_texture_env_combine
                    GL_EXT_texture_env_dot3
                    GL_EXT_texture_filter_anisotropic
                    GL_EXT_texture_integer
                    GL_EXT_texture_lod
                    GL_EXT_texture_lod_bias
                    GL_EXT_texture_mirror_clamp
                    GL_EXT_texture_object
                    GL_EXT_texture_sRGB
                    GL_EXT_texture_swizzle
                    GL_EXT_texture_shared_exponent
                    GL_EXT_timer_query
                    GL_EXT_vertex_array
                    GL_EXT_vertex_array_bgra
                    GL_IBM_rasterpos_clip
                    GL_IBM_texture_mirrored_repeat
                    GL_KTX_buffer_region
                    GL_NV_blend_square
                    GL_NV_copy_depth_to_color
                    GL_NV_depth_buffer_float
                    GL_NV_conditional_render
                    GL_NV_depth_clamp
                    GL_NV_explicit_multisample
                    GL_NV_fence
                    GL_NV_float_buffer
                    GL_NV_fog_distance
                    GL_NV_fragment_program
                    GL_NV_fragment_program_option
                    GL_NV_fragment_program2
                    GL_NV_framebuffer_multisample_coverage
                    GL_NV_geometry_shader4
                    GL_NV_gpu_program4
                    GL_NV_half_float
                    GL_NV_light_max_exponent
                    GL_NV_multisample_coverage
                    GL_NV_multisample_filter_hint
                    GL_NV_occlusion_query
                    GL_NV_packed_depth_stencil
                    GL_NV_parameter_buffer_object
                    GL_NV_parameter_buffer_object2
                    GL_NV_pixel_data_range
                    GL_NV_point_sprite
                    GL_NV_primitive_restart
                    GL_NV_register_combiners
                    GL_NV_register_combiners2
                    GL_NV_texgen_reflection
                    GL_NV_texture_compression_vtc
                    GL_NV_texture_env_combine4
                    GL_NV_texture_expand_normal
                    GL_NV_texture_rectangle
                    GL_NV_texture_shader
                    GL_NV_texture_shader2
                    GL_NV_texture_shader3
                    GL_NV_transform_feedback
                    GL_NV_transform_feedback2
                    GL_NV_vertex_array_range
                    GL_NV_vertex_array_range2
                    GL_NV_vertex_program
                    GL_NV_vertex_program1_1
                    GL_NV_vertex_program2
                    GL_NV_vertex_program2_option
                    GL_NV_vertex_program3
                    GL_NVX_conditional_render
                    GL_NV_vertex_buffer_unified_memory
                    GL_NV_shader_buffer_load
                    GL_SGIS_generate_mipmap
                    GL_SGIS_texture_lod
                    GL_SGIX_depth_texture
                    GL_SGIX_shadow
                    GL_SUN_slice_accum
                    GL_WIN_swap_hint
                    WGL_EXT_swap_control
                    GL_EXT_bgra

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1353106514.3A1BFF41.22060
Date: Fri, 16 Nov 2012 22:55:14 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nvidia GTS 360M: hangs during boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D57211">57211</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nvidia GTS 360M: hangs during boot
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>raymondmeester&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Since Ubuntu/Mint 11.04 and every version thereafter when boot=
ing I see only
artifacts on the screen. I need to blacklist nouveau to boot to the desktop=
 and
install nvidia-current. I rather would use nouveau of course.=20

In Ubuntu 12.10 this is the output during boot:

[   68.480329] [drm] nouveau 0000:01:00.0: PGRAPH  TLB flush idle timout fa=
il:
0x011fde03 0x00145b4d 0x0000002d 0X0034db40
[   70.481621] [drm] nouveau 0000:01:00.0: PGRAPH  TLB flush idle timout fa=
il:
0x011fde03 0x00145b4d 0x0000002d 0X0034db40
[   73.482102] [drm] nouveau 0000:01:00.0: failed to idle channel 3.
[   122.606202] [drm] nouveau 0000:01:00.0: failed to idle channel 2.


I found that a lot of users with the same grahpical card have the same issue
during several releases of ubuntu and linux mint. Here are some related lin=
ks:=20=20

<a href=3D"http://www.youtube.com/watch?v=3D5XBN3qXfjcA&amp;noredirect=3D1"=
>http://www.youtube.com/watch?v=3D5XBN3qXfjcA&amp;noredirect=3D1</a>
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-nou=
veau/+bug/689507">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-vi=
deo-nouveau/+bug/689507</a>
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bug/657736">htt=
ps://bugs.launchpad.net/ubuntu/+source/linux/+bug/657736</a>
<a href=3D"https://bugs.launchpad.net/wubi/+bug/775552">https://bugs.launch=
pad.net/wubi/+bug/775552</a>=20=20=20=20
<a href=3D"http://ubuntuforums.org/showthread.php?t=3D1838567">http://ubunt=
uforums.org/showthread.php?t=3D1838567</a>
<a href=3D"http://ubuntuforums.org/showthread.php?t=3D1838842">http://ubunt=
uforums.org/showthread.php?t=3D1838842</a>



My system details


General

ASUS G51J
GeForce GTS 360M
NVA3 (GT215)
NV50 Family


Details

Graphics
    Monitor
            Name    Generic PnP Monitor on NVIDIA GeForce GTS 360M
            Current Resolution    1920x1080 pixels
            Work Resolution    1920x1032 pixels
            State    enabled, primary
            Monitor Width    1920
            Monitor Height    1080
            Monitor BPP    32 bits per pixel
            Monitor Frequency    60 Hz
            Device    \\.\DISPLAY1\Monitor0
        GeForce GTS 360M
            GPU    GT215
            Device ID    10DE-0CB1
            Revision    A3
            Subvendor    ASUStek Computer Inc (1043)
            Current Performance Level    Level 3
            Current GPU Clock    550 MHz
            Current Memory Clock    1800 MHz
            Current Shader Clock    1323 MHz
            Die Size    133 nm=C2=B2
            Release Date    Nov 17, 2009
            DirectX Support    10.1
            OpenGL Support    4.1
            Bus Interface    PCI Express x1
            Temperature    79 =C2=B0C
            ForceWare version    187.66
            BIOS Version    70.15.39.00.04
            ROPs    8
            Shaders    96 unified
            Physical Memory    1024 MB
            Virtual Memory    2816 MB
                Count of performance levels : 3
                        Level 1 - &quot;Default&quot;
                            GPU Clock    135 MHz
                            Memory Clock    135 MHz
                            Shader Clock    270 MHz
                        Level 2 - &quot;2D Desktop&quot;
                            GPU Clock    405 MHz
                            Memory Clock    324 MHz
                            Shader Clock    810 MHz
                        Level 3 - &quot;3D Applications&quot;
                            GPU Clock    550 MHz
                            Memory Clock    1800 MHz
                            Shader Clock    1323 MHz
        OpenGL
            Version    3.1 NVIDIA 187.66
            Vendor    NVIDIA Corporation
            Renderer    GeForce GTS 360M/PCI/SSE2
            GLU Version    1.2.2.0 Microsoft Corporation
                Values
                    GL_MAX_LIGHTS    8
                    GL_MAX_TEXTURE_SIZE    8192
                    GL_MAX_TEXTURE_STACK_DEPTH    10
                GL Extensions
                    GL_ARB_color_buffer_float
                    GL_ARB_copy_buffer
                    GL_ARB_compatibility
                    GL_ARB_depth_buffer_float
                    GL_ARB_depth_texture
                    GL_ARB_draw_buffers
                    GL_ARB_draw_instanced
                    GL_ARB_fragment_program
                    GL_ARB_fragment_program_shadow
                    GL_ARB_fragment_shader
                    GL_ARB_half_float_pixel
                    GL_ARB_half_float_vertex
                    GL_ARB_framebuffer_object
                    GL_ARB_geometry_shader4
                    GL_ARB_imaging
                    GL_ARB_map_buffer_range
                    GL_ARB_multisample
                    GL_ARB_multitexture
                    GL_ARB_occlusion_query
                    GL_ARB_pixel_buffer_object
                    GL_ARB_point_parameters
                    GL_ARB_point_sprite
                    GL_ARB_shadow
                    GL_ARB_shader_objects
                    GL_ARB_shading_language_100
                    GL_ARB_texture_border_clamp
                    GL_ARB_texture_buffer_object
                    GL_ARB_texture_compression
                    GL_ARB_texture_cube_map
                    GL_ARB_texture_env_add
                    GL_ARB_texture_env_combine
                    GL_ARB_texture_env_dot3
                    GL_ARB_texture_float
                    GL_ARB_texture_mirrored_repeat
                    GL_ARB_texture_non_power_of_two
                    GL_ARB_texture_rectangle
                    GL_ARB_texture_rg
                    GL_ARB_transpose_matrix
                    GL_ARB_vertex_array_object
                    GL_ARB_vertex_buffer_object
                    GL_ARB_vertex_program
                    GL_ARB_vertex_shader
                    GL_ARB_window_pos
                    GL_ATI_draw_buffers
                    GL_ATI_texture_float
                    GL_ATI_texture_mirror_once
                    GL_S3_s3tc
                    GL_EXT_texture_env_add
                    GL_EXT_abgr
                    GL_EXT_bgra
                    GL_EXT_blend_color
                    GL_EXT_blend_equation_separate
                    GL_EXT_blend_func_separate
                    GL_EXT_blend_minmax
                    GL_EXT_blend_subtract
                    GL_EXT_compiled_vertex_array
                    GL_EXT_Cg_shader
                    GL_EXT_bindable_uniform
                    GL_EXT_depth_bounds_test
                    GL_EXT_direct_state_access
                    GL_EXT_draw_buffers2
                    GL_EXT_draw_instanced
                    GL_EXT_draw_range_elements
                    GL_EXT_fog_coord
                    GL_EXT_framebuffer_blit
                    GL_EXT_framebuffer_multisample
                    GL_EXT_framebuffer_object
                    GL_EXTX_framebuffer_mixed_formats
                    GL_EXT_framebuffer_sRGB
                    GL_EXT_geometry_shader4
                    GL_EXT_gpu_program_parameters
                    GL_EXT_gpu_shader4
                    GL_EXT_multi_draw_arrays
                    GL_EXT_packed_depth_stencil
                    GL_EXT_packed_float
                    GL_EXT_packed_pixels
                    GL_EXT_pixel_buffer_object
                    GL_EXT_point_parameters
                    GL_EXT_provoking_vertex
                    GL_EXT_rescale_normal
                    GL_EXT_secondary_color
                    GL_EXT_separate_specular_color
                    GL_EXT_shadow_funcs
                    GL_EXT_stencil_two_side
                    GL_EXT_stencil_wrap
                    GL_EXT_texture3D
                    GL_EXT_texture_array
                    GL_EXT_texture_buffer_object
                    GL_EXT_texture_compression_latc
                    GL_EXT_texture_compression_rgtc
                    GL_EXT_texture_compression_s3tc
                    GL_EXT_texture_cube_map
                    GL_EXT_texture_edge_clamp
                    GL_EXT_texture_env_combine
                    GL_EXT_texture_env_dot3
                    GL_EXT_texture_filter_anisotropic
                    GL_EXT_texture_integer
                    GL_EXT_texture_lod
                    GL_EXT_texture_lod_bias
                    GL_EXT_texture_mirror_clamp
                    GL_EXT_texture_object
                    GL_EXT_texture_sRGB
                    GL_EXT_texture_swizzle
                    GL_EXT_texture_shared_exponent
                    GL_EXT_timer_query
                    GL_EXT_vertex_array
                    GL_EXT_vertex_array_bgra
                    GL_IBM_rasterpos_clip
                    GL_IBM_texture_mirrored_repeat
                    GL_KTX_buffer_region
                    GL_NV_blend_square
                    GL_NV_copy_depth_to_color
                    GL_NV_depth_buffer_float
                    GL_NV_conditional_render
                    GL_NV_depth_clamp
                    GL_NV_explicit_multisample
                    GL_NV_fence
                    GL_NV_float_buffer
                    GL_NV_fog_distance
                    GL_NV_fragment_program
                    GL_NV_fragment_program_option
                    GL_NV_fragment_program2
                    GL_NV_framebuffer_multisample_coverage
                    GL_NV_geometry_shader4
                    GL_NV_gpu_program4
                    GL_NV_half_float
                    GL_NV_light_max_exponent
                    GL_NV_multisample_coverage
                    GL_NV_multisample_filter_hint
                    GL_NV_occlusion_query
                    GL_NV_packed_depth_stencil
                    GL_NV_parameter_buffer_object
                    GL_NV_parameter_buffer_object2
                    GL_NV_pixel_data_range
                    GL_NV_point_sprite
                    GL_NV_primitive_restart
                    GL_NV_register_combiners
                    GL_NV_register_combiners2
                    GL_NV_texgen_reflection
                    GL_NV_texture_compression_vtc
                    GL_NV_texture_env_combine4
                    GL_NV_texture_expand_normal
                    GL_NV_texture_rectangle
                    GL_NV_texture_shader
                    GL_NV_texture_shader2
                    GL_NV_texture_shader3
                    GL_NV_transform_feedback
                    GL_NV_transform_feedback2
                    GL_NV_vertex_array_range
                    GL_NV_vertex_array_range2
                    GL_NV_vertex_program
                    GL_NV_vertex_program1_1
                    GL_NV_vertex_program2
                    GL_NV_vertex_program2_option
                    GL_NV_vertex_program3
                    GL_NVX_conditional_render
                    GL_NV_vertex_buffer_unified_memory
                    GL_NV_shader_buffer_load
                    GL_SGIS_generate_mipmap
                    GL_SGIS_texture_lod
                    GL_SGIX_depth_texture
                    GL_SGIX_shadow
                    GL_SUN_slice_accum
                    GL_WIN_swap_hint
                    WGL_EXT_swap_control
                    GL_EXT_bgra</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1353106514.3A1BFF41.22060--

--===============1904222486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1904222486==--
