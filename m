From: Anders Eriksson <aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org>
Subject: "(EE) NOUVEAU(0): Unable to allocate GART memory" (TNT-2)
Date: Tue, 16 Nov 2010 22:40:15 +0100
Message-ID: <20101116214015.15A3C940003@tippex.mynet.homeunix.org>
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


I recently discovered $subject in my xorg logs. Any idea what it means and how 
to get rid of it? Google suggests changing BIOS parameters but my bios has no 
agp related options (this is a P-II machine from ca 2000).


Some data attached.

/anders


>dmesg | egrep '(gart|drm|nouveau)'
[    9.099026] Linux agpgart interface v0.103
[    9.154475] agpgart-intel 0000:00:00.0: Intel 440BX Chipset
[    9.189754] PM: Adding info for No Bus:agpgart
[    9.199242] agpgart-intel 0000:00:00.0: AGP aperture is 64M @ 0x44000000
[    9.231120] [drm] Initialized drm 1.1.0 20060810
[    9.277291] nouveau 0000:01:00.0: PCI INT A -> Link[LNKA] -> GSI 11 (level, low) -> IRQ 11
[    9.883226] [drm] nouveau 0000:01:00.0: Detected an NV 0 generation card (0x20154000)
[    9.911229] [drm] nouveau 0000:01:00.0: Attempting to load BIOS image from PRAMIN
[   10.081464] [drm] nouveau 0000:01:00.0: ... appears to be valid
[   10.150587] [drm] nouveau 0000:01:00.0: BMP BIOS found
[   10.151970] [drm] nouveau 0000:01:00.0: BMP version 5.1
[   10.154050] [drm] nouveau 0000:01:00.0: Bios version 02.05.17.06
[   10.155560] [drm] nouveau 0000:01:00.0: Assuming a CRT output exists
[   10.157784] [drm] nouveau 0000:01:00.0: Probing TV encoders on I2C bus: 1
[   10.190521] [drm] nouveau 0000:01:00.0: No TV encoders found.
[   10.250904] [drm] nouveau 0000:01:00.0: Detected 16MiB VRAM
[   10.430881] agpgart-intel 0000:00:00.0: AGP 1.0 bridge
[   10.435597] agpgart-intel 0000:00:00.0: putting AGP V2 device into 2x mode
[   10.445600] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[   10.447590] [drm] nouveau 0000:01:00.0: 64 MiB GART (aperture)
[   10.456054] [drm] nouveau 0000:01:00.0: Allocating FIFO number 0
[   10.616818] [drm] nouveau 0000:01:00.0: nouveau_channel_alloc: initialised FIFO 0
[   10.618966] [drm] nouveau 0000:01:00.0: Saving VGA fonts
[   10.733936] [drm] nouveau 0000:01:00.0: Detected a VGA connector
[   10.763794] [drm] nouveau 0000:01:00.0: Setting dpms mode 3 on vga encoder (output 0)
[   11.146793] [drm] nouveau 0000:01:00.0: allocated 1680x1050 fb: 0x45000, bo e73e3a00
[   11.333727] [drm] nouveau 0000:01:00.0: Setting dpms mode 0 on vga encoder (output 0)
[   11.334038] [drm] nouveau 0000:01:00.0: Output VGA-1 is running on CRTC 0 using output @
[   12.026634] fb0: nouveaufb frame buffer device
[   12.029063] drm: registered panic notifier
[   12.050856] [drm] Initialized nouveau 0.0.16 20090420 for 0000:01:00.0 on minor 0


xorg log:
[  1393.179] (II) NOUVEAU(0): Opened GPU channel 1
[  1393.183] (II) NOUVEAU(0): [DRI2] Setup complete
[  1393.184] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau_vieux
[  1393.184] (II) NOUVEAU(0): GART: 64MiB available
[  1393.185] (EE) NOUVEAU(0): Unable to allocate GART memory
[  1393.211] (II) EXA(0): Driver allocated offscreen pixmaps
[  1393.211] (II) EXA(0): Driver registered support for the following operations:
[  1393.211] (II)         Solid
[  1393.211] (II)         Copy
[  1393.211] (II)         UploadToScreen
[  1393.212] (II)         DownloadFromScreen
[  1393.212] (==) NOUVEAU(0): Backing store disabled
[  1393.212] (==) NOUVEAU(0): Silken mouse enabled
[  1393.213] (**) NOUVEAU(0): DPMS enabled
[  1393.213] (II) NOUVEAU(0): RandR 1.2 enabled, ignore the following RandR disabled message.



