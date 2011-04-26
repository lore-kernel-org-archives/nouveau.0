From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35901] two full hd displays (left and right) with
 nouveau does not work any more
Date: Tue, 26 Apr 2011 12:35:29 -0700 (PDT)
Message-ID: <20110426193529.676ED130051@annarchy.freedesktop.org>
References: <bug-35901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35901

--- Comment #13 from Greg Turner <gmturner007-yWtbtysYrB+LZ21kGMrzwg@public.gmane.org> 2011-04-26 12:35:28 PDT ---
A few more notes about this.  First, I backported almost everything from
git://anongit.freedesktop.org/nouveau/linux-2.6 into my 2.6.38.4 kernel, but
the problem remained. (Only stuff I didn't backport was 3673dd547 and
27e8b237944, which, i guess, relied on f9820a46dd, which I was too lazy to look
into).

Secondly, I forgot to mention anything about my setup.

I have an NV49 (iirc, 7950GT (?)) with 512MB.  My xorg.conf is pretty trivial:

Section "ServerLayout"
  Identifier "Default Layout"
  Screen 0 "Screen0" 0 0
EndSection
Section "Monitor"
  Identifier "DVI-I-1"
EndSection
Section "Monitor"
  Identifier "DVI-I-2"
  Option "LeftOf" "DVI-I-1"
  Option "PreferredMode" "1920x1200"
EndSection
Section "Device"
  Identifier "Device0"
  Driver "nouveau"
  VendorName "NVIDIA Corporation"        
  BoardName "GeForce 7950 GT"
EndSection
Section "Screen"
Identifier "Screen0"
  DefaultDepth 24
  Device "Device0"
  SubSection "Display"
    Depth 24
    Virtual 3600 1200
  EndSubSection
EndSection
--

