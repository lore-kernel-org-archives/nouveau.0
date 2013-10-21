From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 20341] [NV31] lockup when using AGP. agpmode=0 fixes
	it.
Date: Mon, 21 Oct 2013 01:58:54 +0000
Message-ID: <bug-20341-8800-yvWORxKP5B@http.bugs.freedesktop.org/>
References: <bug-20341-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1358410141=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-20341-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1358410141==
Content-Type: multipart/alternative; boundary="1382320734.6143511.28416"; charset="us-ascii"


--1382320734.6143511.28416
Date: Mon, 21 Oct 2013 01:58:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=20341

--- Comment #26 from Jason Detring <detringj-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Works well, just needs the chipset ID swapped.

-       { PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8363_0, PCI_VENDOR_ID_NVIDIA,
0x0311, 2 },
+       { PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C691_0, PCI_VENDOR_ID_NVIDIA,
PCI_DEVICE_ID_NVIDIA_GEFORCE_FX_5600_ULTRA, 2 },



> lspci -vnn
00:00.0 Host bridge [0600]: VIA Technologies, Inc. VT82C693A/694x [Apollo
PRO133x] [1106:0691] (rev 03)
        Flags: bus master, medium devsel, latency 0
        Memory at 90000000 (32-bit, prefetchable) [size=64M]
        Capabilities: [a0] AGP version 2.0
        Capabilities: [c0] Power Management version 2
        Kernel driver in use: agpgart-via

00:01.0 PCI bridge [0604]: VIA Technologies, Inc. VT8363/8365 [KT133/KM133 AGP]
[1106:8305] (prog-if 00 [Normal decode])
        Flags: bus master, 66MHz, medium devsel, latency 0
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        Memory behind bridge: 80000000-80ffffff
        Prefetchable memory behind bridge: 88000000-8fffffff
        Capabilities: [80] Power Management version 2

00:05.0 Ethernet controller [0200]: Intel Corporation 82541PI Gigabit Ethernet
Controller [8086:107c] (rev 05)
        Subsystem: Intel Corporation PRO/1000 GT Desktop Adapter [8086:1376]
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 5
        Memory at a0000000 (32-bit, non-prefetchable) [size=128K]
        Memory at a0100000 (32-bit, non-prefetchable) [size=128K]
        I/O ports at 1480 [size=64]
        [virtual] Expansion ROM at 0c000000 [disabled] [size=128K]
        Capabilities: [dc] Power Management version 2
        Capabilities: [e4] PCI-X non-bridge device
        Kernel driver in use: e1000

00:14.0 ISA bridge [0601]: VIA Technologies, Inc. VT82C686 [Apollo Super South]
[1106:0686] (rev 22)
        Flags: bus master, stepping, medium devsel, latency 0
        Kernel driver in use: parport_pc

00:14.1 IDE interface [0101]: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE [1106:0571] (rev 10)
(prog-if 8a [Master SecP PriP])
        Flags: bus master, medium devsel, latency 64
        [virtual] Memory at 000001f0 (32-bit, non-prefetchable) [size=8]
        [virtual] Memory at 000003f0 (type 3, non-prefetchable) [size=1]
        [virtual] Memory at 00000170 (32-bit, non-prefetchable) [size=8]
        [virtual] Memory at 00000370 (type 3, non-prefetchable) [size=1]
        I/O ports at 1440 [size=16]
        Capabilities: [c0] Power Management version 2
        Kernel driver in use: pata_via

00:14.2 USB controller [0c03]: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller [1106:3038] (rev 10) (prog-if 00 [UHCI])
        Subsystem: First International Computer, Inc. VA-502 Mainboard
[0925:1234]
        Flags: bus master, medium devsel, latency 66, IRQ 11
        I/O ports at 1400 [size=32]
        Capabilities: [80] Power Management version 2
        Kernel driver in use: uhci_hcd

00:14.3 USB controller [0c03]: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller [1106:3038] (rev 10) (prog-if 00 [UHCI])
        Subsystem: First International Computer, Inc. VA-502 Mainboard
[0925:1234]
        Flags: bus master, medium devsel, latency 66, IRQ 11
        I/O ports at 1420 [size=32]
        Capabilities: [80] Power Management version 2
        Kernel driver in use: uhci_hcd

00:14.4 Bridge [0680]: VIA Technologies, Inc. VT82C686 [Apollo Super ACPI]
[1106:3057] (rev 30)
        Flags: medium devsel, IRQ 9
        Capabilities: [68] Power Management version 2

