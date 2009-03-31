From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20962] New: Nouveau fail on NVIDIA 8200
Date: Mon, 30 Mar 2009 22:56:05 -0700 (PDT)
Message-ID: <bug-20962-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

http://bugs.freedesktop.org/show_bug.cgi?id=20962

           Summary: Nouveau fail on NVIDIA 8200
           Product: xorg
           Version: unspecified
          Platform: x86 (IA32)
        OS/Version: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: haiku235-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=24387)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24387)
DRM Debug Output

Registers Dumps and ... backtrace for ... NV 8200 Integrated Graphics
(10de:0845)

----------------------------------------------------------------------------------
Xorg.0.log

This is a pre-release version of the X server from The X.Org Foundation.
It is not supported in any way.
Bugs may be filed in the bugzilla at http://bugs.freedesktop.org/.
Select the "xorg" product for bugs you find in this release.
Before reporting bugs in pre-release versions please check the
latest version in the X.Org Foundation git repository.
See http://wiki.x.org/wiki/GitPage for git access instructions.

X.Org X Server 1.6.99.1
Release Date: (unreleased)
X Protocol Version 11, Revision 0
Build Operating System: Linux 2.6.29 i686 
Current Operating System: Linux midna 2.6.29 #2 SMP Sat Mar 28 20:11:37 PST
2009 i686
Build Date: 30 March 2009  09:51:32PM

        Before reporting problems, check http://wiki.x.org
        to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
        (++) from command line, (!!) notice, (II) informational,
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/opt/xorg/var/log/Xorg.0.log", Time: Mon Mar 30 22:28:25 2009
(==) Using config file: "/etc/X11/xorg.conf"
(==) ServerLayout "X.org Configurado"
(**) |-->Screen "Screen0" (0)
(**) |   |-->Monitor "Configured Monitor"
(==) No device specified for screen "Screen0".
        Using the first device section listed.
(**) |   |-->Device "Configured Video Device"
(**) |-->Input Device "Mouse0"
(**) |-->Input Device "Keyboard0"
(**) Option "AIGLX" "true"
(==) Not automatically adding devices
(==) Not automatically enabling devices
(WW) The directory "/opt/xorg/lib/X11/fonts/misc/" does not exist.
        Entry deleted from font path.
(WW) The directory "/opt/xorg/lib/X11/fonts/TTF/" does not exist.
        Entry deleted from font path.
(WW) The directory "/opt/xorg/lib/X11/fonts/OTF" does not exist.
        Entry deleted from font path.
(WW) The directory "/opt/xorg/lib/X11/fonts/Type1/" does not exist.
        Entry deleted from font path.
(WW) The directory "/opt/xorg/lib/X11/fonts/100dpi/" does not exist.
        Entry deleted from font path.
(WW) The directory "/opt/xorg/lib/X11/fonts/75dpi/" does not exist.
        Entry deleted from font path.
(==) FontPath set to:
        built-ins
(==) ModulePath set to "/opt/xorg/lib/xorg/modules"
(**) Extension "Composite" is enabled
(**) Extension "RENDER" is enabled
(**) Extension "DAMAGE" is enabled
(**) Extension "XVideo" is enabled
(II) Loader magic: 0x81ea4c0
(II) Module ABI versions:
        X.Org ANSI C Emulation: 0.4
        X.Org Video Driver: 5.0
        X.Org XInput driver : 5.0
        X.Org Server Extension : 2.0
(--) using VT number 7

(--) PCI: (0@0:1:3) nVidia Corporation MCP78S [GeForce 8200] Co-Processor rev
162, Mem @ 0xc0080000/524288
(--) PCI:*(0@2:0:0) nVidia Corporation unknown chipset (0x0845) rev 162, Mem @
0xc1000000/16777216, 0xd0000000/268435456, 0xc4000000/33554432, I/O @
0x00004000/128, BIOS @ 0x????????/131072
(II) Open ACPI successful (/var/run/acpid.socket)
(II) System resource ranges:
        [0] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [5] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [6] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [7] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [8] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [9] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [10] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [11] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [12] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [13] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [14] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [15] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [16] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [17] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [18] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [19] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [20] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [21] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [22] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [23] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [24] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [25] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [26] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [27] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [28] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [29] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
