From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 85570] New: DPMS does not turn off LCD backlight on
 G73 (NV4B) [GeForce 7600 GS]
Date: Tue, 28 Oct 2014 19:53:04 +0000
Message-ID: <bug-85570-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1894826566=="
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


--===============1894826566==
Content-Type: multipart/alternative; boundary="1414525984.4FfBcFfF1.32260"; charset="UTF-8"


--1414525984.4FfBcFfF1.32260
Date: Tue, 28 Oct 2014 19:53:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=85570

            Bug ID: 85570
           Summary: DPMS does not turn off LCD backlight on G73 (NV4B)
                    [GeForce 7600 GS]
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kilork-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

See many similar reports, but never got to work dpms mode off with nouveau. It
works with nvidia drivers, but stopped to work with nouveau.

My distribution now is fedora 3.16.6-203.fc20.x86_64. But this problem was the
same with my old gentoo distribution. Periodically I enable nouveau, check what
problem with backlight persists and switch back to proprietary drivers. Now I
decided to try file a bug, may be someone will help me.

My dmesg output:
[    1.750475] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x04b200a2
[    1.750477] nouveau  [  DEVICE][0000:01:00.0] Chipset: G73 (NV4B)
[    1.750479] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[    1.750503] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.797924] usb 1-4: New USB device found, idVendor=0421, idProduct=0119
[    1.797927] usb 1-4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    1.797929] usb 1-4: Product: 5630d-1
[    1.797930] usb 1-4: Manufacturer: Nokia
[    1.797931] usb 1-4: SerialNumber: 359350024392454
[    1.810147] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.810149] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.810240] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.810242] nouveau  [   VBIOS][0000:01:00.0] version 05.73.22.25.00
[    1.810415] nouveau 0000:01:00.0: irq 89 for MSI/MSI-X
[    1.810423] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.810443] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    1.810444] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    1.810446] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 379904 tags
[    1.816929] systemd-udevd[324]: renamed network interface eth0 to p4p1
[    1.844784] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.844795] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.844797] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.864815] nouveau  [     CLK][0000:01:00.0] 20: core 400 MHz shader 400
MHz memory 270 MHz
[    1.864825] nouveau  [     CLK][0000:01:00.0] --: core 400 MHz shader 400
MHz memory 270 MHz
[    1.864911] [TTM] Zone  kernel: Available graphics memory: 8164784 kiB
[    1.864912] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.864913] [TTM] Initializing pool allocator
[    1.864917] [TTM] Initializing DMA pool allocator
[    1.864927] nouveau  [     DRM] VRAM: 507 MiB
[    1.864928] nouveau  [     DRM] GART: 512 MiB
[    1.864931] nouveau  [     DRM] TMDS table version 1.1
[    1.864933] nouveau W[     DRM] TMDS table script pointers not stubbed
[    1.864934] nouveau  [     DRM] DCB version 3.0
[    1.864935] nouveau  [     DRM] DCB outp 00: 01000300 00000028
[    1.864937] nouveau  [     DRM] DCB outp 01: 03011312 00000000
[    1.864938] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    1.864939] nouveau  [     DRM] DCB outp 03: 020223f1 00c0c080
[    1.864941] nouveau  [     DRM] DCB conn 00: 1030
[    1.864942] nouveau  [     DRM] DCB conn 01: 0100
[    1.864944] nouveau  [     DRM] DCB conn 02: 0210
[    1.864945] nouveau  [     DRM] DCB conn 03: 0211
[    1.864946] nouveau  [     DRM] DCB conn 04: 0213
[    1.865052] nouveau  [     DRM] Saving VGA fonts
[    1.900712] usb 1-5: new high-speed USB device number 6 using ehci-pci
[    1.926777] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.926779] [drm] Driver supports precise vblank timestamp query.
[    1.926782] nouveau  [     DRM] 0xD06D: Parsing digital output script table
[    1.979026] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.979032] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    1.982731] tsc: Refined TSC clocksource calibration: 4013.612 MHz
[    2.015850] usb 1-5: New USB device found, idVendor=1a40, idProduct=0101
[    2.015853] usb 1-5: New USB device strings: Mfr=0, Product=1,
SerialNumber=0
[    2.015855] usb 1-5: Product: USB 2.0 Hub
[    2.016147] hub 1-5:1.0: USB hub found
[    2.016220] hub 1-5:1.0: 4 ports detected
[    2.036909] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo
ffff88042879a800
[    2.037063] fbcon: nouveaufb (fb0) is primary device
[    2.058666] nouveau  [     DRM] 0xD06D: Parsing digital output script table
[    2.110946] Console: switching to colour frame buffer device 240x75
[    2.113227] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.113228] nouveau 0000:01:00.0: registered panic notifier
[    2.119750] [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0 on
minor 0
[    2.331760] usb-storage 1-4:1.0: USB Mass Storage device detected
[    2.331867] scsi6 : usb-storage 1-4:1.0

lspci -vvv:

01:00.0 VGA compatible controller: NVIDIA Corporation G73 [GeForce 7600 GS]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 8214
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 89
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at fc000000 (64-bit, non-prefetchable) [size=16M]
        Region 5: I/O ports at e000 [size=128]
        Expansion ROM at fe000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee8000c  Data: 41a3
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s <256ns,
L1 <4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s <256ns, L1 <4us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting <?>
        Kernel driver in use: nouveau
        Kernel modules: nouveau

/var/log/Xorg.0.log:

[    25.095] 
X.Org X Server 1.14.4
Release Date: 2013-10-31
[    25.095] X Protocol Version 11, Revision 0
[    25.095] Build Operating System:  3.14.3-200.fc20.x86_64 
[    25.095] Current Operating System: Linux ip-213-141-136-171.bb.netbynet.ru
3.16.6-203.fc20.x86_64 #1 SMP Sat Oct 25 12:44:32 UTC 2014 x86_64
[    25.095] Kernel command line: BOOT_IMAGE=/vmlinuz-3.16.6-203.fc20.x86_64
root=/dev/mapper/fedora_ip--213--141--136--171-root ro
rd.lvm.lv=fedora_ip-213-141-136-171/root
rd.lvm.lv=fedora_ip-213-141-136-171/swap vconsole.font=latarcyrheb-sun16 rhgb
quiet LANG=ru_RU.UTF-8
[    25.095] Build Date: 27 June 2014  01:35:28AM
[    25.095] Build ID: xorg-x11-server 1.14.4-11.fc20 
[    25.095] Current version of pixman: 0.30.0
[    25.095]    Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
[    25.095] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    25.095] (==) Log file: "/var/log/Xorg.0.log", Time: Tue Oct 28 22:03:43
2014
[    25.096] (==) Using config directory: "/etc/X11/xorg.conf.d"
[    25.096] (==) Using system config directory "/usr/share/X11/xorg.conf.d"
[    25.096] (==) No Layout section.  Using the first Screen section.
[    25.096] (==) No screen section available. Using defaults.
[    25.096] (**) |-->Screen "Default Screen Section" (0)
[    25.096] (**) |   |-->Monitor "<default monitor>"
[    25.096] (==) No monitor specified for screen "Default Screen Section".
        Using a default monitor configuration.
[    25.096] (==) Automatically adding devices
[    25.096] (==) Automatically enabling devices
[    25.096] (==) Automatically adding GPU devices
[    25.096] (==) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
[    25.096] (==) ModulePath set to "/usr/lib64/xorg/modules"
[    25.096] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[    25.096] (II) Loader magic: 0x80dd00
[    25.096] (II) Module ABI versions:
[    25.096]    X.Org ANSI C Emulation: 0.4
[    25.096]    X.Org Video Driver: 14.1
[    25.096]    X.Org XInput driver : 19.2
[    25.096]    X.Org Server Extension : 7.0
[    25.096] (II) xfree86: Adding drm device (/dev/dri/card0)
[    25.098] (--) PCI:*(0:1:0:0) 10de:0392:1043:8214 rev 161, Mem @
0xfd000000/16777216, 0xc0000000/268435456, 0xfc000000/16777216, I/O @
0x0000e000/128, BIOS @ 0x????????/131072
[    25.098] Initializing built-in extension Generic Event Extension
[    25.098] Initializing built-in extension SHAPE
[    25.098] Initializing built-in extension MIT-SHM
[    25.098] Initializing built-in extension XInputExtension
[    25.098] Initializing built-in extension XTEST
[    25.098] Initializing built-in extension BIG-REQUESTS
[    25.098] Initializing built-in extension SYNC
[    25.098] Initializing built-in extension XKEYBOARD
[    25.098] Initializing built-in extension XC-MISC
[    25.098] Initializing built-in extension XINERAMA
[    25.098] Initializing built-in extension XFIXES
[    25.098] Initializing built-in extension RENDER
[    25.098] Initializing built-in extension RANDR
[    25.098] Initializing built-in extension COMPOSITE
[    25.098] Initializing built-in extension DAMAGE
[    25.099] Initializing built-in extension MIT-SCREEN-SAVER
[    25.099] Initializing built-in extension DOUBLE-BUFFER
[    25.099] Initializing built-in extension RECORD
[    25.099] Initializing built-in extension DPMS
[    25.099] Initializing built-in extension X-Resource
[    25.099] Initializing built-in extension XVideo
[    25.099] Initializing built-in extension XVideo-MotionCompensation
[    25.099] Initializing built-in extension SELinux
[    25.099] Initializing built-in extension XFree86-VidModeExtension
[    25.099] Initializing built-in extension XFree86-DGA
[    25.099] Initializing built-in extension XFree86-DRI
[    25.099] Initializing built-in extension DRI2
[    25.099] (II) "glx" will be loaded by default.
[    25.099] (WW) "xwayland" is not to be loaded by default. Skipping.
[    25.099] (II) LoadModule: "dri2"
[    25.099] (II) Module "dri2" already built-in
[    25.099] (II) LoadModule: "glamoregl"
[    25.100] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[    25.104] (II) Module glamoregl: vendor="X.Org Foundation"
[    25.104]    compiled for 1.14.4, module version = 0.5.1
[    25.104]    ABI class: X.Org ANSI C Emulation, version 0.4
[    25.104] (II) LoadModule: "glx"
[    25.104] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    25.106] (II) Module glx: vendor="X.Org Foundation"
[    25.106]    compiled for 1.14.4, module version = 1.0.0
[    25.106]    ABI class: X.Org Server Extension, version 7.0
[    25.106] (==) AIGLX enabled
[    25.106] Loading extension GLX
[    25.106] (==) Matched nouveau as autoconfigured driver 0
[    25.106] (==) Matched nv as autoconfigured driver 1
[    25.106] (==) Matched nouveau as autoconfigured driver 2
[    25.106] (==) Matched nv as autoconfigured driver 3
[    25.106] (==) Matched modesetting as autoconfigured driver 4
[    25.106] (==) Matched fbdev as autoconfigured driver 5
[    25.106] (==) Matched vesa as autoconfigured driver 6
[    25.106] (==) Assigned the driver to the xf86ConfigLayout
[    25.106] (II) LoadModule: "nouveau"
[    25.106] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[    25.108] (II) Module nouveau: vendor="X.Org Foundation"
[    25.108]    compiled for 1.14.2, module version = 1.0.9
[    25.108]    Module class: X.Org Video Driver
[    25.108]    ABI class: X.Org Video Driver, version 14.1
[    25.108] (II) LoadModule: "nv"
[    25.109] (WW) Warning, couldn't open module nv
[    25.109] (II) UnloadModule: "nv"
[    25.109] (II) Unloading nv
[    25.109] (EE) Failed to load module "nv" (module does not exist, 0)
[    25.109] (II) LoadModule: "modesetting"
[    25.109] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[    25.109] (II) Module modesetting: vendor="X.Org Foundation"
[    25.109]    compiled for 1.14.2, module version = 0.8.0
[    25.109]    Module class: X.Org Video Driver
[    25.109]    ABI class: X.Org Video Driver, version 14.1
[    25.109] (II) LoadModule: "fbdev"
[    25.109] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    25.110] (II) Module fbdev: vendor="X.Org Foundation"
[    25.110]    compiled for 1.14.2, module version = 0.4.3
[    25.110]    Module class: X.Org Video Driver
[    25.110]    ABI class: X.Org Video Driver, version 14.1
[    25.110] (II) LoadModule: "vesa"
[    25.110] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    25.110] (II) Module vesa: vendor="X.Org Foundation"
[    25.110]    compiled for 1.14.2, module version = 2.3.2
[    25.110]    Module class: X.Org Video Driver
[    25.110]    ABI class: X.Org Video Driver, version 14.1
[    25.110] (II) NOUVEAU driver 
[    25.110] (II) NOUVEAU driver for NVIDIA chipset families :
[    25.110]    RIVA TNT        (NV04)
[    25.110]    RIVA TNT2       (NV05)
[    25.110]    GeForce 256     (NV10)
[    25.110]    GeForce 2       (NV11, NV15)
[    25.110]    GeForce 4MX     (NV17, NV18)
[    25.110]    GeForce 3       (NV20)
[    25.110]    GeForce 4Ti     (NV25, NV28)
[    25.111]    GeForce FX      (NV3x)
[    25.111]    GeForce 6       (NV4x)
[    25.111]    GeForce 7       (G7x)
[    25.111]    GeForce 8       (G8x)
[    25.111]    GeForce GTX 200 (NVA0)
[    25.111]    GeForce GTX 400 (NVC0)
[    25.111] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    25.111] (II) FBDEV: driver for framebuffer: fbdev
[    25.111] (II) VESA: driver for VESA chipsets: vesa
[    25.111] (++) using VT number 1

