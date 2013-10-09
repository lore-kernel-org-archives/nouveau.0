From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70326] New: [NVF0] Kernel/Driver fails to initialize
 acceleration on GTX Titan
Date: Wed, 09 Oct 2013 18:12:53 +0000
Message-ID: <bug-70326-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1955520904=="
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


--===============1955520904==
Content-Type: multipart/alternative; boundary="1381342373.d3526BC01.10548"; charset="us-ascii"


--1381342373.d3526BC01.10548
Date: Wed, 9 Oct 2013 18:12:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70326

          Priority: medium
            Bug ID: 70326
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVF0] Kernel/Driver fails to initialize acceleration
                    on GTX Titan
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bobahu4-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Using Ubuntu 13.10, 3.11 kernel, Nouveau 1.0.9

MacPro3,1, GTX Titan, efi boot with grub2, boot screen on GTX Titan is present
durring boot.

There is no acceleration because something failed, log from kernel:

[   16.544736] fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing
generic driver
[   16.545025] nouveau 0000:02:00.0: enabling device (0006 -> 0007)
[   16.545415] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0f0050a1
[   16.545419] nouveau  [  DEVICE][0000:02:00.0] Chipset: GK110 (NVF0)
[   16.545420] nouveau  [  DEVICE][0000:02:00.0] Family : NVE0
[   16.547246] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[   16.622062] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[   16.622066] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[   16.622165] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[   16.622168] nouveau  [   VBIOS][0000:02:00.0] version 80.10.2c.00.02
[   16.622653] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[   16.622657] nouveau  [     PFB][0000:02:00.0] RAM size: 6144 MiB
[   16.622658] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[   16.647770] nouveau E[  PTHERM][0000:02:00.0] GPIO 16 unknown PWM:
0x0004b05e
[   16.647776] nouveau  [  PTHERM][0000:02:00.0] FAN control: toggle
[   16.647783] nouveau  [  PTHERM][0000:02:00.0] fan management: disabled
[   16.647786] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   16.681028] nouveau W[  PGRAPH][0000:02:00.0] disabled, PGRAPH=1 to enable
[   16.681205] nouveau  [     DRM] VRAM: 6144 MiB
[   16.681207] nouveau  [     DRM] GART: 1048576 MiB
[   16.681212] nouveau  [     DRM] TMDS table version 2.0
[   16.681213] nouveau  [     DRM] DCB version 4.0
[   16.681216] nouveau  [     DRM] DCB outp 00: 01000102 00020030
[   16.681218] nouveau  [     DRM] DCB outp 01: 02000100 00000000
[   16.681220] nouveau  [     DRM] DCB outp 02: 08011282 00020030
[   16.681222] nouveau  [     DRM] DCB outp 04: 02022462 00020010
[   16.681223] nouveau  [     DRM] DCB outp 05: 048338b6 0f420010
[   16.681225] nouveau  [     DRM] DCB outp 06: 04033872 00020010
[   16.681227] nouveau  [     DRM] DCB conn 00: 00001030
[   16.681229] nouveau  [     DRM] DCB conn 01: 00020131
[   16.681231] nouveau  [     DRM] DCB conn 02: 00002261
[   16.681232] nouveau  [     DRM] DCB conn 03: 00010346
[   16.682400] nouveau W[     DRM] voltage table 0x50 unknown
[   16.682407] nouveau  [     DRM] 4 available performance level(s)
[   16.682410] nouveau  [     DRM] 0: core 162MHz shader 324MHz memory 648MHz
voltage 140mV
[   16.682412] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz
voltage 120mV
[   16.682415] nouveau  [     DRM] 2: core 1502MHz shader 3004MHz memory
1080MHz voltage 100mV
[   16.682418] nouveau  [     DRM] 3: core 1502MHz shader 3004MHz memory
1080MHz voltage 80mV
[   16.682420] nouveau  [     DRM] c: fanspeed 100%
[   16.691147] nouveau E[   PFIFO][0000:02:00.0] unsupported engines 0x00000001
[   16.691259] nouveau E[     DRM] failed to create kernel channel, -22
[   16.792388] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff8802ef59a400
[   16.792480] fbcon: nouveaufb (fb0) is primary device
[   16.852787] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   16.852789] nouveau 0000:02:00.0: registered panic notifier
[   16.852794] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on
minor 0
[   27.276369] nouveau W[  PGRAPH][0000:02:00.0] disabled, PGRAPH=1 to enable
[   29.328898] nouveau W[  PGRAPH][0000:02:00.0] disabled, PGRAPH=1 to enable


