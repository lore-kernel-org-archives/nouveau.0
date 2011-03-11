From: Sebastian Glita <glseba-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: VGA output unavailable G72M [NVS 110M]
Date: Fri, 11 Mar 2011 12:22:12 -0800 (PST)
Message-ID: <808641.58337.qm@web161609.mail.bf1.yahoo.com>
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

Hi,

Doing

localhost ~ # xrandr --output VGA-1 --auto 

does not connect VGA-1 output. Cannot activate VGA-1 at all.

Relevant details follow. Appreciate any suggestions. regard s.

localhost ~ # Xorg -version

This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.

X.Org X Server 1.10.99.1
Release Date: unreleased
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.37-pf5 x86_64 Gentoo
Current Operating System: Linux localhost 2.6.37-pf5 #1 SMP Sat Mar 5 10:28:40 
EET 2011 x86_64
Kernel command line: ...
Build Date: 10 March 2011  05:05:44AM

Current version of pixman: 0.21.7
    Before reporting problems, check http://wiki.x.org
    to make sure that you have the latest version.

localhost ~ # lspci -vknn

01:00.0 VGA compatible controller [0300]: nVidia Corporation G72M [Quadro NVS 
110M/GeForce Go 7300] [10de:01d7] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Toshiba America Info Systems Device [1179:ff02]
    Flags: bus master, fast devsel, latency 0, IRQ 16
    Memory at dd000000 (32-bit, non-prefetchable) [size=16M]
    Memory at c0000000 (64-bit, prefetchable) [size=256M]
    Memory at dc000000 (64-bit, non-prefetchable) [size=16M]
    Capabilities: [60] Power Management version 2
    Capabilities: [68] MSI: Enable- Count=1/1 Maskable- 64bit+
    Capabilities: [78] Express Endpoint, MSI 00
    Capabilities: [100] Virtual Channel
    Capabilities: [128] Power Budgeting <?>
    Kernel driver in use: nouveau
    Kernel modules: nouveau

localhost ~ # cat /var/log/Xorg.0.log

[    50.007] 
This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.
[    50.007] 
X.Org X Server 1.10.99.1
Release Date: unreleased
[    50.007] X Protocol Version 11, Revision 0
[    50.007] Build Operating System: Linux 2.6.37-pf5 x86_64 Gentoo
[    50.007] Current Operating System: Linux localhost 2.6.37-pf5 #1 SMP Sat Mar 


5 10:28:40 EET 2011 x86_64
[    50.007] Kernel command line: ...
[    50.008] Build Date: 10 March 2011  05:05:44AM
[    50.008]  
[    50.008] Current version of pixman: 0.21.7
[    50.008]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[    50.008] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    50.008] (==) Log file: "/var/log/Xorg.0.log", Time: Fri Mar 11 09:41:05 
2011
[    50.048] (==) Using config file: "/etc/X11/xorg.conf"
[    50.048] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    50.048] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    50.113] (**) Option "defaultserverlayout" "SV"
[    50.113] (++) ServerLayout "SV1"


....


[    51.758] (II) NOUVEAU(0): EDID for output LVDS-1
[    51.758] (II) NOUVEAU(0): Manufacturer: SEC  Model: 3633  Serial#: 0
[    51.758] (II) NOUVEAU(0): Year: 2005  Week: 0
[    51.758] (II) NOUVEAU(0): EDID Version: 1.3
[    51.758] (II) NOUVEAU(0): Digital Display Input
[    51.758] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 33  vert.: 21
[    51.758] (II) NOUVEAU(0): Gamma: 2.20
[    51.758] (II) NOUVEAU(0): No DPMS capabilities specified
[    51.758] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    51.758] (II) NOUVEAU(0): First detailed timing is preferred mode
[    51.758] (II) NOUVEAU(0): redX: 0.580 redY: 0.340   greenX: 0.310 greenY: 
0.550
[    51.758] (II) NOUVEAU(0): blueX: 0.155 blueY: 0.155   whiteX: 0.313 whiteY: 
0.329
[    51.758] (II) NOUVEAU(0): Manufacturer's mask: 0
[    51.758] (II) NOUVEAU(0): Supported detailed timing:
[    51.758] (II) NOUVEAU(0): clock: 68.9 MHz   Image Size:  331 x 207 mm
[    51.758] (II) NOUVEAU(0): h_active: 1280  h_sync: 1296  h_sync_end 1344 
h_blank_end 1
408 h_border: 0
[    51.758] (II) NOUVEAU(0): v_active: 800  v_sync: 801  v_sync_end 804 
v_blanking: 816 

