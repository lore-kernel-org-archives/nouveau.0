From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80675] New: KMS FB hand-over: no/black console on
 Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
Date: Sun, 29 Jun 2014 12:06:44 +0000
Message-ID: <bug-80675-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1785507939=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1785507939==
Content-Type: multipart/alternative; boundary="1404043604.f13a1.17969"; charset="us-ascii"


--1404043604.f13a1.17969
Date: Sun, 29 Jun 2014 12:06:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80675

          Priority: medium
            Bug ID: 80675
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: KMS FB hand-over: no/black console on Nvidia
                    MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: walter.haidinger-RbZlAiThDcE@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 101974
  --> https://bugs.freedesktop.org/attachment.cgi?id=101974&action=edit
3.15.2 dmesg log

I've an AMD M4N78 PRO (Bios 1303) motherboard [1] here having
a MCP78S chipset (GeForce 8300 onboard, PCI-ID 10de:0848)
where I get all black consoles with KMS.

Please note that X11 works fine.
Fortunately no lockups when switching VTs either.

I think there is probably a problem with KMS hand-over.

Reproducible at least with:
* vanilla 64-bit kernel 3.15.2 and 3.14.8 
* openSUSE 13.1/x86_64 (3.11.10 kernel)
* grml64-2014.03 live CD with 3.13.6 kernel [2]

Yes, I've read:
http://nouveau.freedesktop.org/wiki/KernelModeSetting/

The consoles disappear (black only) once Nouveau switches
to its framebuffer. If KMS is disabled, the consoles stay
visible, i.e. vesa-fb works.

Console switching still works, i.e. switching to/from VT7
where X11 runs fine is possible. When switching, the
display goes black but switching back to VT7 restores
the X11 display.

When using fbcon=map:1 kernel parameter, behavior changes
just slightly when console switching: The X11 screen stays
(no switch to black screen) but seems to freeze. Switching
back to VT7 enables X11 again. 

Btw, the Linux Penguins shown for each CPU core are displayed
but are distorted and in false colors. They disappear after
about 10 seconds when the VT screens goes all black.

Below are more details:

* Relevant dmesg lines (see attachment for full):
[    9.017968] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0aa400a2
[    9.036288] nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
[    9.056678] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
[    9.073849] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    9.135263] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    9.154602] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    9.174041] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    9.192343] nouveau  [   VBIOS][0000:02:00.0] version 62.77.36.00.00
[    9.231562] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[    9.252736] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[    9.270265] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[    9.289229] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 1100000uv
[    9.498063] tsc: Refined TSC clocksource calibration: 3299.999 MHz
[   10.543608] Switched to clocksource tsc
[   18.015935] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[   18.036606] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[   18.056467] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   18.075056] nouveau  [     CLK][0000:02:00.0] 0f: core 500 MHz shader 1500
MHz vdec 500 MHz
[   18.100202] nouveau  [     CLK][0000:02:00.0] --: core 350 MHz shader 800
MHz vdec 350 MHz
[   18.125199] [TTM] Zone  kernel: Available graphics memory: 4062588 kiB
[   18.144801] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   18.164410] [TTM] Initializing pool allocator
[   18.177527] [TTM] Initializing DMA pool allocator
[   18.191691] nouveau  [     DRM] VRAM: 32 MiB
[   18.204540] nouveau  [     DRM] GART: 1048576 MiB
[   18.218697] nouveau  [     DRM] TMDS table version 2.0
[   18.234151] nouveau  [     DRM] DCB version 4.0
[   18.247787] nouveau  [     DRM] DCB outp 00: 01000300 0000001e
[   18.265322] nouveau  [     DRM] DCB outp 01: 01011332 00020010
[   18.282855] nouveau  [     DRM] DCB conn 00: 00000100
[   18.298118] nouveau  [     DRM] DCB conn 01: 00001261
[   18.319941] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   18.339819] [drm] Driver supports precise vblank timestamp query.
[   18.366629] nouveau  [     DRM] MM: using M2MF for buffer copies
[   18.414966] nouveau  [     DRM] allocated 1024x768 fb: 0x50000, bo
ffff88022058e400
[   18.438055] fbcon: nouveaufb (fb0) is primary device
[   18.498687] random: nonblocking pool is initialized
[   18.505940] Console: switching to colour frame buffer device 128x48
[   18.555299] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   18.574317] nouveau 0000:02:00.0: registered panic notifier
[   18.590996] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on
minor 0

