From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104652] New: None of the video outputs are usable
 for GTX 1060 - jerky video very few seconds
Date: Tue, 16 Jan 2018 09:42:57 +0000
Message-ID: <bug-104652-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1428668425=="
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


--===============1428668425==
Content-Type: multipart/alternative; boundary="15160957770.eD0dbb.1318"
Content-Transfer-Encoding: 7bit


--15160957770.eD0dbb.1318
Date: Tue, 16 Jan 2018 09:42:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104652

            Bug ID: 104652
           Summary: None of the video outputs are usable for GTX 1060 -
                    jerky video very few seconds
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

I'm trying to watch a movie using mpv/ffplay and none of the video outputs =
are
usable for GTX 1060. The video plays smoothly for up to 5 seconds, then it
looks like some frames are shown out of order or even in a reverse order.

I've tried all the possible outputs:

-vo xv
-vo opengl
-vo vaapi
-vo x11

The issue occurs both in full screen and windowed modes.

I'm _not_ using a compositing window manager.

Some info:

4.14.13-300.fc27.x86_64

[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    1.369154] nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
[    1.476845] nouveau 0000:01:00.0: bios: version 86.06.0e.00.28
[    1.477677] nouveau 0000:01:00.0: fb: 6144 MiB GDDR5
[    1.479278] nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
[    1.479280] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.479281] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    1.479283] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    1.479284] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.479285] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.479287] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
[    1.479288] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
[    1.479289] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 04620020
[    1.479290] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
[    1.479291] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 04620010
[    1.479292] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 04620010
[    1.479293] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
[    1.479295] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
[    1.479296] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    1.479297] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    1.479298] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[    1.479299] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    1.479300] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
[    1.540695] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.540696] [drm] Driver supports precise vblank timestamp query.
[    1.600885] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    1.925147] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff962d06d62000
[    1.926150] fbcon: nouveaufb (fb0) is primary device
[    2.332812] Console: switching to colour frame buffer device 240x67
[    2.349240] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.356147] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   26.758339] nouveau 0000:01:00.0: gr: intr 00000040
[   33.415288] nouveau 0000:01:00.0: gr: intr 00000040

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15160957770.eD0dbb.1318
Date: Tue, 16 Jan 2018 09:42:57 +0000
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
   title=3D"NEW - None of the video outputs are usable for GTX 1060 - jerky=
 video very few seconds"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104652">104652</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>None of the video outputs are usable for GTX 1060 - jerky vid=
eo very few seconds
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
        <pre>I'm trying to watch a movie using mpv/ffplay and none of the v=
ideo outputs are
usable for GTX 1060. The video plays smoothly for up to 5 seconds, then it
looks like some frames are shown out of order or even in a reverse order.

I've tried all the possible outputs:

-vo xv
-vo opengl
-vo vaapi
-vo x11

The issue occurs both in full screen and windowed modes.

I'm _not_ using a compositing window manager.

Some info:

4.14.13-300.fc27.x86_64

[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [tty0] enabled
[    1.369154] nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
[    1.476845] nouveau 0000:01:00.0: bios: version 86.06.0e.00.28
[    1.477677] nouveau 0000:01:00.0: fb: 6144 MiB GDDR5
[    1.479278] nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
[    1.479280] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[    1.479281] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[    1.479283] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[    1.479284] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[    1.479285] nouveau 0000:01:00.0: DRM: DCB version 4.1
[    1.479287] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
[    1.479288] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
[    1.479289] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 04620020
[    1.479290] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
[    1.479291] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 04620010
[    1.479292] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 04620010
[    1.479293] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
[    1.479295] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
[    1.479296] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[    1.479297] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[    1.479298] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[    1.479299] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[    1.479300] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
[    1.540695] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    1.540696] [drm] Driver supports precise vblank timestamp query.
[    1.600885] nouveau 0000:01:00.0: DRM: MM: using COPY for buffer copies
[    1.925147] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff962d06d62000
[    1.926150] fbcon: nouveaufb (fb0) is primary device
[    2.332812] Console: switching to colour frame buffer device 240x67
[    2.349240] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[    2.356147] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0
[   26.758339] nouveau 0000:01:00.0: gr: intr 00000040
[   33.415288] nouveau 0000:01:00.0: gr: intr 00000040</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15160957770.eD0dbb.1318--

--===============1428668425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1428668425==--