00:14.5 Multimedia audio controller [0401]: VIA Technologies, Inc. VT82C686
AC97 Audio Controller [1106:3058] (rev 20)
        Subsystem: Compaq Computer Corporation Device [0e11:003d]
        Flags: medium devsel, IRQ 10
        I/O ports at 1000 [size=256]
        I/O ports at 1450 [size=4]
        I/O ports at 1454 [size=4]
        Capabilities: [c0] Power Management version 2
        Kernel driver in use: snd_via82xx

01:00.0 VGA compatible controller [0300]: nVidia Corporation NV31 [GeForce FX
5600 Ultra] [10de:0311] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Chaintech Computer Co. Ltd Device [270f:1946]
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 3
        Memory at 80000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 88000000 (32-bit, prefetchable) [size=128M]
        Expansion ROM at <unassigned> [disabled]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel driver in use: nouveau


> uname -a
Linux anduril 3.12.0-rc6 #2 SMP Sat Oct 19 16:47:44 CDT 2013 i686 AMD
Athlon(tm) Processor AuthenticAMD GNU/Linux


> dmesg
...
[ 1786.573538] [drm] hdmi device  not found 1 0 1
[ 1786.573760] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x031100a1
[ 1786.573769] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV31 (NV31)
[ 1786.573776] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[ 1786.575845] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[ 1786.616891] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[ 1786.616900] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[ 1786.616909] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.27
[ 1786.617452] nouveau  [   VBIOS][0000:01:00.0] version 04.31.20.52.00
[ 1786.623690] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[ 1786.623718] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[ 1786.623724] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[ 1786.623731] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 262144 tags
[ 1786.636667] nouveau  [  DEVICE][0000:01:00.0] Setting agp speed to 2X. Use
agpmode to override.
[ 1786.636683] agpgart-via 0000:00:00.0: AGP 2.0 bridge
[ 1786.636715] agpgart-via 0000:00:00.0: putting AGP V2 device into 2x mode
[ 1786.636766] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[ 1786.640057] [TTM] Zone  kernel: Available graphics memory: 92344 kiB
[ 1786.640064] [TTM] Initializing pool allocator
[ 1786.640118] nouveau  [     DRM] VRAM: 127 MiB
[ 1786.640123] nouveau  [     DRM] GART: 64 MiB
[ 1786.640135] nouveau  [     DRM] BMP version 5.39
[ 1786.640145] nouveau  [     DRM] DCB version 2.2
[ 1786.640155] nouveau  [     DRM] DCB outp 00: 01000300 00009c40
[ 1786.640163] nouveau  [     DRM] DCB outp 01: 02010310 00009c40
[ 1786.640169] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[ 1786.640176] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[ 1786.640562] nouveau  [     DRM] Loading NV17 power sequencing microcode
[ 1786.646548] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[ 1786.646560] [drm] No driver support for vblank timestamp query.
[ 1786.646580] nouveau  [     DRM] 0xE1B4: Parsing digital output script table
[ 1786.647246] nouveau  [     DRM] 0 available performance level(s)
[ 1786.647258] nouveau  [     DRM] c: core 234MHz memory 501MHz voltage 1220mV
[ 1786.655499] nouveau  [     DRM] MM: using M2MF for buffer copies
[ 1786.655538] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[ 1786.751345] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo cab83400
[ 1786.751589] fbcon: nouveaufb (fb0) is primary device
[ 1786.781270] Console: switching to colour frame buffer device 240x75
[ 1786.784371] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[ 1786.784376] nouveau 0000:01:00.0: registered panic notifier
[ 1786.789898] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0



I've had x11perf in a while-true loop for the better part of a day.  Seems
solid, no issues to report.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382320734.6143511.28416
Date: Mon, 21 Oct 2013 01:58:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - [NV31] lockup when using AGP. agpmode=0 fixes it."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=20341">bug 20341</a>
              from <span class="vcard"><a class="email" href="mailto:detringj&#64;gmail.com" title="Jason Detring &lt;detringj&#64;gmail.com&gt;"> <span class="fn">Jason Detring</span></a>
</span></b>
        <pre>Works well, just needs the chipset ID swapped.

-       { PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_8363_0, PCI_VENDOR_ID_NVIDIA,
0x0311, 2 },
+       { PCI_VENDOR_ID_VIA, PCI_DEVICE_ID_VIA_82C691_0, PCI_VENDOR_ID_NVIDIA,
PCI_DEVICE_ID_NVIDIA_GEFORCE_FX_5600_ULTRA, 2 },



