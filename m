From: Ioannis Nousias <s0238762-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
Subject: Re: Fedora and direct rendering
Date: Sun, 10 Jun 2007 14:55:00 +0100
Message-ID: <466C02B4.1000300@sms.ed.ac.uk>
References: <466B3BDA.3040706@sms.ed.ac.uk> <466B4BFC.5010401@sms.ed.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------040008050402000800030805"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <466B4BFC.5010401-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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
--------------040008050402000800030805
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

ok, I found the problem. 'ldd /usr/bin/glxinfo' revealed that it was 
linking to nvidia's libGL.so that's installed on my system. I changed 
the suffix of '/etc/ld.so.conf.d/nvidia-96xx.conf' , run 'ldconfig' and 
success !

well sort of ;) It now reports 'direct rendering: Yes', but the general 
feeling is that there is no acceleration. Moving windows or scrolling is 
slow. But it does as advertised. If I run glxgears it crashes the X 
server :-D

no wonder why Fedora chose not to include the nouveau_dri.so on their repos.

thanks guys. By they way, what happened to the nouveau crash course (no 
pan intended ;)) ?

-Ioannis


Ioannis Nousias wrote:
> Ioannis Nousias wrote:
>   
>> Hello,
>>
>> I'm using Fedora 7 and I thought I should try nouveau.  I couldn't get 
>> direct rendering to  work.
>>
>> I found out that the Mesa package that ships with Fedora 7 doesn't 
>> include a DRI interface for the nouveau module. So I fetched the latest 
>> Mesa source from git, compiled with 'mke DRI_DIRS=nouveau linux-dri-x86' 
>> and copied the produced ./lib/nouveau_dri.so in the appropriate 
>> directory (/usr/lib/dri/nouveau_dri.so).
>>
>> the driver nouveau_drv.so is provided by Fedora as well as the kernel 
>> module. I've added 'Load "glx"' and 'Load "dri"' in my xorg.conf, as 
>> well as 'Option "AIGLX" "True"'. Apart from the usual warnings from 
>> AIGLX for some unsupported visuals, there are no other warning or error 
>> messages in the Xorg.0.log
>>
>> there is an error message in the kernel log though:
>> [drm:nouveau_mem_init] *ERROR* Unable to acquire AGP: -19
>>
>>
>> for DRI I get this:
>> $ grep DRI /var/log/Xorg.0.log
>> (II) Loading extension XFree86-DRI
>> (II) NOUVEAU(0): Loaded DRI module
>> (II) NOUVEAU(0): [dri] Found DRI library version 1.3.0 and kernel module 
>> version 0.0.6
>> (II) NOUVEAU(0): [DRI] installation complete
>> (II) GLX: Initialized DRI GL provider for screen 0
>>
>>
>> for DRM I get this:
>> $ grep -i drm /var/log/Xorg.0.log
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is -1, (No such device)
>> drmOpenDevice: open result is -1, (No such device)
>> drmOpenDevice: Open failed
>> drmOpenByBusid: Searching for BusID pci:0000:01:00.0
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is 7, (OK)
>> drmOpenByBusid: drmOpenMinor returns 7
>> drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is 7, (OK)
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is 7, (OK)
>> drmOpenByBusid: Searching for BusID pci:0000:01:00.0
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is 7, (OK)
>> drmOpenByBusid: drmOpenMinor returns 7
>> drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
>> (II) NOUVEAU(0): [drm] DRM interface version 1.3
>> (II) NOUVEAU(0): [drm] created "nouveau" driver at busid "pci:0000:01:00.0"
>> (II) NOUVEAU(0): [drm] added 8192 byte SAREA at 0xf8abb000
>> (II) NOUVEAU(0): [drm] mapped SAREA 0xf8abb000 to 0xb7f9e000
>> (II) NOUVEAU(0): [drm] framebuffer handle = 0xf0000000
>> (II) NOUVEAU(0): [drm] added 1 reserved context for kernel
>> (II) NOUVEAU(0): [drm] installed DRM signal handler
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is 8, (OK)
>> drmOpenByBusid: Searching for BusID pci:0000:01:00.0
>> drmOpenDevice: node name is /dev/dri/card0
>> drmOpenDevice: open result is 8, (OK)
>> drmOpenByBusid: drmOpenMinor returns 8
>> drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
>>
>> and for AIGLX this:
>> (**) Option "AIGLX" "True"
>> (**) AIGLX enabled
>> (II) AIGLX: Loaded and initialized /usr/lib/dri/nouveau_dri.so
>>
>>
>> which looks promising to me.
>>
>> glxinfo reports
>> $ glxinfo | grep Mesa
>> OpenGL renderer string: Mesa DRI GeForce4 Ti 4200 Go AGP 8x 20060219 
>> x86/MMX/SSE2
>> OpenGL version string: 1.2 Mesa 7.1
>>
>> unfortunately direct rendering doesn't get enabled
>> $ glxinfo | grep direct
>> direct rendering: No
>>
>> Of course I know nouveau is in its infancy. Just playing with it I guess ;)
>>
>>
>> thank you for your hard work in building this driver.
>>
>> -Ioannis
>>
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>
>>   
>>     
> forgot to mention that I've properly set the permissions to 0666 for DRI 
> in xorg.conf
>
> thanks
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>   


