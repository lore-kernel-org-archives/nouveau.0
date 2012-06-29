From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 51579] New: Xv video support is black on NVidia NVa8
 Chipset in latest git
Date: Fri, 29 Jun 2012 23:22:58 +0000
Message-ID: <bug-51579-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=51579

             Bug #: 51579
           Summary: Xv video support is black on NVidia NVa8 Chipset in
                    latest git
    Classification: Unclassified
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: boris-Ky47UMpZSVQ@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


I have one of the Zotac all-in-one PC's with the Nvidia ION chipset
(NOUVEAU(0): Chipset: "NVIDIA NVa8") and it seems the latest xf86-nouveau
driver from GIT is broken when trying to use Xv support for video playback. All
it shows is a black screen. The GPU is not locked up as I can hear the audio
during playback but the video is black. The last working version from git was
commit 5ac2ca8c56ec8b055878c8ac4cbc8ca74379abda - "works implement and use
PUSH_DATAu" and then starts failing at commit
b48bcc094beecf521899dd63c8fdbccfd534e5cd - "nv50/exa: perform texcoord
transformations in vertex program" all the way up to the latest git version
from today. The Xorg.0.log seems to be fine. (snippet)

[    21.780] (II) NOUVEAU driver Date:   Thu Apr 19 09:52:24 2012 +1000
[    21.780] (II) NOUVEAU driver for NVIDIA chipset families :
[    21.780]    RIVA TNT        (NV04)
[    21.780]    RIVA TNT2       (NV05)
[    21.780]    GeForce 256     (NV10)
[    21.780]    GeForce 2       (NV11, NV15)
[    21.780]    GeForce 4MX     (NV17, NV18)
[    21.780]    GeForce 3       (NV20)
[    21.780]    GeForce 4Ti     (NV25, NV28)
[    21.780]    GeForce FX      (NV3x)
[    21.780]    GeForce 6       (NV4x)
[    21.780]    GeForce 7       (G7x)
[    21.780]    GeForce 8       (G8x)
[    21.780]    GeForce GTX 200 (NVA0)
[    21.780]    GeForce GTX 400 (NVC0)
[    21.780] (--) using VT number 2

[    21.784] drmOpenDevice: node name is /dev/dri/card0
[    21.784] drmOpenDevice: open result is 9, (OK)
[    21.784] drmOpenByBusid: Searching for BusID pci:0000:03:00.0
[    21.784] drmOpenDevice: node name is /dev/dri/card0
[    21.784] drmOpenDevice: open result is 9, (OK)
[    21.785] drmOpenByBusid: drmOpenMinor returns 9
[    21.785] drmOpenByBusid: drmGetBusid reports pci:0000:03:00.0
[    21.785] (II) [drm] nouveau interface version: 1.0.0
[    21.785] (II) Loading sub module "dri"
[    21.785] (II) LoadModule: "dri"
[    21.785] (II) Loading /usr/X11/lib/xorg/modules/extensions/libdri.so
[    21.785] (II) Module dri: vendor="X.Org Foundation"
[    21.785]    compiled for 1.12.99, module version = 1.0.0
[    21.785]    ABI class: X.Org Server Extension, version 6.0
[    21.785] (II) NOUVEAU(0): Loaded DRI module
[    21.785] drmOpenDevice: node name is /dev/dri/card0
[    21.786] drmOpenDevice: open result is 10, (OK)
[    21.786] drmOpenDevice: node name is /dev/dri/card0
[    21.786] drmOpenDevice: open result is 10, (OK)
[    21.786] drmOpenByBusid: Searching for BusID pci:0000:03:00.0
[    21.786] drmOpenDevice: node name is /dev/dri/card0
[    21.786] drmOpenDevice: open result is 10, (OK)
[    21.786] drmOpenByBusid: drmOpenMinor returns 10
[    21.786] drmOpenByBusid: drmGetBusid reports pci:0000:03:00.0
[    21.786] (II) [drm] DRM interface version 1.4
[    21.786] (II) [drm] DRM open master succeeded.
[    21.786] (--) NOUVEAU(0): Chipset: "NVIDIA NVa8"
[    21.786] (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    21.786] (==) NOUVEAU(0): RGB weight 888
[    21.786] (==) NOUVEAU(0): Default visual is TrueColor
[    21.786] (==) NOUVEAU(0): Using HW cursor
[    21.786] (==) NOUVEAU(0): GLX sync to VBlank disabled.

[    22.198] (II) NOUVEAU(0): Opened GPU channel 2
[    22.226] (II) NOUVEAU(0): [DRI2] Setup complete
[    22.226] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    22.226] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    22.232] (II) NOUVEAU(0): GART: 512MiB available
[    22.246] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    22.246] (II) EXA(0): Driver allocated offscreen pixmaps
[    22.246] (II) EXA(0): Driver registered support for the following
operations:
[    22.246] (II)         Solid
[    22.246] (II)         Copy
[    22.246] (II)         Composite (RENDER acceleration)
[    22.246] (II)         UploadToScreen
[    22.246] (II)         DownloadFromScreen
[    22.246] (==) NOUVEAU(0): Backing store disabled
[    22.246] (==) NOUVEAU(0): Silken mouse enabled
[    22.246] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[    22.246] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    22.246] (==) NOUVEAU(0): DPMS enabled
[    22.246] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    22.247] (--) RandR disabled
[    22.247] (II) Initializing built-in extension Generic Event Extension
[    22.247] (II) Initializing built-in extension SHAPE
[    22.247] (II) Initializing built-in extension MIT-SHM
[    22.247] (II) Initializing built-in extension XInputExtension
[    22.247] (II) Initializing built-in extension XTEST
[    22.247] (II) Initializing built-in extension BIG-REQUESTS
[    22.247] (II) Initializing built-in extension SYNC
[    22.247] (II) Initializing built-in extension XKEYBOARD
[    22.247] (II) Initializing built-in extension XC-MISC
[    22.247] (II) Initializing built-in extension XINERAMA
[    22.247] (II) Initializing built-in extension XFIXES
[    22.247] (II) Initializing built-in extension RENDER
[    22.247] (II) Initializing built-in extension RANDR
[    22.247] (II) Initializing built-in extension COMPOSITE
[    22.247] (II) Initializing built-in extension DAMAGE
[    22.328] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    22.328] (II) AIGLX: enabled GLX_INTEL_swap_event
[    22.328] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[    22.328] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    22.328] (II) AIGLX: Loaded and initialized nouveau
[    22.328] (II) GLX: Initialized DRI2 GL provider for screen 0

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
