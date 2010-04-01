From: "Carlo E. Prelz" <fluido-1XNsQiTun9D1P9xLtpHBDw@public.gmane.org>
Subject: GeForce GTS 250M: no acceleration...
Date: Thu, 1 Apr 2010 22:52:04 +0200
Message-ID: <20100401205203.GA11543@frittella.fluido.as>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
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

Good day. I am Carlo - living in the Netherlands. Today I came in
possession of a MSI-produced barebone laptop - a MS-1656-ID1 (which is
equivalent in hardware to the GT640 "gaming" laptop). 

This laptop comes wih a video card that is identified as follows:

01:00.0 VGA compatible controller: nVidia Corporation GT215 [GeForce GTS 250M] (rev a2)

(pci ID 10de:0ca9). For your info, the closed-source Nvidia drivers
for Linux also currently ignores this specific chip. 

Anyway, I was porting the hard disk from my previous laptop, which had
an older Nvidia card that works quite OK with both Nouveau and
Gallium.  On this machine, the card is recognized, but I get this
message:

[drm] nouveau 0000:01:00.0: I don't know how to make a ctxprog for your NVa3 card.
[drm] nouveau 0000:01:00.0: Disabling acceleration. Please contact the devs.

I tracked the point in the driver where this message is generated, in

drivers/gpu/drm/nouveau/nv50_grctx.c 

and I tried, for the sake of it, just to add the relative 

case 0xa3: 

line in init, where detection had stopped. Boot was OK, the 'disabling
acceleration' line disappeared. and the framebuffer was
perfect. Indeed, X started, but in a very funny sort of way. Part of
the drawing would not take place - for example, no characters were to
be seen, and icons were strangely duplicated. Window proportions and
background colors were correct. It looks like some more
work is required to support this specific card. If you need photos, I
cam make them.

Can I be of help for this? Given time, I can do any test you ask me to
do, provided it does not require windows (I do not have windows in
this or any olther PC). 

Thanks for your work with Nouveau and Gallium, and thanks in advance
for any help you can provide.

Here are the related messages at boot:

