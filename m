From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108982] New: GM206: MMIO write of 800000ec FAULT at
 10eb14 [ IBUS ]
Date: Sat, 08 Dec 2018 16:07:26 +0000
Message-ID: <bug-108982-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1095022676=="
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


--===============1095022676==
Content-Type: multipart/alternative; boundary="15442852461.A012.25328"
Content-Transfer-Encoding: 7bit


--15442852461.A012.25328
Date: Sat, 8 Dec 2018 16:07:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108982

            Bug ID: 108982
           Summary: GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adamos-zBjOIweZRQ4nvi+hAk5376sMm+1xrEX8@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

i7-6700, GM206 [GTX 950]
No touch screen, no hybrid graphics. Pure box. Intel 530 on chip but disabl=
ed
in BIOS. Only one Asus Graphic Card.
Problem started on Kernel 4.10.x and is going on next kernels. Kernel 4.9.x=
 is
FAULT free. Different distributions Fedora, Gentoo.

dmesg | grep nouveau
[   11.511078] fb: switching to nouveaufb from EFI VGA
[   11.511602] nouveau 0000:01:00.0: NVIDIA GM206 (126020a1)
[   11.601757] nouveau 0000:01:00.0: bios: version 84.06.3d.00.6f
[   11.885711] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   11.885746] nouveau 0000:01:00.0: bus: MMIO write of 800000ec FAULT at
10eb14 [ IBUS ]
[   11.979550] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   11.979551] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   11.979553] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   11.979554] nouveau 0000:01:00.0: DRM: DCB version 4.1
[   11.979556] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[   11.979558] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[   11.979559] nouveau 0000:01:00.0: DRM: DCB outp 02: 02811f66 04400010
[   11.979560] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[   11.979562] nouveau 0000:01:00.0: DRM: DCB outp 04: 02022f72 00020020
[   11.979563] nouveau 0000:01:00.0: DRM: DCB outp 05: 04033f82 00020030
[   11.979564] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df4ff8 00000000
[   11.979566] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   11.979567] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[   11.979568] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020261
[   11.979569] nouveau 0000:01:00.0: DRM: DCB conn 03: 02000331
[   11.979570] nouveau 0000:01:00.0: DRM: DCB conn 04: 00000470
[   11.982170] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[   11.982172] nouveau 0000:01:00.0: DRM: Virtual-1 has no encoders, removi=
ng
[   12.233674] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   12.429065] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0xa0000, =
bo
000000000065bfd7
[   12.429187] fbcon: nouveaufb (fb0) is primary device
[   12.564503] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   12.587799] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

01:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 95=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. GM206 [GeForce GTX 950]
        Flags: bus master, fast devsel, latency 0, IRQ 136
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D32M]
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


xf86-video-nouveau-1.0.15-r1
libdrm-2.4.96
kernel-4.19.6

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15442852461.A012.25328
Date: Sat, 8 Dec 2018 16:07:26 +0000
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
   title=3D"NEW - GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108982">108982</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GM206: MMIO write of 800000ec FAULT at 10eb14 [ IBUS ]
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
          <td>adamos&#64;hell.factory.net.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>i7-6700, GM206 [GTX 950]
No touch screen, no hybrid graphics. Pure box. Intel 530 on chip but disabl=
ed
in BIOS. Only one Asus Graphic Card.
Problem started on Kernel 4.10.x and is going on next kernels. Kernel 4.9.x=
 is
FAULT free. Different distributions Fedora, Gentoo.

dmesg | grep nouveau
[   11.511078] fb: switching to nouveaufb from EFI VGA
[   11.511602] nouveau 0000:01:00.0: NVIDIA GM206 (126020a1)
[   11.601757] nouveau 0000:01:00.0: bios: version 84.06.3d.00.6f
[   11.885711] nouveau 0000:01:00.0: fb: 2048 MiB GDDR5
[   11.885746] nouveau 0000:01:00.0: bus: MMIO write of 800000ec FAULT at
10eb14 [ IBUS ]
[   11.979550] nouveau 0000:01:00.0: DRM: VRAM: 2048 MiB
[   11.979551] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   11.979553] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   11.979554] nouveau 0000:01:00.0: DRM: DCB version 4.1
[   11.979556] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f02 00020030
[   11.979558] nouveau 0000:01:00.0: DRM: DCB outp 01: 02000f00 00000000
[   11.979559] nouveau 0000:01:00.0: DRM: DCB outp 02: 02811f66 04400010
[   11.979560] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011f62 00020010
[   11.979562] nouveau 0000:01:00.0: DRM: DCB outp 04: 02022f72 00020020
[   11.979563] nouveau 0000:01:00.0: DRM: DCB outp 05: 04033f82 00020030
[   11.979564] nouveau 0000:01:00.0: DRM: DCB outp 15: 01df4ff8 00000000
[   11.979566] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001030
[   11.979567] nouveau 0000:01:00.0: DRM: DCB conn 01: 00010146
[   11.979568] nouveau 0000:01:00.0: DRM: DCB conn 02: 00020261
[   11.979569] nouveau 0000:01:00.0: DRM: DCB conn 03: 02000331
[   11.979570] nouveau 0000:01:00.0: DRM: DCB conn 04: 00000470
[   11.982170] nouveau 0000:01:00.0: DRM: failed to create encoder 1/8/0: -=
19
[   11.982172] nouveau 0000:01:00.0: DRM: Virtual-1 has no encoders, removi=
ng
[   12.233674] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[   12.429065] nouveau 0000:01:00.0: DRM: allocated 2560x1440 fb: 0xa0000, =
bo
000000000065bfd7
[   12.429187] fbcon: nouveaufb (fb0) is primary device
[   12.564503] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   12.587799] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

01:00.0 VGA compatible controller: NVIDIA Corporation GM206 [GeForce GTX 95=
0]
(rev a1) (prog-if 00 [VGA controller])
        Subsystem: ASUSTeK Computer Inc. GM206 [GeForce GTX 950]
        Flags: bus master, fast devsel, latency 0, IRQ 136
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D32M]
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


xf86-video-nouveau-1.0.15-r1
libdrm-2.4.96
kernel-4.19.6</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15442852461.A012.25328--

--===============1095022676==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1095022676==--
