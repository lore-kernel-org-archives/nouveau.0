From: "R. Cluzel" <r.cluzel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Unable to display a network on GeForce Go 7400 under
	Fedora
Date: Tue, 29 Oct 2013 15:33:50 +0100
Message-ID: <526FC74E.8010806@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050207000100040204040303"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--------------050207000100040204040303
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello all,

I'm new in this forum. I would like to have your help as I am facing the =

following problem:

I've installed the last Gephi release (Gephi 0.8.2-beta) for linux,=20
which is an interactive visualization and exploration platform for all=20
kinds of networks and complex systems, dynamic and hierarchical graphs=20
(http://http://gephi.org/).

The Gephi documentation specifies that OpenJDK is not supported, Sun JDK =

is required. In addition, OPENGL is required.

My system is the following:

Distribution: Fedora 19 (i686) (32 bits)
Cinnamon 1.9.2
Kernel: 3-11-3_201.fc19.i686.PAE/# 1

Laptop: HP Pavillon dv6000
Processor: Intel Core 2 CPU T5500 1.66 GH
Memory: 2 GB
Graphic card: NVIDIA G72M GeForce Go 7400

My laptop is on dual boot Windows Vista Home on which I have no problem=20
with Gephi. It's only under Fedora 19 Linux distribution that I have a=20
problem.

I run the following command:

export LIBGL_DEBUG=3Dverbose
export MESA_DEBUG=3D1
export EGL_LOG_LEVEL=3Ddebug
cd /home/rene/gephi/bin
=2E/gephi &
glxinfo |grep "OpenGL version"
yum list mesa\*

I get the attached file log.

I suspect the problem coming from nouveau or mesa with my nvidia card.

Could someone help me to fix the problem.

Many thanks.

Ren=E9
--=20


--------------050207000100040204040303
Content-Type: text/plain; charset=UTF-8;
 name="script_gephi-Log"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="script_gephi-Log"

[rene@localhost ~]$ '/home/rene/script_gephi'=20
Mot de passe :=20
Modules compl=C3=A9mentaires charg=C3=A9s=C2=A0: langpacks, refresh-packa=
gekit
Paquets install=C3=A9s
mesa-dri-drivers.i686                             9.2-1.20130919.fc19    =
                @updates
mesa-filesystem.i686                              9.2-1.20130919.fc19    =
                @updates
mesa-libEGL.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libGL.i686                                   9.2-1.20130919.fc19    =
                @updates
mesa-libgbm.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libglapi.i686                                9.2-1.20130919.fc19    =
                @updates
mesa-libxatracker.i686                            9.2-1.20130919.fc19    =
                @updates
Paquets disponibles
mesa-demos.i686                                   8.1.0-3.fc19           =
                fedora =20
mesa-libEGL-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libGL-devel.i686                             9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES.i686                                 9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES-devel.i686                           9.2-1.20130919.fc19    =
                updates=20
mesa-libGLU.i686                                  9.0.0-2.fc19           =
                fedora =20
mesa-libGLU-devel.i686                            9.0.0-2.fc19           =
                fedora =20
mesa-libGLw.i686                                  8.0.0-2.fc19           =
                fedora =20
mesa-libGLw-devel.i686                            8.0.0-2.fc19           =
                fedora =20
mesa-libOSMesa.i686                               9.2-1.20130919.fc19    =
                updates=20
mesa-libOSMesa-devel.i686                         9.2-1.20130919.fc19    =
                updates=20
mesa-libgbm-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl.i686                          9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl-devel.i686                    9.2-1.20130919.fc19    =
                updates=20
mesa-libxatracker-devel.i686                      9.2-1.20130919.fc19    =
                updates=20
mesa-vdpau-drivers.i686                           9.2-1.20130919.fc19    =
                updates=20
	libGL.so.1 (libc6) =3D> /lib/libGL.so.1
[    22.373] (II) NOUVEAU driver for NVIDIA chipset families :
[    22.377] (--) NOUVEAU(0): Chipset: "NVIDIA NV46"
[rene@localhost ~]$ yum list | egrep -w "mesa|.i686"
gcc-c++.i686                               4.8.1-1.fc19                 @=
fedora=20
libstdc++.i686                             4.8.1-1.fc19                 @=
fedora=20
mesa-dri-drivers.i686                      9.2-1.20130919.fc19          @=
updates
mesa-filesystem.i686                       9.2-1.20130919.fc19          @=
updates
mesa-libEGL.i686                           9.2-1.20130919.fc19          @=
updates
mesa-libGL.i686                            9.2-1.20130919.fc19          @=
updates
mesa-libgbm.i686                           9.2-1.20130919.fc19          @=
updates
mesa-libglapi.i686                         9.2-1.20130919.fc19          @=
updates
mesa-libxatracker.i686                     9.2-1.20130919.fc19          @=
updates
DivFix++.i686                              0.34-15.fc19                 f=
edora =20
GraphicsMagick-c++.i686                    1.3.18-2.fc19                u=
pdates=20
ImageMagick-c++.i686                       6.7.8.9-5.fc19               f=
edora =20
antlr-C++.i686                             2.7.7-26.fc19                f=
edora =20
arm-none-eabi-gcc-cs-c++.i686              2012.09.63-1.fc19            f=
edora =20
atari++.i686                               1.72-1.fc19                  f=
edora =20
avr-gcc-c++.i686                           4.7.3-0.1.fc19               f=
edora =20
bonnie++.i686                              1.96-5.fc19                  f=
edora =20
canl-c++.i686                              1.0.0-3.fc19                 u=
pdates=20
compat-gcc-34-c++.i686                     3.4.6-29.fc19                f=
edora =20
dbus-c++.i686                              0.5.0-0.16.20090203git13281b3.=
fc19
freefem++.i686                             3.19-3.1.fc18                f=
edora =20
gcc-objc++.i686                            4.8.1-1.fc19                 f=
edora =20
gnutls-c++.i686                            3.1.11-1.fc19                f=
edora =20
gtk+.i686                                  1:1.2.10-75.fc19             f=
edora =20
guiloader-c++.i686                         2.99.0-5.fc18                f=
edora =20
hamlib-c++.i686                            1.2.15.3-2.fc19              f=
edora =20
healpix-c++.i686                           2.13a-10.fc19                f=
edora =20
hylafax+.i686                              5.5.4-1.fc19                 u=
pdates=20
libatf-c++.i686                            0.17-1.fc19                  f=
edora =20
libftdi-c++.i686                           0.20-3.fc19                  f=
edora =20
librcc-gtk+.i686                           0.2.10-1.fc19                f=
edora =20
libsigc++.i686                             1.2.7-13.fc19                f=
edora =20
libxml++.i686                              2.36.0-2.fc19                f=
edora =20
memtest86+.i686                            4.20-11.fc19                 u=
pdates=20
mesa-demos.i686                            8.1.0-3.fc19                 f=
edora =20
mesa-libEGL-devel.i686                     9.2-1.20130919.fc19          u=
pdates=20
mesa-libGL-devel.i686                      9.2-1.20130919.fc19          u=
pdates=20
mesa-libGLES.i686                          9.2-1.20130919.fc19          u=
pdates=20
mesa-libGLES-devel.i686                    9.2-1.20130919.fc19          u=
pdates=20
mesa-libGLU.i686                           9.0.0-2.fc19                 f=
edora =20
mesa-libGLU-devel.i686                     9.0.0-2.fc19                 f=
edora =20
mesa-libGLw.i686                           8.0.0-2.fc19                 f=
edora =20
mesa-libGLw-devel.i686                     8.0.0-2.fc19                 f=
edora =20
mesa-libOSMesa.i686                        9.2-1.20130919.fc19          u=
pdates=20
mesa-libOSMesa-devel.i686                  9.2-1.20130919.fc19          u=
pdates=20
mesa-libgbm-devel.i686                     9.2-1.20130919.fc19          u=
pdates=20
mesa-libwayland-egl.i686                   9.2-1.20130919.fc19          u=
pdates=20
mesa-libwayland-egl-devel.i686             9.2-1.20130919.fc19          u=
pdates=20
mesa-libxatracker-devel.i686               9.2-1.20130919.fc19          u=
pdates=20
mesa-vdpau-drivers.i686                    9.2-1.20130919.fc19          u=
pdates=20
mingw32-gcc-c++.i686                       4.8.1-1.fc19                 f=
edora =20
mingw32-gcc-objc++.i686                    4.8.1-1.fc19                 f=
edora =20
mingw64-gcc-c++.i686                       4.8.1-1.fc19                 f=
edora =20
mingw64-gcc-objc++.i686                    4.8.1-1.fc19                 f=
edora =20
mysql++.i686                               3.1.0-12.fc19                f=
edora =20
mysql-connector-c++.i686                   1.1.2-1.fc19                 f=
edora =20
ncbi-blast+.i686                           2.2.28-1.fc19                u=
pdates=20
nurbs++.i686                               3.0.11-13.fc18               f=
edora =20
qdbm++.i686                                1.8.78-9.fc19                f=
edora =20
snmp++.i686                                3.2.25-4.fc19                f=
edora =20
timidity++.i686                            2.14.0-5.fc19                f=
edora =20
tolua++.i686                               1.0.93-6.fc19                f=
edora =20
uuid-c++.i686                              1.6.2-17.fc19                f=
edora =20
vsqlite++.i686                             0.3.11-2.fc19                f=
edora =20
wmweather+.i686                            2.11-7.fc19                  f=
edora =20
xmlrpc-c-c++.i686                          1.32.5-1901.svn2451.fc19     f=
edora =20
xmlrpc-c-client++.i686                     1.32.5-1901.svn2451.fc19     f=
edora =20
zipios++.i686                              0.1.5.9-9.fc19               f=
edora =20
[rene@localhost ~]$ glxinfo |grep "OpenGL version"
OpenGL version string: 2.1 Mesa 9.2.0
[rene@localhost ~]$ yum list mesa\*
Modules compl=C3=A9mentaires charg=C3=A9s=C2=A0: langpacks, refresh-packa=
gekit
Paquets install=C3=A9s
mesa-dri-drivers.i686                             9.2-1.20130919.fc19    =
                @updates
mesa-filesystem.i686                              9.2-1.20130919.fc19    =
                @updates
mesa-libEGL.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libGL.i686                                   9.2-1.20130919.fc19    =
                @updates
mesa-libgbm.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libglapi.i686                                9.2-1.20130919.fc19    =
                @updates
mesa-libxatracker.i686                            9.2-1.20130919.fc19    =
                @updates
Paquets disponibles
mesa-demos.i686                                   8.1.0-3.fc19           =
                fedora =20
mesa-libEGL-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libGL-devel.i686                             9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES.i686                                 9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES-devel.i686                           9.2-1.20130919.fc19    =
                updates=20
mesa-libGLU.i686                                  9.0.0-2.fc19           =
                fedora =20
mesa-libGLU-devel.i686                            9.0.0-2.fc19           =
                fedora =20
mesa-libGLw.i686                                  8.0.0-2.fc19           =
                fedora =20
mesa-libGLw-devel.i686                            8.0.0-2.fc19           =
                fedora =20
mesa-libOSMesa.i686                               9.2-1.20130919.fc19    =
                updates=20
mesa-libOSMesa-devel.i686                         9.2-1.20130919.fc19    =
                updates=20
mesa-libgbm-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl.i686                          9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl-devel.i686                    9.2-1.20130919.fc19    =
                updates=20
mesa-libxatracker-devel.i686                      9.2-1.20130919.fc19    =
                updates=20
mesa-vdpau-drivers.i686                           9.2-1.20130919.fc19    =
                updates=20
[rene@localhost ~]$ cat /var/log/Xorg.0.log | grep -i nvidia
[    22.373] (II) NOUVEAU driver for NVIDIA chipset families :
[    22.377] (--) NOUVEAU(0): Chipset: "NVIDIA NV46"
[rene@localhost ~]$ glxinfo
name of display: :0
display: :0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
server glx extensions:
    GLX_ARB_create_context, GLX_ARB_create_context_profile,=20
    GLX_ARB_multisample, GLX_EXT_create_context_es2_profile,=20
    GLX_EXT_import_context, GLX_EXT_texture_from_pixmap, GLX_EXT_visual_i=
nfo,=20
    GLX_EXT_visual_rating, GLX_INTEL_swap_event, GLX_MESA_copy_sub_buffer=
,=20
    GLX_OML_swap_method, GLX_SGIS_multisample, GLX_SGIX_fbconfig,=20
    GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group, GLX_SGI_swap_control
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
client glx extensions:
    GLX_ARB_create_context, GLX_ARB_create_context_profile,=20
    GLX_ARB_create_context_robustness, GLX_ARB_fbconfig_float,=20
    GLX_ARB_framebuffer_sRGB, GLX_ARB_get_proc_address, GLX_ARB_multisamp=
le,=20
    GLX_EXT_create_context_es2_profile, GLX_EXT_fbconfig_packed_float,=20
    GLX_EXT_framebuffer_sRGB, GLX_EXT_import_context,=20
    GLX_EXT_texture_from_pixmap, GLX_EXT_visual_info, GLX_EXT_visual_rati=
ng,=20
    GLX_INTEL_swap_event, GLX_MESA_copy_sub_buffer,=20
    GLX_MESA_multithread_makecurrent, GLX_MESA_swap_control,=20
    GLX_OML_swap_method, GLX_OML_sync_control, GLX_SGIS_multisample,=20
    GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group,=20
    GLX_SGI_make_current_read, GLX_SGI_swap_control, GLX_SGI_video_sync
GLX version: 1.4
GLX extensions:
    GLX_ARB_create_context, GLX_ARB_create_context_profile,=20
    GLX_ARB_get_proc_address, GLX_ARB_multisample,=20
    GLX_EXT_create_context_es2_profile, GLX_EXT_import_context,=20
    GLX_EXT_texture_from_pixmap, GLX_EXT_visual_info, GLX_EXT_visual_rati=
ng,=20
    GLX_INTEL_swap_event, GLX_MESA_copy_sub_buffer,=20
    GLX_MESA_multithread_makecurrent, GLX_MESA_swap_control,=20
    GLX_OML_swap_method, GLX_OML_sync_control, GLX_SGIS_multisample,=20
    GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, GLX_SGIX_visual_select_group,=20
    GLX_SGI_make_current_read, GLX_SGI_swap_control, GLX_SGI_video_sync
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV46
OpenGL version string: 2.1 Mesa 9.2.0
OpenGL shading language version string: 1.20
OpenGL extensions:
    GL_ANGLE_texture_compression_dxt3, GL_ANGLE_texture_compression_dxt5,=
=20
    GL_APPLE_packed_pixels, GL_APPLE_vertex_array_object,=20
    GL_ARB_ES2_compatibility, GL_ARB_copy_buffer, GL_ARB_debug_output,=20
    GL_ARB_depth_clamp, GL_ARB_depth_texture, GL_ARB_draw_buffers,=20
    GL_ARB_draw_elements_base_vertex, GL_ARB_explicit_attrib_location,=20
    GL_ARB_fragment_coord_conventions, GL_ARB_fragment_program,=20
    GL_ARB_fragment_program_shadow, GL_ARB_fragment_shader,=20
    GL_ARB_framebuffer_object, GL_ARB_get_program_binary,=20
    GL_ARB_half_float_pixel, GL_ARB_half_float_vertex,=20
    GL_ARB_internalformat_query, GL_ARB_invalidate_subdata,=20
    GL_ARB_map_buffer_range, GL_ARB_multisample, GL_ARB_multitexture,=20
    GL_ARB_occlusion_query, GL_ARB_occlusion_query2,=20
    GL_ARB_pixel_buffer_object, GL_ARB_point_parameters, GL_ARB_point_spr=
ite,=20
    GL_ARB_provoking_vertex, GL_ARB_robustness, GL_ARB_sampler_objects,=20
    GL_ARB_shader_objects, GL_ARB_shading_language_100, GL_ARB_shadow,=20
    GL_ARB_sync, GL_ARB_texture_border_clamp, GL_ARB_texture_compression,=
=20
    GL_ARB_texture_cube_map, GL_ARB_texture_env_add,=20
    GL_ARB_texture_env_combine, GL_ARB_texture_env_crossbar,=20
    GL_ARB_texture_env_dot3, GL_ARB_texture_mirrored_repeat,=20
    GL_ARB_texture_non_power_of_two, GL_ARB_texture_rectangle,=20
    GL_ARB_texture_storage, GL_ARB_texture_swizzle, GL_ARB_timer_query,=20
    GL_ARB_transpose_matrix, GL_ARB_vertex_array_bgra,=20
    GL_ARB_vertex_array_object, GL_ARB_vertex_buffer_object,=20
    GL_ARB_vertex_program, GL_ARB_vertex_shader, GL_ARB_window_pos,=20
    GL_ATI_blend_equation_separate, GL_ATI_draw_buffers,=20
    GL_ATI_separate_stencil, GL_ATI_texture_env_combine3,=20
    GL_ATI_texture_mirror_once, GL_EXT_abgr, GL_EXT_bgra, GL_EXT_blend_co=
lor,=20
    GL_EXT_blend_equation_separate, GL_EXT_blend_func_separate,=20
    GL_EXT_blend_minmax, GL_EXT_blend_subtract, GL_EXT_compiled_vertex_ar=
ray,=20
    GL_EXT_copy_texture, GL_EXT_draw_range_elements, GL_EXT_fog_coord,=20
    GL_EXT_framebuffer_blit, GL_EXT_framebuffer_multisample,=20
    GL_EXT_framebuffer_object, GL_EXT_gpu_program_parameters,=20
    GL_EXT_multi_draw_arrays, GL_EXT_packed_depth_stencil,=20
    GL_EXT_packed_pixels, GL_EXT_pixel_buffer_object, GL_EXT_point_parame=
ters,=20
    GL_EXT_polygon_offset, GL_EXT_provoking_vertex, GL_EXT_rescale_normal=
,=20
    GL_EXT_secondary_color, GL_EXT_separate_specular_color,=20
    GL_EXT_shadow_funcs, GL_EXT_stencil_two_side, GL_EXT_stencil_wrap,=20
    GL_EXT_subtexture, GL_EXT_texture, GL_EXT_texture3D,=20
    GL_EXT_texture_compression_dxt1, GL_EXT_texture_compression_s3tc,=20
    GL_EXT_texture_cube_map, GL_EXT_texture_edge_clamp,=20
    GL_EXT_texture_env_add, GL_EXT_texture_env_combine,=20
    GL_EXT_texture_env_dot3, GL_EXT_texture_filter_anisotropic,=20
    GL_EXT_texture_lod_bias, GL_EXT_texture_mirror_clamp,=20
    GL_EXT_texture_object, GL_EXT_texture_rectangle, GL_EXT_texture_sRGB,=
=20
    GL_EXT_texture_sRGB_decode, GL_EXT_texture_snorm, GL_EXT_texture_swiz=
zle,=20
    GL_EXT_timer_query, GL_EXT_vertex_array, GL_EXT_vertex_array_bgra,=20
    GL_IBM_multimode_draw_arrays, GL_IBM_rasterpos_clip,=20
    GL_IBM_texture_mirrored_repeat, GL_INGR_blend_func_separate,=20
    GL_MESA_pack_invert, GL_MESA_texture_signed_rgba, GL_MESA_window_pos,=
=20
    GL_NV_blend_square, GL_NV_conditional_render, GL_NV_depth_clamp,=20
    GL_NV_fog_distance, GL_NV_light_max_exponent, GL_NV_packed_depth_sten=
cil,=20
    GL_NV_primitive_restart, GL_NV_texgen_reflection,=20
    GL_NV_texture_env_combine4, GL_NV_texture_rectangle, GL_OES_EGL_image=
,=20
    GL_OES_read_format, GL_S3_s3tc, GL_SGIS_generate_mipmap,=20
    GL_SGIS_texture_border_clamp, GL_SGIS_texture_edge_clamp,=20
    GL_SGIS_texture_lod, GL_SUN_multi_draw_arrays

144 GLX Visuals
    visual  x   bf lv rg d st  colorbuffer  sr ax dp st accumbuffer  ms  =
cav
  id dep cl sp  sz l  ci b ro  r  g  b  a F gb bf th cl  r  g  b  a ns b =
eat
-------------------------------------------------------------------------=
---
0x021 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x022 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x1c7 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x1c8 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x1c9 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x1ca 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x1cb 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x1cc 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x1cd 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1ce 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x1cf 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1d0 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x1d1 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1d2 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x1d3 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x1d4 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x1d5 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x1d6 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x1dd 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x1de 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x1df 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x1e0 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x1e1 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x1e2 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x1e3 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x1e4 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x1e5 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x1e6 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x1e7 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x1e8 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x1e9 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x1ea 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x1eb 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x1ec 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x1ed 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x1ee 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x1f5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x1f6 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x1f7 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x1f8 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x1f9 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x1fa 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x1fb 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1fc 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x1fd 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1fe 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x1ff 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x200 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x201 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x202 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x203 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x204 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x205 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x206 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x20d 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x20e 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x20f 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x210 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x211 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x212 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x213 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x214 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x215 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x216 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x217 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x218 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x219 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x21a 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x21b 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x21c 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x21d 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x21e 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x225 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x226 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x227 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x228 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x229 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x22a 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x22b 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x22c 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x22d 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x22e 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x22f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x230 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x231 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x232 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x233 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x234 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x235 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x23c 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x23d 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x23e 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x23f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x240 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x241 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x242 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x243 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x244 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x245 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x246 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x247 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x248 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x249 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x24a 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x24b 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x24c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x24d 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x254 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x255 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x256 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x257 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x258 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x259 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x25a 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x25b 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x25c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x25d 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x25e 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x25f 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x260 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x261 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x262 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x263 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x264 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x265 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x26c 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x26d 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x26e 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x26f 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x270 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x271 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x272 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x273 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x274 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x275 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x276 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x277 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x278 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x279 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x27a 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x27b 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x27c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x27d 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x0a0 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None

216 GLXFBConfigs:
    visual  x   bf lv rg d st  colorbuffer  sr ax dp st accumbuffer  ms  =
cav
  id dep cl sp  sz l  ci b ro  r  g  b  a F gb bf th cl  r  g  b  a ns b =
eat
-------------------------------------------------------------------------=
---
0x0a7 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x0a8 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x0a9 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x0aa 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x0ab 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x0ac 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x0ad 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x0ae 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x0af 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x0b0 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x0b1 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x0b2 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x0b3 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x0b4 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x0b5 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x0b6 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x0b7 32 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x0b8 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x0bf 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x0c0 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x0c1 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x0c2 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x0c3 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x0c4 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x0c5 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x0c6 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x0c7 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x0c8 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x0c9 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x0ca 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x0cb 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x0cc 24 tc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x0cd 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x0ce 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x0cf 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x0d0 24 tc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x0d7 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x0d8 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x0d9 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x0da 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x0db 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x0dc 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x0dd 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x0de 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x0df 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x0e0 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x0e1 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x0e2 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x0e3 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x0e4 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x0e5 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x0e6 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x0e7 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x0e8 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x0ef 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x0f0 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x0f1 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x0f2 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x0f3 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x0f4 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x0f5 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x0f6 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x0f7 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x0f8 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x0f9 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x0fa 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x0fb 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x0fc 24 tc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x0fd 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x0fe 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x0ff 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x100 24 tc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x107  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x108  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x109  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x10a  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x10b  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x10c  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x10d  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x10e  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x10f  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x110  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x111  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x112  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x113  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x114  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x115  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x116  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x117  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x118  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x11f  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x120  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x121  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x122  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x123  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x124  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x125  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x126  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x127  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x128  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x129  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x12a  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x12b  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x12c  0 tc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x12d  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x12e  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x12f  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x130  0 tc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x137 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x138 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x139 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x13a 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x13b 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  0 0 =
None
0x13c 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0 16 16 16 16  0 0 =
Slow
0x13d 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x13e 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x13f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x140 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x141 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  0 0 =
None
0x142 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0 16 16 16 16  0 0 =
Slow
0x143 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x144 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x145 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x146 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x147 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  0 0 =
None
0x148 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8 16 16 16 16  0 0 =
Slow
0x14f 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x150 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x151 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x152 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x153 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  2 1 =
None
0x154 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 16  0  0  0  0  0  4 1 =
None
0x155 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x156 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x157 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x158 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x159 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  2 1 =
None
0x15a 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  0  0  0  0  0  4 1 =
None
0x15b 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x15c 24 dc  0  32  0 r  . .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x15d 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x15e 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x15f 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  2 1 =
None
0x160 24 dc  0  32  0 r  y .   8  8  8  8 .  .  0 24  8  0  0  0  0  4 1 =
None
0x167 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x168 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x169 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x16a 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x16b 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x16c 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x16d 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x16e 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x16f 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x170 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x171 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x172 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x173 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x174 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x175 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x176 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x177 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x178 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x17f 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x180 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x181 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x182 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x183 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x184 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x185 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x186 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x187 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x188 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x189 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x18a 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x18b 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x18c 24 dc  0  24  0 r  . .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x18d 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x18e 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x18f 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x190 24 dc  0  24  0 r  y .   8  8  8  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x197  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x198  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x199  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x19a  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x19b  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  0 0 =
None
0x19c  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0 16 16 16  0  0 0 =
Slow
0x19d  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x19e  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x19f  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1a0  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x1a1  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  0 0 =
None
0x1a2  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0 16 16 16  0  0 0 =
Slow
0x1a3  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x1a4  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x1a5  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x1a6  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x1a7  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  0 0 =
None
0x1a8  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8 16 16 16  0  0 0 =
Slow
0x1af  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x1b0  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x1b1  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x1b2  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x1b3  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  2 1 =
None
0x1b4  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 16  0  0  0  0  0  4 1 =
None
0x1b5  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x1b6  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x1b7  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x1b8  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x1b9  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  2 1 =
None
0x1ba  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  0  0  0  0  0  4 1 =
None
0x1bb  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x1bc  0 dc  0  16  0 r  . .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x1bd  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x1be  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 =
None
0x1bf  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  2 1 =
None
0x1c0  0 dc  0  16  0 r  y .   5  6  5  0 .  .  0 24  8  0  0  0  0  4 1 =
None

[rene@localhost ~]$ lspci
00:00.0 Host bridge: Intel Corporation Mobile 945GM/PM/GMS, 943/940GML an=
d 945GT Express Memory Controller Hub (rev 03)
00:01.0 PCI bridge: Intel Corporation Mobile 945GM/PM/GMS, 943/940GML and=
 945GT Express PCI Express Root Port (rev 03)
00:1b.0 Audio device: Intel Corporation NM10/ICH7 Family High Definition =
Audio Controller (rev 02)
00:1c.0 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 1=
 (rev 02)
00:1c.1 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 2=
 (rev 02)
00:1c.2 PCI bridge: Intel Corporation NM10/ICH7 Family PCI Express Port 3=
 (rev 02)
00:1d.0 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Contr=
oller #1 (rev 02)
00:1d.1 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Contr=
oller #2 (rev 02)
00:1d.2 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Contr=
oller #3 (rev 02)
00:1d.3 USB controller: Intel Corporation NM10/ICH7 Family USB UHCI Contr=
oller #4 (rev 02)
00:1d.7 USB controller: Intel Corporation NM10/ICH7 Family USB2 EHCI Cont=
roller (rev 02)
00:1e.0 PCI bridge: Intel Corporation 82801 Mobile PCI Bridge (rev e2)
00:1f.0 ISA bridge: Intel Corporation 82801GBM (ICH7-M) LPC Interface Bri=
dge (rev 02)
00:1f.1 IDE interface: Intel Corporation 82801G (ICH7 Family) IDE Control=
ler (rev 02)
00:1f.2 SATA controller: Intel Corporation 82801GBM/GHM (ICH7-M Family) S=
ATA Controller [AHCI mode] (rev 02)
00:1f.3 SMBus: Intel Corporation NM10/ICH7 Family SMBus Controller (rev 0=
2)
01:00.0 VGA compatible controller: NVIDIA Corporation G72M [GeForce Go 74=
00] (rev a1)
02:00.0 Network controller: Intel Corporation PRO/Wireless 3945ABG [Golan=
] Network Connection (rev 02)
05:00.0 Ethernet controller: Intel Corporation 82573L Gigabit Ethernet Co=
ntroller
07:05.0 FireWire (IEEE 1394): Ricoh Co Ltd R5C832 IEEE 1394 Controller
07:05.1 SD Host controller: Ricoh Co Ltd R5C822 SD/SDIO/MMC/MS/MSPro Host=
 Adapter (rev 19)
07:05.2 System peripheral: Ricoh Co Ltd R5C592 Memory Stick Bus Host Adap=
ter (rev 0a)
07:05.3 System peripheral: Ricoh Co Ltd xD-Picture Card Controller (rev 0=
5)
[rene@localhost ~]$ Xorg.log
bash: Xorg.log : commande introuvable
[rene@localhost ~]$ yum list mesa\*
Modules compl=C3=A9mentaires charg=C3=A9s=C2=A0: langpacks, refresh-packa=
gekit
Paquets install=C3=A9s
mesa-dri-drivers.i686                             9.2-1.20130919.fc19    =
                @updates
mesa-filesystem.i686                              9.2-1.20130919.fc19    =
                @updates
mesa-libEGL.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libGL.i686                                   9.2-1.20130919.fc19    =
                @updates
mesa-libgbm.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libglapi.i686                                9.2-1.20130919.fc19    =
                @updates
mesa-libxatracker.i686                            9.2-1.20130919.fc19    =
                @updates
Paquets disponibles
mesa-demos.i686                                   8.1.0-3.fc19           =
                fedora =20
mesa-libEGL-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libGL-devel.i686                             9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES.i686                                 9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES-devel.i686                           9.2-1.20130919.fc19    =
                updates=20
mesa-libGLU.i686                                  9.0.0-2.fc19           =
                fedora =20
mesa-libGLU-devel.i686                            9.0.0-2.fc19           =
                fedora =20
mesa-libGLw.i686                                  8.0.0-2.fc19           =
                fedora =20
mesa-libGLw-devel.i686                            8.0.0-2.fc19           =
                fedora =20
mesa-libOSMesa.i686                               9.2-1.20130919.fc19    =
                updates=20
mesa-libOSMesa-devel.i686                         9.2-1.20130919.fc19    =
                updates=20
mesa-libgbm-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl.i686                          9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl-devel.i686                    9.2-1.20130919.fc19    =
                updates=20
mesa-libxatracker-devel.i686                      9.2-1.20130919.fc19    =
                updates=20
mesa-vdpau-drivers.i686                           9.2-1.20130919.fc19    =
                updates=20
[rene@localhost ~]$ '/home/rene/script_gephi'=20
libGL: OpenDriver: trying /usr/lib/dri/tls/nouveau_dri.so
libGL: OpenDriver: trying /usr/lib/dri/nouveau_dri.so
OpenGL version string: 2.1 Mesa 9.2.0
Modules compl=C3=A9mentaires charg=C3=A9s=C2=A0: langpacks, refresh-packa=
gekit
Paquets install=C3=A9s
mesa-dri-drivers.i686                             9.2-1.20130919.fc19    =
                @updates
mesa-filesystem.i686                              9.2-1.20130919.fc19    =
                @updates
mesa-libEGL.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libGL.i686                                   9.2-1.20130919.fc19    =
                @updates
mesa-libgbm.i686                                  9.2-1.20130919.fc19    =
                @updates
mesa-libglapi.i686                                9.2-1.20130919.fc19    =
                @updates
mesa-libxatracker.i686                            9.2-1.20130919.fc19    =
                @updates
Paquets disponibles
mesa-demos.i686                                   8.1.0-3.fc19           =
                fedora =20
mesa-libEGL-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libGL-devel.i686                             9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES.i686                                 9.2-1.20130919.fc19    =
                updates=20
mesa-libGLES-devel.i686                           9.2-1.20130919.fc19    =
                updates=20
mesa-libGLU.i686                                  9.0.0-2.fc19           =
                fedora =20
mesa-libGLU-devel.i686                            9.0.0-2.fc19           =
                fedora =20
mesa-libGLw.i686                                  8.0.0-2.fc19           =
                fedora =20
mesa-libGLw-devel.i686                            8.0.0-2.fc19           =
                fedora =20
mesa-libOSMesa.i686                               9.2-1.20130919.fc19    =
                updates=20
mesa-libOSMesa-devel.i686                         9.2-1.20130919.fc19    =
                updates=20
mesa-libgbm-devel.i686                            9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl.i686                          9.2-1.20130919.fc19    =
                updates=20
mesa-libwayland-egl-devel.i686                    9.2-1.20130919.fc19    =
                updates=20
mesa-libxatracker-devel.i686                      9.2-1.20130919.fc19    =
                updates=20
mesa-vdpau-drivers.i686                           9.2-1.20130919.fc19    =
                updates=20
	libGL.so.1 (libc6) =3D> /lib/libGL.so.1
[rene@localhost ~]$ Loading native libraries
libGL: OpenDriver: trying /usr/lib/dri/tls/nouveau_dri.so
libGL: OpenDriver: trying /usr/lib/dri/nouveau_dri.so
Current Version is 082
libGL: OpenDriver: trying /usr/lib/dri/tls/nouveau_dri.so
libGL: OpenDriver: trying /usr/lib/dri/nouveau_dri.so
Mesa: User error: GL_INVALID_OPERATION in glRenderMode
#
# A fatal error has been detected by the Java Runtime Environment:
#
#  SIGSEGV (0xb) at pc=3D0x698cf2f5, pid=3D6406, tid=3D1804872512
#
# JRE version: Java(TM) SE Runtime Environment (7.0_45-b18) (build 1.7.0_=
45-b18)
# Java VM: Java HotSpot(TM) Server VM (24.45-b08 mixed mode linux-x86 )
# Problematic frame:
# C  [nouveau_dri.so+0x4222f5]  nouveau_resource_map_offset+0x15
#
# Failed to write core dump. Core dumps have been disabled. To enable cor=
e dumping, try "ulimit -c unlimited" before starting Java again
#
# An error report file with more information is saved as:
# /home/rene/gephi/bin/hs_err_pid6406.log
#
# If you would like to submit a bug report, please visit:
#   http://bugreport.sun.com/bugreport/crash.jsp
# The crash happened outside the Java Virtual Machine in native code.
# See problematic frame for where to report the bug.
#
=2E/../platform/lib/nbexec : ligne 568 :  6406 Abandon                 (c=
ore dumped)"/usr/java/latest/bin/java" -Djdk.home=3D"/usr/java/latest" -c=
lasspath "/home/rene/gephi/platform/lib/boot.jar:/home/rene/gephi/platfor=
m/lib/org-openide-modules.jar:/home/rene/gephi/platform/lib/org-openide-u=
til.jar:/home/rene/gephi/platform/lib/org-openide-util-lookup.jar:/home/r=
ene/gephi/platform/lib/locale/boot_ar_SA.jar:/home/rene/gephi/platform/li=
b/locale/boot_bg.jar:/home/rene/gephi/platform/lib/locale/boot_ca.jar:/ho=
me/rene/gephi/platform/lib/locale/boot_cs.jar:/home/rene/gephi/platform/l=
ib/locale/boot_de.jar:/home/rene/gephi/platform/lib/locale/boot_es.jar:/h=
ome/rene/gephi/platform/lib/locale/boot_fr.jar:/home/rene/gephi/platform/=
lib/locale/boot_gl_ES.jar:/home/rene/gephi/platform/lib/locale/boot_in_ID=
=2Ejar:/home/rene/gephi/platform/lib/locale/boot_it.jar:/home/rene/gephi/=
platform/lib/locale/boot_ja.jar:/home/rene/gephi/platform/lib/locale/boot=
_ko.jar:/home/rene/gephi/platform/lib/locale/boot_nl_NL.jar:/home/rene/ge=
phi/platform/lib/locale/boot_pl.jar:/home/rene/gephi/platform/lib/locale/=
boot_pt_BR.jar:/home/rene/gephi/platform/lib/locale/boot_pt_PT.jar:/home/=
rene/gephi/platform/lib/locale/boot_ro.jar:/home/rene/gephi/platform/lib/=
locale/boot_ru.jar:/home/rene/gephi/platform/lib/locale/boot_si.jar:/home=
/rene/gephi/platform/lib/locale/boot_sq.jar:/home/rene/gephi/platform/lib=
/locale/boot_sv.jar:/home/rene/gephi/platform/lib/locale/boot_tr.jar:/hom=
e/rene/gephi/platform/lib/locale/boot_zh_CN.jar:/home/rene/gephi/platform=
/lib/locale/boot_zh_TW.jar:/home/rene/gephi/platform/lib/locale/org-openi=
de-modules_ar_SA.jar:/home/rene/gephi/platform/lib/locale/org-openide-mod=
ules_bg.jar:/home/rene/gephi/platform/lib/locale/org-openide-modules_ca.j=
ar:/home/rene/gephi/platform/lib/locale/org-openide-modules_cs.jar:/home/=
rene/gephi/platform/lib/locale/org-openide-modules_de.jar:/home/rene/geph=
i/platform/lib/locale/org-openide-modules_es.jar:/home/rene/gephi/platfor=
m/lib/locale/org-openide-modules_fr.jar:/home/rene/gephi/platform/lib/loc=
ale/org-openide-modules_gl_ES.jar:/home/rene/gephi/platform/lib/locale/or=
g-openide-modules_in_ID.jar:/home/rene/gephi/platform/lib/locale/org-open=
ide-modules_it.jar:/home/rene/gephi/platform/lib/locale/org-openide-modul=
es_ja.jar:/home/rene/gephi/platform/lib/locale/org-openide-modules_ko.jar=
:/home/rene/gephi/platform/lib/locale/org-openide-modules_nl_NL.jar:/home=
/rene/gephi/platform/lib/locale/org-openide-modules_pl.jar:/home/rene/gep=
hi/platform/lib/locale/org-openide-modules_pt_BR.jar:/home/rene/gephi/pla=
tform/lib/locale/org-openide-modules_pt_PT.jar:/home/rene/gephi/platform/=
lib/locale/org-openide-modules_ro.jar:/home/rene/gephi/platform/lib/local=
e/org-openide-modules_ru.jar:/home/rene/gephi/platform/lib/locale/org-ope=
nide-modules_si.jar:/home/rene/gephi/platform/lib/locale/org-openide-modu=
les_sq.jar:/home/rene/gephi/platform/lib/locale/org-openide-modules_sv.ja=
r:/home/rene/gephi/platform/lib/locale/org-openide-modules_tr.jar:/home/r=
ene/gephi/platform/lib/locale/org-openide-modules_zh_CN.jar:/home/rene/ge=
phi/platform/lib/locale/org-openide-modules_zh_TW.jar:/home/rene/gephi/pl=
atform/lib/locale/org-openide-util_ar_SA.jar:/home/rene/gephi/platform/li=
b/locale/org-openide-util_bg.jar:/home/rene/gephi/platform/lib/locale/org=
-openide-util_ca.jar:/home/rene/gephi/platform/lib/locale/org-openide-uti=
l_cs.jar:/home/rene/gephi/platform/lib/locale/org-openide-util_de.jar:/ho=
me/rene/gephi/platform/lib/locale/org-openide-util_es.jar:/home/rene/geph=
i/platform/lib/locale/org-openide-util_fr.jar:/home/rene/gephi/platform/l=
ib/locale/org-openide-util_gl_ES.jar:/home/rene/gephi/platform/lib/locale=
/org-openide-util_in_ID.jar:/home/rene/gephi/platform/lib/locale/org-open=
ide-util_it.jar:/home/rene/gephi/platform/lib/locale/org-openide-util_ja.=
jar:/home/rene/gephi/platform/lib/locale/org-openide-util_ko.jar:/home/re=
ne/gephi/platform/lib/locale/org-openide-util-lookup_bg.jar:/home/rene/ge=
phi/platform/lib/locale/org-openide-util-lookup_ca.jar:/home/rene/gephi/p=
latform/lib/locale/org-openide-util-lookup_cs.jar:/home/rene/gephi/platfo=
rm/lib/locale/org-openide-util-lookup_de.jar:/home/rene/gephi/platform/li=
b/locale/org-openide-util-lookup_es.jar:/home/rene/gephi/platform/lib/loc=
ale/org-openide-util-lookup_fr.jar:/home/rene/gephi/platform/lib/locale/o=
rg-openide-util-lookup_gl_ES.jar:/home/rene/gephi/platform/lib/locale/org=
-openide-util-lookup_in_ID.jar:/home/rene/gephi/platform/lib/locale/org-o=
penide-util-lookup_it.jar:/home/rene/gephi/platform/lib/locale/org-openid=
e-util-lookup_ja.jar:/home/rene/gephi/platform/lib/locale/org-openide-uti=
l-lookup_ko.jar:/home/rene/gephi/platform/lib/locale/org-openide-util-loo=
kup_nl_NL.jar:/home/rene/gephi/platform/lib/locale/org-openide-util-looku=
p_pl.jar:/home/rene/gephi/platform/lib/locale/org-openide-util-lookup_pt_=
BR.jar:/home/rene/gephi/platform/lib/locale/org-openide-util-lookup_ro.ja=
r:/home/rene/gephi/platform/lib/locale/org-openide-util-lookup_ru.jar:/ho=
me/rene/gephi/platform/lib/locale/org-openide-util-lookup_si.jar:/home/re=
ne/gephi/platform/lib/locale/org-openide-util-lookup_sv.jar:/home/rene/ge=
phi/platform/lib/locale/org-openide-util-lookup_tr.jar:/home/rene/gephi/p=
latform/lib/locale/org-openide-util-lookup_zh_CN.jar:/home/rene/gephi/pla=
tform/lib/locale/org-openide-util_nl_NL.jar:/home/rene/gephi/platform/lib=
/locale/org-openide-util_pl.jar:/home/rene/gephi/platform/lib/locale/org-=
openide-util_pt_BR.jar:/home/rene/gephi/platform/lib/locale/org-openide-u=
til_pt_PT.jar:/home/rene/gephi/platform/lib/locale/org-openide-util_ro.ja=
r:/home/rene/gephi/platform/lib/locale/org-openide-util_ru.jar:/home/rene=
/gephi/platform/lib/locale/org-openide-util_si.jar:/home/rene/gephi/platf=
orm/lib/locale/org-openide-util_sq.jar:/home/rene/gephi/platform/lib/loca=
le/org-openide-util_sv.jar:/home/rene/gephi/platform/lib/locale/org-openi=
de-util_tr.jar:/home/rene/gephi/platform/lib/locale/org-openide-util_zh_C=
N.jar:/home/rene/gephi/platform/lib/locale/org-openide-util_zh_TW.jar" -D=
netbeans.system_http_proxy=3D"DIRECT" -Dnetbeans.system_http_non_proxy_ho=
sts=3D"" -Dnetbeans.dirs=3D"./../gephi:./../platform:" -Dnetbeans.home=3D=
"/home/rene/gephi/platform" '-Xms512m' '-Xmx1024m' '-Xverify:none' '-Dsun=
=2Ejava2d.noddraw=3Dtrue' '-Dsun.awt.noerasebackground=3Dtrue' '-Dnetbean=
s.indexing.noFileRefresh=3Dtrue' '-Dplugin.manager.check.interval=3DEVERY=
_DAY' -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=3D"/home/rene/.gep=
hi/0.8.2/dev/var/log/heapdump.hprof" org.netbeans.Main --userdir "/home/r=
ene/.gephi/0.8.2/dev" "--branding" "gephi" 0<&0



--------------050207000100040204040303
Content-Type: text/x-vcard; charset=utf-8;
 name="r_cluzel.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="r_cluzel.vcf"

begin:vcard
fn;quoted-printable:Ren=C3=A9 Cluzel
n;quoted-printable:Cluzel;Ren=C3=A9
email;internet:r.cluzel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------050207000100040204040303
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------050207000100040204040303--