[    25.112] (II) [drm] nouveau interface version: 1.1.2
[    25.112] (WW) Falling back to old probe method for modesetting
[    25.112] (WW) Falling back to old probe method for fbdev
[    25.112] (II) Loading sub module "fbdevhw"
[    25.112] (II) LoadModule: "fbdevhw"
[    25.112] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[    25.113] (II) Module fbdevhw: vendor="X.Org Foundation"
[    25.113]    compiled for 1.14.4, module version = 0.0.2
[    25.113]    ABI class: X.Org Video Driver, version 14.1
[    25.113] (WW) Falling back to old probe method for vesa
[    25.113] (II) Loading sub module "dri2"
[    25.113] (II) LoadModule: "dri2"
[    25.113] (II) Module "dri2" already built-in
[    25.113] (--) NOUVEAU(0): Chipset: "NVIDIA NV4B"
[    25.113] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
        "Default Screen Section" for depth/fbbpp 24/32
[    25.113] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    25.113] (==) NOUVEAU(0): RGB weight 888
[    25.113] (==) NOUVEAU(0): Default visual is TrueColor
[    25.113] (==) NOUVEAU(0): Using HW cursor
[    25.113] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    25.113] (==) NOUVEAU(0): Page flipping enabled
[    25.113] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    25.142] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    25.174] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[    25.200] (II) NOUVEAU(0): Output TV-1 has no monitor section
[    25.228] (II) NOUVEAU(0): EDID for output DVI-I-1
[    25.261] (II) NOUVEAU(0): EDID for output VGA-1
[    25.261] (II) NOUVEAU(0): Manufacturer: VSC  Model: 8420  Serial#: 16843009
[    25.261] (II) NOUVEAU(0): Year: 2008  Week: 20
[    25.261] (II) NOUVEAU(0): EDID Version: 1.3
[    25.261] (II) NOUVEAU(0): Digital Display Input
[    25.261] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 55  vert.: 34
[    25.261] (II) NOUVEAU(0): Gamma: 2.20
[    25.261] (II) NOUVEAU(0): DPMS capabilities: Off
[    25.261] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    25.261] (II) NOUVEAU(0): Default color space is primary color space
[    25.261] (II) NOUVEAU(0): First detailed timing is preferred mode
[    25.261] (II) NOUVEAU(0): redX: 0.659 redY: 0.327   greenX: 0.218 greenY:
0.682
[    25.261] (II) NOUVEAU(0): blueX: 0.141 blueY: 0.068   whiteX: 0.313 whiteY:
0.329
[    25.261] (II) NOUVEAU(0): Supported established timings:
[    25.261] (II) NOUVEAU(0): 720x400@70Hz
[    25.261] (II) NOUVEAU(0): 640x480@60Hz
[    25.261] (II) NOUVEAU(0): 640x480@67Hz
[    25.261] (II) NOUVEAU(0): 640x480@72Hz
[    25.261] (II) NOUVEAU(0): 640x480@75Hz
[    25.261] (II) NOUVEAU(0): 800x600@56Hz
[    25.261] (II) NOUVEAU(0): 800x600@60Hz
[    25.261] (II) NOUVEAU(0): 800x600@72Hz
[    25.261] (II) NOUVEAU(0): 800x600@75Hz
[    25.261] (II) NOUVEAU(0): 832x624@75Hz
[    25.261] (II) NOUVEAU(0): 1024x768@60Hz
[    25.261] (II) NOUVEAU(0): 1024x768@70Hz
[    25.261] (II) NOUVEAU(0): 1024x768@75Hz
[    25.261] (II) NOUVEAU(0): 1280x1024@75Hz
[    25.261] (II) NOUVEAU(0): 1152x864@75Hz
[    25.261] (II) NOUVEAU(0): Manufacturer's mask: 0
[    25.261] (II) NOUVEAU(0): Supported standard timings:
[    25.261] (II) NOUVEAU(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[    25.261] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[    25.261] (II) NOUVEAU(0): #2: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    25.261] (II) NOUVEAU(0): #3: hsize: 1400  vsize 1050  refresh: 60  vid:
16528
[    25.261] (II) NOUVEAU(0): #4: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[    25.261] (II) NOUVEAU(0): #5: hsize: 1280  vsize 960  refresh: 60  vid:
16513
[    25.261] (II) NOUVEAU(0): #6: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[    25.261] (II) NOUVEAU(0): Supported detailed timing:
[    25.261] (II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  550 x 344 mm
[    25.261] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border: 0
[    25.261] (II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209
v_blanking: 1235 v_border: 0
[    25.261] (II) NOUVEAU(0): Serial No: QS2082000703
[    25.261] (II) NOUVEAU(0): Ranges: V min: 50 V max: 75 Hz, H min: 24 H max:
82 kHz, PixClock max 175 MHz
[    25.261] (II) NOUVEAU(0): Monitor name: VX2640w
[    25.261] (II) NOUVEAU(0): EDID (in hex):
[    25.261] (II) NOUVEAU(0):   00ffffffffffff005a63208401010101
[    25.261] (II) NOUVEAU(0):   14120103803722782efe25a85337ae24
[    25.261] (II) NOUVEAU(0):   115054bfef80b300a940950090408180
[    25.261] (II) NOUVEAU(0):   8140714f0101283c80a070b023403020
[    25.261] (II) NOUVEAU(0):   360026582100001a000000ff00515332
[    25.261] (II) NOUVEAU(0):   3038323030303730330a000000fd0032
[    25.261] (II) NOUVEAU(0):   4b185211000a202020202020000000fc
[    25.261] (II) NOUVEAU(0):   00565832363430770a2020202020002a
[    25.261] (II) NOUVEAU(0): Printing probed modes for output VGA-1
[    25.261] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    25.261] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline "1400x1050"x59.9  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline "1440x900"x59.9   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152
 624 625 628 667 -hsync -vsync (49.7 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040
 600 637 643 666 +hsync +vsync (48.1 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832 
480 489 491 520 -hsync -vsync (37.9 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    25.288] (II) NOUVEAU(0): EDID for output TV-1
[    25.288] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[    25.288] (II) NOUVEAU(0): Output VGA-1 connected
[    25.288] (II) NOUVEAU(0): Output TV-1 disconnected
[    25.288] (II) NOUVEAU(0): Using exact sizes for initial modes
[    25.288] (II) NOUVEAU(0): Output VGA-1 using initial mode 1920x1200 +0+0
[    25.288] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    25.288] (--) NOUVEAU(0): Virtual size is 1920x1200 (pitch 0)
[    25.288] (**) NOUVEAU(0):  Driver mode "1920x1200": 154.0 MHz (scaled from
0.0 MHz), 74.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1920x1200"x60.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    25.288] (**) NOUVEAU(0):  Driver mode "1600x1200": 162.0 MHz (scaled from
0.0 MHz), 75.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1600x1200"x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1680x1050": 119.0 MHz (scaled from
0.0 MHz), 64.7 kHz, 59.9 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1680x1050"x59.9  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1400x1050": 101.0 MHz (scaled from
0.0 MHz), 64.7 kHz, 59.9 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1400x1050"x59.9  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1280x1024": 135.0 MHz (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1280x1024"x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1280x1024": 108.0 MHz (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1280x1024"x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1440x900": 88.8 MHz (scaled from
0.0 MHz), 55.5 kHz, 59.9 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1440x900"x59.9   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1280x960": 108.0 MHz (scaled from
0.0 MHz), 60.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline "1280x960"x60.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode "1152x864": 108.0 MHz (scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline "1152x864"x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "1024x768": 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[    25.289] (II) NOUVEAU(0): Modeline "1024x768"x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "1024x768": 75.0 MHz (scaled from
0.0 MHz), 56.5 kHz, 70.1 Hz
[    25.289] (II) NOUVEAU(0): Modeline "1024x768"x70.1   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "1024x768": 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline "1024x768"x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "832x624": 57.3 MHz (scaled from 0.0
MHz), 49.7 kHz, 74.6 Hz
[    25.289] (II) NOUVEAU(0): Modeline "832x624"x74.6   57.28  832 864 928 1152
 624 625 628 667 -hsync -vsync (49.7 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "800x600": 50.0 MHz (scaled from 0.0
MHz), 48.1 kHz, 72.2 Hz
[    25.289] (II) NOUVEAU(0): Modeline "800x600"x72.2   50.00  800 856 976 1040
 600 637 643 666 +hsync +vsync (48.1 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "800x600": 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline "800x600"x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "800x600": 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    25.289] (II) NOUVEAU(0): Modeline "800x600"x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "800x600": 36.0 MHz (scaled from 0.0
MHz), 35.2 kHz, 56.2 Hz
[    25.289] (II) NOUVEAU(0): Modeline "800x600"x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline "640x480"x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "640x480": 31.5 MHz (scaled from 0.0
MHz), 37.9 kHz, 72.8 Hz
[    25.289] (II) NOUVEAU(0): Modeline "640x480"x72.8   31.50  640 664 704 832 
480 489 491 520 -hsync -vsync (37.9 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "640x480": 30.2 MHz (scaled from 0.0
MHz), 35.0 kHz, 66.7 Hz
[    25.289] (II) NOUVEAU(0): Modeline "640x480"x66.7   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "640x480": 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline "640x480"x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode "720x400": 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[    25.289] (II) NOUVEAU(0): Modeline "720x400"x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    25.289] (==) NOUVEAU(0): DPI set to (96, 96)
[    25.289] (II) Loading sub module "fb"
[    25.289] (II) LoadModule: "fb"
[    25.290] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    25.290] (II) Module fb: vendor="X.Org Foundation"
[    25.290]    compiled for 1.14.4, module version = 1.0.0
[    25.290]    ABI class: X.Org ANSI C Emulation, version 0.4
[    25.290] (II) Loading sub module "exa"
[    25.290] (II) LoadModule: "exa"
[    25.290] (II) Loading /usr/lib64/xorg/modules/libexa.so
[    25.291] (II) Module exa: vendor="X.Org Foundation"
[    25.291]    compiled for 1.14.4, module version = 2.6.0
[    25.291]    ABI class: X.Org Video Driver, version 14.1
[    25.291] (II) Loading sub module "shadowfb"
[    25.291] (II) LoadModule: "shadowfb"
[    25.291] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[    25.291] (II) Module shadowfb: vendor="X.Org Foundation"
[    25.291]    compiled for 1.14.4, module version = 1.0.0
[    25.291]    ABI class: X.Org ANSI C Emulation, version 0.4
[    25.291] (II) UnloadModule: "modesetting"
[    25.291] (II) Unloading modesetting
[    25.291] (II) UnloadModule: "fbdev"
[    25.291] (II) Unloading fbdev
[    25.291] (II) UnloadSubModule: "fbdevhw"
[    25.291] (II) Unloading fbdevhw
[    25.291] (II) UnloadModule: "vesa"
[    25.292] (II) Unloading vesa
[    25.292] (--) Depth 24 pixmap format is 32 bpp
[    25.292] (II) NOUVEAU(0): Opened GPU channel 0
[    25.293] (II) NOUVEAU(0): [DRI2] Setup complete
[    25.293] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    25.293] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    25.293] (II) EXA(0): Driver allocated offscreen pixmaps
[    25.293] (II) EXA(0): Driver registered support for the following
operations:
[    25.293] (II)         Solid
[    25.293] (II)         Copy
[    25.293] (II)         Composite (RENDER acceleration)
[    25.293] (II)         UploadToScreen
[    25.293] (II)         DownloadFromScreen
[    25.293] (==) NOUVEAU(0): Backing store disabled
[    25.293] (==) NOUVEAU(0): Silken mouse enabled
[    25.293] (II) NOUVEAU(0): [XvMC] Associated with NV40 texture adapter.
[    25.293] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    25.293] (==) NOUVEAU(0): DPMS enabled
[    25.293] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    25.294] (--) RandR disabled
[    25.298] (II) SELinux: Disabled by boolean
[    25.349] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    25.349] (II) AIGLX: enabled GLX_INTEL_swap_event
[    25.349] (II) AIGLX: enabled GLX_ARB_create_context
[    25.349] (II) AIGLX: enabled GLX_ARB_create_context_profile
[    25.349] (II) AIGLX: enabled GLX_EXT_create_context_es2_profile
[    25.349] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[    25.349] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    25.350] (II) AIGLX: Loaded and initialized nouveau
[    25.350] (II) GLX: Initialized DRI2 GL provider for screen 0
[    25.355] (II) NOUVEAU(0): NVEnterVT is called.
[    25.355] (II) NOUVEAU(0): Setting screen physical size to 508 x 317
[    25.355] resize called 1920 1200
[    25.399] (II) config/udev: Adding input device Power Button
(/dev/input/event1)
[    25.399] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    25.399] (**) Power Button: Applying InputClass "system-keyboard"
[    25.399] (II) LoadModule: "evdev"
[    25.399] (II) Loading /usr/lib64/xorg/modules/input/evdev_drv.so
[    25.399] (II) Module evdev: vendor="X.Org Foundation"
[    25.400]    compiled for 1.14.4, module version = 2.8.4
[    25.400]    Module class: X.Org XInput Driver
[    25.400]    ABI class: X.Org XInput driver, version 19.2
[    25.400] (II) Using input driver 'evdev' for 'Power Button'
[    25.400] (**) Power Button: always reports core events
[    25.400] (**) evdev: Power Button: Device: "/dev/input/event1"
[    25.400] (--) evdev: Power Button: Vendor 0 Product 0x1
[    25.400] (--) evdev: Power Button: Found keys
[    25.400] (II) evdev: Power Button: Configuring as keyboard
[    25.400] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1"
[    25.400] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD, id 6)
[    25.400] (**) Option "xkb_rules" "evdev"
[    25.400] (**) Option "xkb_model" "pc104"
[    25.400] (**) Option "xkb_layout" "us,ru"
[    25.400] (**) Option "xkb_variant" ","
[    25.400] (**) Option "xkb_options" "grp:caps_toggle"
[    25.430] (II) config/udev: Adding input device Power Button
(/dev/input/event0)
[    25.430] (**) Power Button: Applying InputClass "evdev keyboard catchall"
[    25.430] (**) Power Button: Applying InputClass "system-keyboard"
[    25.430] (II) Using input driver 'evdev' for 'Power Button'
[    25.430] (**) Power Button: always reports core events
[    25.430] (**) evdev: Power Button: Device: "/dev/input/event0"
[    25.430] (--) evdev: Power Button: Vendor 0 Product 0x1
[    25.430] (--) evdev: Power Button: Found keys
[    25.430] (II) evdev: Power Button: Configuring as keyboard
[    25.430] (**) Option "config_info"
"udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0"
[    25.430] (II) XINPUT: Adding extended input device "Power Button" (type:
KEYBOARD, id 7)
[    25.430] (**) Option "xkb_rules" "evdev"
[    25.430] (**) Option "xkb_model" "pc104"
[    25.430] (**) Option "xkb_layout" "us,ru"
[    25.430] (**) Option "xkb_variant" ","
[    25.431] (**) Option "xkb_options" "grp:caps_toggle"
[    25.431] (II) config/udev: Adding drm device (/dev/dri/card0)
[    25.432] (II) config/udev: Adding input device gspca_zc3xx
(/dev/input/event12)
[    25.432] (**) gspca_zc3xx: Applying InputClass "evdev keyboard catchall"
[    25.432] (**) gspca_zc3xx: Applying InputClass "system-keyboard"
[    25.432] (II) Using input driver 'evdev' for 'gspca_zc3xx'
[    25.432] (**) gspca_zc3xx: always reports core events
[    25.432] (**) evdev: gspca_zc3xx: Device: "/dev/input/event12"
[    25.432] (--) evdev: gspca_zc3xx: Vendor 0x46d Product 0x89d
[    25.432] (--) evdev: gspca_zc3xx: Found keys
[    25.432] (II) evdev: gspca_zc3xx: Configuring as keyboard
[    25.432] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:12.0/usb4/4-1/input/input15/event12"
[    25.432] (II) XINPUT: Adding extended input device "gspca_zc3xx" (type:
KEYBOARD, id 8)
[    25.432] (**) Option "xkb_rules" "evdev"
[    25.432] (**) Option "xkb_model" "pc104"
[    25.432] (**) Option "xkb_layout" "us,ru"
[    25.432] (**) Option "xkb_variant" ","
[    25.432] (**) Option "xkb_options" "grp:caps_toggle"
[    25.433] (II) config/udev: Adding input device Logitech USB Laser Mouse
(/dev/input/event2)
[    25.433] (**) Logitech USB Laser Mouse: Applying InputClass "evdev pointer
catchall"
[    25.433] (II) Using input driver 'evdev' for 'Logitech USB Laser Mouse'
[    25.433] (**) Logitech USB Laser Mouse: always reports core events
[    25.433] (**) evdev: Logitech USB Laser Mouse: Device: "/dev/input/event2"
[    25.433] (--) evdev: Logitech USB Laser Mouse: Vendor 0x46d Product 0xc062
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found 12 mouse buttons
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found scroll wheel(s)
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found relative axes
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found x and y relative axes
[    25.433] (II) evdev: Logitech USB Laser Mouse: Configuring as mouse
[    25.433] (II) evdev: Logitech USB Laser Mouse: Adding scrollwheel support
[    25.433] (**) evdev: Logitech USB Laser Mouse: YAxisMapping: buttons 4 and
5
[    25.433] (**) evdev: Logitech USB Laser Mouse: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    25.433] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:12.0/usb4/4-2/4-2:1.0/0003:046D:C062.0001/input/input5/event2"
[    25.433] (II) XINPUT: Adding extended input device "Logitech USB Laser
Mouse" (type: MOUSE, id 9)
[    25.433] (II) evdev: Logitech USB Laser Mouse: initialized for relative
axes.
[    25.433] (**) Logitech USB Laser Mouse: (accel) keeping acceleration scheme
1
[    25.434] (**) Logitech USB Laser Mouse: (accel) acceleration profile 0
[    25.434] (**) Logitech USB Laser Mouse: (accel) acceleration factor: 2.000
[    25.434] (**) Logitech USB Laser Mouse: (accel) acceleration threshold: 4
[    25.434] (II) config/udev: Adding input device Logitech USB Laser Mouse
(/dev/input/mouse0)
[    25.434] (II) No input driver specified, ignoring this device.
[    25.434] (II) This device may have been added with another device file.
[    25.435] (II) config/udev: Adding input device Logitech Unifying Device.
Wireless PID:200a (/dev/input/event13)
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: Applying
InputClass "evdev keyboard catchall"
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: Applying
InputClass "system-keyboard"
[    25.435] (II) Using input driver 'evdev' for 'Logitech Unifying Device.
Wireless PID:200a'
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: always reports
core events
[    25.435] (**) evdev: Logitech Unifying Device. Wireless PID:200a: Device:
"/dev/input/event13"
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Vendor
0x46d Product 0xc52b
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found 1
mouse buttons
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
scroll wheel(s)
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
relative axes
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a: Forcing
relative x/y axes to exist.
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
absolute axes
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a: Forcing
absolute x/y axes to exist.
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
keys
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a:
Configuring as mouse
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a:
Configuring as keyboard
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a: Adding
scrollwheel support
[    25.435] (**) evdev: Logitech Unifying Device. Wireless PID:200a:
YAxisMapping: buttons 4 and 5
[    25.435] (**) evdev: Logitech Unifying Device. Wireless PID:200a:
EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    25.435] (**) Option "config_info"
"udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-5/1-5.1/1-5.1:1.2/0003:046D:C52B.0005/0003:046D:C52B.0006/input/input16/event13"
[    25.435] (II) XINPUT: Adding extended input device "Logitech Unifying
Device. Wireless PID:200a" (type: KEYBOARD, id 10)
[    25.435] (**) Option "xkb_rules" "evdev"
[    25.435] (**) Option "xkb_model" "pc104"
[    25.435] (**) Option "xkb_layout" "us,ru"
[    25.435] (**) Option "xkb_variant" ","
[    25.435] (**) Option "xkb_options" "grp:caps_toggle"
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a:
initialized for relative axes.
[    25.435] (WW) evdev: Logitech Unifying Device. Wireless PID:200a: ignoring
absolute axes.
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel) keeping
acceleration scheme 1
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel)
acceleration profile 0
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel)
acceleration factor: 2.000
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel)
acceleration threshold: 4
[    25.436] (II) config/udev: Adding input device HDA ATI SB Line Out Surround
(/dev/input/event7)
[    25.436] (II) No input driver specified, ignoring this device.
[    25.436] (II) This device may have been added with another device file.
[    25.436] (II) config/udev: Adding input device HDA ATI SB Line Out CLFE
(/dev/input/event8)
[    25.436] (II) No input driver specified, ignoring this device.
[    25.436] (II) This device may have been added with another device file.
[    25.436] (II) config/udev: Adding input device HDA ATI SB Line Out Side
(/dev/input/event9)
[    25.436] (II) No input driver specified, ignoring this device.
[    25.436] (II) This device may have been added with another device file.
[    25.437] (II) config/udev: Adding input device HDA ATI SB Front Headphone
(/dev/input/event10)
[    25.437] (II) No input driver specified, ignoring this device.
[    25.437] (II) This device may have been added with another device file.
[    25.437] (II) config/udev: Adding input device HDA ATI SB Front Mic
(/dev/input/event3)
[    25.437] (II) No input driver specified, ignoring this device.
[    25.437] (II) This device may have been added with another device file.
[    25.437] (II) config/udev: Adding input device HDA ATI SB Rear Mic
(/dev/input/event4)
[    25.437] (II) No input driver specified, ignoring this device.
[    25.437] (II) This device may have been added with another device file.
[    25.438] (II) config/udev: Adding input device HDA ATI SB Line
(/dev/input/event5)
[    25.438] (II) No input driver specified, ignoring this device.
[    25.438] (II) This device may have been added with another device file.
[    25.438] (II) config/udev: Adding input device HDA ATI SB Line Out Front
(/dev/input/event6)
[    25.438] (II) No input driver specified, ignoring this device.
[    25.438] (II) This device may have been added with another device file.
[    25.438] (II) config/udev: Adding input device Eee PC WMI hotkeys
(/dev/input/event11)
[    25.438] (**) Eee PC WMI hotkeys: Applying InputClass "evdev keyboard
catchall"
[    25.438] (**) Eee PC WMI hotkeys: Applying InputClass "system-keyboard"
[    25.438] (II) Using input driver 'evdev' for 'Eee PC WMI hotkeys'
[    25.438] (**) Eee PC WMI hotkeys: always reports core events
[    25.438] (**) evdev: Eee PC WMI hotkeys: Device: "/dev/input/event11"
[    25.438] (--) evdev: Eee PC WMI hotkeys: Vendor 0 Product 0
[    25.438] (--) evdev: Eee PC WMI hotkeys: Found keys
[    25.438] (II) evdev: Eee PC WMI hotkeys: Configuring as keyboard
[    25.438] (**) Option "config_info"
"udev:/sys/devices/platform/eeepc-wmi/input/input14/event11"
[    25.438] (II) XINPUT: Adding extended input device "Eee PC WMI hotkeys"
(type: KEYBOARD, id 11)
[    25.438] (**) Option "xkb_rules" "evdev"
[    25.439] (**) Option "xkb_model" "pc104"
[    25.439] (**) Option "xkb_layout" "us,ru"
[    25.439] (**) Option "xkb_variant" ","
[    25.439] (**) Option "xkb_options" "grp:caps_toggle"
[    26.215] (II) NOUVEAU(0): EDID vendor "VSC", prod id 33824
[    26.215] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    26.215] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    26.215] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.215] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    26.215] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1400x1050"x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    26.534] resize called 1920 1200
[    26.959] (II) NOUVEAU(0): EDID vendor "VSC", prod id 33824
[    26.959] (II) NOUVEAU(0): Using hsync ranges from config file
[    26.959] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    26.959] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.959] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    26.959] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1400x1050"x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    38.130] (II) NOUVEAU(0): EDID vendor "VSC", prod id 33824
[    38.130] (II) NOUVEAU(0): Using hsync ranges from config file
[    38.130] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    38.130] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    38.130] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    38.130] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1400x1050"x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    38.220] (II) NOUVEAU(0): EDID vendor "VSC", prod id 33824
[    38.220] (II) NOUVEAU(0): Using hsync ranges from config file
[    38.220] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    38.220] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    38.220] (II) NOUVEAU(0): Modeline "1920x1200"x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    38.220] (II) NOUVEAU(0): Modeline "800x600"x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "800x600"x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "640x480"x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "640x480"x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "640x480"x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "720x400"x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "1024x768"x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline "1024x768"x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1024x768"x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "832x624"x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "800x600"x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "800x600"x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1152x864"x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1680x1050"x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1600x1200"x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1440x900"x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1400x1050"x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1280x1024"x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline "1280x960"x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1414525984.4FfBcFfF1.32260
Date: Tue, 28 Oct 2014 19:53:04 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=85570">85570</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>DPMS does not turn off LCD backlight on G73 (NV4B) [GeForce 7600 GS]
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>kilork&#64;yandex.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>See many similar reports, but never got to work dpms mode off with nouveau. It
works with nvidia drivers, but stopped to work with nouveau.

