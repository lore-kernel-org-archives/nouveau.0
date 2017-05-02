From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100423] MMIO read of 00000000 FAULT at 022554 [ IBUS
	]
Date: Tue, 02 May 2017 13:47:01 +0000
Message-ID: <bug-100423-8800-Usj1oreq5U@http.bugs.freedesktop.org/>
References: <bug-100423-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0369820914=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100423-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0369820914==
Content-Type: multipart/alternative; boundary="14937328212.Ac6bc.1785";
 charset="UTF-8"


--14937328212.Ac6bc.1785
Date: Tue, 2 May 2017 13:47:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100423

--- Comment #3 from Johnny B. Goode <adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org> ---
Almost same for i7-6700, GM206 [GTX 950]
No touch screen, no hybrid graphics. Pure desktop. Intel 530 on chip but
disabled in BIOS. Only one Asus Graphic Card.
Problem started on Kernel 4.10.x and is going on 4.11.0. Kernel 4.9.x is FA=
ULT
free. Different distributions Fedora 25, Gentoo.
------------------------------------

dmesg | grep -i nouveau
[    1.688288] fb: switching to nouveaufb from EFI VGA
[    1.689206] nouveau 0000:01:00.0: NVIDIA GM206 (126020a1)
[    1.787066] nouveau 0000:01:00.0: bios: version 84.06.3d.00.6f
[    1.787209] nouveau 0000:01:00.0: disp: dcb 15 type 8 unknown
[    1.787571] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    1.787585] nouveau 0000:01:00.0: bus: MMIO write of 80000136 FAULT at
10eb14 [ IBUS ]
[    1.794508] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    1.794509] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.794512] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.794513] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.794515] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    1.794517] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    1.794518] nouveau 0000:01:00.0: DRM: DCB outp 02: 02811f66 04400010
[    1.794520] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[    1.794522] nouveau 0000:01:00.0: DRM: DCB outp 04: 02022f72 00020020
[    1.794523] nouveau 0000:01:00.0: DRM: DCB outp 05: 04033f82 00020030
[    1.794525] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df4ff8 00000000
[    1.794526] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    1.794528] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[    1.794529] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020261
[    1.794531] nouveau 0000:01:00.0: DRM: DCB conn 03: 02000331
[    1.794532] nouveau 0000:01:00.0: DRM: DCB conn 04: 00000470
[    1.794534] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[    1.828756] nouveau 0000:01:00.0: DRM: unknown connector type 70
[    1.828775] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    1.828778] nouveau 0000:01:00.0: DRM: Unknown-1 has no encoders, removi=
ng
[    1.934421] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    1.993646] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.072744] nouveau 0000:01:00.0: priv: GPC0: 419df4 00000000 (1c40820e)
[    2.072763] nouveau 0000:01:00.0: priv: GPC1: 419df4 00000000 (1c40820e)
[    2.174707] nouveau 0000:01:00.0: DRM: allocated 1600x1200 fb: 0x60000, =
bo
ffff9b09ca6eb800
[    2.176838] fbcon: nouveaufb (fb0) is primary device
[    2.375660] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.389828] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

Almost same, because my FAULT is at 10eb14=20
------------------------------------

01:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 95=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 8555
        Flags: bus master, fast devsel, latency 0, IRQ 134
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at 2fe0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at 2ff0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting <?>
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
<?>
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau
------------------------------------

xorg-x11-drv-nouveau-1.0.14-2.fc25.x86_64
libdrm-2.4.79-1.fc25.x86_64
and:
xf86-video-nouveau-1.0.13
libdrm-2.4.75

Should I open a new bug with "FAULT at 10eb14" or is it this same issue?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14937328212.Ac6bc.1785
Date: Tue, 2 May 2017 13:47:01 +0000
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
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - MMIO read of 00000000 FAULT at 022554 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100423">bug 10042=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
adamos&#64;hell.factory.net.pl" title=3D"Johnny B. Goode &lt;adamos&#64;hel=
l.factory.net.pl&gt;"> <span class=3D"fn">Johnny B. Goode</span></a>
</span></b>
        <pre>Almost same for i7-6700, GM206 [GTX 950]
No touch screen, no hybrid graphics. Pure desktop. Intel 530 on chip but
disabled in BIOS. Only one Asus Graphic Card.
Problem started on Kernel 4.10.x and is going on 4.11.0. Kernel 4.9.x is FA=
ULT
free. Different distributions Fedora 25, Gentoo.
------------------------------------

dmesg | grep -i nouveau
[    1.688288] fb: switching to nouveaufb from EFI VGA
[    1.689206] nouveau 0000:01:00.0: NVIDIA GM206 (126020a1)
[    1.787066] nouveau 0000:01:00.0: bios: version 84.06.3d.00.6f
[    1.787209] nouveau 0000:01:00.0: disp: dcb 15 type 8 unknown
[    1.787571] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[    1.787585] nouveau 0000:01:00.0: bus: MMIO write of 80000136 FAULT at
10eb14 [ IBUS ]
[    1.794508] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[    1.794509] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.794512] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.794513] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.794515] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[    1.794517] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[    1.794518] nouveau 0000:01:00.0: DRM: DCB outp 02: 02811f66 04400010
[    1.794520] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[    1.794522] nouveau 0000:01:00.0: DRM: DCB outp 04: 02022f72 00020020
[    1.794523] nouveau 0000:01:00.0: DRM: DCB outp 05: 04033f82 00020030
[    1.794525] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df4ff8 00000000
[    1.794526] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[    1.794528] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[    1.794529] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020261
[    1.794531] nouveau 0000:01:00.0: DRM: DCB conn 03: 02000331
[    1.794532] nouveau 0000:01:00.0: DRM: DCB conn 04: 00000470
[    1.794534] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[    1.828756] nouveau 0000:01:00.0: DRM: unknown connector type 70
[    1.828775] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[    1.828778] nouveau 0000:01:00.0: DRM: Unknown-1 has no encoders, removi=
ng
[    1.934421] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[    1.993646] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    2.072744] nouveau 0000:01:00.0: priv: GPC0: 419df4 00000000 (1c40820e)
[    2.072763] nouveau 0000:01:00.0: priv: GPC1: 419df4 00000000 (1c40820e)
[    2.174707] nouveau 0000:01:00.0: DRM: allocated 1600x1200 fb: 0x60000, =
bo
ffff9b09ca6eb800
[    2.176838] fbcon: nouveaufb (fb0) is primary device
[    2.375660] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.389828] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

Almost same, because my FAULT is at 10eb14=20
------------------------------------

01:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 95=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. Device 8555
        Flags: bus master, fast devsel, latency 0, IRQ 134
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at 2fe0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at 2ff0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: [60] Power Management version 3
        Capabilities: [68] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [78] Express Legacy Endpoint, MSI 00
        Capabilities: [100] Virtual Channel
        Capabilities: [258] L1 PM Substates
        Capabilities: [128] Power Budgeting &lt;?&gt;
        Capabilities: [420] Advanced Error Reporting
        Capabilities: [600] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D024
&lt;?&gt;
        Capabilities: [900] #19
        Kernel driver in use: nouveau
        Kernel modules: nouveau
------------------------------------

xorg-x11-drv-nouveau-1.0.14-2.fc25.x86_64
libdrm-2.4.79-1.fc25.x86_64
and:
xf86-video-nouveau-1.0.13
libdrm-2.4.75

Should I open a new bug with &quot;FAULT at 10eb14&quot; or is it this same=
 issue?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14937328212.Ac6bc.1785--

--===============0369820914==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0369820914==--