from xorg.log:

[    28.953] (II) NOUVEAU driver Date:   Wed Jul 31 10:51:03 2013 +1000
[    28.953] (II) NOUVEAU driver for NVIDIA chipset families :
[    28.953] (II) [drm] nouveau interface version: 1.1.1
[    28.964] (--) NOUVEAU(0): Chipset: "NVIDIA NVF0"
[    28.964] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
[    28.964] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    28.964] (==) NOUVEAU(0): RGB weight 888
[    28.964] (==) NOUVEAU(0): Default visual is TrueColor
[    28.964] (==) NOUVEAU(0): Using HW cursor
[    28.964] (==) NOUVEAU(0): GLX sync to VBlank enabled.
[    28.964] (==) NOUVEAU(0): Page flipping enabled
[    28.964] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    28.997] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    28.999] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[    29.001] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[    29.128] (II) NOUVEAU(0): Output DP-1 has no monitor section
[    29.157] (II) NOUVEAU(0): EDID for output DVI-I-1
[    29.157] (II) NOUVEAU(0): Manufacturer: DEL  Model: f040  Serial#:
1093808205
[    29.157] (II) NOUVEAU(0): Year: 2011  Week: 35
[    29.157] (II) NOUVEAU(0): EDID Version: 1.3
[    29.157] (II) NOUVEAU(0): Digital Display Input
[    29.157] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 48  vert.: 27
[    29.157] (II) NOUVEAU(0): Gamma: 2.20
[    29.157] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    29.157] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    29.157] (II) NOUVEAU(0): First detailed timing is preferred mode
[    29.157] (II) NOUVEAU(0): redX: 0.641 redY: 0.338   greenX: 0.315 greenY:
0.629
[    29.157] (II) NOUVEAU(0): blueX: 0.159 blueY: 0.059   whiteX: 0.313 whiteY:
0.329
[    29.157] (II) NOUVEAU(0): Supported established timings:
[    29.157] (II) NOUVEAU(0): 720x400@70Hz
[    29.157] (II) NOUVEAU(0): 640x480@60Hz
[    29.157] (II) NOUVEAU(0): 640x480@75Hz
[    29.157] (II) NOUVEAU(0): 800x600@60Hz
[    29.157] (II) NOUVEAU(0): 800x600@75Hz
[    29.157] (II) NOUVEAU(0): 1024x768@60Hz
[    29.157] (II) NOUVEAU(0): 1024x768@75Hz
[    29.157] (II) NOUVEAU(0): 1280x1024@75Hz
[    29.157] (II) NOUVEAU(0): Manufacturer's mask: 0
[    29.157] (II) NOUVEAU(0): Supported standard timings:
[    29.157] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[    29.157] (II) NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[    29.157] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1080  refresh: 60  vid:
49361
[    29.157] (II) NOUVEAU(0): Supported detailed timing:
[    29.157] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  477 x 268 mm
[    29.157] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end 2052
h_blank_end 2200 h_border: 0
[    29.157] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end 1089
v_blanking: 1125 v_border: 0
[    29.157] (II) NOUVEAU(0): Serial No: DWYC018PA20M
[    29.157] (II) NOUVEAU(0): Monitor name: DELL S2230MX
[    29.157] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max:
83 kHz, PixClock max 175 MHz
[    29.157] (II) NOUVEAU(0): EDID (in hex):
[    29.157] (II) NOUVEAU(0):     00ffffffffffff0010ac40f04d303241
[    29.157] (II) NOUVEAU(0):     2315010380301b78ea2cc5a45650a128
[    29.157] (II) NOUVEAU(0):     0f5054a54b00714f8180d1c001010101
[    29.157] (II) NOUVEAU(0):     010101010101023a801871382d40582c
[    29.157] (II) NOUVEAU(0):     4500dd0c1100001e000000ff00445759
[    29.157] (II) NOUVEAU(0):     43303138504132304d0a000000fc0044
[    29.157] (II) NOUVEAU(0):     454c4c2053323233304d580a000000fd
[    29.157] (II) NOUVEAU(0):     00384c1e5311000a2020202020200007
[    29.157] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    29.157] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    29.158] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    29.160] (II) NOUVEAU(0): EDID for output DVI-D-1
[    29.162] (II) NOUVEAU(0): EDID for output HDMI-1
[    29.288] (II) NOUVEAU(0): EDID for output DP-1
[    29.288] (II) NOUVEAU(0): Output DVI-I-1 connected
[    29.288] (II) NOUVEAU(0): Output DVI-D-1 disconnected
[    29.288] (II) NOUVEAU(0): Output HDMI-1 disconnected
[    29.288] (II) NOUVEAU(0): Output DP-1 disconnected
[    29.288] (II) NOUVEAU(0): Using exact sizes for initial modes
[    29.288] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1920x1080
[    29.288] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    29.288] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[    29.288] (**) NOUVEAU(0):  Driver mode "1920x1080": 148.5 MHz (scaled from
0.0 MHz), 67.5 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "1920x1080"x60.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    29.288] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[    29.288] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    29.288] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[    29.288] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    29.288] (==) NOUVEAU(0): DPI set to (96, 96)
[    29.328] (EE) NOUVEAU(0): Error creating GPU channel: -19
[    29.328] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel
[    29.340] (==) NOUVEAU(0): Backing store disabled
[    29.340] (==) NOUVEAU(0): Silken mouse enabled
[    29.340] (==) NOUVEAU(0): DPMS enabled
[    29.340] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    29.458] (II) NOUVEAU(0): NVEnterVT is called.
[    29.464] (II) NOUVEAU(0): Setting screen physical size to 508 x 285
[    33.255] (II) NOUVEAU(0): EDID vendor "DEL", prod id 61504
[    33.255] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    33.255] (II) NOUVEAU(0): Using EDID range info for vertical refresh

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381342373.d3526BC01.10548
Date: Wed, 9 Oct 2013 18:12:53 +0000
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
   title="NEW --- - [NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70326">70326</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVF0] Kernel/Driver fails to initialize acceleration on GTX Titan
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
          <td>bobahu4&#64;gmail.com
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
        <pre>Using Ubuntu 13.10, 3.11 kernel, Nouveau 1.0.9