My distribution now is fedora 3.16.6-203.fc20.x86_64. But this problem was the
same with my old gentoo distribution. Periodically I enable nouveau, check what
problem with backlight persists and switch back to proprietary drivers. Now I
decided to try file a bug, may be someone will help me.

My dmesg output:
[    1.750475] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x04b200a2
[    1.750477] nouveau  [  DEVICE][0000:01:00.0] Chipset: G73 (NV4B)
[    1.750479] nouveau  [  DEVICE][0000:01:00.0] Family : NV40
[    1.750503] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[    1.797924] usb 1-4: New USB device found, idVendor=0421, idProduct=0119
[    1.797927] usb 1-4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[    1.797929] usb 1-4: Product: 5630d-1
[    1.797930] usb 1-4: Manufacturer: Nokia
[    1.797931] usb 1-4: SerialNumber: 359350024392454
[    1.810147] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[    1.810149] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[    1.810240] nouveau  [   VBIOS][0000:01:00.0] BIT signature found
[    1.810242] nouveau  [   VBIOS][0000:01:00.0] version 05.73.22.25.00
[    1.810415] nouveau 0000:01:00.0: irq 89 for MSI/MSI-X
[    1.810423] nouveau  [     PMC][0000:01:00.0] MSI interrupts enabled
[    1.810443] nouveau  [     PFB][0000:01:00.0] RAM type: DDR2
[    1.810444] nouveau  [     PFB][0000:01:00.0] RAM size: 512 MiB
[    1.810446] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 379904 tags
[    1.816929] systemd-udevd[324]: renamed network interface eth0 to p4p1
[    1.844784] nouveau  [  PTHERM][0000:01:00.0] FAN control: none / external
[    1.844795] nouveau  [  PTHERM][0000:01:00.0] fan management: automatic
[    1.844797] nouveau  [  PTHERM][0000:01:00.0] internal sensor: yes
[    1.864815] nouveau  [     CLK][0000:01:00.0] 20: core 400 MHz shader 400
MHz memory 270 MHz
[    1.864825] nouveau  [     CLK][0000:01:00.0] --: core 400 MHz shader 400
MHz memory 270 MHz
[    1.864911] [TTM] Zone  kernel: Available graphics memory: 8164784 kiB
[    1.864912] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    1.864913] [TTM] Initializing pool allocator
[    1.864917] [TTM] Initializing DMA pool allocator
[    1.864927] nouveau  [     DRM] VRAM: 507 MiB
[    1.864928] nouveau  [     DRM] GART: 512 MiB
[    1.864931] nouveau  [     DRM] TMDS table version 1.1
[    1.864933] nouveau W[     DRM] TMDS table script pointers not stubbed
[    1.864934] nouveau  [     DRM] DCB version 3.0
[    1.864935] nouveau  [     DRM] DCB outp 00: 01000300 00000028
[    1.864937] nouveau  [     DRM] DCB outp 01: 03011312 00000000
[    1.864938] nouveau  [     DRM] DCB outp 02: 04011310 00000028
[    1.864939] nouveau  [     DRM] DCB outp 03: 020223f1 00c0c080
[    1.864941] nouveau  [     DRM] DCB conn 00: 1030
[    1.864942] nouveau  [     DRM] DCB conn 01: 0100
[    1.864944] nouveau  [     DRM] DCB conn 02: 0210
[    1.864945] nouveau  [     DRM] DCB conn 03: 0211
[    1.864946] nouveau  [     DRM] DCB conn 04: 0213
[    1.865052] nouveau  [     DRM] Saving VGA fonts
[    1.900712] usb 1-5: new high-speed USB device number 6 using ehci-pci
[    1.926777] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.926779] [drm] Driver supports precise vblank timestamp query.
[    1.926782] nouveau  [     DRM] 0xD06D: Parsing digital output script table
[    1.979026] nouveau  [     DRM] MM: using M2MF for buffer copies
[    1.979032] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[    1.982731] tsc: Refined TSC clocksource calibration: 4013.612 MHz
[    2.015850] usb 1-5: New USB device found, idVendor=1a40, idProduct=0101
[    2.015853] usb 1-5: New USB device strings: Mfr=0, Product=1,
SerialNumber=0
[    2.015855] usb 1-5: Product: USB 2.0 Hub
[    2.016147] hub 1-5:1.0: USB hub found
[    2.016220] hub 1-5:1.0: 4 ports detected
[    2.036909] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo
ffff88042879a800
[    2.037063] fbcon: nouveaufb (fb0) is primary device
[    2.058666] nouveau  [     DRM] 0xD06D: Parsing digital output script table
[    2.110946] Console: switching to colour frame buffer device 240x75
[    2.113227] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.113228] nouveau 0000:01:00.0: registered panic notifier
[    2.119750] [drm] Initialized nouveau 1.1.2 20120801 for 0000:01:00.0 on
minor 0
[    2.331760] usb-storage 1-4:1.0: USB Mass Storage device detected
[    2.331867] scsi6 : usb-storage 1-4:1.0