* Xorg.0.log, driver from openSUSE package
 xorg-x11-driver-video-nouveau-1.0.9-3.1.2.x86_64

 NOTE: Yes, this isn't the lastest but X11 is working. 
       This bug is about the console framebuffer.
       I'm adding the Xorg log because it might provide some clues.   

 X.Org X Server 1.14.3.901 (1.14.4 RC 1)
 Release Date: 2013-10-26
 Build Operating System: openSUSE SUSE LINUX
 Build Date: 17 April 2014  05:37:34AM
 (II) xfree86: Adding drm device (/dev/dri/card0)
 (--) PCI:*(0:2:0:0) 10de:0848:1043:82e2 rev 162, Mem @ 0xfa000000/16777216,
0xd8000000/134217728, 0xd6000000/33554432, I/O @ 0x0000bc00/128, BIOS @
0x????????/131072
 (II) NOUVEAU driver
 (II) NOUVEAU driver for NVIDIA chipset families :
        RIVA TNT        (NV04)
        RIVA TNT2       (NV05)
        GeForce 256     (NV10)
        GeForce 2       (NV11, NV15)
        GeForce 4MX     (NV17, NV18)
        GeForce 3       (NV20)
        GeForce 4Ti     (NV25, NV28)
        GeForce FX      (NV3x)
        GeForce 6       (NV4x)
        GeForce 7       (G7x)
        GeForce 8       (G8x)
        GeForce GTX 200 (NVA0)
        GeForce GTX 400 (NVC0)
 (++) using VT number 7
 (II) [drm] nouveau interface version: 1.1.1
 (--) NOUVEAU(0): Chipset: "NVIDIA NVAA"
 (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
 (==) NOUVEAU(0): RGB weight 888
 (==) NOUVEAU(0): Default visual is TrueColor
 (==) NOUVEAU(0): Using HW cursor
 (==) NOUVEAU(0): GLX sync to VBlank disabled.
 (==) NOUVEAU(0): Page flipping enabled
 (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
 (II) NOUVEAU(0): Output VGA-1 using monitor section Monitor[0]
 (II) NOUVEAU(0): EDID for output VGA-1
 (II) NOUVEAU(0): Printing probed modes for output VGA-1
 (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184 1344  768
771 777 806 -hsync -vsync (48.4 kHz eP)
 (II) NOUVEAU(0): EDID for output HDMI-1
 (II) NOUVEAU(0): Output VGA-1 connected
 (II) NOUVEAU(0): Output HDMI-1 disconnected
 (II) NOUVEAU(0): Using exact sizes for initial modes
 (II) NOUVEAU(0): Output VGA-1 using initial mode 1024x768
 (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise
stated.
 (--) NOUVEAU(0): Virtual size is 1024x768 (pitch 0)
 (==) NOUVEAU(0): Backing store disabled
 (==) NOUVEAU(0): Silken mouse enabled
 (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
 (II) NOUVEAU(0): [XvMC] Extension initialized.
 (**) NOUVEAU(0): DPMS enabled
 (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
 (II) NOUVEAU(0): NVEnterVT is called.
 (II) NOUVEAU(0): Setting screen physical size to 304 x 228

* lspci -vs 02:00.0
02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8300] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 82e2
        Flags: bus master, fast devsel, latency 0, IRQ 23
        Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d8000000 (64-bit, prefetchable) [size=128M]
        Memory at d6000000 (64-bit, prefetchable) [size=32M]
        I/O ports at bc00 [size=128]
        Expansion ROM at fb3e0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Kernel driver in use: nouveau

* Relevant kernel config:
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y

* References:
[1] http://www.asus.com/Motherboards/M4N78_PRO/specifications/
[2] http://grml.org/changelogs/README-grml-2014.03/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404043604.f13a1.17969
Date: Sun, 29 Jun 2014 12:06:44 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - KMS FB hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80675">80675</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>KMS FB hand-over: no/black console on Nvidia MCP78S/C77/GeForce 8300 (10de:0848), X11 ok
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
          <td>walter.haidinger&#64;gmx.at
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
        <pre>Created <span class=""><a href="attachment.cgi?id=101974" name="attach_101974" title="3.15.2 dmesg log">attachment 101974</a> <a href="attachment.cgi?id=101974&amp;action=edit" title="3.15.2 dmesg log">[details]</a></span>
3.15.2 dmesg log

I've an AMD M4N78 PRO (Bios 1303) motherboard [1] here having
a MCP78S chipset (GeForce 8300 onboard, PCI-ID 10de:0848)
where I get all black consoles with KMS.

Please note that X11 works fine.
Fortunately no lockups when switching VTs either.

I think there is probably a problem with KMS hand-over.

Reproducible at least with:
* vanilla 64-bit kernel 3.15.2 and 3.14.8 
* openSUSE 13.1/x86_64 (3.11.10 kernel)
* grml64-2014.03 live CD with 3.13.6 kernel [2]

Yes, I've read:
<a href="http://nouveau.freedesktop.org/wiki/KernelModeSetting/">http://nouveau.freedesktop.org/wiki/KernelModeSetting/</a>

The consoles disappear (black only) once Nouveau switches
to its framebuffer. If KMS is disabled, the consoles stay
visible, i.e. vesa-fb works.

Console switching still works, i.e. switching to/from VT7
where X11 runs fine is possible. When switching, the
display goes black but switching back to VT7 restores
the X11 display.

When using fbcon=map:1 kernel parameter, behavior changes
just slightly when console switching: The X11 screen stays
(no switch to black screen) but seems to freeze. Switching
back to VT7 enables X11 again. 

Btw, the Linux Penguins shown for each CPU core are displayed
but are distorted and in false colors. They disappear after
about 10 seconds when the VT screens goes all black.

Below are more details:

* Relevant dmesg lines (see attachment for full):
[    9.017968] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0aa400a2
[    9.036288] nouveau  [  DEVICE][0000:02:00.0] Chipset: MCP77/MCP78 (NVAA)
[    9.056678] nouveau  [  DEVICE][0000:02:00.0] Family : NV50
[    9.073849] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[    9.135263] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[    9.154602] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[    9.174041] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[    9.192343] nouveau  [   VBIOS][0000:02:00.0] version 62.77.36.00.00
[    9.231562] nouveau  [     PFB][0000:02:00.0] RAM type: stolen system memory
[    9.252736] nouveau  [     PFB][0000:02:00.0] RAM size: 32 MiB
[    9.270265] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[    9.289229] nouveau  [    VOLT][0000:02:00.0] GPU voltage: 1100000uv
[    9.498063] tsc: Refined TSC clocksource calibration: 3299.999 MHz
[   10.543608] Switched to clocksource tsc
[   18.015935] nouveau  [  PTHERM][0000:02:00.0] FAN control: none / external
[   18.036606] nouveau  [  PTHERM][0000:02:00.0] fan management: automatic
[   18.056467] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   18.075056] nouveau  [     CLK][0000:02:00.0] 0f: core 500 MHz shader 1500
MHz vdec 500 MHz
[   18.100202] nouveau  [     CLK][0000:02:00.0] --: core 350 MHz shader 800
MHz vdec 350 MHz
[   18.125199] [TTM] Zone  kernel: Available graphics memory: 4062588 kiB
[   18.144801] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[   18.164410] [TTM] Initializing pool allocator
[   18.177527] [TTM] Initializing DMA pool allocator
[   18.191691] nouveau  [     DRM] VRAM: 32 MiB
[   18.204540] nouveau  [     DRM] GART: 1048576 MiB
[   18.218697] nouveau  [     DRM] TMDS table version 2.0
[   18.234151] nouveau  [     DRM] DCB version 4.0
[   18.247787] nouveau  [     DRM] DCB outp 00: 01000300 0000001e
[   18.265322] nouveau  [     DRM] DCB outp 01: 01011332 00020010
[   18.282855] nouveau  [     DRM] DCB conn 00: 00000100
[   18.298118] nouveau  [     DRM] DCB conn 01: 00001261
[   18.319941] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   18.339819] [drm] Driver supports precise vblank timestamp query.
[   18.366629] nouveau  [     DRM] MM: using M2MF for buffer copies
[   18.414966] nouveau  [     DRM] allocated 1024x768 fb: 0x50000, bo
ffff88022058e400
[   18.438055] fbcon: nouveaufb (fb0) is primary device
[   18.498687] random: nonblocking pool is initialized
[   18.505940] Console: switching to colour frame buffer device 128x48
[   18.555299] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   18.574317] nouveau 0000:02:00.0: registered panic notifier
[   18.590996] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on
minor 0

* Xorg.0.log, driver from openSUSE package
 xorg-x11-driver-video-nouveau-1.0.9-3.1.2.x86_64

 NOTE: Yes, this isn't the lastest but X11 is working. 
       This bug is about the console framebuffer.
       I'm adding the Xorg log because it might provide some clues.   

 X.Org X Server 1.14.3.901 (1.14.4 RC 1)
 Release Date: 2013-10-26
 Build Operating System: openSUSE SUSE LINUX
 Build Date: 17 April 2014  05:37:34AM
 (II) xfree86: Adding drm device (/dev/dri/card0)
 (--) PCI:*(0:2:0:0) 10de:0848:1043:82e2 rev 162, Mem &#64; 0xfa000000/16777216,
0xd8000000/134217728, 0xd6000000/33554432, I/O &#64; 0x0000bc00/128, BIOS &#64;
0x????????/131072
 (II) NOUVEAU driver
 (II) NOUVEAU driver for NVIDIA chipset families :
        RIVA TNT        (NV04)
        RIVA TNT2       (NV05)
        GeForce 256     (NV10)
        GeForce 2       (NV11, NV15)
        GeForce 4MX     (NV17, NV18)
        GeForce 3       (NV20)
        GeForce 4Ti     (NV25, NV28)
        GeForce FX      (NV3x)
        GeForce 6       (NV4x)
        GeForce 7       (G7x)
        GeForce 8       (G8x)
        GeForce GTX 200 (NVA0)
        GeForce GTX 400 (NVC0)
 (++) using VT number 7
 (II) [drm] nouveau interface version: 1.1.1
 (--) NOUVEAU(0): Chipset: &quot;NVIDIA NVAA&quot;
 (**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
 (==) NOUVEAU(0): RGB weight 888
 (==) NOUVEAU(0): Default visual is TrueColor
 (==) NOUVEAU(0): Using HW cursor
 (==) NOUVEAU(0): GLX sync to VBlank disabled.
 (==) NOUVEAU(0): Page flipping enabled
 (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
 (II) NOUVEAU(0): Output VGA-1 using monitor section Monitor[0]
 (II) NOUVEAU(0): EDID for output VGA-1
 (II) NOUVEAU(0): Printing probed modes for output VGA-1
 (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184 1344  768
771 777 806 -hsync -vsync (48.4 kHz eP)
 (II) NOUVEAU(0): EDID for output HDMI-1
 (II) NOUVEAU(0): Output VGA-1 connected
 (II) NOUVEAU(0): Output HDMI-1 disconnected
 (II) NOUVEAU(0): Using exact sizes for initial modes
 (II) NOUVEAU(0): Output VGA-1 using initial mode 1024x768
 (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise
stated.
 (--) NOUVEAU(0): Virtual size is 1024x768 (pitch 0)
 (==) NOUVEAU(0): Backing store disabled
 (==) NOUVEAU(0): Silken mouse enabled
 (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9 Textured Video.
 (II) NOUVEAU(0): [XvMC] Extension initialized.
 (**) NOUVEAU(0): DPMS enabled
 (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
 (II) NOUVEAU(0): NVEnterVT is called.
 (II) NOUVEAU(0): Setting screen physical size to 304 x 228

* lspci -vs 02:00.0
02:00.0 VGA compatible controller: NVIDIA Corporation C77 [GeForce 8300] (rev
a2) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 82e2
        Flags: bus master, fast devsel, latency 0, IRQ 23
        Memory at fa000000 (32-bit, non-prefetchable) [size=16M]
        Memory at d8000000 (64-bit, prefetchable) [size=128M]
        Memory at d6000000 (64-bit, prefetchable) [size=32M]
        I/O ports at bc00 [size=128]
        Expansion ROM at fb3e0000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
        Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
        Kernel driver in use: nouveau

* Relevant kernel config:
CONFIG_VT_CONSOLE=y
CONFIG_VT_CONSOLE_SLEEP=y
CONFIG_HW_CONSOLE=y
CONFIG_VT_HW_CONSOLE_BINDING=y
CONFIG_VGA_CONSOLE=y
CONFIG_DUMMY_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=y
CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y

* References:
[1] <a href="http://www.asus.com/Motherboards/M4N78_PRO/specifications/">http://www.asus.com/Motherboards/M4N78_PRO/specifications/</a>
[2] <a href="http://grml.org/changelogs/README-grml-2014.03/">http://grml.org/changelogs/README-grml-2014.03/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404043604.f13a1.17969--

--===============1785507939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1785507939==--