v_border: 0
[    51.758] (II) NOUVEAU(0): Unknown vendor-specific block f
[    51.758] (II) NOUVEAU(0):  SAMSUNG
[    51.758] (II) NOUVEAU(0):  LTN154X3-L06
[    51.758] (II) NOUVEAU(0): EDID (in hex):
[    51.758] (II) NOUVEAU(0):   00ffffffffffff004ca3333600000000
[    51.758] (II) NOUVEAU(0):   000f0103802115780a87f594574f8c27
[    51.758] (II) NOUVEAU(0):   27505400000001010101010101010101
[    51.758] (II) NOUVEAU(0):   010101010101ee1a0080502010301030
[    51.758] (II) NOUVEAU(0):   13004bcf100000190000000f00000000
[    51.758] (II) NOUVEAU(0):   00000000002387026402000000fe0053
[    51.758] (II) NOUVEAU(0):   414d53554e470a2020202020000000fe
[    51.758] (II) NOUVEAU(0):   004c544e31353458332d4c30360a0070
[    51.758] (II) NOUVEAU(0): EDID vendor "SEC", prod id 13875
[    51.758] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    51.758] (II) NOUVEAU(0): Modeline "1280x800"x0.0   68.94  1280 1296 1344 
1408  800 801 804 816 -hsync -vsync (49.0 kHz)
[    51.758] (II) NOUVEAU(0): Printing probed modes for output LVDS-1
[    51.758] (II) NOUVEAU(0): Modeline "1280x800"x60.0   68.94  1280 1296 1344 
1408  800 801 804 816 -hsync -vsync (49.0 kHz)
[    51.758] (II) NOUVEAU(0): Modeline "1024x768"x59.9   63.50  1024 1072 1176 
1328  768 771 775 798 -hsync +vsync (47.8 kHz)
[    51.758] (II) NOUVEAU(0): Modeline "800x600"x59.9   38.25  800 832 912 1024  


600 603 607 624 -hsync +vsync (37.4 kHz)
[    51.758] (II) NOUVEAU(0): Modeline "640x480"x59.4   23.75  640 664 720 800  
480 483 487 500 -hsync +vsync (29.7 kHz)
[    51.758] (II) NOUVEAU(0): Modeline "720x400"x59.6   22.25  720 744 808 896  
400 403 413 417 -hsync +vsync (24.8 kHz)
[    51.758] (II) NOUVEAU(0): Modeline "640x400"x60.0   20.00  640 664 720 800  
400 403 409 417 -hsync +vsync (25.0 kHz)
[    51.758] (II) NOUVEAU(0): Modeline "640x350"x59.8   17.50  640 664 720 800  
350 353 363 366 -hsync +vsync (21.9 kHz)
[    51.792] (II) NOUVEAU(0): EDID for output VGA-1
[    51.818] (II) NOUVEAU(0): EDID for output TV-1
[    51.818] (II) NOUVEAU(0): Output LVDS-1 disconnected
[    51.818] (II) NOUVEAU(0): Output VGA-1 disconnected
[    51.818] (II) NOUVEAU(0): Output TV-1 disconnected
[    51.818] (WW) NOUVEAU(0): No outputs definitely connected, trying again...
[    51.818] (II) NOUVEAU(0): Output LVDS-1 connected
[    51.818] (II) NOUVEAU(0): Output VGA-1 disconnected
[    51.818] (II) NOUVEAU(0): Output TV-1 disconnected
[    51.818] (II) NOUVEAU(0): Using user preference for initial modes
[    51.818] (II) NOUVEAU(0): Output LVDS-1 using initial mode 1280x800