lspci -vvv:

01:00.0 VGA compatible controller: NVIDIA Corporation G73 [GeForce 7600 GS]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 8214
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast &gt;TAbort- &lt;TAbort-
&lt;MAbort- &gt;SERR- &lt;PERR- INTx-
        Latency: 0, Cache Line Size: 64 bytes
        Interrupt: pin A routed to IRQ 89
        Region 0: Memory at fd000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at c0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at fc000000 (64-bit, non-prefetchable) [size=16M]
        Region 5: I/O ports at e000 [size=128]
        Expansion ROM at fe000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 NoSoftRst- PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] MSI: Enable+ Count=1/1 Maskable- 64bit+
                Address: 00000000fee8000c  Data: 41a3
        Capabilities: [78] Express (v1) Endpoint, MSI 00
                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s &lt;256ns,
L1 &lt;4us
                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE- FLReset-
                DevCtl: Report errors: Correctable- Non-Fatal- Fatal-
Unsupported-
                        RlxdOrd- ExtTag- PhantFunc- AuxPwr- NoSnoop+
                        MaxPayload 128 bytes, MaxReadReq 512 bytes
                DevSta: CorrErr- UncorrErr- FatalErr- UnsuppReq- AuxPwr-
TransPend-
                LnkCap: Port #0, Speed 2.5GT/s, Width x16, ASPM L0s L1, Exit