(II) LoadModule: "extmod"
(II) Loading /opt/xorg/lib/xorg/modules/extensions/libextmod.so
(II) Module extmod: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 2.0
(II) Loading extension MIT-SCREEN-SAVER
(II) Loading extension XFree86-VidModeExtension
(II) Loading extension XFree86-DGA
(II) Loading extension DPMS
(II) Loading extension XVideo
(II) Loading extension XVideo-MotionCompensation
(II) Loading extension X-Resource
(II) LoadModule: "dbe"
(II) Loading /opt/xorg/lib/xorg/modules/extensions/libdbe.so
(II) Module dbe: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        Module class: X.Org Server Extension
        ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DOUBLE-BUFFER
(II) LoadModule: "glx"
(II) Loading /opt/xorg/lib/xorg/modules/extensions/libglx.so
(II) Module glx: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        ABI class: X.Org Server Extension, version 2.0
(**) AIGLX enabled
(II) Loading extension GLX
(II) LoadModule: "dri"
(II) Loading /opt/xorg/lib/xorg/modules/extensions/libdri.so
(II) Module dri: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        ABI class: X.Org Server Extension, version 2.0
(II) Loading extension XFree86-DRI
(II) LoadModule: "dri2"
(II) Loading /opt/xorg/lib/xorg/modules/extensions/libdri2.so
(II) Module dri2: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        ABI class: X.Org Server Extension, version 2.0
(II) Loading extension DRI2
(II) LoadModule: "nouveau"
(II) Loading /opt/xorg/lib/xorg/modules/drivers/nouveau_drv.so
(II) Module nouveau: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 0.0.10
        Module class: X.Org Video Driver
        ABI class: X.Org Video Driver, version 5.0
(II) LoadModule: "mouse"
(II) Loading /opt/xorg/lib/xorg/modules/input/mouse_drv.so
(II) Module mouse: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.4.0
        Module class: X.Org XInput Driver
        ABI class: X.Org XInput driver, version 5.0
(II) LoadModule: "kbd"
(II) Loading /opt/xorg/lib/xorg/modules/input/kbd_drv.so
(II) Module kbd: vendor="X.Org Foundation"
        compiled for 1.4.2, module version = 1.3.2
        Module class: X.Org XInput Driver
        ABI class: X.Org XInput driver, version 2.0
(EE) module ABI major version (2) doesn't match the server's version (5)
(II) UnloadModule: "kbd"
(II) Unloading /opt/xorg/lib/xorg/modules/input/kbd_drv.so
(EE) Failed to load module "kbd" (module requirement mismatch, 0)
(II) NOUVEAU driver Date:   Mon Mar 30 03:31:01 2009 +0100
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
(II) Primary Device is: PCI 02@00:00:0
(II) resource ranges after probing:
        [0] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [1] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [2] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [3] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [4] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [5] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [6] -1  0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [7] -1  0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [8] -1  0       0xffffffff - 0xffffffff (0x1) MX[B]
        [9] -1  0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [10] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [11] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [12] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [13] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [14] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [15] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [16] -1 0       0xffffffff - 0xffffffff (0x1) MX[B]
        [17] -1 0       0x000f0000 - 0x000fffff (0x10000) MX[B]
        [18] -1 0       0x000c0000 - 0x000effff (0x30000) MX[B]
        [19] -1 0       0x00000000 - 0x0009ffff (0xa0000) MX[B]
        [20] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [21] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [22] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [23] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [24] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [25] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [26] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [27] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
        [28] -1 0       0x0000ffff - 0x0000ffff (0x1) IX[B]
        [29] -1 0       0x00000000 - 0x00000000 (0x1) IX[B]
(--) NOUVEAU(0): Chipset: "NVIDIA NVAA"
(II) Loading sub module "int10"
(II) LoadModule: "int10"
(II) Loading /opt/xorg/lib/xorg/modules/libint10.so
(II) Module int10: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 1.0.0
        ABI class: X.Org Video Driver, version 5.0
