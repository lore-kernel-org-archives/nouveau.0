From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98386] [NVE7] bus: MMIO write of FAULT at [ IBUS ],
 Pointer to {TDMS, flat panel} table invalid
Date: Fri, 04 Jan 2019 09:36:25 +0000
Message-ID: <bug-98386-8800-lwHCkm1YXA@http.bugs.freedesktop.org/>
References: <bug-98386-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1841352799=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98386-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1841352799==
Content-Type: multipart/alternative; boundary="15465945853.25FFF1.31431"
Content-Transfer-Encoding: 7bit


--15465945853.25FFF1.31431
Date: Fri, 4 Jan 2019 09:36:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98386

--- Comment #25 from Andrei Borzenkov <arvidjaar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Have it on Dell Latitude E5450

00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 5500
[8086:1616] (rev 09)
03:00.0 3D controller [0302]: NVIDIA Corporation GM108M [GeForce 830M]
[10de:1340] (rev a2)

VERSION=3D"18.04.1 LTS (Bionic Beaver)"
Linux bor-Latitude-E5450 4.18.0-13-generic #14~18.04.1-Ubuntu SMP Thu Dec 6
14:09:52 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

Dec 20 21:10:10 bor-Latitude-E5450 kernel: fb: switching to inteldrmfb from=
 EFI
VGA
Dec 20 21:10:10 bor-Latitude-E5450 kernel: Console: switching to colour dum=
my
device 80x25
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Replacing VGA console driv=
er
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] ACPI BIOS requests an
excessive sleep of 20000 ms, using 1500 ms instead
Dec 20 21:10:10 bor-Latitude-E5450 kernel: MXM: GUID detected in BIOS
Dec 20 21:10:10 bor-Latitude-E5450 kernel: ACPI Warning:
\_SB.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20180531/nsarguments-66)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Driver supports precise vb=
lank
timestamp query.
Dec 20 21:10:10 bor-Latitude-E5450 kernel: pci 0000:03:00.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Dec 20 21:10:10 bor-Latitude-E5450 kernel: VGA switcheroo: detected Optimus=
 DSM
method \_SB_.PCI0.RP05.PEGP handle
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau: detected PR support, wi=
ll
not use DSM
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: enabling
device (0006 -> 0007)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: NVIDIA GM1=
08
(118000a2)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: i915 0000:00:02.0: vgaarb: chang=
ed
VGA decodes: olddecodes=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Initialized i915 1.6.0
20180514 for 0000:00:02.0 on minor 0
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: bios: vers=
ion
82.08.18.00.2a
Dec 20 21:10:10 bor-Latitude-E5450 kernel: ACPI: Video Device [GFX0]
(multi-head: yes  rom: no  post: no)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: fb: 2048 M=
iB
DDR3
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: bus: MMIO =
read
of 00000000 FAULT at 6013d4 [ IBUS ]
Dec 20 21:10:10 bor-Latitude-E5450 kernel: input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
Dec 20 21:10:10 bor-Latitude-E5450 kernel: ACPI: Video Device [PEGP]
(multi-head: no  rom: yes  post: no)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1d/LNXVIDEO:01/input/inp=
ut8
Dec 20 21:10:10 bor-Latitude-E5450 kernel: fbcon: inteldrmfb (fb0) is prima=
ry
device
Dec 20 21:10:10 bor-Latitude-E5450 kernel: Console: switching to colour fra=
me
buffer device 240x67
Dec 20 21:10:10 bor-Latitude-E5450 kernel: i915 0000:00:02.0: fb0: inteldrm=
fb
frame buffer device
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: bus: MMIO =
read
of 00000000 FAULT at 10ac08 [ IBUS ]
Dec 20 21:10:10 bor-Latitude-E5450 kernel: vga_switcheroo: enabled
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: GART:
1048576 MiB
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: Point=
er
to TMDS table invalid
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: DCB
version 4.0
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: MM: u=
sing
COPY for buffer copies
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Initialized nouveau 1.3.1
20120801 for 0000:03:00.0 on minor 1

The read fault at 10ac08 happens only ones during system boot, read fault
6013d4 happens apparently every time I suspend/resume.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15465945853.25FFF1.31431
Date: Fri, 4 Jan 2019 09:36:25 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [NVE7] bus: MMIO write of FAULT at [ IBUS ], Pointer=
 to {TDMS,flat panel} table invalid"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98386">bug 98386<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