Latency L0s &lt;256ns, L1 &lt;4us
                        ClockPM- Surprise- LLActRep- BwNot-
                LnkCtl: ASPM Disabled; RCB 128 bytes Disabled- CommClk+
                        ExtSynch- ClockPM- AutWidDis- BWInt- AutBWInt-
                LnkSta: Speed 2.5GT/s, Width x16, TrErr- Train- SlotClk+
DLActive- BWMgmt- ABWMgmt-
        Capabilities: [100 v1] Virtual Channel
                Caps:   LPEVC=0 RefClk=100ns PATEntryBits=1
                Arb:    Fixed- WRR32- WRR64- WRR128-
                Ctrl:   ArbSelect=Fixed
                Status: InProgress-
                VC0:    Caps:   PATOffset=00 MaxTimeSlots=1 RejSnoopTrans-
                        Arb:    Fixed- WRR32- WRR64- WRR128- TWRR128- WRR256-
                        Ctrl:   Enable+ ID=0 ArbSelect=Fixed TC/VC=01
                        Status: NegoPending- InProgress-
        Capabilities: [128 v1] Power Budgeting &lt;?&gt;
        Kernel driver in use: nouveau
        Kernel modules: nouveau

/var/log/Xorg.0.log:

[    25.095] 
X.Org X Server 1.14.4
Release Date: 2013-10-31
[    25.095] X Protocol Version 11, Revision 0
[    25.095] Build Operating System:  3.14.3-200.fc20.x86_64 
[    25.095] Current Operating System: Linux ip-213-141-136-171.bb.netbynet.ru
3.16.6-203.fc20.x86_64 #1 SMP Sat Oct 25 12:44:32 UTC 2014 x86_64
[    25.095] Kernel command line: BOOT_IMAGE=/vmlinuz-3.16.6-203.fc20.x86_64
root=/dev/mapper/fedora_ip--213--141--136--171-root ro
rd.lvm.lv=fedora_ip-213-141-136-171/root
rd.lvm.lv=fedora_ip-213-141-136-171/swap vconsole.font=latarcyrheb-sun16 rhgb
quiet LANG=ru_RU.UTF-8
[    25.095] Build Date: 27 June 2014  01:35:28AM
[    25.095] Build ID: xorg-x11-server 1.14.4-11.fc20 
[    25.095] Current version of pixman: 0.30.0
[    25.095]    Before reporting problems, check <a href="http://wiki.x.org">http://wiki.x.org</a>
        to make sure that you have the latest version.
[    25.095] Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    25.095] (==) Log file: &quot;/var/log/Xorg.0.log&quot;, Time: Tue Oct 28 22:03:43
2014
[    25.096] (==) Using config directory: &quot;/etc/X11/xorg.conf.d&quot;
[    25.096] (==) Using system config directory &quot;/usr/share/X11/xorg.conf.d&quot;
[    25.096] (==) No Layout section.  Using the first Screen section.
[    25.096] (==) No screen section available. Using defaults.
[    25.096] (**) |--&gt;Screen &quot;Default Screen Section&quot; (0)
[    25.096] (**) |   |--&gt;Monitor &quot;&lt;default monitor&gt;&quot;
[    25.096] (==) No monitor specified for screen &quot;Default Screen Section&quot;.
        Using a default monitor configuration.
[    25.096] (==) Automatically adding devices
[    25.096] (==) Automatically enabling devices
[    25.096] (==) Automatically adding GPU devices
[    25.096] (==) FontPath set to:
        catalogue:/etc/X11/fontpath.d,
        built-ins
[    25.096] (==) ModulePath set to &quot;/usr/lib64/xorg/modules&quot;
[    25.096] (II) The server relies on udev to provide the list of input
devices.
        If no devices become available, reconfigure udev or disable
AutoAddDevices.
[    25.096] (II) Loader magic: 0x80dd00
[    25.096] (II) Module ABI versions:
[    25.096]    X.Org ANSI C Emulation: 0.4
[    25.096]    X.Org Video Driver: 14.1
[    25.096]    X.Org XInput driver : 19.2
[    25.096]    X.Org Server Extension : 7.0
[    25.096] (II) xfree86: Adding drm device (/dev/dri/card0)
[    25.098] (--) PCI:*(0:1:0:0) 10de:0392:1043:8214 rev 161, Mem &#64;
0xfd000000/16777216, 0xc0000000/268435456, 0xfc000000/16777216, I/O &#64;
0x0000e000/128, BIOS &#64; 0x????????/131072
[    25.098] Initializing built-in extension Generic Event Extension
[    25.098] Initializing built-in extension SHAPE
[    25.098] Initializing built-in extension MIT-SHM
[    25.098] Initializing built-in extension XInputExtension
[    25.098] Initializing built-in extension XTEST
[    25.098] Initializing built-in extension BIG-REQUESTS
[    25.098] Initializing built-in extension SYNC
[    25.098] Initializing built-in extension XKEYBOARD
[    25.098] Initializing built-in extension XC-MISC
[    25.098] Initializing built-in extension XINERAMA
[    25.098] Initializing built-in extension XFIXES
[    25.098] Initializing built-in extension RENDER
[    25.098] Initializing built-in extension RANDR
[    25.098] Initializing built-in extension COMPOSITE
[    25.098] Initializing built-in extension DAMAGE
[    25.099] Initializing built-in extension MIT-SCREEN-SAVER
[    25.099] Initializing built-in extension DOUBLE-BUFFER
[    25.099] Initializing built-in extension RECORD
[    25.099] Initializing built-in extension DPMS
[    25.099] Initializing built-in extension X-Resource
[    25.099] Initializing built-in extension XVideo
[    25.099] Initializing built-in extension XVideo-MotionCompensation
[    25.099] Initializing built-in extension SELinux
[    25.099] Initializing built-in extension XFree86-VidModeExtension
[    25.099] Initializing built-in extension XFree86-DGA
[    25.099] Initializing built-in extension XFree86-DRI
[    25.099] Initializing built-in extension DRI2
[    25.099] (II) &quot;glx&quot; will be loaded by default.
[    25.099] (WW) &quot;xwayland&quot; is not to be loaded by default. Skipping.
[    25.099] (II) LoadModule: &quot;dri2&quot;
[    25.099] (II) Module &quot;dri2&quot; already built-in
[    25.099] (II) LoadModule: &quot;glamoregl&quot;
[    25.100] (II) Loading /usr/lib64/xorg/modules/libglamoregl.so
[    25.104] (II) Module glamoregl: vendor=&quot;X.Org Foundation&quot;
[    25.104]    compiled for 1.14.4, module version = 0.5.1
[    25.104]    ABI class: X.Org ANSI C Emulation, version 0.4
[    25.104] (II) LoadModule: &quot;glx&quot;
[    25.104] (II) Loading /usr/lib64/xorg/modules/extensions/libglx.so
[    25.106] (II) Module glx: vendor=&quot;X.Org Foundation&quot;
[    25.106]    compiled for 1.14.4, module version = 1.0.0
[    25.106]    ABI class: X.Org Server Extension, version 7.0
[    25.106] (==) AIGLX enabled
[    25.106] Loading extension GLX
[    25.106] (==) Matched nouveau as autoconfigured driver 0
[    25.106] (==) Matched nv as autoconfigured driver 1
[    25.106] (==) Matched nouveau as autoconfigured driver 2
[    25.106] (==) Matched nv as autoconfigured driver 3
[    25.106] (==) Matched modesetting as autoconfigured driver 4
[    25.106] (==) Matched fbdev as autoconfigured driver 5
[    25.106] (==) Matched vesa as autoconfigured driver 6
[    25.106] (==) Assigned the driver to the xf86ConfigLayout
[    25.106] (II) LoadModule: &quot;nouveau&quot;
[    25.106] (II) Loading /usr/lib64/xorg/modules/drivers/nouveau_drv.so
[    25.108] (II) Module nouveau: vendor=&quot;X.Org Foundation&quot;
[    25.108]    compiled for 1.14.2, module version = 1.0.9
[    25.108]    Module class: X.Org Video Driver
[    25.108]    ABI class: X.Org Video Driver, version 14.1
[    25.108] (II) LoadModule: &quot;nv&quot;
[    25.109] (WW) Warning, couldn't open module nv
[    25.109] (II) UnloadModule: &quot;nv&quot;
[    25.109] (II) Unloading nv
[    25.109] (EE) Failed to load module &quot;nv&quot; (module does not exist, 0)
[    25.109] (II) LoadModule: &quot;modesetting&quot;
[    25.109] (II) Loading /usr/lib64/xorg/modules/drivers/modesetting_drv.so
[    25.109] (II) Module modesetting: vendor=&quot;X.Org Foundation&quot;
[    25.109]    compiled for 1.14.2, module version = 0.8.0
[    25.109]    Module class: X.Org Video Driver
[    25.109]    ABI class: X.Org Video Driver, version 14.1
[    25.109] (II) LoadModule: &quot;fbdev&quot;
[    25.109] (II) Loading /usr/lib64/xorg/modules/drivers/fbdev_drv.so
[    25.110] (II) Module fbdev: vendor=&quot;X.Org Foundation&quot;
[    25.110]    compiled for 1.14.2, module version = 0.4.3
[    25.110]    Module class: X.Org Video Driver
[    25.110]    ABI class: X.Org Video Driver, version 14.1
[    25.110] (II) LoadModule: &quot;vesa&quot;
[    25.110] (II) Loading /usr/lib64/xorg/modules/drivers/vesa_drv.so
[    25.110] (II) Module vesa: vendor=&quot;X.Org Foundation&quot;
[    25.110]    compiled for 1.14.2, module version = 2.3.2
[    25.110]    Module class: X.Org Video Driver
[    25.110]    ABI class: X.Org Video Driver, version 14.1
[    25.110] (II) NOUVEAU driver 
[    25.110] (II) NOUVEAU driver for NVIDIA chipset families :
[    25.110]    RIVA TNT        (NV04)
[    25.110]    RIVA TNT2       (NV05)
[    25.110]    GeForce 256     (NV10)
[    25.110]    GeForce 2       (NV11, NV15)
[    25.110]    GeForce 4MX     (NV17, NV18)
[    25.110]    GeForce 3       (NV20)
[    25.110]    GeForce 4Ti     (NV25, NV28)
[    25.111]    GeForce FX      (NV3x)
[    25.111]    GeForce 6       (NV4x)
[    25.111]    GeForce 7       (G7x)
[    25.111]    GeForce 8       (G8x)
[    25.111]    GeForce GTX 200 (NVA0)
[    25.111]    GeForce GTX 400 (NVC0)
[    25.111] (II) modesetting: Driver for Modesetting Kernel Drivers: kms
[    25.111] (II) FBDEV: driver for framebuffer: fbdev
[    25.111] (II) VESA: driver for VESA chipsets: vesa
[    25.111] (++) using VT number 1