--------------040008050402000800030805
Content-Type: text/plain;
 name="glxinfo.nouveau"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="glxinfo.nouveau"

libGL: XF86DRIGetClientDriverName: 1.2.0 nouveau (screen 0)
libGL: OpenDriver: trying /usr/lib/dri/nouveau_dri.so
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 4, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 4, (OK)
drmOpenByBusid: drmOpenMinor returns 4
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
libGL warning: 3D driver claims to not support visual 0x8a
************************************INFO***********************************
File nouveau_fifo.c function nouveauFifoInit line 138
Fifo init ok. Using context 1
***************************************************************************
libGL error: 
Can't open configuration file /home/s0238762/.drirc: No such file or directory.
do_wait: drmWaitVBlank returned -1, IRQs don't seem to be working correctly.
Try running with LIBGL_THROTTLE_REFRESH and LIBL_SYNC_REFRESH unset.
name of display: :0.0
display: :0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.2
server glx extensions:
    GLX_ARB_multisample, GLX_EXT_import_context, GLX_EXT_texture_from_pixmap, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_OML_swap_method, 
    GLX_SGIS_multisample, GLX_SGIX_fbconfig, GLX_SGIX_visual_select_group
client glx vendor string: SGI
client glx version string: 1.4
client glx extensions:
    GLX_ARB_get_proc_address, GLX_ARB_multisample, GLX_EXT_import_context, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_MESA_allocate_memory, 
    GLX_MESA_copy_sub_buffer, GLX_MESA_swap_control, 
    GLX_MESA_swap_frame_usage, GLX_OML_swap_method, GLX_OML_sync_control, 
    GLX_SGI_make_current_read, GLX_SGI_swap_control, GLX_SGI_video_sync, 
    GLX_SGIS_multisample, GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, 
    GLX_SGIX_visual_select_group, GLX_EXT_texture_from_pixmap
GLX version: 1.2
GLX extensions:
    GLX_ARB_get_proc_address, GLX_ARB_multisample, GLX_EXT_import_context, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_OML_swap_method, 
    GLX_SGIS_multisample, GLX_SGIX_fbconfig, GLX_SGIX_visual_select_group
OpenGL vendor string: Stephane Marchesin
OpenGL renderer string: Mesa DRI GeForce4 Ti 4200 Go AGP 8x 20060219 x86/MMX/SSE2
OpenGL version string: 1.2 Mesa 7.0
OpenGL extensions:
    GL_ARB_imaging, GL_ARB_transpose_matrix, GL_ARB_window_pos, GL_EXT_abgr, 
    GL_EXT_bgra, GL_EXT_blend_color, GL_EXT_blend_minmax, 
    GL_EXT_blend_subtract, GL_EXT_clip_volume_hint, 
    GL_EXT_compiled_vertex_array, GL_EXT_convolution, GL_EXT_copy_texture, 
    GL_EXT_draw_range_elements, GL_EXT_histogram, GL_EXT_packed_pixels, 
    GL_EXT_polygon_offset, GL_EXT_rescale_normal, 
    GL_EXT_separate_specular_color, GL_EXT_subtexture, GL_EXT_texture, 
    GL_EXT_texture3D, GL_EXT_texture_edge_clamp, GL_EXT_texture_object, 
    GL_EXT_vertex_array, GL_APPLE_packed_pixels, GL_IBM_rasterpos_clip, 
    GL_MESA_window_pos, GL_NV_light_max_exponent, GL_NV_texgen_reflection, 
    GL_OES_read_format, GL_SGI_color_matrix, GL_SGI_color_table, 
    GL_SGIS_texture_edge_clamp, GL_SGIS_texture_lod

   visual  x  bf lv rg d st colorbuffer ax dp st accumbuffer  ms  cav
 id dep cl sp sz l  ci b ro  r  g  b  a bf th cl  r  g  b  a ns b eat