arvidjaar&#64;gmail.com" title=3D"Andrei Borzenkov &lt;arvidjaar&#64;gmail.=
com&gt;"> <span class=3D"fn">Andrei Borzenkov</span></a>
</span></b>
        <pre>Have it on Dell Latitude E5450

00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 5500
[8086:1616] (rev 09)
03:00.0 3D controller [0302]: NVIDIA Corporation GM108M [GeForce 830M]
[10de:1340] (rev a2)

VERSION=3D&quot;18.04.1 LTS (Bionic Beaver)&quot;
Linux bor-Latitude-E5450 4.18.0-13-generic #14~18.04.1-Ubuntu SMP Thu Dec 6
14:09:52 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

Dec 20 21:10:10 bor-Latitude-E5450 kernel: fb: switching to inteldrmfb from=
 EFI
VGA
Dec 20 21:10:10 bor-Latitude-E5450 kernel: Console: switching to colour dum=
my
device 80x25
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Replacing VGA console driv=
er
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] ACPI BIOS requests an
excessive sleep of 20000 ms, using 1500 ms instead
Dec 20 21:10:10 bor-Latitude-E5450 kernel: MXM: GUID detected in BIOS
Dec 20 21:10:10 bor-Latitude-E5450 kernel: ACPI Warning:
\_SB.PCI0.RP05.PEGP._DSM: Argument #4 type mismatch - Found [Buffer], ACPI
requires [Package] (20180531/nsarguments-66)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Supports vblank timestamp
caching Rev 2 (21.10.2013).
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Driver supports precise vb=
lank
timestamp query.
Dec 20 21:10:10 bor-Latitude-E5450 kernel: pci 0000:03:00.0: optimus
capabilities: enabled, status dynamic power, hda bios codec supported
Dec 20 21:10:10 bor-Latitude-E5450 kernel: VGA switcheroo: detected Optimus=
 DSM
method \_SB_.PCI0.RP05.PEGP handle
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau: detected PR support, wi=
ll
not use DSM
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: enabling
device (0006 -&gt; 0007)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: NVIDIA GM1=
08
(118000a2)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: i915 0000:00:02.0: vgaarb: chang=
ed
VGA decodes: olddecodes=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Initialized i915 1.6.0
20180514 for 0000:00:02.0 on minor 0
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: bios: vers=
ion
82.08.18.00.2a
Dec 20 21:10:10 bor-Latitude-E5450 kernel: ACPI: Video Device [GFX0]
(multi-head: yes  rom: no  post: no)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: fb: 2048 M=
iB
DDR3
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: bus: MMIO =
read
of 00000000 FAULT at 6013d4 [ IBUS ]
Dec 20 21:10:10 bor-Latitude-E5450 kernel: input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input7
Dec 20 21:10:10 bor-Latitude-E5450 kernel: ACPI: Video Device [PEGP]
(multi-head: no  rom: yes  post: no)
Dec 20 21:10:10 bor-Latitude-E5450 kernel: input: Video Bus as
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:1d/LNXVIDEO:01/input/inp=
ut8
Dec 20 21:10:10 bor-Latitude-E5450 kernel: fbcon: inteldrmfb (fb0) is prima=
ry
device
Dec 20 21:10:10 bor-Latitude-E5450 kernel: Console: switching to colour fra=
me
buffer device 240x67
Dec 20 21:10:10 bor-Latitude-E5450 kernel: i915 0000:00:02.0: fb0: inteldrm=
fb
frame buffer device
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: bus: MMIO =
read
of 00000000 FAULT at 10ac08 [ IBUS ]
Dec 20 21:10:10 bor-Latitude-E5450 kernel: vga_switcheroo: enabled
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: GART:
1048576 MiB
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: Point=
er
to TMDS table invalid
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: DCB
version 4.0
Dec 20 21:10:10 bor-Latitude-E5450 kernel: nouveau 0000:03:00.0: DRM: MM: u=
sing
COPY for buffer copies
Dec 20 21:10:10 bor-Latitude-E5450 kernel: [drm] Initialized nouveau 1.3.1
20120801 for 0000:03:00.0 on minor 1

The read fault at 10ac08 happens only ones during system boot, read fault
6013d4 happens apparently every time I suspend/resume.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15465945853.25FFF1.31431--

--===============1841352799==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1841352799==--
