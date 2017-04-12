From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100659] New: [nouveau] Certain errors on
 initializing GTX 1060 6GB
Date: Wed, 12 Apr 2017 07:50:55 +0000
Message-ID: <bug-100659-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1730551453=="
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


--===============1730551453==
Content-Type: multipart/alternative; boundary="14919834550.cA6edC4e.5163";
 charset="UTF-8"


--14919834550.cA6edC4e.5163
Date: Wed, 12 Apr 2017 07:50:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100659

            Bug ID: 100659
           Summary: [nouveau] Certain errors on initializing GTX 1060 6GB
           Product: xorg
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: t.artem-VInPYn6yXxRWk0Htik3J/w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

[   85.170719] [drm] Initialized
[   85.297953] nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
[   85.404652] nouveau 0000:01:00.0: bios: version 86.06.0e.00.28
[   85.405558] nouveau 0000:01:00.0: fb: 6144 MiB GDDR5
[   85.405562] nouveau 0000:01:00.0: priv: HUB0: 00d054 00000007 (1f408216)
[   85.407278] nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
[   85.407280] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   85.407283] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[   85.407284] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[   85.407286] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   85.407287] nouveau 0000:01:00.0: DRM: DCB version 4.1
[   85.407289] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
[   85.407291] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
[   85.407293] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 04620020
[   85.407294] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
[   85.407295] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 04620010
[   85.407297] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 04620010
[   85.407298] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
[   85.407299] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
[   85.407301] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[   85.407302] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[   85.407304] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[   85.407305] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[   85.407306] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
[   85.407308] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[   85.470272] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   85.470274] [drm] Driver supports precise vblank timestamp query.
[   85.488355] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[   85.514327] nouveau 0000:01:00.0: DRM: failed to create kernel channel, =
-22
[   85.690271] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff9fabcb0a0c00
[   85.694638] fbcon: nouveaufb (fb0) is primary device
[   86.071445] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   86.075582] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

I just wanted to know if these messages are safe to ignore or they are inde=
ed
something you might want to pay close attention to:

1. nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
2. nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22

I'm running:

Linux localhost.localdomain 4.10.9-200.fc25.x86_64 #1 SMP Mon Apr 10 14:48:=
16
UTC 2017 x86_64 x86_64 x86_64 GNU/Linux

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14919834550.cA6edC4e.5163
Date: Wed, 12 Apr 2017 07:50:55 +0000
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
   title=3D"NEW - [nouveau] Certain errors on initializing GTX 1060 6GB"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100659">100659</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nouveau] Certain errors on initializing GTX 1060 6GB
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
        <pre>[   85.170719] [drm] Initialized
[   85.297953] nouveau 0000:01:00.0: NVIDIA GP106 (136000a1)
[   85.404652] nouveau 0000:01:00.0: bios: version 86.06.0e.00.28
[   85.405558] nouveau 0000:01:00.0: fb: 6144 MiB GDDR5
[   85.405562] nouveau 0000:01:00.0: priv: HUB0: 00d054 00000007 (1f408216)
[   85.407278] nouveau 0000:01:00.0: DRM: VRAM: 6144 MiB
[   85.407280] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
[   85.407283] nouveau 0000:01:00.0: DRM: BIT table 'A' not found
[   85.407284] nouveau 0000:01:00.0: DRM: BIT table 'L' not found
[   85.407286] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
[   85.407287] nouveau 0000:01:00.0: DRM: DCB version 4.1
[   85.407289] nouveau 0000:01:00.0: DRM: DCB outp 00: 01000f42 04620030
[   85.407291] nouveau 0000:01:00.0: DRM: DCB outp 01: 04811f96 04600020
[   85.407293] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011f92 04620020
[   85.407294] nouveau 0000:01:00.0: DRM: DCB outp 03: 04822f86 04600010
[   85.407295] nouveau 0000:01:00.0: DRM: DCB outp 04: 04022f82 04620010
[   85.407297] nouveau 0000:01:00.0: DRM: DCB outp 06: 02033f62 04620010
[   85.407298] nouveau 0000:01:00.0: DRM: DCB outp 07: 02844f76 04600020
[   85.407299] nouveau 0000:01:00.0: DRM: DCB outp 08: 02044f72 00020020
[   85.407301] nouveau 0000:01:00.0: DRM: DCB conn 00: 00001031
[   85.407302] nouveau 0000:01:00.0: DRM: DCB conn 01: 02000146
[   85.407304] nouveau 0000:01:00.0: DRM: DCB conn 02: 01000246
[   85.407305] nouveau 0000:01:00.0: DRM: DCB conn 03: 00010361
[   85.407306] nouveau 0000:01:00.0: DRM: DCB conn 04: 00020446
[   85.407308] nouveau 0000:01:00.0: DRM: Pointer to flat panel table inval=
id
[   85.470272] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   85.470274] [drm] Driver supports precise vblank timestamp query.
[   85.488355] nouveau 0000:01:00.0: hwmon_device_register() is deprecated.
Please convert the driver to use hwmon_device_register_with_info().
[   85.514327] nouveau 0000:01:00.0: DRM: failed to create kernel channel, =
-22
[   85.690271] nouveau 0000:01:00.0: DRM: allocated 1920x1080 fb: 0x60000, =
bo
ffff9fabcb0a0c00
[   85.694638] fbcon: nouveaufb (fb0) is primary device
[   86.071445] nouveau 0000:01:00.0: fb0: nouveaufb frame buffer device
[   86.075582] [drm] Initialized nouveau 1.3.1 20120801 for 0000:01:00.0 on
minor 0

I just wanted to know if these messages are safe to ignore or they are inde=
ed
something you might want to pay close attention to:

1. nouveau 0000:01:00.0: DRM: Pointer to flat panel table invalid
2. nouveau 0000:01:00.0: DRM: failed to create kernel channel, -22

I'm running:

Linux localhost.localdomain 4.10.9-200.fc25.x86_64 #1 SMP Mon Apr 10 14:48:=
16
UTC 2017 x86_64 x86_64 x86_64 GNU/Linux</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14919834550.cA6edC4e.5163--

--===============1730551453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1730551453==--