lspci -v
00:00.0 Host bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX Host bridge (rev 02)
        Flags: bus master, medium devsel, latency 64
        Memory at 44000000 (32-bit, prefetchable) [size=64M]
        Capabilities: [a0] AGP version 1.0
        Kernel driver in use: agpgart-intel

00:01.0 PCI bridge: Intel Corporation 440BX/ZX/DX - 82443BX/ZX/DX AGP bridge (rev 02) (prog-if 00 [Normal decode])
        Flags: bus master, 66MHz, medium devsel, latency 64
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=64
        Memory behind bridge: 40000000-40ffffff
        Prefetchable memory behind bridge: 42000000-43ffffff

00:03.0 Network controller: RaLink RT2500 802.11g Cardbus/mini-PCI (rev 01)
        Subsystem: RaLink Device 2560
        Flags: bus master, slow devsel, latency 66, IRQ 3
        Memory at 48000000 (32-bit, non-prefetchable) [size=8K]
        Capabilities: [40] Power Management version 2
        Kernel driver in use: rt2500pci
        Kernel modules: rt2500pci

00:04.0 Multimedia audio controller: Aureal Semiconductor Vortex 1 (rev 02)
        Subsystem: Diamond Multimedia Systems Sonic Impact A3D
        Flags: bus master, medium devsel, latency 64, IRQ 11
        Memory at 41000000 (32-bit, non-prefetchable) [size=128K]
        I/O ports at 10b0 [size=8]
        I/O ports at 10b8 [size=8]
        Capabilities: [dc] Power Management version 1
        Kernel driver in use: au8820

00:12.0 Ethernet controller: Digital Equipment Corporation DECchip 21142/43 (rev 41)
        Subsystem: Compaq Computer Corporation Device b11e
        Flags: bus master, medium devsel, latency 66, IRQ 11
        I/O ports at 1000 [size=128]
        Memory at 41200000 (32-bit, non-prefetchable) [size=1K]
        [virtual] Expansion ROM at 28000000 [disabled] [size=256K]
        Capabilities: [dc] Power Management version 1
        Kernel driver in use: tulip

00:14.0 ISA bridge: Intel Corporation 82371AB/EB/MB PIIX4 ISA (rev 02)
        Flags: bus master, medium devsel, latency 0

00:14.1 IDE interface: Intel Corporation 82371AB/EB/MB PIIX4 IDE (rev 01) (prog-if 80 [Master])
        Flags: bus master, medium devsel, latency 64
        [virtual] Memory at 000001f0 (32-bit, non-prefetchable) [size=8]
        [virtual] Memory at 000003f0 (type 3, non-prefetchable) [size=1]
        [virtual] Memory at 00000170 (32-bit, non-prefetchable) [size=8]
        [virtual] Memory at 00000370 (type 3, non-prefetchable) [size=1]
        I/O ports at 10a0 [size=16]
        Kernel driver in use: ata_piix

00:14.2 USB Controller: Intel Corporation 82371AB/EB/MB PIIX4 USB (rev 01) (prog-if 00 [UHCI])
        Flags: bus master, medium devsel, latency 64, IRQ 11
        I/O ports at 1080 [size=32]
        Kernel driver in use: uhci_hcd

00:14.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 02)
        Flags: medium devsel, IRQ 9
        Kernel modules: i2c-piix4

01:00.0 VGA compatible controller: nVidia Corporation NV5 [RIVA TNT2/TNT2 Pro] (rev 15) (prog-if 00 [VGA controller])
        Subsystem: nVidia Corporation Compaq NVIDIA TNT2 Pro
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 11
        Memory at 40000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 42000000 (32-bit, prefetchable) [size=32M]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: [60] Power Management version 1
        Capabilities: [44] AGP version 2.0
        Kernel driver in use: nouveau
