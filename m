From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109397] New: PGRAPH TLB flush idle timeout fail: X
 hangs, ssh login possible
Date: Sun, 20 Jan 2019 07:57:40 +0000
Message-ID: <bug-109397-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0734169613=="
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


--===============0734169613==
Content-Type: multipart/alternative; boundary="15479710600.CE220.8719"
Content-Transfer-Encoding: 7bit


--15479710600.CE220.8719
Date: Sun, 20 Jan 2019 07:57:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109397

            Bug ID: 109397
           Summary: PGRAPH TLB flush idle timeout fail: X hangs, ssh login
                    possible
           Product: Mesa
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: martin.okrslar-1KBjaw7Xf1+zQB+pC5nmwQ@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Dear nouveau developers and community,

I#m using nouveau on a MacBook Pro mid 2008, with GeForce 8600M GT und Linux
kernel 4.14.90 under NixOS.

After some 30 to 50 minutes of working, the X server always freezes and giv=
es
scattered image. Moving the mouse is often possible, but clicking or typing=
 are
without any effect.

Loging in with ssh is still possible. I also tried to restart the X server,=
 but
it hangs so hard, the only pressing power off button helps.

Here are the nouveau related logs from systemd.

----during boot---

Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: Invalid PCI ROM head=
er
signature: expecting 0xaa55, got 0xffff
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: bios: version
60.84.49.03.00
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: fb: 256 MiB GDDR3

[...]

Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 M=
iB
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: TMDS table vers=
ion
2.0
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 00:
01000123 00010034
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 01:
02011210 00000028
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 02:
02011212 00000030
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 03:
01011211 0080c070
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00=
40
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 11=
20
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: unknown connect=
or
type 20
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: failed to create
encoder 0/1/0: -19

[...]

Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: MM: using CRYPT=
 for
buffer copies
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: allocated 1440x=
900
fb: 0x70000, bo ffff99eff1428000
Jan 20 07:00:07 hackbetz kernel: Console: switching to colour frame buffer
device 180x56
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame
buffer device
Jan 20 07:00:07 hackbetz kernel: [drm] Initialized nouveau 1.3.1 20120801 f=
or
0000:01:00.0 on minor 0
Jan 20 07:00:07 hackbetz kernel: audit: type=3D1130 audit(1547964002.868:7):
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295
msg=3D'unit=3Dsystemd-backlight@leds:smc::kbd_b>


--- on crash this message repeats over and over ---

Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush
idle timeout fail
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS
00000603 [BUSY DISPATCH VFETCH CCACHE_PREGEOM]
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0:
00000009 [VFETCH CCACHE]
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1:
00000000 []
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2:
00000000 []


Any ideas?

Thanks a lot to all of you writing this software!

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15479710600.CE220.8719
Date: Sun, 20 Jan 2019 07:57:40 +0000
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
   title=3D"NEW - PGRAPH TLB flush idle timeout fail: X hangs, ssh login po=
ssible"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109397">109397</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>PGRAPH TLB flush idle timeout fail: X hangs, ssh login possib=
le
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
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
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>martin.okrslar&#64;posteo.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Dear nouveau developers and community,

I#m using nouveau on a MacBook Pro mid 2008, with GeForce 8600M GT und Linux
kernel 4.14.90 under NixOS.

After some 30 to 50 minutes of working, the X server always freezes and giv=
es
scattered image. Moving the mouse is often possible, but clicking or typing=
 are
without any effect.

Loging in with ssh is still possible. I also tried to restart the X server,=
 but
it hangs so hard, the only pressing power off button helps.

Here are the nouveau related logs from systemd.

----during boot---

Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: NVIDIA G84 (084700a2)
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: Invalid PCI ROM head=
er
signature: expecting 0xaa55, got 0xffff
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: bios: version
60.84.49.03.00
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: fb: 256 MiB GDDR3

[...]

Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: VRAM: 256 MiB
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 M=
iB
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: TMDS table vers=
ion
2.0
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 00:
01000123 00010034
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 01:
02011210 00000028
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 02:
02011212 00000030
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB outp 03:
01011211 0080c070
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00=
40
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 11=
20
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: unknown connect=
or
type 20
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: failed to create
encoder 0/1/0: -19

[...]

Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: MM: using CRYPT=
 for
buffer copies
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: DRM: allocated 1440x=
900
fb: 0x70000, bo ffff99eff1428000
Jan 20 07:00:07 hackbetz kernel: Console: switching to colour frame buffer
device 180x56
Jan 20 07:00:07 hackbetz kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame
buffer device
Jan 20 07:00:07 hackbetz kernel: [drm] Initialized nouveau 1.3.1 20120801 f=
or
0000:01:00.0 on minor 0
Jan 20 07:00:07 hackbetz kernel: audit: type=3D1130 audit(1547964002.868:7):
pid=3D1 uid=3D0 auid=3D4294967295 ses=3D4294967295
msg=3D'unit=3Dsystemd-backlight&#64;leds:smc::kbd_b&gt;


--- on crash this message repeats over and over ---

Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH TLB flush
idle timeout fail
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_STATUS
00000603 [BUSY DISPATCH VFETCH CCACHE_PREGEOM]
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS0:
00000009 [VFETCH CCACHE]
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS1:
00000000 []
Jan 20 07:46:51 hackbetz kernel: nouveau 0000:01:00.0: gr: PGRAPH_VSTATUS2:
00000000 []


Any ideas?

Thanks a lot to all of you writing this software!</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15479710600.CE220.8719--

--===============0734169613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0734169613==--