<span class="quote">&gt; lspci -vnn</span >
00:00.0 Host bridge [0600]: VIA Technologies, Inc. VT82C693A/694x [Apollo
PRO133x] [1106:0691] (rev 03)
        Flags: bus master, medium devsel, latency 0
        Memory at 90000000 (32-bit, prefetchable) [size=64M]
        Capabilities: [a0] AGP version 2.0
        Capabilities: [c0] Power Management version 2
        Kernel driver in use: agpgart-via

00:01.0 PCI bridge [0604]: VIA Technologies, Inc. VT8363/8365 [KT133/KM133 AGP]
[1106:8305] (prog-if 00 [Normal decode])
        Flags: bus master, 66MHz, medium devsel, latency 0
        Bus: primary=00, secondary=01, subordinate=01, sec-latency=0
        Memory behind bridge: 80000000-80ffffff
        Prefetchable memory behind bridge: 88000000-8fffffff
        Capabilities: [80] Power Management version 2

00:05.0 Ethernet controller [0200]: Intel Corporation 82541PI Gigabit Ethernet
Controller [8086:107c] (rev 05)
        Subsystem: Intel Corporation PRO/1000 GT Desktop Adapter [8086:1376]
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 5
        Memory at a0000000 (32-bit, non-prefetchable) [size=128K]
        Memory at a0100000 (32-bit, non-prefetchable) [size=128K]
        I/O ports at 1480 [size=64]
        [virtual] Expansion ROM at 0c000000 [disabled] [size=128K]
        Capabilities: [dc] Power Management version 2
        Capabilities: [e4] PCI-X non-bridge device
        Kernel driver in use: e1000

00:14.0 ISA bridge [0601]: VIA Technologies, Inc. VT82C686 [Apollo Super South]
[1106:0686] (rev 22)
        Flags: bus master, stepping, medium devsel, latency 0
        Kernel driver in use: parport_pc

00:14.1 IDE interface [0101]: VIA Technologies, Inc.
VT82C586A/B/VT82C686/A/B/VT823x/A/C PIPC Bus Master IDE [1106:0571] (rev 10)
(prog-if 8a [Master SecP PriP])
        Flags: bus master, medium devsel, latency 64
        [virtual] Memory at 000001f0 (32-bit, non-prefetchable) [size=8]
        [virtual] Memory at 000003f0 (type 3, non-prefetchable) [size=1]
        [virtual] Memory at 00000170 (32-bit, non-prefetchable) [size=8]
        [virtual] Memory at 00000370 (type 3, non-prefetchable) [size=1]
        I/O ports at 1440 [size=16]
        Capabilities: [c0] Power Management version 2
        Kernel driver in use: pata_via

00:14.2 USB controller [0c03]: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller [1106:3038] (rev 10) (prog-if 00 [UHCI])
        Subsystem: First International Computer, Inc. VA-502 Mainboard
[0925:1234]
        Flags: bus master, medium devsel, latency 66, IRQ 11
        I/O ports at 1400 [size=32]
        Capabilities: [80] Power Management version 2
        Kernel driver in use: uhci_hcd

00:14.3 USB controller [0c03]: VIA Technologies, Inc. VT82xxxxx UHCI USB 1.1
Controller [1106:3038] (rev 10) (prog-if 00 [UHCI])
        Subsystem: First International Computer, Inc. VA-502 Mainboard
[0925:1234]
        Flags: bus master, medium devsel, latency 66, IRQ 11
        I/O ports at 1420 [size=32]
        Capabilities: [80] Power Management version 2
        Kernel driver in use: uhci_hcd

00:14.4 Bridge [0680]: VIA Technologies, Inc. VT82C686 [Apollo Super ACPI]
[1106:3057] (rev 30)
        Flags: medium devsel, IRQ 9
        Capabilities: [68] Power Management version 2

00:14.5 Multimedia audio controller [0401]: VIA Technologies, Inc. VT82C686
AC97 Audio Controller [1106:3058] (rev 20)
        Subsystem: Compaq Computer Corporation Device [0e11:003d]
        Flags: medium devsel, IRQ 10
        I/O ports at 1000 [size=256]
        I/O ports at 1450 [size=4]
        I/O ports at 1454 [size=4]
        Capabilities: [c0] Power Management version 2
        Kernel driver in use: snd_via82xx

01:00.0 VGA compatible controller [0300]: nVidia Corporation NV31 [GeForce FX
5600 Ultra] [10de:0311] (rev a1) (prog-if 00 [VGA controller])
        Subsystem: Chaintech Computer Co. Ltd Device [270f:1946]
        Flags: bus master, 66MHz, medium devsel, latency 64, IRQ 3
        Memory at 80000000 (32-bit, non-prefetchable) [size=16M]
        Memory at 88000000 (32-bit, prefetchable) [size=128M]
        Expansion ROM at &lt;unassigned&gt; [disabled]
        Capabilities: [60] Power Management version 2
        Capabilities: [44] AGP version 3.0
        Kernel driver in use: nouveau