MacPro3,1, GTX Titan, efi boot with grub2, boot screen on GTX Titan is present
durring boot.

There is no acceleration because something failed, log from kernel:

[   16.544736] fb: conflicting fb hw usage nouveaufb vs EFI VGA - removing
generic driver
[   16.545025] nouveau 0000:02:00.0: enabling device (0006 -&gt; 0007)
[   16.545415] nouveau  [  DEVICE][0000:02:00.0] BOOT0  : 0x0f0050a1
[   16.545419] nouveau  [  DEVICE][0000:02:00.0] Chipset: GK110 (NVF0)
[   16.545420] nouveau  [  DEVICE][0000:02:00.0] Family : NVE0
[   16.547246] nouveau  [   VBIOS][0000:02:00.0] checking PRAMIN for image...
[   16.622062] nouveau  [   VBIOS][0000:02:00.0] ... appears to be valid
[   16.622066] nouveau  [   VBIOS][0000:02:00.0] using image from PRAMIN
[   16.622165] nouveau  [   VBIOS][0000:02:00.0] BIT signature found
[   16.622168] nouveau  [   VBIOS][0000:02:00.0] version 80.10.2c.00.02
[   16.622653] nouveau  [     PFB][0000:02:00.0] RAM type: GDDR5
[   16.622657] nouveau  [     PFB][0000:02:00.0] RAM size: 6144 MiB
[   16.622658] nouveau  [     PFB][0000:02:00.0]    ZCOMP: 0 tags
[   16.647770] nouveau E[  PTHERM][0000:02:00.0] GPIO 16 unknown PWM:
0x0004b05e
[   16.647776] nouveau  [  PTHERM][0000:02:00.0] FAN control: toggle
[   16.647783] nouveau  [  PTHERM][0000:02:00.0] fan management: disabled
[   16.647786] nouveau  [  PTHERM][0000:02:00.0] internal sensor: yes
[   16.681028] nouveau W[  PGRAPH][0000:02:00.0] disabled, PGRAPH=1 to enable
[   16.681205] nouveau  [     DRM] VRAM: 6144 MiB
[   16.681207] nouveau  [     DRM] GART: 1048576 MiB
[   16.681212] nouveau  [     DRM] TMDS table version 2.0
[   16.681213] nouveau  [     DRM] DCB version 4.0
[   16.681216] nouveau  [     DRM] DCB outp 00: 01000102 00020030
[   16.681218] nouveau  [     DRM] DCB outp 01: 02000100 00000000
[   16.681220] nouveau  [     DRM] DCB outp 02: 08011282 00020030
[   16.681222] nouveau  [     DRM] DCB outp 04: 02022462 00020010
[   16.681223] nouveau  [     DRM] DCB outp 05: 048338b6 0f420010
[   16.681225] nouveau  [     DRM] DCB outp 06: 04033872 00020010
[   16.681227] nouveau  [     DRM] DCB conn 00: 00001030
[   16.681229] nouveau  [     DRM] DCB conn 01: 00020131
[   16.681231] nouveau  [     DRM] DCB conn 02: 00002261
[   16.681232] nouveau  [     DRM] DCB conn 03: 00010346
[   16.682400] nouveau W[     DRM] voltage table 0x50 unknown
[   16.682407] nouveau  [     DRM] 4 available performance level(s)
[   16.682410] nouveau  [     DRM] 0: core 162MHz shader 324MHz memory 648MHz
voltage 140mV
[   16.682412] nouveau  [     DRM] 1: core 405MHz shader 810MHz memory 1080MHz
voltage 120mV
[   16.682415] nouveau  [     DRM] 2: core 1502MHz shader 3004MHz memory
1080MHz voltage 100mV
[   16.682418] nouveau  [     DRM] 3: core 1502MHz shader 3004MHz memory
1080MHz voltage 80mV
[   16.682420] nouveau  [     DRM] c: fanspeed 100%
[   16.691147] nouveau E[   PFIFO][0000:02:00.0] unsupported engines 0x00000001
[   16.691259] nouveau E[     DRM] failed to create kernel channel, -22
[   16.792388] nouveau  [     DRM] allocated 1920x1080 fb: 0x60000, bo
ffff8802ef59a400
[   16.792480] fbcon: nouveaufb (fb0) is primary device
[   16.852787] nouveau 0000:02:00.0: fb0: nouveaufb frame buffer device
[   16.852789] nouveau 0000:02:00.0: registered panic notifier
[   16.852794] [drm] Initialized nouveau 1.1.1 20120801 for 0000:02:00.0 on
minor 0
[   27.276369] nouveau W[  PGRAPH][0000:02:00.0] disabled, PGRAPH=1 to enable
[   29.328898] nouveau W[  PGRAPH][0000:02:00.0] disabled, PGRAPH=1 to enable