(II) NOUVEAU(0): Initializing int10
(II) NOUVEAU(0): Primary V_BIOS segment is: 0xc000
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenByBusid: Searching for BusID pci:0000:02:00.0
drmOpenDevice: node name is /dev/dri/card0
drmOpenDevice: open result is 12, (OK)
drmOpenByBusid: drmOpenMinor returns 12
drmOpenByBusid: drmGetBusid reports pci:0000:02:00.0
(II) [drm] DRM interface version 1.3
(II) [drm] DRM open master succeeded.
(II) NOUVEAU(0): [drm] nouveau interface version: 0.0.12
(--) NOUVEAU(0): [drm] kernel modesetting not available
(--) NOUVEAU(0): VESA-HACK: Console VGA mode is 0x3
(II) NOUVEAU(0): Creating default Display subsection in Screen section
        "Screen0" for depth/fbbpp 24/32
(==) NOUVEAU(0): Depth 24, (--) framebuffer bpp 32
(==) NOUVEAU(0): RGB weight 888
(==) NOUVEAU(0): Default visual is TrueColor
(II) Loading sub module "vgahw"
(II) LoadModule: "vgahw"
(II) Loading /opt/xorg/lib/xorg/modules/libvgahw.so
(II) Module vgahw: vendor="X.Org Foundation"
        compiled for 1.6.99.1, module version = 0.1.0
        ABI class: X.Org Video Driver, version 5.0
(==) NOUVEAU(0): Randr1.2 support enabled
(==) NOUVEAU(0): Using HW cursor
(--) NOUVEAU(0): Linear framebuffer at 0xD0000000
(--) NOUVEAU(0): MMIO registers at 0xC1000000
(II) NOUVEAU(0): Initial CRTC_OWNER is 0
(II) NOUVEAU(0): Attempting to load BIOS image from PROM
(!!) NOUVEAU(0): ... BIOS signature not found
(II) NOUVEAU(0): Attempting to load BIOS image from PRAMIN
(II) NOUVEAU(0): ... appears to be valid
(II) NOUVEAU(0): BIT BIOS found
(II) NOUVEAU(0): Bios version 62.77.2f.00
(WW) NOUVEAU(0): TMDS table revision 2.0 not currently supported
(II) NOUVEAU(0): Found Display Configuration Block version 4.0
(!!) NOUVEAU(0): Raw DCB entry 0: 01000323 00010034
(WW) NOUVEAU(0): G80+ LVDS not initialized by driver; ignoring conf bits
(!!) NOUVEAU(0): Raw DCB entry 1: 02011300 0000001e
(!!) NOUVEAU(0): Raw DCB entry 2: 02022332 00020010
(!!) NOUVEAU(0): Raw DCB entry 3: 0000000e 00000000
(--) NOUVEAU(0): Parsing VBIOS init table 0 at offset 0xD5C5
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020060 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020074 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002010C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020114 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0002011C ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00020120 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0000C054 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x002FF0A8 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x002FF0A8 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614100 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614900 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614100 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614900 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00009220 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00009200 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00009210 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00614004 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00610184 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00610184 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00619F00 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x00021220 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061A068 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061A868 ==========
(EE) NOUVEAU(0): ========== unknown reg 0x0061B068 ==========

Backtrace:
0: /opt/xorg/bin/Xorg(xorg_backtrace+0x37) [0x80a0e57]

Fatal server error:
Caught signal 11.  Server aborting


Please consult the The X.Org Foundation support 
         at http://wiki.x.org
 for help. 
Please also check the log file at "/opt/xorg/var/log/Xorg.0.log" for additional
information.

---------------------------------------------------------------------------''

oberon@midna:~$ sudo lspci -vvn -s 2:00
02:00.0 0300: 10de:0845 (rev a2) (prog-if 00 [VGA controller])
        Subsystem: 103c:360a
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx-
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 19
        Region 0: Memory at c1000000 (32-bit, non-prefetchable) [size=16M]
        Region 1: Memory at d0000000 (64-bit, prefetchable) [size=256M]
        Region 3: Memory at c4000000 (64-bit, prefetchable) [size=32M]
        Region 5: I/O ports at 4000 [size=128]
        [virtual] Expansion ROM at c6000000 [disabled] [size=128K]
        Capabilities: [60] Power Management version 2
                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
PME(D0-,D1-,D2-,D3hot-,D3cold-)
                Status: D0 PME-Enable- DSel=0 DScale=0 PME-
        Capabilities: [68] Message Signalled Interrupts: Mask- 64bit+ Queue=0/0
Enable-
                Address: 0000000000000000  Data: 0000
        Kernel driver in use: nvidia
        Kernel modules: nvidia


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
