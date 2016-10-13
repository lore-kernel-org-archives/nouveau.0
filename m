From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98240] New: Kernel module fails to load on HP
 Pavilion V3A33AV laptop.
Date: Thu, 13 Oct 2016 23:02:35 +0000
Message-ID: <bug-98240-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1417400676=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1417400676==
Content-Type: multipart/alternative; boundary="14763997551.fAECAC.16959";
 charset="UTF-8"


--14763997551.fAECAC.16959
Date: Thu, 13 Oct 2016 23:02:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98240

            Bug ID: 98240
           Summary: Kernel module fails to load on HP Pavilion V3A33AV
                    laptop.
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: sos-iE5g+WOE291eeLb3ft/vUmD2FQJk+8+b@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

The laptop has NVIDIA=C2=AE GeForce=C2=AE GTX 960M discrete chip at PCI:01:=
00.0

01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)

Using 4.8.1 kernel, here is dmesg of "modprobe nouveau debug=3Dspam":

[ 4620.345670] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 4620.345756] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 4620.345862] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 4620.346999] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[ 4620.347006] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[ 4620.347007] nouveau: detected PR support, will not use DSM
[ 4620.347890] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[ 4620.347968] nouveau 0000:01:00.0: pci: MSI enabled
[ 4620.347973] nouveau 0000:01:00.0: bios: trying PRAMIN...
[ 4620.347986] nouveau 0000:01:00.0: bios: ... not enabled
[ 4620.347989] nouveau 0000:01:00.0: bios: trying PROM...
[ 4620.353937] nouveau 0000:01:00.0: bios: 00000000: ROM signature (0000)
unknown
[ 4620.353939] nouveau 0000:01:00.0: bios: image 0 invalid
[ 4620.353946] nouveau 0000:01:00.0: bios: scored 0
[ 4620.353947] nouveau 0000:01:00.0: bios: trying ACPI...
[ 4620.354437] nouveau 0000:01:00.0: bios: 00000000: type 00, 65536 bytes
[ 4620.354784] nouveau 0000:01:00.0: bios: 00000000: checksum failed
[ 4620.355094] nouveau 0000:01:00.0: bios: 00010000: type e0, 37376 bytes
[ 4620.355513] nouveau 0000:01:00.0: bios: 00019200: ROM signature (0000)
unknown
[ 4620.355513] nouveau 0000:01:00.0: bios: image 2 invalid
[ 4620.355514] nouveau 0000:01:00.0: bios: scored 6
[ 4620.355515] nouveau 0000:01:00.0: bios: using image from ACPI
[ 4620.355588] nouveau 0000:01:00.0: bios: BIT signature found
[ 4620.355589] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[ 4620.355592] nouveau 0000:01:00.0: bios: DCB contains no useful data
[ 4620.355592] nouveau 0000:01:00.0: bios: DCB contains no useful data
[ 4620.355593] nouveau 0000:01:00.0: mxm: no VBIOS data, nothing to do
[ 4620.355603] nouveau 0000:01:00.0: bios: DCB contains no useful data
[ 4620.355995] nouveau: DRM:00000000:00000000: ioctl: size 32
[ 4620.355996] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 00 object
0000000000000000 owner 00
[ 4620.355997] nouveau: DRM:00000000:00000000: ioctl: nop size 8
[ 4620.355997] nouveau: DRM:00000000:00000000: ioctl: nop vers 0
[ 4620.355998] nouveau: DRM:00000000:00000000: ioctl: return 0
[ 4620.356001] nouveau: DRM:00000000:00000000: ioctl: size 72
[ 4620.356002] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 02 object
0000000000000000 owner ff
[ 4620.356002] nouveau: DRM:00000000:00000000: ioctl: new size 48
[ 4620.356003] nouveau: DRM:00000000:00000000: ioctl: new vers 0 handle
00000000 class 00000080 route 00 token ffff8802591e50d8 object ffff8802591e=
50d8
[ 4620.356004] nouveau: DRM:00000000:00000000: ioctl: create device size 16
[ 4620.356004] nouveau: DRM:00000000:00000000: ioctl: create device v0 devi=
ce
ffffffffffffffff
[ 4620.356005] nouveau: DRM:00000000:00000080: init running...
[ 4620.356006] nouveau 0000:01:00.0: preinit running...
[ 4620.356006] nouveau 0000:01:00.0: pci: preinit running...
[ 4620.356007] nouveau 0000:01:00.0: pci: preinit completed in 0us
[ 4620.356008] nouveau 0000:01:00.0: bios: preinit running...
[ 4620.356008] nouveau 0000:01:00.0: bios: preinit completed in 0us
[ 4620.356009] nouveau 0000:01:00.0: devinit: preinit running...
[ 4620.356024] nouveau 0000:01:00.0: devinit: preinit completed in 14us
[ 4620.356024] nouveau 0000:01:00.0: top: preinit running...
[ 4620.356025] nouveau 0000:01:00.0: top: preinit completed in 0us
[ 4620.356025] nouveau 0000:01:00.0: priv: preinit running...
[ 4620.356058] nouveau 0000:01:00.0: priv: preinit completed in 33us
[ 4620.356059] nouveau 0000:01:00.0: gpio: preinit running...
[ 4620.356060] nouveau 0000:01:00.0: gpio: preinit completed in 0us
[ 4620.356060] nouveau 0000:01:00.0: i2c: preinit running...
[ 4620.356061] nouveau 0000:01:00.0: i2c: preinit completed in 0us
[ 4620.356061] nouveau 0000:01:00.0: fuse: preinit running...
[ 4620.356062] nouveau 0000:01:00.0: fuse: preinit completed in 0us
[ 4620.356062] nouveau 0000:01:00.0: mxm: preinit running...
[ 4620.356063] nouveau 0000:01:00.0: mxm: preinit completed in 1us
[ 4620.356063] nouveau 0000:01:00.0: mc: preinit running...
[ 4620.356064] nouveau 0000:01:00.0: mc: preinit completed in 0us
[ 4620.356064] nouveau 0000:01:00.0: bus: preinit running...
[ 4620.356065] nouveau 0000:01:00.0: bus: preinit completed in 0us
[ 4620.356065] nouveau 0000:01:00.0: tmr: preinit running...
[ 4620.356066] nouveau 0000:01:00.0: tmr: preinit completed in 0us
[ 4620.356066] nouveau 0000:01:00.0: imem: preinit running...
[ 4620.356067] nouveau 0000:01:00.0: imem: preinit completed in 0us
[ 4620.356067] nouveau 0000:01:00.0: fb: preinit running...
[ 4620.356068] nouveau 0000:01:00.0: fb: preinit completed in 0us
[ 4620.356069] nouveau 0000:01:00.0: ltc: preinit running...
[ 4620.356069] nouveau 0000:01:00.0: ltc: preinit completed in 0us
[ 4620.356070] nouveau 0000:01:00.0: mmu: preinit running...
[ 4620.356070] nouveau 0000:01:00.0: mmu: preinit completed in 0us
[ 4620.356071] nouveau 0000:01:00.0: bar: preinit running...
[ 4620.356071] nouveau 0000:01:00.0: bar: preinit completed in 0us
[ 4620.356072] nouveau 0000:01:00.0: pmu: preinit running...
[ 4620.356072] nouveau 0000:01:00.0: pmu: preinit completed in 0us
[ 4620.356073] nouveau 0000:01:00.0: iccsense: preinit running...
[ 4620.356073] nouveau 0000:01:00.0: iccsense: preinit completed in 0us
[ 4620.356074] nouveau 0000:01:00.0: therm: preinit running...
[ 4620.356074] nouveau 0000:01:00.0: therm: preinit completed in 0us
[ 4620.356075] nouveau 0000:01:00.0: clk: preinit running...
[ 4620.356075] nouveau 0000:01:00.0: clk: preinit completed in 0us
[ 4620.356076] nouveau 0000:01:00.0: ce0: preinit running...
[ 4620.356077] nouveau 0000:01:00.0: ce0: preinit completed in 0us
[ 4620.356077] nouveau 0000:01:00.0: ce2: preinit running...
[ 4620.356078] nouveau 0000:01:00.0: ce2: preinit completed in 0us
[ 4620.356078] nouveau 0000:01:00.0: disp: preinit running...
[ 4620.356079] nouveau 0000:01:00.0: disp: preinit completed in 0us
[ 4620.356079] nouveau 0000:01:00.0: dma: preinit running...
[ 4620.356080] nouveau 0000:01:00.0: dma: preinit completed in 0us
[ 4620.356080] nouveau 0000:01:00.0: fifo: preinit running...
[ 4620.356081] nouveau 0000:01:00.0: fifo: preinit completed in 0us
[ 4620.356081] nouveau 0000:01:00.0: gr: preinit running...
[ 4620.356082] nouveau 0000:01:00.0: gr: preinit completed in 0us
[ 4620.356083] nouveau 0000:01:00.0: sw: preinit running...
[ 4620.356083] nouveau 0000:01:00.0: sw: preinit completed in 0us
[ 4620.356097] nouveau 0000:01:00.0: devinit: running init tables
[ 4620.356099] nouveau 0000:01:00.0: devinit: 0xf152[0]: unknown opcode 0x00
[ 4620.356109] nouveau 0000:01:00.0: preinit failed with -22
[ 4620.356109] nouveau: DRM:00000000:00000080: init failed with -22=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[ 4620.356110] nouveau: DRM:00000000:00000080: fini children...
[ 4620.356110] nouveau: DRM:00000000:00000080: fini running...
[ 4620.356111] nouveau: DRM:00000000:00000080: fini completed in 0us
[ 4620.356111] nouveau: DRM:00000000:00000080: destroy children...
[ 4620.356111] nouveau: DRM:00000000:00000080: destroy running...
[ 4620.356112] nouveau: DRM:00000000:00000080: destroy completed in 1us...
[ 4620.356112] nouveau: DRM:00000000:00000000: ioctl: return -22
[ 4620.356113] nouveau: DRM:00000000:00000000: fini notify
[ 4620.356114] nouveau: DRM:00000000:00000000: fini children...
[ 4620.356114] nouveau: DRM:00000000:00000000: fini running...
[ 4620.356115] nouveau: DRM:00000000:00000000: fini completed in 0us
[ 4620.356115] nouveau: DRM:00000000:00000000: destroy children...
[ 4620.356115] nouveau: DRM:00000000:00000000: destroy running...
[ 4620.356116] nouveau: DRM:00000000:00000000: destroy completed in 1us...
[ 4620.356264] nouveau 0000:01:00.0: sw: destroy running...
[ 4620.356265] nouveau 0000:01:00.0: sw: destroy completed in 1us
[ 4620.356267] nouveau 0000:01:00.0: gr: destroy running...
[ 4620.356268] nouveau 0000:01:00.0: gr: destroy completed in 0us
[ 4620.356269] nouveau 0000:01:00.0: fifo: destroy running...
[ 4620.356270] nouveau 0000:01:00.0: fifo: destroy completed in 1us
[ 4620.356271] nouveau 0000:01:00.0: dma: destroy running...
[ 4620.356272] nouveau 0000:01:00.0: dma: destroy completed in 0us
[ 4620.356273] nouveau 0000:01:00.0: disp: destroy running...
[ 4620.356274] nouveau 0000:01:00.0: disp: destroy completed in 1us
[ 4620.356275] nouveau 0000:01:00.0: ce2: destroy running...
[ 4620.356276] nouveau 0000:01:00.0: ce2: destroy completed in 0us
[ 4620.356277] nouveau 0000:01:00.0: ce0: destroy running...
[ 4620.356277] nouveau 0000:01:00.0: ce0: destroy completed in 0us
[ 4620.356278] nouveau 0000:01:00.0: clk: destroy running...
[ 4620.356279] nouveau 0000:01:00.0: clk: destroy completed in 0us
[ 4620.356280] nouveau 0000:01:00.0: therm: destroy running...
[ 4620.356281] nouveau 0000:01:00.0: therm: destroy completed in 0us
[ 4620.356282] nouveau 0000:01:00.0: iccsense: destroy running...
[ 4620.356283] nouveau 0000:01:00.0: iccsense: destroy completed in 0us
[ 4620.356284] nouveau 0000:01:00.0: pmu: destroy running...
[ 4620.356285] nouveau 0000:01:00.0: pmu: destroy completed in 0us
[ 4620.356285] nouveau 0000:01:00.0: bar: destroy running...
[ 4620.356286] nouveau 0000:01:00.0: bar: destroy completed in 0us
[ 4620.356287] nouveau 0000:01:00.0: mmu: destroy running...
[ 4620.356288] nouveau 0000:01:00.0: mmu: destroy completed in 0us
[ 4620.356289] nouveau 0000:01:00.0: ltc: destroy running...
[ 4620.356290] nouveau 0000:01:00.0: ltc: destroy completed in 1us
[ 4620.356291] nouveau 0000:01:00.0: fb: destroy running...
[ 4620.356293] nouveau 0000:01:00.0: fb: destroy completed in 2us
[ 4620.356294] nouveau 0000:01:00.0: imem: destroy running...
[ 4620.356295] nouveau 0000:01:00.0: imem: destroy completed in 0us
[ 4620.356295] nouveau 0000:01:00.0: tmr: destroy running...
[ 4620.356296] nouveau 0000:01:00.0: tmr: destroy completed in 0us
[ 4620.356297] nouveau 0000:01:00.0: bus: destroy running...
[ 4620.356298] nouveau 0000:01:00.0: bus: destroy completed in 0us
[ 4620.356299] nouveau 0000:01:00.0: mc: destroy running...
[ 4620.356299] nouveau 0000:01:00.0: mc: destroy completed in 0us
[ 4620.356300] nouveau 0000:01:00.0: mxm: destroy running...
[ 4620.356301] nouveau 0000:01:00.0: mxm: destroy completed in 0us
[ 4620.356302] nouveau 0000:01:00.0: fuse: destroy running...
[ 4620.356303] nouveau 0000:01:00.0: fuse: destroy completed in 0us
[ 4620.356304] nouveau 0000:01:00.0: i2c: destroy running...
[ 4620.356305] nouveau 0000:01:00.0: i2c: destroy completed in 0us
[ 4620.356305] nouveau 0000:01:00.0: gpio: destroy running...
[ 4620.356306] nouveau 0000:01:00.0: gpio: destroy completed in 0us
[ 4620.356307] nouveau 0000:01:00.0: priv: destroy running...
[ 4620.356308] nouveau 0000:01:00.0: priv: destroy completed in 0us
[ 4620.356309] nouveau 0000:01:00.0: top: destroy running...
[ 4620.356309] nouveau 0000:01:00.0: top: destroy completed in 0us
[ 4620.356310] nouveau 0000:01:00.0: devinit: destroy running...
[ 4620.356321] nouveau 0000:01:00.0: devinit: destroy completed in 9us
[ 4620.356322] nouveau 0000:01:00.0: bios: destroy running...
[ 4620.356323] nouveau 0000:01:00.0: bios: destroy completed in 1us
[ 4620.356324] nouveau 0000:01:00.0: pci: destroy running...
[ 4620.356332] nouveau 0000:01:00.0: pci: destroy completed in 7us
[ 4620.356480] nouveau: probe of 0000:01:00.0 failed with error -22

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14763997551.fAECAC.16959
Date: Thu, 13 Oct 2016 23:02:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel module fails to load on HP Pavilion V3A33AV laptop=
."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98240">98240</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Kernel module fails to load on HP Pavilion V3A33AV laptop.
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
          <td>x86-64 (AMD64)
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
          <td>sos&#64;sokhapkin.dyndns.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The laptop has NVIDIA=C2=AE GeForce=C2=AE GTX 960M discrete ch=
