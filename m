From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103753] New: Visual glitches on GTX 1060 6GB/4.13.x
Date: Wed, 15 Nov 2017 10:04:01 +0000
Message-ID: <bug-103753-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0352155216=="
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


--===============0352155216==
Content-Type: multipart/alternative; boundary="15107402411.AB1E01A.5449";
 charset="UTF-8"


--15107402411.AB1E01A.5449
Date: Wed, 15 Nov 2017 10:04:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103753

            Bug ID: 103753
           Summary: Visual glitches on GTX 1060 6GB/4.13.x
           Product: xorg
           Version: git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: t.artem-VInPYn6yXxRWk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 135483
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D135483&action=3Dedit
XFCE panel screenshot

This is clearly a regression because kernel 4.12.x worked just fine here and
all 4.13.x releases exhibit this problem.

I'm running XFCE under Fedora 27 (recently updated from 26 which also exhib=
ited
this bug) without a compositing manager.

Upon logon XFCE panel icons are always broken in one way or another. If you
move any window above the panel then everything gets back to normal. Yet wh=
en
you run `xfce4-panel -r` glitches return.

Also this bug manifests itself in Firefox when you're scrolling. Text often
gets strange artifacts.

Here are relevant kernel messages:

nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
nouveau 0000:01:00.0: bios: version 86.06.0e.00.28
nouveau 0000:01:00.0: fb: 6144 MiB GDDR5
nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: BIT table 'A' not found
nouveau 0000:01:00.0: DRM: BIT table 'L' not found
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.1
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 04620020
nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 04620010
nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 04620010
nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, bo ffff908246f2=
6800
fbcon: nouveaufb (fb0) is primary device
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15107402411.AB1E01A.5449
Date: Wed, 15 Nov 2017 10:04:01 +0000
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
   title=3D"NEW - Visual glitches on GTX 1060 6GB/4.13.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103753">103753</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Visual glitches on GTX 1060 6GB/4.13.x
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>major
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
          <td>t.artem&#64;mailcity.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D135483=
" name=3D"attach_135483" title=3D"XFCE panel screenshot">attachment 135483<=
/a> <a href=3D"attachment.cgi?id=3D135483&amp;action=3Dedit" title=3D"XFCE =
panel screenshot">[details]</a></span>
XFCE panel screenshot

This is clearly a regression because kernel 4.12.x worked just fine here and
all 4.13.x releases exhibit this problem.

I'm running XFCE under Fedora 27 (recently updated from 26 which also exhib=
ited
this bug) without a compositing manager.

Upon logon XFCE panel icons are always broken in one way or another. If you
move any window above the panel then everything gets back to normal. Yet wh=
en
you run `xfce4-panel -r` glitches return.

Also this bug manifests itself in Firefox when you're scrolling. Text often
gets strange artifacts.

Here are relevant kernel messages:

nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
nouveau 0000:01:00.0: bios: version 86.06.0e.00.28
nouveau 0000:01:00.0: fb: 6144 MiB GDDR5
nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
nouveau 0000:01:00.0: DRM: BIT table 'A' not found
nouveau 0000:01:00.0: DRM: BIT table 'L' not found
nouveau 0000:01:00.0: DRM: TMDS table version 2.0
nouveau 0000:01:00.0: DRM: DCB version 4.1
nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 04620020
nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 04620010
nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 04620010
nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] Driver supports precise vblank timestamp query.
nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, bo ffff908246f2=
6800
fbcon: nouveaufb (fb0) is primary device
nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on minor 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15107402411.AB1E01A.5449--

--===============0352155216==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0352155216==--