----------------------------------------------------------------------
0x23 24 tc  0 24  0 r  y  .  8  8  8  0  0 24  0  0  0  0  0  0 0 None
0x24 24 tc  0 24  0 r  y  .  8  8  8  0  0 24  8  0  0  0  0  0 0 None
0x25 24 tc  0 32  0 r  y  .  8  8  8  8  0 24  0  0  0  0  0  0 0 None
0x26 24 tc  0 32  0 r  y  .  8  8  8  8  0 24  8  0  0  0  0  0 0 None
0x27 24 tc  0 24  0 r  y  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x28 24 tc  0 24  0 r  y  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x29 24 tc  0 32  0 r  y  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x2a 24 tc  0 32  0 r  y  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x2b 24 tc  0 24  0 r  y  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x2c 24 tc  0 24  0 r  y  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x2d 24 tc  0 32  0 r  y  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x2e 24 tc  0 32  0 r  y  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x2f 24 tc  0 24  0 r  .  .  8  8  8  0  0 24  0  0  0  0  0  0 0 None
0x30 24 tc  0 24  0 r  .  .  8  8  8  0  0 24  8  0  0  0  0  0 0 None
0x31 24 tc  0 32  0 r  .  .  8  8  8  8  0 24  0  0  0  0  0  0 0 None
0x32 24 tc  0 32  0 r  .  .  8  8  8  8  0 24  8  0  0  0  0  0 0 None
0x33 24 tc  0 24  0 r  .  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x34 24 tc  0 24  0 r  .  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x35 24 tc  0 32  0 r  .  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x36 24 tc  0 32  0 r  .  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x37 24 tc  0 24  0 r  .  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x38 24 tc  0 24  0 r  .  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x39 24 tc  0 32  0 r  .  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x3a 24 tc  0 32  0 r  .  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x3b 24 dc  0 24  0 r  y  .  8  8  8  0  0 24  0  0  0  0  0  0 0 None
0x3c 24 dc  0 24  0 r  y  .  8  8  8  0  0 24  8  0  0  0  0  0 0 None
0x3d 24 dc  0 32  0 r  y  .  8  8  8  8  0 24  0  0  0  0  0  0 0 None
0x3e 24 dc  0 32  0 r  y  .  8  8  8  8  0 24  8  0  0  0  0  0 0 None
0x3f 24 dc  0 24  0 r  y  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x40 24 dc  0 24  0 r  y  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x41 24 dc  0 32  0 r  y  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x42 24 dc  0 32  0 r  y  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x43 24 dc  0 24  0 r  y  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x44 24 dc  0 24  0 r  y  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x45 24 dc  0 32  0 r  y  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x46 24 dc  0 32  0 r  y  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x47 24 dc  0 24  0 r  .  .  8  8  8  0  0 24  0  0  0  0  0  0 0 None
0x48 24 dc  0 24  0 r  .  .  8  8  8  0  0 24  8  0  0  0  0  0 0 None
0x49 24 dc  0 32  0 r  .  .  8  8  8  8  0 24  0  0  0  0  0  0 0 None
0x4a 24 dc  0 32  0 r  .  .  8  8  8  8  0 24  8  0  0  0  0  0 0 None
0x4b 24 dc  0 24  0 r  .  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x4c 24 dc  0 24  0 r  .  .  8  8  8  0  0 16  0  0  0  0  0  0 0 None
0x4d 24 dc  0 32  0 r  .  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x4e 24 dc  0 32  0 r  .  .  8  8  8  8  0 16  0  0  0  0  0  0 0 None
0x4f 24 dc  0 24  0 r  .  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x50 24 dc  0 24  0 r  .  .  8  8  8  0  0  0  0  0  0  0  0  0 0 None
0x51 24 dc  0 32  0 r  .  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x52 24 dc  0 32  0 r  .  .  8  8  8  8  0  0  0  0  0  0  0  0 0 None
0x8a 32 tc  0 32  0 r  .  .  8  8  8  8  0  0  0  0  0  0  0  0 0 Ncon

--------------040008050402000800030805
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--------------040008050402000800030805--