--8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<--
nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
PM: Adding info for No Bus:controlD64
PM: Adding info for No Bus:card0
[drm] nouveau 0000:01:00.0: Detected an NV50 generation card (0x0a3480a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 70.15.0c.00
[drm] nouveau 0000:01:00.0: Pointer to BIT loadval table invalid
[drm] nouveau 0000:01:00.0: TMDS table revision 2.0 not currently supported
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 4.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000313 00010034
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 08014382 00020010
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 02049300 00000000
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x40 5 16 4
[drm] nouveau 0000:01:00.0:   0: 0x00000040: type 0x40 idx 0 tag 0xff
[drm] nouveau 0000:01:00.0:   1: 0x00001161: type 0x61 idx 1 tag 0x07
[drm] nouveau 0000:01:00.0:   2: 0x00001231: type 0x31 idx 2 tag 0x07
[drm] nouveau 0000:01:00.0:   3: 0x01000331: type 0x31 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x01000461: type 0x61 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0:   5: 0x02000546: type 0x46 idx 5 tag 0xff
[drm] nouveau 0000:01:00.0:   6: 0x00010631: type 0x31 idx 6 tag 0x51
[drm] nouveau 0000:01:00.0:   7: 0x00010746: type 0x46 idx 7 tag 0x51
[drm] nouveau 0000:01:00.0:   8: 0x00020846: type 0x46 idx 8 tag 0x52
[drm] nouveau 0000:01:00.0:   9: 0x00000900: type 0x00 idx 9 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xD9E9
[drm] nouveau 0000:01:00.0: 0xDD49: Condition still not met after 20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: 0xDD4D: Condition still not met after 20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: 0xDF17: Condition still not met after 20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xDF44
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xEE44
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xEE82
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xF085
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table at offset 0xF0EA
[drm] nouveau 0000:01:00.0: 0xF0EA: Condition still not met after 20ms, skipping following opcodes
[drm] nouveau 0000:01:00.0: 0xBE2A: parsing output script 0
[drm] nouveau 0000:01:00.0: 0xC225: parsing output script 0
[drm] nouveau 0000:01:00.0: Detected 1024MiB VRAM
[TTM] Zone  kernel: Available graphics memory: 2020652 kiB.
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: I don't know how to make a ctxprog for your NVa3 card.
[drm] nouveau 0000:01:00.0: Disabling acceleration. Please contact the devs.
[drm] nouveau 0000:01:00.0: Detected a LVDS output
[drm] nouveau 0000:01:00.0: Detected a TMDS output
[drm] nouveau 0000:01:00.0: Detected a DAC output
[drm] nouveau 0000:01:00.0: Detected a LVDS connector
PM: Adding info for No Bus:card0-LVDS-1
PM: Adding info for i2c:i2c-0
[drm] nouveau 0000:01:00.0: Detected a HDMI connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a DVI-D connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a DVI-D connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a HDMI connector
PM: Adding info for No Bus:card0-HDMI Type A-2
[drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a DVI-D connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a DisplayPort connector
[drm] nouveau 0000:01:00.0:   no encoders, ignoring
[drm] nouveau 0000:01:00.0: Detected a VGA connector
PM: Adding info for No Bus:card0-VGA-1
PM: Adding info for No Bus:nv_backlight
PM: Adding info for i2c:i2c-1
PM: Adding info for i2c:i2c-2
[drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x401c0000, bo ffff88013a148e00
PM: Adding info for No Bus:fb0
fbcon: nouveaufb (fb0) is primary device
PM: Adding info for No Bus:vtcon1
[drm] nouveau 0000:01:00.0: 0xBE2E: parsing output script 1
[drm] nouveau 0000:01:00.0: 0xBCC5: parsing clock script 0
Console: switching to colour frame buffer device 210x65
fb0: nouveaufb frame buffer device
registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
...
...
[drm] nouveau 0000:01:00.0: 0xBE25: parsing clock script 1
--8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<--

And this is what X says:

--8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<--
...
...
(--) PCI:*(0:1:0:0) 10de:0ca9:1462:102f nVidia Corporation GT215 [GeForce GTS 250M] rev 162, Mem @ 0xd2000000/16777216, 0xc0000000/268435456, 0xd0000000/33554432, I/O @ 0x0000d000/128, BIOS @ 0x????????/524288
...
...
(II) NOUVEAU driver Date:   Mon May 4 17:04:34 2009 +1000
(II) NOUVEAU driver for NVIDIA chipset families :
	RIVA TNT    (NV04)
	RIVA TNT2   (NV05)
	GeForce 256 (NV10)
	GeForce 2   (NV11, NV15)
	GeForce 4MX (NV17, NV18)
	GeForce 3   (NV20)
	GeForce 4Ti (NV25, NV28)
	GeForce FX  (NV3x)
	GeForce 6   (NV4x)
	GeForce 7   (G7x)
	GeForce 8   (G8x)
(II) Primary Device is: PCI 01@00:00:0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 10, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 10, (OK)
drmOpenByBusid: drmOpenMinor returns 10
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] nouveau interface version: 0.0.16
(II) Loading sub module "dri"
(II) LoadModule: "dri"
(II) Reloading /usr/lib/xorg/modules/extensions/libdri.so
(II) NOUVEAU(0): Loaded DRI module
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: Searching for BusID pci:0000:01:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 11, (OK)
drmOpenByBusid: drmOpenMinor returns 11
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(--) NOUVEAU(0): Chipset: "NVIDIA NVa3"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(II) NOUVEAU(0): Output LVDS-1 using monitor section Monitor Generico
(II) NOUVEAU(0): Output HDMI-2 has no monitor section
(II) NOUVEAU(0): Output VGA-1 has no monitor section
(II) NOUVEAU(0): EDID for output LVDS-1
(II) NOUVEAU(0): Manufacturer: SEC  Model: 3946  Serial#: 0
(II) NOUVEAU(0): Year: 2008  Week: 0
(II) NOUVEAU(0): EDID Version: 1.3
(II) NOUVEAU(0): Digital Display Input
(II) NOUVEAU(0): Max Image Size [cm]: horiz.: 33  vert.: 21
(II) NOUVEAU(0): Gamma: 2.20
(II) NOUVEAU(0): No DPMS capabilities specified
(II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
(II) NOUVEAU(0): First detailed timing is preferred mode
(II) NOUVEAU(0): redX: 0.580 redY: 0.340   greenX: 0.310 greenY: 0.550
(II) NOUVEAU(0): blueX: 0.155 blueY: 0.155   whiteX: 0.313 whiteY: 0.329
(II) NOUVEAU(0): Manufacturer's mask: 0
(II) NOUVEAU(0): Supported detailed timing:
(II) NOUVEAU(0): clock: 131.5 MHz   Image Size:  331 x 207 mm
(II) NOUVEAU(0): h_active: 1680  h_sync: 1704  h_sync_end 1792 h_blank_end 2058 h_border: 0
(II) NOUVEAU(0): v_active: 1050  v_sync: 1051  v_sync_end 1054 v_blanking: 1065 v_border: 0
(II) NOUVEAU(0): Unknown vendor-specific block f
(II) NOUVEAU(0):  SAMSUNG
(II) NOUVEAU(0):  154MT02-H01
(II) NOUVEAU(0): EDID (in hex):
(II) NOUVEAU(0): 	00ffffffffffff004ca3463900000000
(II) NOUVEAU(0): 	00120103802115780a87f594574f8c27
(II) NOUVEAU(0): 	27505400000001010101010101010101
(II) NOUVEAU(0): 	0101010101015e33907a611a0f401858
(II) NOUVEAU(0): 	13004bcf100000190000000f00000000
(II) NOUVEAU(0): 	00000000003cd2026400000000fe0053
(II) NOUVEAU(0): 	414d53554e470a2020202020000000fe
(II) NOUVEAU(0): 	003135344d5430322d4830310a2000f7
(II) NOUVEAU(0): EDID vendor "SEC", prod id 14662
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  131.50  1680 1704 1792 2058  1050 1051 1054 1065 -hsync -vsync (63.9 kHz)
(II) NOUVEAU(0): Not using mode "720x400" (hsync out of range)
(II) NOUVEAU(0): Not using mode "640x400" (hsync out of range)
(II) NOUVEAU(0): Not using mode "640x350" (hsync out of range)
(II) NOUVEAU(0): Printing probed modes for output LVDS-1
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  131.50  1680 1704 1792 2058  1050 1051 1054 1065 -hsync -vsync (63.9 kHz)
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  121.75  1400 1488 1632 1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
(II) NOUVEAU(0): Modeline "1280x1024"x59.9  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync (63.7 kHz)
(II) NOUVEAU(0): Modeline "1280x960"x59.9  101.25  1280 1360 1488 1696  960 963 967 996 -hsync +vsync (59.7 kHz)
(II) NOUVEAU(0): Modeline "1152x864"x60.0   81.75  1152 1216 1336 1520  864 867 871 897 -hsync +vsync (53.8 kHz)
(II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176 1328  768 771 775 798 -hsync +vsync (47.8 kHz)
(II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024  600 603 607 624 -hsync +vsync (37.4 kHz)
(II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800  480 483 487 500 -hsync +vsync (29.7 kHz)
(II) NOUVEAU(0): EDID for output HDMI-2
(II) NOUVEAU(0): EDID for output VGA-1
(II) NOUVEAU(0): Output LVDS-1 connected
(II) NOUVEAU(0): Output HDMI-2 disconnected
(II) NOUVEAU(0): Output VGA-1 disconnected
(II) NOUVEAU(0): Using user preference for initial modes
(II) NOUVEAU(0): Output LVDS-1 using initial mode 1680x1050
(II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless otherwise stated.
(--) NOUVEAU(0): Virtual size is 1680x1050 (pitch 1680)
(**) NOUVEAU(0):  Driver mode "1680x1050": 131.5 MHz (scaled from 0.0 MHz), 63.9 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  131.50  1680 1704 1792 2058  1050 1051 1054 1065 -hsync -vsync (63.9 kHz)
(**) NOUVEAU(0):  Driver mode "1680x1050": 146.2 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x60.0  146.25  1680 1784 1960 2240  1050 1053 1059 1089 -hsync +vsync (65.3 kHz)
(**) NOUVEAU(0):  Driver mode "1400x1050": 121.8 MHz (scaled from 0.0 MHz), 65.3 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1400x1050"x60.0  121.75  1400 1488 1632 1864  1050 1053 1057 1089 -hsync +vsync (65.3 kHz)
(**) NOUVEAU(0):  Driver mode "1280x1024": 109.0 MHz (scaled from 0.0 MHz), 63.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1280x1024"x59.9  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync (63.7 kHz)
(**) NOUVEAU(0):  Driver mode "1280x960": 101.2 MHz (scaled from 0.0 MHz), 59.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1280x960"x59.9  101.25  1280 1360 1488 1696  960 963 967 996 -hsync +vsync (59.7 kHz)
(**) NOUVEAU(0):  Driver mode "1152x864": 81.8 MHz (scaled from 0.0 MHz), 53.8 kHz, 60.0 Hz
(II) NOUVEAU(0): Modeline "1152x864"x60.0   81.75  1152 1216 1336 1520  864 867 871 897 -hsync +vsync (53.8 kHz)
(**) NOUVEAU(0):  Driver mode "1024x768": 63.5 MHz (scaled from 0.0 MHz), 47.8 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176 1328  768 771 775 798 -hsync +vsync (47.8 kHz)
(**) NOUVEAU(0):  Driver mode "800x600": 38.2 MHz (scaled from 0.0 MHz), 37.4 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024  600 603 607 624 -hsync +vsync (37.4 kHz)
(**) NOUVEAU(0):  Driver mode "640x480": 23.8 MHz (scaled from 0.0 MHz), 29.7 kHz, 59.4 Hz
(II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800  480 483 487 500 -hsync +vsync (29.7 kHz)
(**) NOUVEAU(0): Display dimensions: (330, 210) mm
(**) NOUVEAU(0): DPI set to (129, 127)
...
...
(EE) NOUVEAU(0): Error creating GPU channel: -19
(EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel
(**) NOUVEAU(0): Option "BackingStore" "true"
(**) NOUVEAU(0): Backing store enabled
(==) NOUVEAU(0): Silken mouse enabled
(II) NOUVEAU(0): NVEnterVT is called.
(**) NOUVEAU(0): DPMS enabled
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.
...
...
(II) NOUVEAU(0): EDID vendor "SEC", prod id 14662
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  131.50  1680 1704 1792 2058  1050 1051 1054 1065 -hsync -vsync (63.9 kHz)
(II) NOUVEAU(0): EDID vendor "SEC", prod id 14662
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  131.50  1680 1704 1792 2058  1050 1051 1054 1065 -hsync -vsync (63.9 kHz)

--8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<----8<--

Best

Carlo

-- 
  *         Se la Strada e la sua Virtu' non fossero state messe da parte,
* K * Carlo E. Prelz - fluido-1XNsQiTun9D1P9xLtpHBDw@public.gmane.org             che bisogno ci sarebbe
  *               di parlare tanto di amore e di rettitudine? (Chuang-Tzu)