ip at PCI:01:00.0

01:00.0 3D controller: NVIDIA Corporation GM107M [GeForce GTX 960M] (rev a2)

Using 4.8.1 kernel, here is dmesg of &quot;modprobe nouveau debug=3Dspam&qu=
ot;:

[ 4620.345670] ACPI Warning: \_SB.PCI0.GFX0._DSM: Argument #4 type mismatch=
 -
Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 4620.345756] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 4620.345862] ACPI Warning: \_SB.PCI0.PEG0.PEGP._DSM: Argument #4 type
mismatch - Found [Buffer], ACPI requires [Package] (20160422/nsarguments-95)
[ 4620.346999] pci 0000:01:00.0: optimus capabilities: enabled, status dyna=
mic
power,=20
[ 4620.347006] VGA switcheroo: detected Optimus DSM method \_SB_.PCI0.PEG0.=
PEGP
handle
[ 4620.347007] nouveau: detected PR support, will not use DSM
[ 4620.347890] nouveau 0000:01:00.0: NVIDIA GM107 (1171b0a2)
[ 4620.347968] nouveau 0000:01:00.0: pci: MSI enabled
[ 4620.347973] nouveau 0000:01:00.0: bios: trying PRAMIN...
[ 4620.347986] nouveau 0000:01:00.0: bios: ... not enabled
[ 4620.347989] nouveau 0000:01:00.0: bios: trying PROM...
[ 4620.353937] nouveau 0000:01:00.0: bios: 00000000: ROM signature (0000)
unknown
[ 4620.353939] nouveau 0000:01:00.0: bios: image 0 invalid
[ 4620.353946] nouveau 0000:01:00.0: bios: scored 0
[ 4620.353947] nouveau 0000:01:00.0: bios: trying ACPI...
[ 4620.354437] nouveau 0000:01:00.0: bios: 00000000: type 00, 65536 bytes
[ 4620.354784] nouveau 0000:01:00.0: bios: 00000000: checksum failed
[ 4620.355094] nouveau 0000:01:00.0: bios: 00010000: type e0, 37376 bytes
[ 4620.355513] nouveau 0000:01:00.0: bios: 00019200: ROM signature (0000)
unknown
[ 4620.355513] nouveau 0000:01:00.0: bios: image 2 invalid
[ 4620.355514] nouveau 0000:01:00.0: bios: scored 6
[ 4620.355515] nouveau 0000:01:00.0: bios: using image from ACPI
[ 4620.355588] nouveau 0000:01:00.0: bios: BIT signature found
[ 4620.355589] nouveau 0000:01:00.0: bios: version 82.07.9b.00.69
[ 4620.355592] nouveau 0000:01:00.0: bios: DCB contains no useful data
[ 4620.355592] nouveau 0000:01:00.0: bios: DCB contains no useful data
[ 4620.355593] nouveau 0000:01:00.0: mxm: no VBIOS data, nothing to do
[ 4620.355603] nouveau 0000:01:00.0: bios: DCB contains no useful data
[ 4620.355995] nouveau: DRM:00000000:00000000: ioctl: size 32
[ 4620.355996] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 00 object
0000000000000000 owner 00
[ 4620.355997] nouveau: DRM:00000000:00000000: ioctl: nop size 8
[ 4620.355997] nouveau: DRM:00000000:00000000: ioctl: nop vers 0
[ 4620.355998] nouveau: DRM:00000000:00000000: ioctl: return 0
[ 4620.356001] nouveau: DRM:00000000:00000000: ioctl: size 72
[ 4620.356002] nouveau: DRM:00000000:00000000: ioctl: vers 0 type 02 object
0000000000000000 owner ff
[ 4620.356002] nouveau: DRM:00000000:00000000: ioctl: new size 48
[ 4620.356003] nouveau: DRM:00000000:00000000: ioctl: new vers 0 handle
00000000 class 00000080 route 00 token ffff8802591e50d8 object ffff8802591e=
50d8
[ 4620.356004] nouveau: DRM:00000000:00000000: ioctl: create device size 16
[ 4620.356004] nouveau: DRM:00000000:00000000: ioctl: create device v0 devi=
ce
ffffffffffffffff
[ 4620.356005] nouveau: DRM:00000000:00000080: init running...
[ 4620.356006] nouveau 0000:01:00.0: preinit running...
[ 4620.356006] nouveau 0000:01:00.0: pci: preinit running...
[ 4620.356007] nouveau 0000:01:00.0: pci: preinit completed in 0us
[ 4620.356008] nouveau 0000:01:00.0: bios: preinit running...
[ 4620.356008] nouveau 0000:01:00.0: bios: preinit completed in 0us
[ 4620.356009] nouveau 0000:01:00.0: devinit: preinit running...
[ 4620.356024] nouveau 0000:01:00.0: devinit: preinit completed in 14us
[ 4620.356024] nouveau 0000:01:00.0: top: preinit running...
[ 4620.356025] nouveau 0000:01:00.0: top: preinit completed in 0us
[ 4620.356025] nouveau 0000:01:00.0: priv: preinit running...
[ 4620.356058] nouveau 0000:01:00.0: priv: preinit completed in 33us
[ 4620.356059] nouveau 0000:01:00.0: gpio: preinit running...
[ 4620.356060] nouveau 0000:01:00.0: gpio: preinit completed in 0us
[ 4620.356060] nouveau 0000:01:00.0: i2c: preinit running...
[ 4620.356061] nouveau 0000:01:00.0: i2c: preinit completed in 0us
[ 4620.356061] nouveau 0000:01:00.0: fuse: preinit running...
[ 4620.356062] nouveau 0000:01:00.0: fuse: preinit completed in 0us
[ 4620.356062] nouveau 0000:01:00.0: mxm: preinit running...
[ 4620.356063] nouveau 0000:01:00.0: mxm: preinit completed in 1us
[ 4620.356063] nouveau 0000:01:00.0: mc: preinit running...
[ 4620.356064] nouveau 0000:01:00.0: mc: preinit completed in 0us
[ 4620.356064] nouveau 0000:01:00.0: bus: preinit running...
[ 4620.356065] nouveau 0000:01:00.0: bus: preinit completed in 0us
[ 4620.356065] nouveau 0000:01:00.0: tmr: preinit running...
[ 4620.356066] nouveau 0000:01:00.0: tmr: preinit completed in 0us
[ 4620.356066] nouveau 0000:01:00.0: imem: preinit running...
[ 4620.356067] nouveau 0000:01:00.0: imem: preinit completed in 0us
[ 4620.356067] nouveau 0000:01:00.0: fb: preinit running...
[ 4620.356068] nouveau 0000:01:00.0: fb: preinit completed in 0us
[ 4620.356069] nouveau 0000:01:00.0: ltc: preinit running...
[ 4620.356069] nouveau 0000:01:00.0: ltc: preinit completed in 0us
[ 4620.356070] nouveau 0000:01:00.0: mmu: preinit running...
[ 4620.356070] nouveau 0000:01:00.0: mmu: preinit completed in 0us
[ 4620.356071] nouveau 0000:01:00.0: bar: preinit running...
[ 4620.356071] nouveau 0000:01:00.0: bar: preinit completed in 0us
[ 4620.356072] nouveau 0000:01:00.0: pmu: preinit running...
[ 4620.356072] nouveau 0000:01:00.0: pmu: preinit completed in 0us
[ 4620.356073] nouveau 0000:01:00.0: iccsense: preinit running...
[ 4620.356073] nouveau 0000:01:00.0: iccsense: preinit completed in 0us
[ 4620.356074] nouveau 0000:01:00.0: therm: preinit running...
[ 4620.356074] nouveau 0000:01:00.0: therm: preinit completed in 0us
[ 4620.356075] nouveau 0000:01:00.0: clk: preinit running...
[ 4620.356075] nouveau 0000:01:00.0: clk: preinit completed in 0us
[ 4620.356076] nouveau 0000:01:00.0: ce0: preinit running...
[ 4620.356077] nouveau 0000:01:00.0: ce0: preinit completed in 0us
[ 4620.356077] nouveau 0000:01:00.0: ce2: preinit running...
[ 4620.356078] nouveau 0000:01:00.0: ce2: preinit completed in 0us
[ 4620.356078] nouveau 0000:01:00.0: disp: preinit running...
[ 4620.356079] nouveau 0000:01:00.0: disp: preinit completed in 0us
[ 4620.356079] nouveau 0000:01:00.0: dma: preinit running...
[ 4620.356080] nouveau 0000:01:00.0: dma: preinit completed in 0us
[ 4620.356080] nouveau 0000:01:00.0: fifo: preinit running...
[ 4620.356081] nouveau 0000:01:00.0: fifo: preinit completed in 0us
[ 4620.356081] nouveau 0000:01:00.0: gr: preinit running...
[ 4620.356082] nouveau 0000:01:00.0: gr: preinit completed in 0us
[ 4620.356083] nouveau 0000:01:00.0: sw: preinit running...
[ 4620.356083] nouveau 0000:01:00.0: sw: preinit completed in 0us
[ 4620.356097] nouveau 0000:01:00.0: devinit: running init tables
[ 4620.356099] nouveau 0000:01:00.0: devinit: 0xf152[0]: unknown opcode 0x00
[ 4620.356109] nouveau 0000:01:00.0: preinit failed with -22
[ 4620.356109] nouveau: DRM:00000000:00000080: init failed with -22=20=20=
=20=20=20=20=20=20=20=20=20=20=20
[ 4620.356110] nouveau: DRM:00000000:00000080: fini children...
[ 4620.356110] nouveau: DRM:00000000:00000080: fini running...
[ 4620.356111] nouveau: DRM:00000000:00000080: fini completed in 0us
[ 4620.356111] nouveau: DRM:00000000:00000080: destroy children...
[ 4620.356111] nouveau: DRM:00000000:00000080: destroy running...
[ 4620.356112] nouveau: DRM:00000000:00000080: destroy completed in 1us...
[ 4620.356112] nouveau: DRM:00000000:00000000: ioctl: return -22
[ 4620.356113] nouveau: DRM:00000000:00000000: fini notify
[ 4620.356114] nouveau: DRM:00000000:00000000: fini children...
[ 4620.356114] nouveau: DRM:00000000:00000000: fini running...
[ 4620.356115] nouveau: DRM:00000000:00000000: fini completed in 0us
[ 4620.356115] nouveau: DRM:00000000:00000000: destroy children...
[ 4620.356115] nouveau: DRM:00000000:00000000: destroy running...
[ 4620.356116] nouveau: DRM:00000000:00000000: destroy completed in 1us...
[ 4620.356264] nouveau 0000:01:00.0: sw: destroy running...
[ 4620.356265] nouveau 0000:01:00.0: sw: destroy completed in 1us
[ 4620.356267] nouveau 0000:01:00.0: gr: destroy running...
[ 4620.356268] nouveau 0000:01:00.0: gr: destroy completed in 0us
[ 4620.356269] nouveau 0000:01:00.0: fifo: destroy running...
[ 4620.356270] nouveau 0000:01:00.0: fifo: destroy completed in 1us
[ 4620.356271] nouveau 0000:01:00.0: dma: destroy running...
[ 4620.356272] nouveau 0000:01:00.0: dma: destroy completed in 0us
[ 4620.356273] nouveau 0000:01:00.0: disp: destroy running...
[ 4620.356274] nouveau 0000:01:00.0: disp: destroy completed in 1us
[ 4620.356275] nouveau 0000:01:00.0: ce2: destroy running...
[ 4620.356276] nouveau 0000:01:00.0: ce2: destroy completed in 0us
[ 4620.356277] nouveau 0000:01:00.0: ce0: destroy running...
[ 4620.356277] nouveau 0000:01:00.0: ce0: destroy completed in 0us
[ 4620.356278] nouveau 0000:01:00.0: clk: destroy running...
[ 4620.356279] nouveau 0000:01:00.0: clk: destroy completed in 0us
[ 4620.356280] nouveau 0000:01:00.0: therm: destroy running...
[ 4620.356281] nouveau 0000:01:00.0: therm: destroy completed in 0us
[ 4620.356282] nouveau 0000:01:00.0: iccsense: destroy running...
[ 4620.356283] nouveau 0000:01:00.0: iccsense: destroy completed in 0us
[ 4620.356284] nouveau 0000:01:00.0: pmu: destroy running...
[ 4620.356285] nouveau 0000:01:00.0: pmu: destroy completed in 0us
[ 4620.356285] nouveau 0000:01:00.0: bar: destroy running...
[ 4620.356286] nouveau 0000:01:00.0: bar: destroy completed in 0us
[ 4620.356287] nouveau 0000:01:00.0: mmu: destroy running...
[ 4620.356288] nouveau 0000:01:00.0: mmu: destroy completed in 0us
[ 4620.356289] nouveau 0000:01:00.0: ltc: destroy running...
[ 4620.356290] nouveau 0000:01:00.0: ltc: destroy completed in 1us
[ 4620.356291] nouveau 0000:01:00.0: fb: destroy running...
[ 4620.356293] nouveau 0000:01:00.0: fb: destroy completed in 2us
[ 4620.356294] nouveau 0000:01:00.0: imem: destroy running...
[ 4620.356295] nouveau 0000:01:00.0: imem: destroy completed in 0us
[ 4620.356295] nouveau 0000:01:00.0: tmr: destroy running...
[ 4620.356296] nouveau 0000:01:00.0: tmr: destroy completed in 0us
[ 4620.356297] nouveau 0000:01:00.0: bus: destroy running...
[ 4620.356298] nouveau 0000:01:00.0: bus: destroy completed in 0us
[ 4620.356299] nouveau 0000:01:00.0: mc: destroy running...
[ 4620.356299] nouveau 0000:01:00.0: mc: destroy completed in 0us
[ 4620.356300] nouveau 0000:01:00.0: mxm: destroy running...
[ 4620.356301] nouveau 0000:01:00.0: mxm: destroy completed in 0us
[ 4620.356302] nouveau 0000:01:00.0: fuse: destroy running...
[ 4620.356303] nouveau 0000:01:00.0: fuse: destroy completed in 0us
[ 4620.356304] nouveau 0000:01:00.0: i2c: destroy running...
[ 4620.356305] nouveau 0000:01:00.0: i2c: destroy completed in 0us
[ 4620.356305] nouveau 0000:01:00.0: gpio: destroy running...
[ 4620.356306] nouveau 0000:01:00.0: gpio: destroy completed in 0us
[ 4620.356307] nouveau 0000:01:00.0: priv: destroy running...
[ 4620.356308] nouveau 0000:01:00.0: priv: destroy completed in 0us
[ 4620.356309] nouveau 0000:01:00.0: top: destroy running...
[ 4620.356309] nouveau 0000:01:00.0: top: destroy completed in 0us
[ 4620.356310] nouveau 0000:01:00.0: devinit: destroy running...
[ 4620.356321] nouveau 0000:01:00.0: devinit: destroy completed in 9us
[ 4620.356322] nouveau 0000:01:00.0: bios: destroy running...
[ 4620.356323] nouveau 0000:01:00.0: bios: destroy completed in 1us
[ 4620.356324] nouveau 0000:01:00.0: pci: destroy running...
[ 4620.356332] nouveau 0000:01:00.0: pci: destroy completed in 7us
[ 4620.356480] nouveau: probe of 0000:01:00.0 failed with error -22</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14763997551.fAECAC.16959--

--===============1417400676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1417400676==--
