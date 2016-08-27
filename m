From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97505] New: X11 does not detect nouveau when using
 the linux kernel EFI Loader (GRUB loader works fine)
Date: Sat, 27 Aug 2016 00:57:42 +0000
Message-ID: <bug-97505-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1857236082=="
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


--===============1857236082==
Content-Type: multipart/alternative; boundary="14722594620.8B923DE.17082";
 charset="UTF-8"


--14722594620.8B923DE.17082
Date: Sat, 27 Aug 2016 00:57:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97505

            Bug ID: 97505
           Summary: X11 does not detect nouveau when using the linux
                    kernel EFI Loader (GRUB loader works fine)
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jeremyhu-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

When using the Linux Kernel's EFI Boot Loader stub, X11 1.18.3 fails to sta=
rt.=20
Everything works fine when using GRUB as the boot loader.

The kernel is based on 4.4.15 (specifically, Ubuntu's 4.4.0-34 kernel.

Looking at dmesg shows some interesting differences regarding fb, which is =
why
I suspect the device isn't getting automatically detected:


$ egrep '^(nouveau|.*fb).*:' dmesg.notime=20
efifb: dmi detected MacBookPro3,1 - framebuffer at 0xc0030000 (1440x900, st=
ride
8192)
efifb: probing for efifb
efifb: framebuffer at 0xc0030000, mapped to 0xffffc90000800000, using 7232k,
total 7232k
efifb: mode is 1440x900x32, linelength=3D8192, pages=3D1
efifb: scrolling: redraw
efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
fb0: EFI VGA frame buffer device
nouveau 0000:01:00.0: enabling device (0002 -> 0003)
fb: switching to nouveaufb from EFI VGA
nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
nouveau 0000:01:00.0: bios: version 60.84.49.03.00
nouveau 0000:01:00.0: fb: 128 MiB GDDR3
nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
nouveau 0000:01:00.0: DRM: unknown connector type 20
nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -19
nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo ffff880035b24=
400
fbcon: nouveaufb (fb0) is primary device
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device


linux-efi-loader $ egrep '^(nouveau|.*fb).*:' dmesg.notime=20
nouveau 0000:01:00.0: enabling device (0002 -> 0003)
nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
nouveau 0000:01:00.0: bios: version 60.84.49.03.00
nouveau 0000:01:00.0: fb: 128 MiB GDDR3
nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
nouveau 0000:01:00.0: DRM: unknown connector type 20
nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -19
nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo ffff88007f5d6=
400
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device

The differences in the Xorg.0.logs for the failed/working case is essential=
ly
some memory address / time / kernel boot arg differences and then the tail
hunk:
@@ -174,323 +174,13 @@ nouveau interface version: 1.3.1
        compiled for 1.18.3, module version =3D 0.0.2
        ABI class: X.Org Video Driver, version 20.0
 (WW) Falling back to old probe method for vesa
-(II) Loading sub module "dri2"
-(II) LoadModule: "dri2"
-(II) Module "dri2" already built-in
-(--) NOUVEAU(0): Chipset: "NVIDIA NV84"
-(II) NOUVEAU(0): Creating default Display subsection in Screen section
-       "Default Screen Section" for depth/fbbpp 24/32
... more - for the successful launch
+(EE) No devices detected.
...

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14722594620.8B923DE.17082
Date: Sat, 27 Aug 2016 00:57:42 +0000
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
   title=3D"NEW - X11 does not detect nouveau when using the linux kernel E=
FI Loader (GRUB loader works fine)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97505">97505</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X11 does not detect nouveau when using the linux kernel EFI L=
oader (GRUB loader works fine)
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
          <td>All
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
          <td>jeremyhu&#64;freedesktop.org
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When using the Linux Kernel's EFI Boot Loader stub, X11 1.18.3=
 fails to start.=20
Everything works fine when using GRUB as the boot loader.

The kernel is based on 4.4.15 (specifically, Ubuntu's 4.4.0-34 kernel.

Looking at dmesg shows some interesting differences regarding fb, which is =
why
I suspect the device isn't getting automatically detected:


$ egrep '^(nouveau|.*fb).*:' dmesg.notime=20
efifb: dmi detected MacBookPro3,1 - framebuffer at 0xc0030000 (1440x900, st=
ride
8192)
efifb: probing for efifb
efifb: framebuffer at 0xc0030000, mapped to 0xffffc90000800000, using 7232k,
total 7232k
efifb: mode is 1440x900x32, linelength=3D8192, pages=3D1
efifb: scrolling: redraw
efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
fb0: EFI VGA frame buffer device
nouveau 0000:01:00.0: enabling device (0002 -&gt; 0003)
fb: switching to nouveaufb from EFI VGA
nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
nouveau 0000:01:00.0: bios: version 60.84.49.03.00
nouveau 0000:01:00.0: fb: 128 MiB GDDR3
nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
nouveau 0000:01:00.0: DRM: unknown connector type 20
nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -19
nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo ffff880035b24=
400
fbcon: nouveaufb (fb0) is primary device
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device


linux-efi-loader $ egrep '^(nouveau|.*fb).*:' dmesg.notime=20
nouveau 0000:01:00.0: enabling device (0002 -&gt; 0003)
nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
nouveau 0000:01:00.0: bios: version 60.84.49.03.00
nouveau 0000:01:00.0: fb: 128 MiB GDDR3
nouveau 0000:01:00.0: DRM: VRAM: 128 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.0
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000123 00010034
nouveau 0000:01:00.0: DRM: DCB outp 01: 02011210 00000028
nouveau 0000:01:00.0: DRM: DCB outp 02: 02011212 00010030
nouveau 0000:01:00.0: DRM: DCB outp 03: 01011211 0080c070
nouveau 0000:01:00.0: DRM: DCB conn 00: 0040
nouveau 0000:01:00.0: DRM: DCB conn 01: 1120
nouveau 0000:01:00.0: DRM: unknown connector type 20
nouveau 0000:01:00.0: DRM: failed to create encoder 0/1/0: -19
nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
nouveau 0000:01:00.0: DRM: allocated 1440x900 fb: 0x50000, bo ffff88007f5d6=
400
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device

The differences in the Xorg.0.logs for the failed/working case is essential=
ly
some memory address / time / kernel boot arg differences and then the tail
hunk:
&#64;&#64; -174,323 +174,13 &#64;&#64; nouveau interface version: 1.3.1
        compiled for 1.18.3, module version =3D 0.0.2
        ABI class: X.Org Video Driver, version 20.0
 (WW) Falling back to old probe method for vesa
-(II) Loading sub module &quot;dri2&quot;
-(II) LoadModule: &quot;dri2&quot;
-(II) Module &quot;dri2&quot; already built-in
-(--) NOUVEAU(0): Chipset: &quot;NVIDIA NV84&quot;
-(II) NOUVEAU(0): Creating default Display subsection in Screen section
-       &quot;Default Screen Section&quot; for depth/fbbpp 24/32
... more - for the successful launch
+(EE) No devices detected.
...</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14722594620.8B923DE.17082--

--===============1857236082==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1857236082==--
