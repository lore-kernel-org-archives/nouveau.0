From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33986] mouse freeze randomly but periodical
Date: Sun, 20 Feb 2011 08:09:29 -0800 (PST)
Message-ID: <20110220160929.4A8DE13000B@annarchy.freedesktop.org>
References: <bug-33986-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33986-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33986

--- Comment #4 from Olivier Jaulent <ojaulent-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-20 08:09:28 PST ---
I'm on a laptop (MSI) and the behaviour for me is a freeze every 10 seconds.
This happen only when my external screen is plugged, I do not have to use it,
just plug it and the bug appear. If I unplug it the bud disappear.

I'm using hdmi connectivity.

I found similar bugs on internet (first one from Linus Torvald):
- http://lkml.org/lkml/2010/8/15/111
- https://bugs.launchpad.net/ubuntu/+source/linux/+bug/653815
- https://bugs.freedesktop.org/show_bug.cgi?id=29536

I'm under Ubuntu Natty (Alpha) : 
$ cat /proc/version
Linux version 2.6.38-4-generic (buildd@crested) (gcc version 4.5.2
(Ubuntu/Linaro 4.5.2-2ubuntu3) ) #31-Ubuntu SMP Wed Feb 16 23:49:38 UTC 2011

$ dpkg -l *xorg*nouveau*
[...]
ii  xserver-xorg-video-nouveau              
1:0.0.16+git20110107+b795ca6e-0ubuntu4   X.Org X server -- Nouveau display
driver (experimental)

$ lspci | grep VGA
01:00.0 VGA compatible controller: nVidia Corporation G84 [GeForce 8600M GT]
(rev a1)