$ dmesg |egrep -i 'drm|nouveau|ttm'|grep -v 'linked\sin'
[drm] Initialized drm 1.1.0 20060810
nouveau 0000:01:00.0: PCI INT A -> Link[AXV5] -> GSI 16 (level, low) -> IRQ 16
nouveau 0000:01:00.0: setting latency timer to 64
[drm] nouveau 0000:01:00.0: Detected an NV40 generation card (0x049500a2)
[drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[drm] nouveau 0000:01:00.0: ... appears to be valid
[drm] nouveau 0000:01:00.0: BIT BIOS found
[drm] nouveau 0000:01:00.0: Bios version 05.71.22.42
[drm] nouveau 0000:01:00.0: TMDS table version 1.1
[drm] nouveau 0000:01:00.0: TMDS table script pointers not stubbed
[drm] nouveau 0000:01:00.0: BIT table 'd' not found
[drm] nouveau 0000:01:00.0: Found Display Configuration Block version 3.0
[drm] nouveau 0000:01:00.0: Raw DCB entry 0: 01000300 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 1: 03000302 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 2: 04011310 00000028
[drm] nouveau 0000:01:00.0: Raw DCB entry 3: 0c011312 00000000
[drm] nouveau 0000:01:00.0: Raw DCB entry 4: 020223f1 00c0c080
[drm] nouveau 0000:01:00.0: DCB connector table: VHER 0x30 5 10 2
[drm] nouveau 0000:01:00.0:   0: 0x00001030: type 0x30 idx 0 tag 0x07
[drm] nouveau 0000:01:00.0:   1: 0x00002130: type 0x30 idx 1 tag 0x08
[drm] nouveau 0000:01:00.0:   2: 0x00000210: type 0x10 idx 2 tag 0xff
[drm] nouveau 0000:01:00.0:   3: 0x00000211: type 0x11 idx 3 tag 0xff
[drm] nouveau 0000:01:00.0:   4: 0x00000213: type 0x13 idx 4 tag 0xff
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 0 at offset 0xD1D8
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 1 at offset 0xDACB
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 2 at offset 0xE4F9
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 3 at offset 0xE674
[drm] nouveau 0000:01:00.0: Parsing VBIOS init table 4 at offset 0xE7D0
[drm] nouveau 0000:01:00.0: timingset 255 does not exist
[drm] nouveau 0000:01:00.0: timingset 255 does not exist
[drm] nouveau 0000:01:00.0: 2 available performance level(s)
[drm] nouveau 0000:01:00.0: 0: memory 700MHz core 550MHz voltage 1350mV
fanspeed 20%
[drm] nouveau 0000:01:00.0: 1: memory 730MHz core 570MHz voltage 1350mV
fanspeed 30%
[drm] nouveau 0000:01:00.0: c: memory 702MHz core 550MHz voltage 1350mV
[TTM] Zone  kernel: Available graphics memory: 4091730 kiB.
[TTM] Zone   dma32: Available graphics memory: 2097152 kiB.
[TTM] Initializing pool allocator.
[drm] nouveau 0000:01:00.0: Detected 512MiB VRAM
[drm] nouveau 0000:01:00.0: 512 MiB GART (aperture)
[drm] nouveau 0000:01:00.0: Saving VGA fonts
[drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[drm] No driver support for vblank timestamp query.
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 1)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 2)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on tmds encoder (output 3)
[drm] nouveau 0000:01:00.0: Setting dpms mode 3 on TV encoder (output 4)
[drm] nouveau 0000:01:00.0: allocated 1920x1200 fb: 0x49000, bo
ffff88024d43f800
[drm] nouveau 0000:01:00.0: 0xC5B5: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 1)
[drm] nouveau 0000:01:00.0: Output DVI-I-1 is running on CRTC 0 using output A
[drm] nouveau 0000:01:00.0: 0xC605: Parsing digital output script table
[drm] nouveau 0000:01:00.0: Setting dpms mode 0 on tmds encoder (output 3)
[drm] nouveau 0000:01:00.0: Output DVI-I-2 is running on CRTC 1 using output C
fb0: nouveaufb frame buffer device
drm: registered panic notifier
[drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0
--
some Xorg.0.log excerpts:

X.Org X Server 1.10.99.1
(II) Loader magic: 0x7d5200
(II) Module ABI versions:
   X.Org ANSI C Emulation: 0.4
   X.Org Video Driver: 10.0
   X.Org XInput driver : 12.2
   X.Org Server Extension : 5.0
 (--) PCI:*(0:1:0:0) 10de:0295:1682:2219 rev 161, Mem @ 0xcc000000/16777216,
0xb0000000/268435456, 0xcd000000/16777216, I/O @ 0x0000dc00/128, BIOS @
0x????????/131072
 (II) Module nouveau: vendor="X.Org Foundation"
   compiled for 1.10.99.1, module version = 0.0.16
   Module class: X.Org Video Driver
   ABI class: X.Org Video Driver, version 10.0
drmOpenByBusid: drmGetBusid reports pci:0000:01:00.0
(II) [drm] nouveau interface version: 0.0.16
(II) [drm] DRM interface version 1.4
(--) NOUVEAU(0): Chipset: "NVIDIA NV49"
(**) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(==) NOUVEAU(0): Using HW cursor
(==) NOUVEAU(0): GLX sync to VBlank disabled.
(==) NOUVEAU(0): Page flipping enabled
(II) NOUVEAU(0): EDID for output DVI-I-1
(II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
(II) NOUVEAU(0): redX: 0.640 redY: 0.340   greenX: 0.295 greenY: 0.610
(II) NOUVEAU(0): blueX: 0.145 blueY: 0.070   whiteX: 0.312 whiteY: 0.329
(II) NOUVEAU(0): Supported detailed timing:
(II) NOUVEAU(0): clock: 119.0 MHz   Image Size:  433 x 270 mm
(II) NOUVEAU(0): h_active: 1680  h_sync: 1728  h_sync_end 1760 h_blank_end 1840
h_border: 0
(II) NOUVEAU(0): v_active: 1050  v_sync: 1053  v_sync_end 1059 v_blanking: 1080
v_border: 0
(II) NOUVEAU(0): Printing DDC gathered Modelines:
(II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760 1840  1050
1053 1059 1080 +hsync -vsync (64.7 kHz)
(II) NOUVEAU(0): Printing probed modes for output DVI-I-1
(II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050
1053 1059 1080 +hsync -vsync (64.7 kHz)
(II) NOUVEAU(0): EDID for output DVI-I-2
(II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4
(II) NOUVEAU(0): redX: 0.640 redY: 0.330   greenX: 0.300 greenY: 0.608
(II) NOUVEAU(0): blueX: 0.150 blueY: 0.060   whiteX: 0.313 whiteY: 0.329
(II) NOUVEAU(0): Supported detailed timing:
(II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  518 x 324 mm
(II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000 h_blank_end 2080
h_border: 0
(II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209 v_blanking: 1235
v_border: 0
(II) NOUVEAU(0): Printing probed modes for output DVI-I-2
(II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000 2080  1200
1203 1209 1235 +hsync -vsync (74.0 kHz)
(II) NOUVEAU(0): Output DVI-I-1 using initial mode 1680x1050
(II) NOUVEAU(0): Output DVI-I-2 using initial mode 1920x1200
(--) NOUVEAU(0): Virtual size is 3600x1200 (pitch 0)
(**) NOUVEAU(0):  Driver mode "1680x1050": 119.0 MHz (scaled from 0.0 MHz),
64.7 kHz, 59.9 Hz
(II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760 1840  1050
1053 1059 1080 +hsync -vsync (64.7 kHz)
(**) NOUVEAU(0): Display dimensions: (430, 270) mm
(**) NOUVEAU(0): DPI set to (212, 112)
(--) Depth 24 pixmap format is 32 bpp
(II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
(II) NOUVEAU(0): GART: 512MiB available
(II) NOUVEAU(0): GART: Allocated 16MiB as a scratch buffer
(II) EXA(0): Driver allocated offscreen pixmaps
(II) EXA(0): Driver registered support for the following operations:
(II)         Solid
(II)         Copy
(II)         Composite (RENDER acceleration)
(II)         UploadToScreen
(II)         DownloadFromScreen
(==) NOUVEAU(0): Backing store disabled
(II) NOUVEAU(0): [XvMC] Associated with NV40 texture adapter.
(II) NOUVEAU(0): [XvMC] Extension initialized.
(II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled
message.
(II) Initializing built-in extension Generic Event Extension
(II) Initializing built-in extension SHAPE
(II) Initializing built-in extension MIT-SHM
(II) Initializing built-in extension XInputExtension
(II) Initializing built-in extension XTEST
(II) Initializing built-in extension BIG-REQUESTS
(II) Initializing built-in extension SYNC
(II) Initializing built-in extension XKEYBOARD
(II) Initializing built-in extension XC-MISC
(II) Initializing built-in extension XINERAMA
(II) Initializing built-in extension XFIXES
(II) Initializing built-in extension RENDER
(II) Initializing built-in extension RANDR
(II) Initializing built-in extension COMPOSITE
(II) Initializing built-in extension DAMAGE
(II) AIGLX: enabled GLX_MESA_copy_sub_buffer
(II) AIGLX: enabled GLX_INTEL_swap_event
(II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
(II) AIGLX: enabled GLX_SGI_make_current_read
(II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
(II) AIGLX: Loaded and initialized nouveau
(II) GLX: Initialized DRI2 GL provider for screen 0
(II) NOUVEAU(0): NVEnterVT is called.
(II) NOUVEAU(0): Setting screen physical size to 952 x 317
resize called 3600 1200
--

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
