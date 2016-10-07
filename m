From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98149] New: EDID doesn't detect resolution 1440x900
 correctly NV34 FX5200Go
Date: Fri, 07 Oct 2016 15:15:30 +0000
Message-ID: <bug-98149-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2021466830=="
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


--===============2021466830==
Content-Type: multipart/alternative; boundary="14758533300.0B2D2.12565";
 charset="UTF-8"


--14758533300.0B2D2.12565
Date: Fri, 7 Oct 2016 15:15:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98149

            Bug ID: 98149
           Summary: EDID doesn't detect resolution 1440x900 correctly NV34
                    FX5200Go
           Product: xorg
           Version: unspecified
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: dino-fd97jBR+K/4TdH58SC1qeg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 127102
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127102&action=3Dedit
Dmesg log

I have an older laptop Toshiba P25-S609 which has NV34 based graphics (NVID=
IA
FX5200Go). With 4.2 kernel and lower (and possibly 4.3) native resolution
1440x900 is detected properly. With 4.4 kernel and newer (e.g. Xubuntu 16.0=
4.1
and newer) image on screen is displayed really weird. It is split in 4 part=
s,
and then it is shown from right to left (inverted). With xrandr --newmode a=
nd
cvt 1440 900 I can set the resolution, but then tty is still messed up.
I have tried to get the bug with options drm.debug=3D0x1e nouveau.debug=3Dd=
ebug,
and vbios.rom from /sys/kernel/debug/dri/0/ and it is here:=20
http://filebin.ca/2xexyy0VGT9L/vbios.rom

Here is the image of what it does look like:=20
http://imgur.com/a/ZUi0j=20

Dmesg log is attached below.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14758533300.0B2D2.12565
Date: Fri, 7 Oct 2016 15:15:30 +0000
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
   title=3D"NEW - EDID doesn't detect resolution 1440x900 correctly NV34 FX=
5200Go"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98149">98149</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>EDID doesn't detect resolution 1440x900 correctly NV34 FX5200=
Go
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
          <td>dino&#64;archlinux.info
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127102=
" name=3D"attach_127102" title=3D"Dmesg log">attachment 127102</a> <a href=
=3D"attachment.cgi?id=3D127102&amp;action=3Dedit" title=3D"Dmesg log">[deta=
ils]</a></span>
Dmesg log

I have an older laptop Toshiba P25-S609 which has NV34 based graphics (NVID=
IA
FX5200Go). With 4.2 kernel and lower (and possibly 4.3) native resolution
1440x900 is detected properly. With 4.4 kernel and newer (e.g. Xubuntu 16.0=
4.1
and newer) image on screen is displayed really weird. It is split in 4 part=
s,
and then it is shown from right to left (inverted). With xrandr --newmode a=
nd
cvt 1440 900 I can set the resolution, but then tty is still messed up.
I have tried to get the bug with options drm.debug=3D0x1e nouveau.debug=3Dd=
ebug,
and vbios.rom from /sys/kernel/debug/dri/0/ and it is here:=20
<a href=3D"http://filebin.ca/2xexyy0VGT9L/vbios.rom">http://filebin.ca/2xex=
yy0VGT9L/vbios.rom</a>

Here is the image of what it does look like:=20
<a href=3D"http://imgur.com/a/ZUi0j">http://imgur.com/a/ZUi0j</a>=20

Dmesg log is attached below.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14758533300.0B2D2.12565--

--===============2021466830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2021466830==--
