From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109407] New: GTX 1050 fails to initialise
 acceleration
Date: Mon, 21 Jan 2019 20:17:52 +0000
Message-ID: <bug-109407-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1249641925=="
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


--===============1249641925==
Content-Type: multipart/alternative; boundary="15481018720.e106C5.13029"
Content-Transfer-Encoding: 7bit


--15481018720.e106C5.13029
Date: Mon, 21 Jan 2019 20:17:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109407

            Bug ID: 109407
           Summary: GTX 1050 fails to initialise acceleration
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tom-JS3CarkZCLSmg8Ev75riOw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 143179
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143179&action=3Dedit
Kernel log

I have a GTX 1050 card that seems to be failing to initialise acceleration
leading Gnome to fallback to software rendering. The card is:

43:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeForce GTX 10=
50
3GB] (rev a1)

and an extract of relevant looking log messages:

Jan 21 19:27:17 localhost.localdomain kernel: MXM: GUID detected in BIOS
Jan 21 19:27:17 localhost.localdomain kernel: nouveau 0000:43:00.0: NVIDIA
GP107 (137000a1)
Jan 21 19:27:17 localhost.localdomain kernel: nouveau 0000:43:00.0: bios:
version 86.07.61.00.25
Jan 21 19:27:17 localhost.localdomain kernel: nouveau 0000:43:00.0: fb: 3072
MiB GDDR5
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Zone  kernel: Available
graphics memory: 65973248 kiB
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Zone   dma32: Available
graphics memory: 2097152 kiB
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Initializing pool alloc=
ator
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Initializing DMA pool
allocator
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: VR=
AM:
3072 MiB
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: GA=
RT:
536870912 MiB
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: BIT
table 'A' not found
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: BIT
table 'L' not found
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: TM=
DS
table version 2.0
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
version 4.1
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 00: 01000f42 04620030
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 01: 02011f62 04620010
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 02: 02822f76 04600020
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 03: 02022f72 04620020
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
conn 00: 00001031
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
conn 01: 00010161
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
conn 02: 00020246
Jan 21 19:27:18 localhost.localdomain kernel: [drm] Supports vblank timesta=
mp
caching Rev 2 (21.10.2013).
Jan 21 19:27:18 localhost.localdomain kernel: [drm] Driver supports precise
vblank timestamp query.
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: MM:
using COPY for buffer copies
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: secboot:
SEC2 failed to start
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: sec2:
unhandled intr 00000010
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: gr: init
failed, -22
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM:
allocated 2560x1600 fb: 0x200000, bo 00000000f94c15a8
Jan 21 19:27:18 localhost.localdomain kernel: fbcon: nouveaufb (fb0) is pri=
mary
device
Jan 21 19:27:18 localhost.localdomain kernel: Console: switching to colour
frame buffer device 320x100
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: fb0:
nouveaufb frame buffer device
Jan 21 19:27:18 localhost.localdomain kernel: [drm] Initialized nouveau 1.3=
.1
20120801 for 0000:43:00.0 on minor 0
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]:
nvc0_screen_create:983 - Error allocating PGRAPH context for M2MF: -16
Jan 21 19:27:21 localhost.localdomain kernel: nouveau 0000:43:00.0: gr: FECS
falcon already acquired by gr!
Jan 21 19:27:21 localhost.localdomain kernel: nouveau 0000:43:00.0: gr: init
failed, -16
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: glamor=
: No
eglstream capable devices found
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: glamor:
'wl_drm' not supported
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: Missing
Wayland requirements for glamor GBM backend
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: Missing
Wayland requirements for glamor EGLStream backend
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: Failed=
 to
initialize glamor, falling back to sw

Full kernel logs are attached, along with the VBIOS.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15481018720.e106C5.13029
Date: Mon, 21 Jan 2019 20:17:52 +0000
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
   title=3D"NEW - GTX 1050 fails to initialise acceleration"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109407">109407</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GTX 1050 fails to initialise acceleration
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
          <td>tom&#64;compton.nu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143179=
" name=3D"attach_143179" title=3D"Kernel log">attachment 143179</a> <a href=
=3D"attachment.cgi?id=3D143179&amp;action=3Dedit" title=3D"Kernel log">[det=
ails]</a></span>
Kernel log

I have a GTX 1050 card that seems to be failing to initialise acceleration
leading Gnome to fallback to software rendering. The card is:

43:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeForce GTX 10=
50
3GB] (rev a1)

and an extract of relevant looking log messages:

Jan 21 19:27:17 localhost.localdomain kernel: MXM: GUID detected in BIOS
Jan 21 19:27:17 localhost.localdomain kernel: nouveau 0000:43:00.0: NVIDIA
GP107 (137000a1)
Jan 21 19:27:17 localhost.localdomain kernel: nouveau 0000:43:00.0: bios:
version 86.07.61.00.25
Jan 21 19:27:17 localhost.localdomain kernel: nouveau 0000:43:00.0: fb: 3072
MiB GDDR5
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Zone  kernel: Available
graphics memory: 65973248 kiB
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Zone   dma32: Available
graphics memory: 2097152 kiB
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Initializing pool alloc=
ator
Jan 21 19:27:18 localhost.localdomain kernel: [TTM] Initializing DMA pool
allocator
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: VR=
AM:
3072 MiB
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: GA=
RT:
536870912 MiB
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: BIT
table 'A' not found
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: BIT
table 'L' not found
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: TM=
DS
table version 2.0
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
version 4.1
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 00: 01000f42 04620030
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 01: 02011f62 04620010
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 02: 02822f76 04600020
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
outp 03: 02022f72 04620020
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
conn 00: 00001031
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
conn 01: 00010161
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: DCB
conn 02: 00020246
Jan 21 19:27:18 localhost.localdomain kernel: [drm] Supports vblank timesta=
mp
caching Rev 2 (21.10.2013).
Jan 21 19:27:18 localhost.localdomain kernel: [drm] Driver supports precise
vblank timestamp query.
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM: MM:
using COPY for buffer copies
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: secboot:
SEC2 failed to start
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: sec2:
unhandled intr 00000010
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: gr: init
failed, -22
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: DRM:
allocated 2560x1600 fb: 0x200000, bo 00000000f94c15a8
Jan 21 19:27:18 localhost.localdomain kernel: fbcon: nouveaufb (fb0) is pri=
mary
device
Jan 21 19:27:18 localhost.localdomain kernel: Console: switching to colour
frame buffer device 320x100
Jan 21 19:27:18 localhost.localdomain kernel: nouveau 0000:43:00.0: fb0:
nouveaufb frame buffer device
Jan 21 19:27:18 localhost.localdomain kernel: [drm] Initialized nouveau 1.3=
.1
20120801 for 0000:43:00.0 on minor 0
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]:
nvc0_screen_create:983 - Error allocating PGRAPH context for M2MF: -16
Jan 21 19:27:21 localhost.localdomain kernel: nouveau 0000:43:00.0: gr: FECS
falcon already acquired by gr!
Jan 21 19:27:21 localhost.localdomain kernel: nouveau 0000:43:00.0: gr: init
failed, -16
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: glamor=
: No
eglstream capable devices found
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: glamor:
'wl_drm' not supported
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: Missing
Wayland requirements for glamor GBM backend
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: Missing
Wayland requirements for glamor EGLStream backend
Jan 21 19:27:21 localhost.localdomain org.gnome.Shell.desktop[1930]: Failed=
 to
initialize glamor, falling back to sw

Full kernel logs are attached, along with the VBIOS.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15481018720.e106C5.13029--

--===============1249641925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1249641925==--