from xorg.log:

[    28.953] (II) NOUVEAU driver Date:   Wed Jul 31 10:51:03 2013 +1000
[    28.953] (II) NOUVEAU driver for NVIDIA chipset families :
[    28.953] (II) [drm] nouveau interface version: 1.1.1
[    28.964] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NVF0&quot;
[    28.964] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
[    28.964] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    28.964] (==) NOUVEAU(0): RGB weight 888
[    28.964] (==) NOUVEAU(0): Default visual is TrueColor
[    28.964] (==) NOUVEAU(0): Using HW cursor
[    28.964] (==) NOUVEAU(0): GLX sync to VBlank enabled.
[    28.964] (==) NOUVEAU(0): Page flipping enabled
[    28.964] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    28.997] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    28.999] (II) NOUVEAU(0): Output DVI-D-1 has no monitor section
[    29.001] (II) NOUVEAU(0): Output HDMI-1 has no monitor section
[    29.128] (II) NOUVEAU(0): Output DP-1 has no monitor section
[    29.157] (II) NOUVEAU(0): EDID for output DVI-I-1
[    29.157] (II) NOUVEAU(0): Manufacturer: DEL  Model: f040  Serial#:
1093808205
[    29.157] (II) NOUVEAU(0): Year: 2011  Week: 35
[    29.157] (II) NOUVEAU(0): EDID Version: 1.3
[    29.157] (II) NOUVEAU(0): Digital Display Input
[    29.157] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 48  vert.: 27
[    29.157] (II) NOUVEAU(0): Gamma: 2.20
[    29.157] (II) NOUVEAU(0): DPMS capabilities: StandBy Suspend Off
[    29.157] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    29.157] (II) NOUVEAU(0): First detailed timing is preferred mode
[    29.157] (II) NOUVEAU(0): redX: 0.641 redY: 0.338   greenX: 0.315 greenY:
0.629
[    29.157] (II) NOUVEAU(0): blueX: 0.159 blueY: 0.059   whiteX: 0.313 whiteY:
0.329
[    29.157] (II) NOUVEAU(0): Supported established timings:
[    29.157] (II) NOUVEAU(0): 720x400&#64;70Hz
[    29.157] (II) NOUVEAU(0): 640x480&#64;60Hz
[    29.157] (II) NOUVEAU(0): 640x480&#64;75Hz
[    29.157] (II) NOUVEAU(0): 800x600&#64;60Hz
[    29.157] (II) NOUVEAU(0): 800x600&#64;75Hz
[    29.157] (II) NOUVEAU(0): 1024x768&#64;60Hz
[    29.157] (II) NOUVEAU(0): 1024x768&#64;75Hz
[    29.157] (II) NOUVEAU(0): 1280x1024&#64;75Hz
[    29.157] (II) NOUVEAU(0): Manufacturer's mask: 0
[    29.157] (II) NOUVEAU(0): Supported standard timings:
[    29.157] (II) NOUVEAU(0): #0: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[    29.157] (II) NOUVEAU(0): #1: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[    29.157] (II) NOUVEAU(0): #2: hsize: 1920  vsize 1080  refresh: 60  vid:
49361
[    29.157] (II) NOUVEAU(0): Supported detailed timing:
[    29.157] (II) NOUVEAU(0): clock: 148.5 MHz   Image Size:  477 x 268 mm
[    29.157] (II) NOUVEAU(0): h_active: 1920  h_sync: 2008  h_sync_end 2052
h_blank_end 2200 h_border: 0
[    29.157] (II) NOUVEAU(0): v_active: 1080  v_sync: 1084  v_sync_end 1089
v_blanking: 1125 v_border: 0
[    29.157] (II) NOUVEAU(0): Serial No: DWYC018PA20M
[    29.157] (II) NOUVEAU(0): Monitor name: DELL S2230MX
[    29.157] (II) NOUVEAU(0): Ranges: V min: 56 V max: 76 Hz, H min: 30 H max:
83 kHz, PixClock max 175 MHz
[    29.157] (II) NOUVEAU(0): EDID (in hex):
[    29.157] (II) NOUVEAU(0):     00ffffffffffff0010ac40f04d303241
[    29.157] (II) NOUVEAU(0):     2315010380301b78ea2cc5a45650a128
[    29.157] (II) NOUVEAU(0):     0f5054a54b00714f8180d1c001010101
[    29.157] (II) NOUVEAU(0):     010101010101023a801871382d40582c
[    29.157] (II) NOUVEAU(0):     4500dd0c1100001e000000ff00445759
[    29.157] (II) NOUVEAU(0):     43303138504132304d0a000000fc0044
[    29.157] (II) NOUVEAU(0):     454c4c2053323233304d580a000000fd
[    29.157] (II) NOUVEAU(0):     00384c1e5311000a2020202020200007
[    29.157] (II) NOUVEAU(0): Printing probed modes for output DVI-I-1
[    29.157] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    29.158] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    29.158] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    29.160] (II) NOUVEAU(0): EDID for output DVI-D-1
[    29.162] (II) NOUVEAU(0): EDID for output HDMI-1
[    29.288] (II) NOUVEAU(0): EDID for output DP-1
[    29.288] (II) NOUVEAU(0): Output DVI-I-1 connected
[    29.288] (II) NOUVEAU(0): Output DVI-D-1 disconnected
[    29.288] (II) NOUVEAU(0): Output HDMI-1 disconnected
[    29.288] (II) NOUVEAU(0): Output DP-1 disconnected
[    29.288] (II) NOUVEAU(0): Using exact sizes for initial modes
[    29.288] (II) NOUVEAU(0): Output DVI-I-1 using initial mode 1920x1080
[    29.288] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    29.288] (--) NOUVEAU(0): Virtual size is 1920x1080 (pitch 0)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;1920x1080&quot;: 148.5 MHz (scaled from
0.0 MHz), 67.5 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;1920x1080&quot;x60.0  148.50  1920 2008 2052
2200  1080 1084 1089 1125 +hsync +vsync (67.5 kHz eP)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 135.0 MHz (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 108.0 MHz (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;1152x864&quot;: 108.0 MHz (scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    29.288] (**) NOUVEAU(0):  Driver mode &quot;720x400&quot;: 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[    29.288] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    29.288] (==) NOUVEAU(0): DPI set to (96, 96)
[    29.328] (EE) NOUVEAU(0): Error creating GPU channel: -19
[    29.328] (EE) NOUVEAU(0): Error initialising acceleration.  Falling back to
NoAccel
[    29.340] (==) NOUVEAU(0): Backing store disabled
[    29.340] (==) NOUVEAU(0): Silken mouse enabled
[    29.340] (==) NOUVEAU(0): DPMS enabled
[    29.340] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    29.458] (II) NOUVEAU(0): NVEnterVT is called.
[    29.464] (II) NOUVEAU(0): Setting screen physical size to 508 x 285
[    33.255] (II) NOUVEAU(0): EDID vendor &quot;DEL&quot;, prod id 61504
[    33.255] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    33.255] (II) NOUVEAU(0): Using EDID range info for vertical refresh</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381342373.d3526BC01.10548--

--===============1955520904==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1955520904==--
