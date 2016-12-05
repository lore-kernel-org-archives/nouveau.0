From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98997] New: Invalid ioctl during Xorg startup
Date: Mon, 05 Dec 2016 12:20:46 +0000
Message-ID: <bug-98997-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0270658088=="
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


--===============0270658088==
Content-Type: multipart/alternative; boundary="14809404460.e99B1d.10937";
 charset="UTF-8"


--14809404460.e99B1d.10937
Date: Mon, 5 Dec 2016 12:20:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98997

            Bug ID: 98997
           Summary: Invalid ioctl during Xorg startup
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: reptm-O5WfVfzUwx8@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

OS:    Ubuntu 16.10
Kernel: 4.8.0-28-generic
xorg-server: 1.18.4
cpu: Intel(R) Core(TM) i7-3720QM CPU @ 2.60GHz


After connecting UDL device and restarting Xorg, Xorg tries to send invalid
ioctl to that device.

Looks like Xorg enumerates existing drm devices and performs driver's
platformprobe function on them regardless of their type.

syslog:
Dec  5 11:31:55 kernel: [ 1026.543315] [drm:drm_stub_open]
Dec  5 11:31:55 kernel: [ 1026.543317] [drm:drm_open_helper] pid =3D 4642, =
minor
=3D 0
Dec  5 11:31:55 kernel: [ 1026.543341] [drm:drm_setup]
Dec  5 11:31:55 kernel: [ 1026.543349] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543351] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543355] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543357] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543358] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543359] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543362] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543364] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543393] [drm:drm_release] open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543394] [drm:drm_release] pid =3D 4642, devi=
ce =3D
0xe200, open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543401] [drm:drm_lastclose]
Dec  5 11:31:55 kernel: [ 1026.543401] [drm:drm_lastclose] driver lastclose
completed
Dec  5 11:31:55 kernel: [ 1026.543414] [drm:drm_stub_open]
Dec  5 11:31:55 kernel: [ 1026.543415] [drm:drm_open_helper] pid =3D 4642, =
minor
=3D 2
Dec  5 11:31:55 kernel: [ 1026.543416] [drm:drm_setup]
Dec  5 11:31:55 kernel: [ 1026.543418] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e202,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543419] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e202,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543421] [drm:drm_ioctl] invalid ioctl: pid=
=3D4642,
dev=3D0xe202, auth=3D1, cmd=3D0xc0106440, nr=3D0x40
Dec  5 11:31:55 kernel: [ 1026.543422] [drm:drm_ioctl] ret =3D -22
Dec  5 11:31:55 kernel: [ 1026.543425] [drm:drm_release] open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543426] [drm:drm_release] pid =3D 4642, devi=
ce =3D
0xe202, open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543427] [drm:drm_lastclose]
Dec  5 11:31:55 kernel: [ 1026.543427] [drm:drm_lastclose] driver lastclose
completed

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14809404460.e99B1d.10937
Date: Mon, 5 Dec 2016 12:20:46 +0000
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
   title=3D"NEW - Invalid ioctl during Xorg startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98997">98997</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Invalid ioctl during Xorg startup
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
          <td>reptm&#64;mail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>OS:    Ubuntu 16.10
Kernel: 4.8.0-28-generic
xorg-server: 1.18.4
cpu: Intel(R) Core(TM) i7-3720QM CPU &#64; 2.60GHz


After connecting UDL device and restarting Xorg, Xorg tries to send invalid
ioctl to that device.

Looks like Xorg enumerates existing drm devices and performs driver's
platformprobe function on them regardless of their type.

syslog:
Dec  5 11:31:55 kernel: [ 1026.543315] [drm:drm_stub_open]
Dec  5 11:31:55 kernel: [ 1026.543317] [drm:drm_open_helper] pid =3D 4642, =
minor
=3D 0
Dec  5 11:31:55 kernel: [ 1026.543341] [drm:drm_setup]
Dec  5 11:31:55 kernel: [ 1026.543349] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543351] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543355] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543357] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543358] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543359] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, NOUVEAU_GETPARAM
Dec  5 11:31:55 kernel: [ 1026.543362] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543364] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e200,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543393] [drm:drm_release] open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543394] [drm:drm_release] pid =3D 4642, devi=
ce =3D
0xe200, open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543401] [drm:drm_lastclose]
Dec  5 11:31:55 kernel: [ 1026.543401] [drm:drm_lastclose] driver lastclose
completed
Dec  5 11:31:55 kernel: [ 1026.543414] [drm:drm_stub_open]
Dec  5 11:31:55 kernel: [ 1026.543415] [drm:drm_open_helper] pid =3D 4642, =
minor
=3D 2
Dec  5 11:31:55 kernel: [ 1026.543416] [drm:drm_setup]
Dec  5 11:31:55 kernel: [ 1026.543418] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e202,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543419] [drm:drm_ioctl] pid=3D4642, dev=3D0x=
e202,
auth=3D1, DRM_IOCTL_VERSION
Dec  5 11:31:55 kernel: [ 1026.543421] [drm:drm_ioctl] invalid ioctl: pid=
=3D4642,
dev=3D0xe202, auth=3D1, cmd=3D0xc0106440, nr=3D0x40
Dec  5 11:31:55 kernel: [ 1026.543422] [drm:drm_ioctl] ret =3D -22
Dec  5 11:31:55 kernel: [ 1026.543425] [drm:drm_release] open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543426] [drm:drm_release] pid =3D 4642, devi=
ce =3D
0xe202, open_count =3D 1
Dec  5 11:31:55 kernel: [ 1026.543427] [drm:drm_lastclose]
Dec  5 11:31:55 kernel: [ 1026.543427] [drm:drm_lastclose] driver lastclose
completed</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14809404460.e99B1d.10937--

--===============0270658088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0270658088==--