<span class="quote">&gt; uname -a</span >
Linux anduril 3.12.0-rc6 #2 SMP Sat Oct 19 16:47:44 CDT 2013 i686 AMD
Athlon(tm) Processor AuthenticAMD GNU/Linux


<span class="quote">&gt; dmesg</span >
...
[ 1786.573538] [drm] hdmi device  not found 1 0 1
[ 1786.573760] nouveau  [  DEVICE][0000:01:00.0] BOOT0  : 0x031100a1
[ 1786.573769] nouveau  [  DEVICE][0000:01:00.0] Chipset: NV31 (NV31)
[ 1786.573776] nouveau  [  DEVICE][0000:01:00.0] Family : NV30
[ 1786.575845] nouveau  [   VBIOS][0000:01:00.0] checking PRAMIN for image...
[ 1786.616891] nouveau  [   VBIOS][0000:01:00.0] ... appears to be valid
[ 1786.616900] nouveau  [   VBIOS][0000:01:00.0] using image from PRAMIN
[ 1786.616909] nouveau  [   VBIOS][0000:01:00.0] BMP version 5.27
[ 1786.617452] nouveau  [   VBIOS][0000:01:00.0] version 04.31.20.52.00
[ 1786.623690] nouveau W[  PTIMER][0000:01:00.0] unknown input clock freq
[ 1786.623718] nouveau  [     PFB][0000:01:00.0] RAM type: DDR1
[ 1786.623724] nouveau  [     PFB][0000:01:00.0] RAM size: 128 MiB
[ 1786.623731] nouveau  [     PFB][0000:01:00.0]    ZCOMP: 262144 tags
[ 1786.636667] nouveau  [  DEVICE][0000:01:00.0] Setting agp speed to 2X. Use
agpmode to override.
[ 1786.636683] agpgart-via 0000:00:00.0: AGP 2.0 bridge
[ 1786.636715] agpgart-via 0000:00:00.0: putting AGP V2 device into 2x mode
[ 1786.636766] nouveau 0000:01:00.0: putting AGP V2 device into 2x mode
[ 1786.640057] [TTM] Zone  kernel: Available graphics memory: 92344 kiB
[ 1786.640064] [TTM] Initializing pool allocator
[ 1786.640118] nouveau  [     DRM] VRAM: 127 MiB
[ 1786.640123] nouveau  [     DRM] GART: 64 MiB
[ 1786.640135] nouveau  [     DRM] BMP version 5.39
[ 1786.640145] nouveau  [     DRM] DCB version 2.2
[ 1786.640155] nouveau  [     DRM] DCB outp 00: 01000300 00009c40
[ 1786.640163] nouveau  [     DRM] DCB outp 01: 02010310 00009c40
[ 1786.640169] nouveau  [     DRM] DCB outp 02: 01010312 00000000
[ 1786.640176] nouveau  [     DRM] DCB outp 03: 02020321 00000003
[ 1786.640562] nouveau  [     DRM] Loading NV17 power sequencing microcode
[ 1786.646548] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[ 1786.646560] [drm] No driver support for vblank timestamp query.
[ 1786.646580] nouveau  [     DRM] 0xE1B4: Parsing digital output script table
[ 1786.647246] nouveau  [     DRM] 0 available performance level(s)
[ 1786.647258] nouveau  [     DRM] c: core 234MHz memory 501MHz voltage 1220mV
[ 1786.655499] nouveau  [     DRM] MM: using M2MF for buffer copies
[ 1786.655538] nouveau  [     DRM] Setting dpms mode 3 on TV encoder (output 3)
[ 1786.751345] nouveau  [     DRM] allocated 1920x1200 fb: 0x9000, bo cab83400
[ 1786.751589] fbcon: nouveaufb (fb0) is primary device
[ 1786.781270] Console: switching to colour frame buffer device 240x75
[ 1786.784371] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[ 1786.784376] nouveau 0000:01:00.0: registered panic notifier
[ 1786.789898] [drm] Initialized nouveau 1.1.1 20120801 for 0000:01:00.0 on
minor 0



I've had x11perf in a while-true loop for the better part of a day.  Seems
solid, no issues to report.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382320734.6143511.28416--

--===============1358410141==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1358410141==--
