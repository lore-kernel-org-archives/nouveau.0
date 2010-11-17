From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31684] New: No Xv acceleration with 7600 GT AGP
 (NV4B), last git drivers
Date: Wed, 17 Nov 2010 10:01:38 -0800 (PST)
Message-ID: <bug-31684-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

https://bugs.freedesktop.org/show_bug.cgi?id=31684

           Summary: No Xv acceleration with 7600 GT AGP (NV4B), last git
                    drivers
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: pwet_pwet_yepyep-PkbjNfxxIARGWvitb5QawA@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I've recently lost Xv acceleration when i update nouveau last git drivers. I
use Gentoo AMD64 with kernel 2.6.34-r12 and the integrated kernel drm drivers.
I don't remember which version i had before but all ran good.

xvinfo :
#######################################################
X-Video Extension version 2.2
screen #0
 no adaptors present

glxinfo :
#######################################################
name of display: :0.0
display: :0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.2
server glx extensions:
    GLX_ARB_multisample, GLX_EXT_visual_info, GLX_EXT_visual_rating, 
    GLX_EXT_import_context, GLX_EXT_texture_from_pixmap, GLX_OML_swap_method, 
    GLX_SGI_make_current_read, GLX_SGIS_multisample, GLX_SGIX_hyperpipe, 
    GLX_SGIX_swap_barrier, GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, 
    GLX_MESA_copy_sub_buffer
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
client glx extensions:
    GLX_ARB_get_proc_address, GLX_ARB_multisample, GLX_EXT_import_context, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_MESA_copy_sub_buffer, 
    GLX_MESA_swap_control, GLX_OML_swap_method, GLX_OML_sync_control, 
    GLX_SGI_make_current_read, GLX_SGI_swap_control, GLX_SGI_video_sync, 
    GLX_SGIS_multisample, GLX_SGIX_fbconfig, GLX_SGIX_pbuffer, 
    GLX_SGIX_visual_select_group, GLX_EXT_texture_from_pixmap, 
    GLX_INTEL_swap_event
GLX version: 1.2
GLX extensions:
    GLX_ARB_get_proc_address, GLX_ARB_multisample, GLX_EXT_import_context, 
    GLX_EXT_visual_info, GLX_EXT_visual_rating, GLX_OML_swap_method, 
    GLX_SGIS_multisample, GLX_SGIX_fbconfig, GLX_SGIX_pbuffer
OpenGL vendor string: VMware, Inc.
OpenGL renderer string: Gallium 0.4 on llvmpipe
OpenGL version string: 2.1 Mesa 7.10-devel
OpenGL shading language version string: 1.20