[    25.112] (II) [drm] nouveau interface version: 1.1.2
[    25.112] (WW) Falling back to old probe method for modesetting
[    25.112] (WW) Falling back to old probe method for fbdev
[    25.112] (II) Loading sub module &quot;fbdevhw&quot;
[    25.112] (II) LoadModule: &quot;fbdevhw&quot;
[    25.112] (II) Loading /usr/lib64/xorg/modules/libfbdevhw.so
[    25.113] (II) Module fbdevhw: vendor=&quot;X.Org Foundation&quot;
[    25.113]    compiled for 1.14.4, module version = 0.0.2
[    25.113]    ABI class: X.Org Video Driver, version 14.1
[    25.113] (WW) Falling back to old probe method for vesa
[    25.113] (II) Loading sub module &quot;dri2&quot;
[    25.113] (II) LoadModule: &quot;dri2&quot;
[    25.113] (II) Module &quot;dri2&quot; already built-in
[    25.113] (--) NOUVEAU(0): Chipset: &quot;NVIDIA NV4B&quot;
[    25.113] (II) NOUVEAU(0): Creating default Display subsection in Screen
section
        &quot;Default Screen Section&quot; for depth/fbbpp 24/32
[    25.113] (==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
[    25.113] (==) NOUVEAU(0): RGB weight 888
[    25.113] (==) NOUVEAU(0): Default visual is TrueColor
[    25.113] (==) NOUVEAU(0): Using HW cursor
[    25.113] (==) NOUVEAU(0): GLX sync to VBlank disabled.
[    25.113] (==) NOUVEAU(0): Page flipping enabled
[    25.113] (==) NOUVEAU(0): Swap limit set to 2 [Max allowed 2]
[    25.142] (II) NOUVEAU(0): Output DVI-I-1 has no monitor section
[    25.174] (II) NOUVEAU(0): Output VGA-1 has no monitor section
[    25.200] (II) NOUVEAU(0): Output TV-1 has no monitor section
[    25.228] (II) NOUVEAU(0): EDID for output DVI-I-1
[    25.261] (II) NOUVEAU(0): EDID for output VGA-1
[    25.261] (II) NOUVEAU(0): Manufacturer: VSC  Model: 8420  Serial#: 16843009
[    25.261] (II) NOUVEAU(0): Year: 2008  Week: 20
[    25.261] (II) NOUVEAU(0): EDID Version: 1.3
[    25.261] (II) NOUVEAU(0): Digital Display Input
[    25.261] (II) NOUVEAU(0): Max Image Size [cm]: horiz.: 55  vert.: 34
[    25.261] (II) NOUVEAU(0): Gamma: 2.20
[    25.261] (II) NOUVEAU(0): DPMS capabilities: Off
[    25.261] (II) NOUVEAU(0): Supported color encodings: RGB 4:4:4 YCrCb 4:4:4 
[    25.261] (II) NOUVEAU(0): Default color space is primary color space
[    25.261] (II) NOUVEAU(0): First detailed timing is preferred mode
[    25.261] (II) NOUVEAU(0): redX: 0.659 redY: 0.327   greenX: 0.218 greenY:
0.682
[    25.261] (II) NOUVEAU(0): blueX: 0.141 blueY: 0.068   whiteX: 0.313 whiteY:
0.329
[    25.261] (II) NOUVEAU(0): Supported established timings:
[    25.261] (II) NOUVEAU(0): 720x400&#64;70Hz
[    25.261] (II) NOUVEAU(0): 640x480&#64;60Hz
[    25.261] (II) NOUVEAU(0): 640x480&#64;67Hz
[    25.261] (II) NOUVEAU(0): 640x480&#64;72Hz
[    25.261] (II) NOUVEAU(0): 640x480&#64;75Hz
[    25.261] (II) NOUVEAU(0): 800x600&#64;56Hz
[    25.261] (II) NOUVEAU(0): 800x600&#64;60Hz
[    25.261] (II) NOUVEAU(0): 800x600&#64;72Hz
[    25.261] (II) NOUVEAU(0): 800x600&#64;75Hz
[    25.261] (II) NOUVEAU(0): 832x624&#64;75Hz
[    25.261] (II) NOUVEAU(0): 1024x768&#64;60Hz
[    25.261] (II) NOUVEAU(0): 1024x768&#64;70Hz
[    25.261] (II) NOUVEAU(0): 1024x768&#64;75Hz
[    25.261] (II) NOUVEAU(0): 1280x1024&#64;75Hz
[    25.261] (II) NOUVEAU(0): 1152x864&#64;75Hz
[    25.261] (II) NOUVEAU(0): Manufacturer's mask: 0
[    25.261] (II) NOUVEAU(0): Supported standard timings:
[    25.261] (II) NOUVEAU(0): #0: hsize: 1680  vsize 1050  refresh: 60  vid:
179
[    25.261] (II) NOUVEAU(0): #1: hsize: 1600  vsize 1200  refresh: 60  vid:
16553
[    25.261] (II) NOUVEAU(0): #2: hsize: 1440  vsize 900  refresh: 60  vid: 149
[    25.261] (II) NOUVEAU(0): #3: hsize: 1400  vsize 1050  refresh: 60  vid:
16528
[    25.261] (II) NOUVEAU(0): #4: hsize: 1280  vsize 1024  refresh: 60  vid:
32897
[    25.261] (II) NOUVEAU(0): #5: hsize: 1280  vsize 960  refresh: 60  vid:
16513
[    25.261] (II) NOUVEAU(0): #6: hsize: 1152  vsize 864  refresh: 75  vid:
20337
[    25.261] (II) NOUVEAU(0): Supported detailed timing:
[    25.261] (II) NOUVEAU(0): clock: 154.0 MHz   Image Size:  550 x 344 mm
[    25.261] (II) NOUVEAU(0): h_active: 1920  h_sync: 1968  h_sync_end 2000
h_blank_end 2080 h_border: 0
[    25.261] (II) NOUVEAU(0): v_active: 1200  v_sync: 1203  v_sync_end 1209
v_blanking: 1235 v_border: 0
[    25.261] (II) NOUVEAU(0): Serial No: QS2082000703
[    25.261] (II) NOUVEAU(0): Ranges: V min: 50 V max: 75 Hz, H min: 24 H max:
82 kHz, PixClock max 175 MHz
[    25.261] (II) NOUVEAU(0): Monitor name: VX2640w
[    25.261] (II) NOUVEAU(0): EDID (in hex):
[    25.261] (II) NOUVEAU(0):   00ffffffffffff005a63208401010101
[    25.261] (II) NOUVEAU(0):   14120103803722782efe25a85337ae24
[    25.261] (II) NOUVEAU(0):   115054bfef80b300a940950090408180
[    25.261] (II) NOUVEAU(0):   8140714f0101283c80a070b023403020
[    25.261] (II) NOUVEAU(0):   360026582100001a000000ff00515332
[    25.261] (II) NOUVEAU(0):   3038323030303730330a000000fd0032
[    25.261] (II) NOUVEAU(0):   4b185211000a202020202020000000fc
[    25.261] (II) NOUVEAU(0):   00565832363430770a2020202020002a
[    25.261] (II) NOUVEAU(0): Printing probed modes for output VGA-1
[    25.261] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x60.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    25.261] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x59.9  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    25.261] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x59.9   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x60.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x70.1   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;832x624&quot;x74.6   57.28  832 864 928 1152
 624 625 628 667 -hsync -vsync (49.7 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x72.2   50.00  800 856 976 1040
 600 637 643 666 +hsync +vsync (48.1 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x72.8   31.50  640 664 704 832 
480 489 491 520 -hsync -vsync (37.9 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x66.7   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    25.262] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    25.288] (II) NOUVEAU(0): EDID for output TV-1
[    25.288] (II) NOUVEAU(0): Output DVI-I-1 disconnected
[    25.288] (II) NOUVEAU(0): Output VGA-1 connected
[    25.288] (II) NOUVEAU(0): Output TV-1 disconnected
[    25.288] (II) NOUVEAU(0): Using exact sizes for initial modes
[    25.288] (II) NOUVEAU(0): Output VGA-1 using initial mode 1920x1200 +0+0
[    25.288] (II) NOUVEAU(0): Using default gamma of (1.0, 1.0, 1.0) unless
otherwise stated.
[    25.288] (--) NOUVEAU(0): Virtual size is 1920x1200 (pitch 0)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1920x1200&quot;: 154.0 MHz (scaled from
0.0 MHz), 74.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x60.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1600x1200&quot;: 162.0 MHz (scaled from
0.0 MHz), 75.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x60.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1680x1050&quot;: 119.0 MHz (scaled from
0.0 MHz), 64.7 kHz, 59.9 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x59.9  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1400x1050&quot;: 101.0 MHz (scaled from
0.0 MHz), 64.7 kHz, 59.9 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x59.9  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 135.0 MHz (scaled from
0.0 MHz), 80.0 kHz, 75.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x75.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1280x1024&quot;: 108.0 MHz (scaled from
0.0 MHz), 64.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x60.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1440x900&quot;: 88.8 MHz (scaled from
0.0 MHz), 55.5 kHz, 59.9 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x59.9   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1280x960&quot;: 108.0 MHz (scaled from
0.0 MHz), 60.0 kHz, 60.0 Hz
[    25.288] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x60.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    25.288] (**) NOUVEAU(0):  Driver mode &quot;1152x864&quot;: 108.0 MHz (scaled from
0.0 MHz), 67.5 kHz, 75.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x75.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 78.8 MHz (scaled from
0.0 MHz), 60.1 kHz, 75.1 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x75.1   78.80  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.1 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 75.0 MHz (scaled from
0.0 MHz), 56.5 kHz, 70.1 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x70.1   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;1024x768&quot;: 65.0 MHz (scaled from
0.0 MHz), 48.4 kHz, 60.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x60.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;832x624&quot;: 57.3 MHz (scaled from 0.0
MHz), 49.7 kHz, 74.6 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;832x624&quot;x74.6   57.28  832 864 928 1152
 624 625 628 667 -hsync -vsync (49.7 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 50.0 MHz (scaled from 0.0
MHz), 48.1 kHz, 72.2 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x72.2   50.00  800 856 976 1040
 600 637 643 666 +hsync +vsync (48.1 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 49.5 MHz (scaled from 0.0
MHz), 46.9 kHz, 75.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x75.0   49.50  800 816 896 1056
 600 601 604 625 +hsync +vsync (46.9 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 40.0 MHz (scaled from 0.0
MHz), 37.9 kHz, 60.3 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x60.3   40.00  800 840 968 1056
 600 601 605 628 +hsync +vsync (37.9 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;800x600&quot;: 36.0 MHz (scaled from 0.0
MHz), 35.2 kHz, 56.2 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x56.2   36.00  800 824 896 1024
 600 601 603 625 +hsync +vsync (35.2 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (scaled from 0.0
MHz), 37.5 kHz, 75.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x75.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 31.5 MHz (scaled from 0.0
MHz), 37.9 kHz, 72.8 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x72.8   31.50  640 664 704 832 
480 489 491 520 -hsync -vsync (37.9 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 30.2 MHz (scaled from 0.0
MHz), 35.0 kHz, 66.7 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x66.7   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;640x480&quot;: 25.2 MHz (scaled from 0.0
MHz), 31.5 kHz, 60.0 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x60.0   25.20  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    25.289] (**) NOUVEAU(0):  Driver mode &quot;720x400&quot;: 28.3 MHz (scaled from 0.0
MHz), 31.5 kHz, 70.1 Hz
[    25.289] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x70.1   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    25.289] (==) NOUVEAU(0): DPI set to (96, 96)
[    25.289] (II) Loading sub module &quot;fb&quot;
[    25.289] (II) LoadModule: &quot;fb&quot;
[    25.290] (II) Loading /usr/lib64/xorg/modules/libfb.so
[    25.290] (II) Module fb: vendor=&quot;X.Org Foundation&quot;
[    25.290]    compiled for 1.14.4, module version = 1.0.0
[    25.290]    ABI class: X.Org ANSI C Emulation, version 0.4
[    25.290] (II) Loading sub module &quot;exa&quot;
[    25.290] (II) LoadModule: &quot;exa&quot;
[    25.290] (II) Loading /usr/lib64/xorg/modules/libexa.so
[    25.291] (II) Module exa: vendor=&quot;X.Org Foundation&quot;
[    25.291]    compiled for 1.14.4, module version = 2.6.0
[    25.291]    ABI class: X.Org Video Driver, version 14.1
[    25.291] (II) Loading sub module &quot;shadowfb&quot;
[    25.291] (II) LoadModule: &quot;shadowfb&quot;
[    25.291] (II) Loading /usr/lib64/xorg/modules/libshadowfb.so
[    25.291] (II) Module shadowfb: vendor=&quot;X.Org Foundation&quot;
[    25.291]    compiled for 1.14.4, module version = 1.0.0
[    25.291]    ABI class: X.Org ANSI C Emulation, version 0.4
[    25.291] (II) UnloadModule: &quot;modesetting&quot;
[    25.291] (II) Unloading modesetting
[    25.291] (II) UnloadModule: &quot;fbdev&quot;
[    25.291] (II) Unloading fbdev
[    25.291] (II) UnloadSubModule: &quot;fbdevhw&quot;
[    25.291] (II) Unloading fbdevhw
[    25.291] (II) UnloadModule: &quot;vesa&quot;
[    25.292] (II) Unloading vesa
[    25.292] (--) Depth 24 pixmap format is 32 bpp
[    25.292] (II) NOUVEAU(0): Opened GPU channel 0
[    25.293] (II) NOUVEAU(0): [DRI2] Setup complete
[    25.293] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    25.293] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    25.293] (II) EXA(0): Driver allocated offscreen pixmaps
[    25.293] (II) EXA(0): Driver registered support for the following
operations:
[    25.293] (II)         Solid
[    25.293] (II)         Copy
[    25.293] (II)         Composite (RENDER acceleration)
[    25.293] (II)         UploadToScreen
[    25.293] (II)         DownloadFromScreen
[    25.293] (==) NOUVEAU(0): Backing store disabled
[    25.293] (==) NOUVEAU(0): Silken mouse enabled
[    25.293] (II) NOUVEAU(0): [XvMC] Associated with NV40 texture adapter.
[    25.293] (II) NOUVEAU(0): [XvMC] Extension initialized.
[    25.293] (==) NOUVEAU(0): DPMS enabled
[    25.293] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR
disabled message.
[    25.294] (--) RandR disabled
[    25.298] (II) SELinux: Disabled by boolean
[    25.349] (II) AIGLX: enabled GLX_MESA_copy_sub_buffer
[    25.349] (II) AIGLX: enabled GLX_INTEL_swap_event
[    25.349] (II) AIGLX: enabled GLX_ARB_create_context
[    25.349] (II) AIGLX: enabled GLX_ARB_create_context_profile
[    25.349] (II) AIGLX: enabled GLX_EXT_create_context_es2_profile
[    25.349] (II) AIGLX: enabled GLX_SGI_swap_control and GLX_MESA_swap_control
[    25.349] (II) AIGLX: GLX_EXT_texture_from_pixmap backed by buffer objects
[    25.350] (II) AIGLX: Loaded and initialized nouveau
[    25.350] (II) GLX: Initialized DRI2 GL provider for screen 0
[    25.355] (II) NOUVEAU(0): NVEnterVT is called.
[    25.355] (II) NOUVEAU(0): Setting screen physical size to 508 x 317
[    25.355] resize called 1920 1200
[    25.399] (II) config/udev: Adding input device Power Button
(/dev/input/event1)
[    25.399] (**) Power Button: Applying InputClass &quot;evdev keyboard catchall&quot;
[    25.399] (**) Power Button: Applying InputClass &quot;system-keyboard&quot;
[    25.399] (II) LoadModule: &quot;evdev&quot;
[    25.399] (II) Loading /usr/lib64/xorg/modules/input/evdev_drv.so
[    25.399] (II) Module evdev: vendor=&quot;X.Org Foundation&quot;
[    25.400]    compiled for 1.14.4, module version = 2.8.4
[    25.400]    Module class: X.Org XInput Driver
[    25.400]    ABI class: X.Org XInput driver, version 19.2
[    25.400] (II) Using input driver 'evdev' for 'Power Button'
[    25.400] (**) Power Button: always reports core events
[    25.400] (**) evdev: Power Button: Device: &quot;/dev/input/event1&quot;
[    25.400] (--) evdev: Power Button: Vendor 0 Product 0x1
[    25.400] (--) evdev: Power Button: Found keys
[    25.400] (II) evdev: Power Button: Configuring as keyboard
[    25.400] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/LNXSYSTM:00/LNXPWRBN:00/input/input1/event1&quot;
[    25.400] (II) XINPUT: Adding extended input device &quot;Power Button&quot; (type:
KEYBOARD, id 6)
[    25.400] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    25.400] (**) Option &quot;xkb_model&quot; &quot;pc104&quot;
[    25.400] (**) Option &quot;xkb_layout&quot; &quot;us,ru&quot;
[    25.400] (**) Option &quot;xkb_variant&quot; &quot;,&quot;
[    25.400] (**) Option &quot;xkb_options&quot; &quot;grp:caps_toggle&quot;
[    25.430] (II) config/udev: Adding input device Power Button
(/dev/input/event0)
[    25.430] (**) Power Button: Applying InputClass &quot;evdev keyboard catchall&quot;
[    25.430] (**) Power Button: Applying InputClass &quot;system-keyboard&quot;
[    25.430] (II) Using input driver 'evdev' for 'Power Button'
[    25.430] (**) Power Button: always reports core events
[    25.430] (**) evdev: Power Button: Device: &quot;/dev/input/event0&quot;
[    25.430] (--) evdev: Power Button: Vendor 0 Product 0x1
[    25.430] (--) evdev: Power Button: Found keys
[    25.430] (II) evdev: Power Button: Configuring as keyboard
[    25.430] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input0/event0&quot;
[    25.430] (II) XINPUT: Adding extended input device &quot;Power Button&quot; (type:
KEYBOARD, id 7)
[    25.430] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    25.430] (**) Option &quot;xkb_model&quot; &quot;pc104&quot;
[    25.430] (**) Option &quot;xkb_layout&quot; &quot;us,ru&quot;
[    25.430] (**) Option &quot;xkb_variant&quot; &quot;,&quot;
[    25.431] (**) Option &quot;xkb_options&quot; &quot;grp:caps_toggle&quot;
[    25.431] (II) config/udev: Adding drm device (/dev/dri/card0)
[    25.432] (II) config/udev: Adding input device gspca_zc3xx
(/dev/input/event12)
[    25.432] (**) gspca_zc3xx: Applying InputClass &quot;evdev keyboard catchall&quot;
[    25.432] (**) gspca_zc3xx: Applying InputClass &quot;system-keyboard&quot;
[    25.432] (II) Using input driver 'evdev' for 'gspca_zc3xx'
[    25.432] (**) gspca_zc3xx: always reports core events
[    25.432] (**) evdev: gspca_zc3xx: Device: &quot;/dev/input/event12&quot;
[    25.432] (--) evdev: gspca_zc3xx: Vendor 0x46d Product 0x89d
[    25.432] (--) evdev: gspca_zc3xx: Found keys
[    25.432] (II) evdev: gspca_zc3xx: Configuring as keyboard
[    25.432] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:12.0/usb4/4-1/input/input15/event12&quot;
[    25.432] (II) XINPUT: Adding extended input device &quot;gspca_zc3xx&quot; (type:
KEYBOARD, id 8)
[    25.432] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    25.432] (**) Option &quot;xkb_model&quot; &quot;pc104&quot;
[    25.432] (**) Option &quot;xkb_layout&quot; &quot;us,ru&quot;
[    25.432] (**) Option &quot;xkb_variant&quot; &quot;,&quot;
[    25.432] (**) Option &quot;xkb_options&quot; &quot;grp:caps_toggle&quot;
[    25.433] (II) config/udev: Adding input device Logitech USB Laser Mouse
(/dev/input/event2)
[    25.433] (**) Logitech USB Laser Mouse: Applying InputClass &quot;evdev pointer
catchall&quot;
[    25.433] (II) Using input driver 'evdev' for 'Logitech USB Laser Mouse'
[    25.433] (**) Logitech USB Laser Mouse: always reports core events
[    25.433] (**) evdev: Logitech USB Laser Mouse: Device: &quot;/dev/input/event2&quot;
[    25.433] (--) evdev: Logitech USB Laser Mouse: Vendor 0x46d Product 0xc062
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found 12 mouse buttons
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found scroll wheel(s)
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found relative axes
[    25.433] (--) evdev: Logitech USB Laser Mouse: Found x and y relative axes
[    25.433] (II) evdev: Logitech USB Laser Mouse: Configuring as mouse
[    25.433] (II) evdev: Logitech USB Laser Mouse: Adding scrollwheel support
[    25.433] (**) evdev: Logitech USB Laser Mouse: YAxisMapping: buttons 4 and
5
[    25.433] (**) evdev: Logitech USB Laser Mouse: EmulateWheelButton: 4,
EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    25.433] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:12.0/usb4/4-2/4-2:1.0/0003:046D:C062.0001/input/input5/event2&quot;
[    25.433] (II) XINPUT: Adding extended input device &quot;Logitech USB Laser
Mouse&quot; (type: MOUSE, id 9)
[    25.433] (II) evdev: Logitech USB Laser Mouse: initialized for relative
axes.
[    25.433] (**) Logitech USB Laser Mouse: (accel) keeping acceleration scheme
1
[    25.434] (**) Logitech USB Laser Mouse: (accel) acceleration profile 0
[    25.434] (**) Logitech USB Laser Mouse: (accel) acceleration factor: 2.000
[    25.434] (**) Logitech USB Laser Mouse: (accel) acceleration threshold: 4
[    25.434] (II) config/udev: Adding input device Logitech USB Laser Mouse
(/dev/input/mouse0)
[    25.434] (II) No input driver specified, ignoring this device.
[    25.434] (II) This device may have been added with another device file.
[    25.435] (II) config/udev: Adding input device Logitech Unifying Device.
Wireless PID:200a (/dev/input/event13)
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: Applying
InputClass &quot;evdev keyboard catchall&quot;
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: Applying
InputClass &quot;system-keyboard&quot;
[    25.435] (II) Using input driver 'evdev' for 'Logitech Unifying Device.
Wireless PID:200a'
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: always reports
core events
[    25.435] (**) evdev: Logitech Unifying Device. Wireless PID:200a: Device:
&quot;/dev/input/event13&quot;
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Vendor
0x46d Product 0xc52b
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found 1
mouse buttons
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
scroll wheel(s)
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
relative axes
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a: Forcing
relative x/y axes to exist.
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
absolute axes
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a: Forcing
absolute x/y axes to exist.
[    25.435] (--) evdev: Logitech Unifying Device. Wireless PID:200a: Found
keys
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a:
Configuring as mouse
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a:
Configuring as keyboard
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a: Adding
scrollwheel support
[    25.435] (**) evdev: Logitech Unifying Device. Wireless PID:200a:
YAxisMapping: buttons 4 and 5
[    25.435] (**) evdev: Logitech Unifying Device. Wireless PID:200a:
EmulateWheelButton: 4, EmulateWheelInertia: 10, EmulateWheelTimeout: 200
[    25.435] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/pci0000:00/0000:00:12.2/usb1/1-5/1-5.1/1-5.1:1.2/0003:046D:C52B.0005/0003:046D:C52B.0006/input/input16/event13&quot;
[    25.435] (II) XINPUT: Adding extended input device &quot;Logitech Unifying
Device. Wireless PID:200a&quot; (type: KEYBOARD, id 10)
[    25.435] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    25.435] (**) Option &quot;xkb_model&quot; &quot;pc104&quot;
[    25.435] (**) Option &quot;xkb_layout&quot; &quot;us,ru&quot;
[    25.435] (**) Option &quot;xkb_variant&quot; &quot;,&quot;
[    25.435] (**) Option &quot;xkb_options&quot; &quot;grp:caps_toggle&quot;
[    25.435] (II) evdev: Logitech Unifying Device. Wireless PID:200a:
initialized for relative axes.
[    25.435] (WW) evdev: Logitech Unifying Device. Wireless PID:200a: ignoring
absolute axes.
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel) keeping
acceleration scheme 1
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel)
acceleration profile 0
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel)
acceleration factor: 2.000
[    25.435] (**) Logitech Unifying Device. Wireless PID:200a: (accel)
acceleration threshold: 4
[    25.436] (II) config/udev: Adding input device HDA ATI SB Line Out Surround
(/dev/input/event7)
[    25.436] (II) No input driver specified, ignoring this device.
[    25.436] (II) This device may have been added with another device file.
[    25.436] (II) config/udev: Adding input device HDA ATI SB Line Out CLFE
(/dev/input/event8)
[    25.436] (II) No input driver specified, ignoring this device.
[    25.436] (II) This device may have been added with another device file.
[    25.436] (II) config/udev: Adding input device HDA ATI SB Line Out Side
(/dev/input/event9)
[    25.436] (II) No input driver specified, ignoring this device.
[    25.436] (II) This device may have been added with another device file.
[    25.437] (II) config/udev: Adding input device HDA ATI SB Front Headphone
(/dev/input/event10)
[    25.437] (II) No input driver specified, ignoring this device.
[    25.437] (II) This device may have been added with another device file.
[    25.437] (II) config/udev: Adding input device HDA ATI SB Front Mic
(/dev/input/event3)
[    25.437] (II) No input driver specified, ignoring this device.
[    25.437] (II) This device may have been added with another device file.
[    25.437] (II) config/udev: Adding input device HDA ATI SB Rear Mic
(/dev/input/event4)
[    25.437] (II) No input driver specified, ignoring this device.
[    25.437] (II) This device may have been added with another device file.
[    25.438] (II) config/udev: Adding input device HDA ATI SB Line
(/dev/input/event5)
[    25.438] (II) No input driver specified, ignoring this device.
[    25.438] (II) This device may have been added with another device file.
[    25.438] (II) config/udev: Adding input device HDA ATI SB Line Out Front
(/dev/input/event6)
[    25.438] (II) No input driver specified, ignoring this device.
[    25.438] (II) This device may have been added with another device file.
[    25.438] (II) config/udev: Adding input device Eee PC WMI hotkeys
(/dev/input/event11)
[    25.438] (**) Eee PC WMI hotkeys: Applying InputClass &quot;evdev keyboard
catchall&quot;
[    25.438] (**) Eee PC WMI hotkeys: Applying InputClass &quot;system-keyboard&quot;
[    25.438] (II) Using input driver 'evdev' for 'Eee PC WMI hotkeys'
[    25.438] (**) Eee PC WMI hotkeys: always reports core events
[    25.438] (**) evdev: Eee PC WMI hotkeys: Device: &quot;/dev/input/event11&quot;
[    25.438] (--) evdev: Eee PC WMI hotkeys: Vendor 0 Product 0
[    25.438] (--) evdev: Eee PC WMI hotkeys: Found keys
[    25.438] (II) evdev: Eee PC WMI hotkeys: Configuring as keyboard
[    25.438] (**) Option &quot;config_info&quot;
&quot;udev:/sys/devices/platform/eeepc-wmi/input/input14/event11&quot;
[    25.438] (II) XINPUT: Adding extended input device &quot;Eee PC WMI hotkeys&quot;
(type: KEYBOARD, id 11)
[    25.438] (**) Option &quot;xkb_rules&quot; &quot;evdev&quot;
[    25.439] (**) Option &quot;xkb_model&quot; &quot;pc104&quot;
[    25.439] (**) Option &quot;xkb_layout&quot; &quot;us,ru&quot;
[    25.439] (**) Option &quot;xkb_variant&quot; &quot;,&quot;
[    25.439] (**) Option &quot;xkb_options&quot; &quot;grp:caps_toggle&quot;
[    26.215] (II) NOUVEAU(0): EDID vendor &quot;VSC&quot;, prod id 33824
[    26.215] (II) NOUVEAU(0): Using EDID range info for horizontal sync
[    26.215] (II) NOUVEAU(0): Using EDID range info for vertical refresh
[    26.215] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.215] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    26.215] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    26.215] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;832x624&quot;x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    26.216] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    26.534] resize called 1920 1200
[    26.959] (II) NOUVEAU(0): EDID vendor &quot;VSC&quot;, prod id 33824
[    26.959] (II) NOUVEAU(0): Using hsync ranges from config file
[    26.959] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    26.959] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    26.959] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    26.959] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;832x624&quot;x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    26.959] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    38.130] (II) NOUVEAU(0): EDID vendor &quot;VSC&quot;, prod id 33824
[    38.130] (II) NOUVEAU(0): Using hsync ranges from config file
[    38.130] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    38.130] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    38.130] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    38.130] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;832x624&quot;x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    38.130] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)
[    38.220] (II) NOUVEAU(0): EDID vendor &quot;VSC&quot;, prod id 33824
[    38.220] (II) NOUVEAU(0): Using hsync ranges from config file
[    38.220] (II) NOUVEAU(0): Using vrefresh ranges from config file
[    38.220] (II) NOUVEAU(0): Printing DDC gathered Modelines:
[    38.220] (II) NOUVEAU(0): Modeline &quot;1920x1200&quot;x0.0  154.00  1920 1968 2000
2080  1200 1203 1209 1235 +hsync -vsync (74.0 kHz eP)
[    38.220] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   40.00  800 840 968 1056 
600 601 605 628 +hsync +vsync (37.9 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   36.00  800 824 896 1024 
600 601 603 625 +hsync +vsync (35.2 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 656 720 840 
480 481 484 500 -hsync -vsync (37.5 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   31.50  640 664 704 832 
480 489 492 520 -hsync -vsync (37.9 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   30.24  640 704 768 864 
480 483 486 525 -hsync -vsync (35.0 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;640x480&quot;x0.0   25.18  640 656 752 800 
480 490 492 525 -hsync -vsync (31.5 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;720x400&quot;x0.0   28.32  720 738 846 900 
400 412 414 449 -hsync +vsync (31.5 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  135.00  1280 1296 1440
1688  1024 1025 1028 1066 +hsync +vsync (80.0 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   78.75  1024 1040 1136
1312  768 769 772 800 +hsync +vsync (60.0 kHz e)
[    38.220] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   75.00  1024 1048 1184
1328  768 771 777 806 -hsync -vsync (56.5 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1024x768&quot;x0.0   65.00  1024 1048 1184
1344  768 771 777 806 -hsync -vsync (48.4 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;832x624&quot;x0.0   57.28  832 864 928 1152 
624 625 628 667 -hsync -vsync (49.7 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   49.50  800 816 896 1056 
600 601 604 625 +hsync +vsync (46.9 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;800x600&quot;x0.0   50.00  800 856 976 1040 
600 637 643 666 +hsync +vsync (48.1 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1152x864&quot;x0.0  108.00  1152 1216 1344
1600  864 865 868 900 +hsync +vsync (67.5 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1680x1050&quot;x0.0  119.00  1680 1728 1760
1840  1050 1053 1059 1080 +hsync -vsync (64.7 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1600x1200&quot;x0.0  162.00  1600 1664 1856
2160  1200 1201 1204 1250 +hsync +vsync (75.0 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1440x900&quot;x0.0   88.75  1440 1488 1520
1600  900 903 909 926 +hsync -vsync (55.5 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1400x1050&quot;x0.0  101.00  1400 1448 1480
1560  1050 1053 1057 1080 +hsync -vsync (64.7 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1280x1024&quot;x0.0  108.00  1280 1328 1440
1688  1024 1025 1028 1066 +hsync +vsync (64.0 kHz e)
[    38.221] (II) NOUVEAU(0): Modeline &quot;1280x960&quot;x0.0  108.00  1280 1376 1488
1800  960 961 964 1000 +hsync +vsync (60.0 kHz e)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1414525984.4FfBcFfF1.32260--

--===============1894826566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1894826566==--