localhost ~ # xdpyinfo
name of display:    :0
version number:    11.0
vendor string:    The X.Org Foundation
vendor release number:    11099001
X.Org version: 1.10.99.1
maximum request size:  16777212 bytes
motion buffer size:  256
bitmap unit, bit order, padding:    32, LSBFirst, 32
image byte order:    LSBFirst
number of supported pixmap formats:    7
supported pixmap formats:
    depth 1, bits_per_pixel 1, scanline_pad 32
    depth 4, bits_per_pixel 8, scanline_pad 32
    depth 8, bits_per_pixel 8, scanline_pad 32
    depth 15, bits_per_pixel 16, scanline_pad 32
    depth 16, bits_per_pixel 16, scanline_pad 32
    depth 24, bits_per_pixel 32, scanline_pad 32
    depth 32, bits_per_pixel 32, scanline_pad 32
keycode range:    minimum 8, maximum 255
focus:  window 0x5e00004, revert to PointerRoot
number of extensions:    26
    BIG-REQUESTS
    Composite
    DAMAGE
    DOUBLE-BUFFER
    DPMS
    DRI2
    GLX
    Generic Event Extension
    MIT-SCREEN-SAVER
    MIT-SHM
    RANDR
    RECORD
    RENDER
    SGI-GLX
    SHAPE
    SYNC
    X-Resource
    XC-MISC
    XFIXES
    XFree86-VidModeExtension
    XINERAMA
    XInputExtension
    XKEYBOARD
    XTEST
    XVideo
    XVideo-MotionCompensation
default screen number:    0
number of screens:    1

screen #0:
  dimensions:    800x1280 pixels (270x432 millimeters)
  resolution:    75x75 dots per inch
  depths (7):    24, 1, 4, 8, 15, 16, 32
  root window id:    0x18d
  depth of root window:    24 planes
  number of colormaps:    minimum 1, maximum 1
  default colormap:    0x20
  default number of colormap cells:    256
  preallocated pixels:    black 0, white 16777215
  options:    backing-store NO, save-unders NO
  largest cursor:    64x64

localhost ~ # cat /etc/X11/xorg.conf

Section "Screen"
    Identifier    "Console1"
    Device        "NVIDIA C. Quadro NVS 110M (DualFeet)"
    Monitor        "LCD 15.4'' WXGA"
    DefaultDepth    24

    SubSection    "Display"
        Visual        "TrueColor
        Depth        24
        Modes        "1280x800"
        ViewPort    0 0
        Virtual        2880 2880
    EndSubSection
EndSection

Section "Screen"
    Identifier    "Monitor2"
    Device        "NVIDIA C. Quadro NVS 110M (DualFeet)"
    Monitor        "Monitor"
    DefaultDepth    24

    SubSection    "Display"
        Visual        "TrueColor"
        Depth        24
        Modes        "1600x1200"
        ViewPort    0 0
        Virtual        2880 2880
    EndSubSection
EndSection

Section "DRI"
    Group        "video"
    Mode        0660
EndSection


Section "ServerLayout"
    Identifier    "SV1"
    Screen        "Console1"        Absolute 0 0
    Screen        "Monitor2"
EndSection


Section "Monitor"
    Identifier    "LCD 15.4'' WXGA"
EndSection

Section "Monitor"
        Identifier      "Monitor"
        Option          "RightOf"               "LVDS-1"
        Option          "PreferredMode"         "1600x1200@60"
        UseModes                        "VGA"
EndSection

Section "Modes"
    Identifier            "VGA"
    Modeline    "1280x1024@60"    108.00    1280 1328 1440 1688 1024 1025 1028 
1066 +hsync +vsync
    Modeline    "1600x1200@60"    162.00    1600 1664 1856 2160 1200 1201 1204 
1250 +hsync +vsync
EndSection


Section "Device"
    Identifier    "NVIDIA C. Quadro NVS 110M (DualFeet)"
    VendorName    "NVIDIA Corp"
    Driver        "nouveau"

    Option        "Monitor-LVDS-1"    "LCD 15.4'' WXGA"
    Option        "Monitor-VGA-1"        "Monitor"

    Option        "HW_cursor"        "true"
EndSection

--
a lens, a ray, a screen: a projection; an ocean, the sky, a projection... and 
glasses.