$ dmesg | egrep -i 'nouveau|drm'
[   23.419388] [drm] Initialized drm 1.1.0 20060810
[   23.775460] nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
[   23.775470] nouveau 0000:01:00.0: setting latency timer to 64
[   23.805484] [drm] nouveau 0000:01:00.0: Detected an NV50 generation card
(0x084700a2)
[   23.815296] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PRAMIN
[   23.904303] [drm] nouveau 0000:01:00.0: ... BIOS checksum invalid
[   23.904307] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PROM
[   23.904312] [drm] nouveau 0000:01:00.0: ... BIOS signature not found
[   23.904313] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from
PCIROM
[   23.904421] [drm] nouveau 0000:01:00.0: ... appears to be valid
[   23.904424] [drm] nouveau 0000:01:00.0: BIT BIOS found
[   23.904427] [drm] nouveau 0000:01:00.0: Bios version 60.84.5d.00
[   23.904430] [drm] nouveau 0000:01:00.0: TMDS table version 2.0
[   23.904432] [drm] nouveau 0000:01:00.0: Found Display Configuration Block
version 4.0
[   23.904435] [drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000323 00010034
[   23.904438] [drm] nouveau 0000:01:00.0: Raw DCB entry 1: 02012300 00000028
[   23.904440] [drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02026312 00020020
[   23.904442] [drm] nouveau 0000:01:00.0: Raw DCB entry 3: 010333f1 00c0c080
[   23.904444] [drm] nouveau 0000:01:00.0: Raw DCB entry 4: 0000000e 00000000
[   23.904447] [drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 14
2
[   23.904449] [drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag
0xff
[   23.904452] [drm] nouveau 0000:01:00.0:   1: 0x00001130: type 0x30 idx 1 tag
0x07
[   23.904454] [drm] nouveau 0000:01:00.0:   2: 0x00000200: type 0x00 idx 2 tag
0xff
[   23.904456] [drm] nouveau 0000:01:00.0:   3: 0x00000310: type 0x10 idx 3 tag
0xff
[   23.904458] [drm] nouveau 0000:01:00.0:   4: 0x00000311: type 0x11 idx 4 tag
0xff
[   23.904461] [drm] nouveau 0000:01:00.0:   5: 0x00000313: type 0x13 idx 5 tag
0xff
[   23.904463] [drm] nouveau 0000:01:00.0:   6: 0x00002461: type 0x61 idx 6 tag
0x08
[   23.904468] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset
0xC524
[   23.904471] [drm] nouveau 0000:01:00.0: ========== unknown indexed io port
0x7868 ==========
[   23.904489] [drm] nouveau 0000:01:00.0: 0xC529: Init table command not
found: 0x60
[   23.904503] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset
0xC881
[   23.904505] [drm] nouveau 0000:01:00.0: 0xC881: Init table command not
found: 0x00
[   23.904520] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset
0xD4C5
[   23.904529] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset
0xD5B7
[   23.922910] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset
0xD7EA
[   23.922914] [drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset
0xD84F
[   23.950020] [drm] nouveau 0000:01:00.0: 0xD84F: Condition still not met
after 20ms, skipping following opcodes
[   23.950039] [drm] nouveau 0000:01:00.0: voltage table 0x00 unknown
[   23.984238] [drm] nouveau 0000:01:00.0: memory timing table 0x0c unknown
[   23.984241] [drm] nouveau 0000:01:00.0: 0 available performance level(s)
[   23.984257] [drm] nouveau 0000:01:00.0: c: memory 199MHz core 275MHz shader
550MHz
[   23.984390] [drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[   24.009550] [drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[   24.043201] [drm] nouveau 0000:01:00.0: DCB encoder 1 unknown
[   24.043204] [drm] nouveau 0000:01:00.0: TV-1 has no encoders, removing
[   24.043974] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[   24.043976] [drm] No driver support for vblank timestamp query.
[   24.051076] [drm] nouveau 0000:01:00.0: ACPI backlight interface available,
not registering our own
[   24.336690] [drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x60000000,
bo ffff8800b3797000
[   24.344466] fb0: nouveaufb frame buffer device
[   24.344468] drm: registered panic notifier
[   24.344475] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on
minor 0
[  229.438975] [drm] nouveau 0000:01:00.0: plugged HDMI-A-1
[  347.112424] [drm] nouveau 0000:01:00.0: unplugged HDMI-A-1
[  347.222395] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 19
[  347.222401] [drm:drm_edid_block_valid] *ERROR* Raw EDID:
[  347.226280] [drm] nouveau 0000:01:00.0: DDC responded, but no EDID for
HDMI-A-1
[  398.564613] [drm] nouveau 0000:01:00.0: plugged HDMI-A-1
[  502.432165] [drm] nouveau 0000:01:00.0: unplugged HDMI-A-1
[  502.541661] [drm:drm_edid_block_valid] *ERROR* EDID checksum is invalid,
remainder is 65
[  502.541665] [drm:drm_edid_block_valid] *ERROR* Raw EDID:
[  502.545488] [drm] nouveau 0000:01:00.0: DDC responded, but no EDID for
HDMI-A-1
[ 1126.293965] [drm] nouveau 0000:01:00.0: plugged HDMI-A-1

$ grep -i nouveau /var/log/Xorg.0.log
[    24.641] (==) Matched nouveau as autoconfigured driver 1
[    24.641] (II) LoadModule: "nouveau"
[    24.641] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    24.641] (II) Module nouveau: vendor="X.Org Foundation"
[    24.642] (II) NOUVEAU driver Date:   Fri Jan 7 13:33:36 2011 +1000
[    24.642] (II) NOUVEAU driver for NVIDIA chipset families :
[    24.643] (II) [drm] nouveau interface version: 0.0.16
[    24.643] (II) Loading /usr/lib/xorg/modules/drivers/nouveau_drv.so
[    24.643] (II) NOUVEAU(0): Loaded DRI module
[    24.643] (--) NOUVEAU(0): Chipset: "NVIDIA NV84"
[    24.643] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
[    24.643] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    24.643] (==) NOUVEAU(0): RGB weight 888
[    24.643] (==) NOUVEAU(0): Default visual is TrueColor
[    24.643] (==) NOUVEAU(0): Using HW cursor
[    24.643] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    24.790] (II) NOUVEAU(0): Output LVDS-1 using monitor section LVDS-1
[    24.790] (**) NOUVEAU(0): Option "PreferredMode" "1680x1050"
[    24.896] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[    24.904] (II) NOUVEAU(0): Output HDMI-1 using monitor section HDMI-1
[    24.904] (**) NOUVEAU(0): Option "PreferredMode" "1920x1080"
[    24.904] (**) NOUVEAU(0): Option "RightOf" "LVDS-1"
[    25.050] (II) NOUVEAU(0): EDID for output LVDS-1
[    25.050] (II) NOUVEAU(0): Manufacturer: SEC  Model: 3446  Serial#: 0
[    25.050] (II) NOUVEAU(0): Year: 2006  Week: 0
[    25.050] (II) NOUVEAU(0): EDID Version: 1.3
[    25.050] (II) NOUVEAU(0): Digital Display Input
[    25.050] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 33  vert.: 21
[    25.050] (II) NOUVEAU(0): Gamma: 2.20
[    25.050] (II) NOUVEAU(0): No DPMS capabilities specified
[    25.050] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    25.050] (II) NOUVEAU(0): First detailed timing is preferred mode
[    25.050] (II) NOUVEAU(0): redX: 0.580 redY: 0.340   greenX: 0.310 greenY:
0.550
[    25.050] (II) NOUVEAU(0): blueX: 0.155 blueY: 0.155   whiteX: 0.313 whiteY:
0.329
[    25.050] (II) NOUVEAU(0): Manufacturer's mask: 0
[    25.050] (II) NOUVEAU(0): Supported detailed timing:
[    25.050] (II) NOUVEAU(0): clock: 121.0 MHz   Image Size:  331 x 207 mm
[    25.050] (II) NOUVEAU(0): h_active: 1680  h_sync: 1704  h_sync_end 1792
h_blank_end 1876 h_border: 0
[    25.050] (II) NOUVEAU(0): v_active: 1050  v_sync: 1051  v_sync_end 1054
v_blanking: 1065 v_border: 0
[    25.050] (II) NOUVEAU(0): Unknown vendor-specific block f
[    25.050] (II) NOUVEAU(0):  SAMSUNG
[    25.050] (II) NOUVEAU(0):  LTN154P4-L01
[    25.050] (II) NOUVEAU(0): EDID (in hex):
[    25.050] (II) NOUVEAU(0):     00ffffffffffff004ca3463400000000
[    25.050] (II) NOUVEAU(0):     00100103802115780a87f594574f8c27
[    25.050] (II) NOUVEAU(0):     27505400000001010101010101010101
[    25.050] (II) NOUVEAU(0):     010101010101442f90c4601a0f401858
[    25.050] (II) NOUVEAU(0):     13004bcf100000190000000f00000000
[    25.050] (II) NOUVEAU(0):     00000000003cd2026400000000fe0053
[    25.050] (II) NOUVEAU(0):     414d53554e470a2020202020000000fe
[    25.050] (II) NOUVEAU(0):     004c544e31353450342d4c30310a0080
[    25.050] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[    25.050] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    25.050] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    25.050] (II) NOUVEAU(0): Printing probed modes for output LVDS-1
[    25.050] (II) NOUVEAU(0): Modeline "1680x1050"x60.6  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    25.050] (II) NOUVEAU(0): Modeline "1680x1050"x60.9  148.75  1680 1784 1960
2240  1050 1053 1059 1090 -hsync +vsync (66.4 kHz)
[    25.050] (II) NOUVEAU(0): Modeline "1400x1050"x60.9  123.75  1400 1488 1632
1864  1050 1053 1057 1090 -hsync +vsync (66.4 kHz)
[    25.050] (II) NOUVEAU(0): Modeline "1280x1024"x60.9  110.75  1280 1368 1496
1712  1024 1027 1034 1063 -hsync +vsync (64.7 kHz)
[    25.050] (II) NOUVEAU(0): Modeline "1280x960"x60.9  103.00  1280 1360 1488
1696  960 963 967 997 -hsync +vsync (60.7 kHz)
[    25.050] (II) NOUVEAU(0): Modeline "1152x864"x60.8   83.00  1152 1216 1336
1520  864 867 871 898 -hsync +vsync (54.6 kHz)
[    25.051] (II) NOUVEAU(0): Modeline "1024x768"x60.8   65.25  1024 1080 1184
1344  768 771 775 798 -hsync +vsync (48.5 kHz)
[    25.051] (II) NOUVEAU(0): Modeline "800x600"x60.6   38.75  800 832 912 1024
 600 603 607 624 -hsync +vsync (37.8 kHz)
[    25.051] (II) NOUVEAU(0): Modeline "640x480"x60.6   24.25  640 664 720 800 
480 483 487 500 -hsync +vsync (30.3 kHz)
[    25.051] (II) NOUVEAU(0): Modeline "720x400"x60.9   22.75  720 744 808 896 
400 403 413 417 -hsync +vsync (25.4 kHz)
[    25.051] (II) NOUVEAU(0): Modeline "640x400"x60.7   20.25  640 664 720 800 
400 403 409 417 -hsync +vsync (25.3 kHz)
[    25.051] (II) NOUVEAU(0): Modeline "640x350"x60.6   17.75  640 664 720 800 
350 353 363 366 -hsync +vsync (22.2 kHz)
[    25.150] (II) NOUVEAU(0): EDID for output VGA-1
[    25.158] (II) NOUVEAU(0): EDID for output HDMI-1
[    25.158] (II) NOUVEAU(0): Output LVDS-1 connected
[    25.158] (II) NOUVEAU(0): Output VGA-1 disconnected
[    25.158] (II) NOUVEAU(0): Output HDMI-1 disconnected
[    25.158] (II) NOUVEAU(0): Using user preference for initial modes
[    25.158] (II) NOUVEAU(0): Output LVDS-1 using initial mode 1680x1050
[    25.158] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    25.158] (--) NOUVEAU(0): Virtual size is 1680x1050 (pitch 0)
[    25.158] (**) NOUVEAU(0):  Driver mode "1680x1050": 121.0 MHz (scaled from
0.0 MHz), 64.5 kHz, 60.6 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1680x1050"x60.6  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "1680x1050": 148.8 MHz (scaled from
0.0 MHz), 66.4 kHz, 60.9 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1680x1050"x60.9  148.75  1680 1784 1960
2240  1050 1053 1059 1090 -hsync +vsync (66.4 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "1400x1050": 123.8 MHz (scaled from
0.0 MHz), 66.4 kHz, 60.9 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1400x1050"x60.9  123.75  1400 1488 1632
1864  1050 1053 1057 1090 -hsync +vsync (66.4 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "1280x1024": 110.8 MHz (scaled from
0.0 MHz), 64.7 kHz, 60.9 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1280x1024"x60.9  110.75  1280 1368 1496
1712  1024 1027 1034 1063 -hsync +vsync (64.7 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "1280x960": 103.0 MHz (scaled from
0.0 MHz), 60.7 kHz, 60.9 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1280x960"x60.9  103.00  1280 1360 1488
1696  960 963 967 997 -hsync +vsync (60.7 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "1152x864": 83.0 MHz (scaled from
0.0 MHz), 54.6 kHz, 60.8 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1152x864"x60.8   83.00  1152 1216 1336
1520  864 867 871 898 -hsync +vsync (54.6 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "1024x768": 65.2 MHz (scaled from
0.0 MHz), 48.5 kHz, 60.8 Hz
[    25.158] (II) NOUVEAU(0): Modeline "1024x768"x60.8   65.25  1024 1080 1184
1344  768 771 775 798 -hsync +vsync (48.5 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "800x600": 38.8 MHz (scaled from 0.0
MHz), 37.8 kHz, 60.6 Hz
[    25.158] (II) NOUVEAU(0): Modeline "800x600"x60.6   38.75  800 832 912 1024
 600 603 607 624 -hsync +vsync (37.8 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "640x480": 24.2 MHz (scaled from 0.0
MHz), 30.3 kHz, 60.6 Hz
[    25.158] (II) NOUVEAU(0): Modeline "640x480"x60.6   24.25  640 664 720 800 
480 483 487 500 -hsync +vsync (30.3 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "720x400": 22.8 MHz (scaled from 0.0
MHz), 25.4 kHz, 60.9 Hz
[    25.158] (II) NOUVEAU(0): Modeline "720x400"x60.9   22.75  720 744 808 896 
400 403 413 417 -hsync +vsync (25.4 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "640x400": 20.2 MHz (scaled from 0.0
MHz), 25.3 kHz, 60.7 Hz
[    25.158] (II) NOUVEAU(0): Modeline "640x400"x60.7   20.25  640 664 720 800 
400 403 409 417 -hsync +vsync (25.3 kHz)
[    25.158] (**) NOUVEAU(0):  Driver mode "640x350": 17.8 MHz (scaled from 0.0
MHz), 22.2 kHz, 60.6 Hz
[    25.158] (II) NOUVEAU(0): Modeline "640x350"x60.6   17.75  640 664 720 800 
350 353 363 366 -hsync +vsync (22.2 kHz)
[    25.158] (**) NOUVEAU(0): Display dimensions: (330, 210) mm
[    25.159] (**) NOUVEAU(0): DPI set to (129, 127)
[    25.168] (II) NOUVEAU(0): Opened GPU channel 2
[    25.168] (II) NOUVEAU(0): [DRI2] Setup complete
[    25.168] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    25.168] (II) NOUVEAU(0): GART: 512MiB available
[    25.170] (II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
[    25.170] (==) NOUVEAU(0): Backing store disabled
[    25.170] (==) NOUVEAU(0): Silken mouse enabled
[    25.171] (II) NOUVEAU(0): [XvMC] Associated with Nouveau GeForce 8/9
Textured Video.
[    25.171] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    25.171] (==) NOUVEAU(0): DPMS enabled
[    25.171] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    25.176] (II) AIGLX: Trying DRI driver /usr/lib/dri/nouveau_dri.so
[    25.186] (II) AIGLX: Loaded and initialized nouveau
[    25.210] (II) NOUVEAU(0): NVEnterVT is called.
[    25.210] (II) NOUVEAU(0): Setting screen physical size to 444 x 277
[    26.200] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[    26.200] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.200] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    26.590] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[    26.590] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.590] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    26.980] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[    26.980] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.980] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    27.370] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[    27.370] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    27.370] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[    47.120] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[    47.120] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    47.120] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[   229.800] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[   229.800] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   229.800] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[   347.380] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[   347.380] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   347.380] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[   398.920] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[   398.920] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   398.920] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[   502.690] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[   502.690] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[   502.690] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[  1126.660] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[  1126.660] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[  1126.660] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[  1146.000] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[  1146.000] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[  1146.000] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[  1148.450] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[  1148.450] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[  1148.450] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)
[  1161.450] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13382
[  1161.450] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[  1161.450] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  121.00  1680 1704 1792
1876  1050 1051 1054 1065 -hsync -vsync (64.5 kHz)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