Xorg.0.log | grep -i nouveau :
#######################################################
(II) LoadModule: "nouveau"
(II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
(II) NOUVEAU driver Date:   Thu Aug 26 13:22:33 2010 +1000
(II) NOUVEAU driver for NVIDIA chipset families :
(II) [drm] nouveau interface version: 0.0.16
(II) NOUVEAU(0): Loaded DRI module
(--) NOUVEAU(0): Chipset: "NVIDIA NV4b"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(II) NOUVEAU(0): Output DVI-I-1 using monitor section IQT995
(II) NOUVEAU(0): Output VGA-1 has no monitor section
(II) NOUVEAU(0): Output TV-1 has no monitor section
(II) NOUVEAU(0): Output DVI-I-1 disconnected
(II) NOUVEAU(0): Output VGA-1 connected
(II) NOUVEAU(0): Output TV-1 disconnected
(II) NOUVEAU(0): Using user preference for initial modes
(II) NOUVEAU(0): Output VGA-1 using initial mode 1280x1024
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise
stated.
(--) NOUVEAU(0): Virtual size is 1280x1024 (pitch 1280)
(**) NOUVEAU(0):  Driver mode "1280x1024": 157.5 MHz (scaled from 0.0 MHz),
91.1 kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x85.0  157.50  1280 1344 1504 1728  1024
1025 1028 1072 +hsync +vsync (91.1 kHz)
(**) NOUVEAU(0):  Mode "1600x1200": 206.0 MHz (scaled from 0.0 MHz), 94.0 kHz,
75.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x75.0  205.99  1600 1720 1896 2192  1200
1201 1204 1253 -hsync +vsync (94.0 kHz)
(**) NOUVEAU(0):  Driver mode "1600x1200": 202.5 MHz (scaled from 0.0 MHz),
93.8 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1600x1200"x75.0  202.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (93.8 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from 0.0 MHz),
80.0 kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz)
(**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from 0.0 MHz), 67.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 94.5 MHz (scaled from 0.0 MHz), 68.7
kHz, 85.0 Hz
(II) NOUVEAU(0): Modeline "1024x768"x85.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from 0.0 MHz), 60.1
kHz, 75.1 Hz
(II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.1 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 56.2 MHz (scaled from 0.0 MHz), 53.7
kHz, 85.1 Hz
(II) NOUVEAU(0): Modeline "800x600"x85.1   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0 MHz), 46.9
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 40.5 MHz (scaled from 0.0 MHz), 50.6
kHz, 100.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x100.0   40.50  640 656 720 800  480 481 484
506 -hsync -vsync (50.6 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0 MHz), 37.5
kHz, 75.0 Hz
(II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0 MHz), 31.5
kHz, 70.1 Hz
(II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz)
(==) NOUVEAU(0): DPI set to (96, 96)
(EE) NOUVEAU(0): Error creating GPU channel: -22
(EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel
(==) NOUVEAU(0): Backing store disabled
(==) NOUVEAU(0): Silken mouse enabled
(==) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): Setting screen physical size to 338 x 270
(II) NOUVEAU(0): EDID vendor "IQT", prod id 10645
(II) NOUVEAU(0): Using hsync ranges from config file
(II) NOUVEAU(0): Using vrefresh ranges from config file
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1600x1200"x0.0  202.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (93.8 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   40.50  640 656 720 800  480 481 484
506 -hsync -vsync (50.6 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  157.50  1280 1344 1504 1728  1024
1025 1028 1072 +hsync +vsync (91.1 kHz)
(II) NOUVEAU(0): EDID vendor "IQT", prod id 10645
(II) NOUVEAU(0): Using hsync ranges from config file
(II) NOUVEAU(0): Using vrefresh ranges from config file
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1600x1200"x0.0  202.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (93.8 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   40.50  640 656 720 800  480 481 484
506 -hsync -vsync (50.6 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  157.50  1280 1344 1504 1728  1024
1025 1028 1072 +hsync +vsync (91.1 kHz)
(II) NOUVEAU(0): EDID vendor "IQT", prod id 10645
(II) NOUVEAU(0): Using hsync ranges from config file
(II) NOUVEAU(0): Using vrefresh ranges from config file
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1600x1200"x0.0  202.50  1600 1664 1856 2160  1200
1201 1204 1250 +hsync +vsync (93.8 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   40.50  640 656 720 800  480 481 484
506 -hsync -vsync (50.6 kHz)
(II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840  480 481 484
500 -hsync -vsync (37.5 kHz)
(II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900  400 412 414
449 -hsync +vsync (31.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440 1688  1024
1025 1028 1066 +hsync +vsync (80.0 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136 1312  768 769
772 800 +hsync +vsync (60.0 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056  600 601 604
625 +hsync +vsync (46.9 kHz)
(II) NOUVEAU(0): Modeline "800x600"x0.0   56.25  800 832 896 1048  600 601 604
631 +hsync +vsync (53.7 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x0.0   94.50  1024 1072 1168 1376  768 769
772 808 +hsync +vsync (68.7 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344 1600  864 865
868 900 +hsync +vsync (67.5 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x0.0  157.50  1280 1344 1504 1728  1024
1025 1028 1072 +hsync +vsync (91.1 kHz)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
