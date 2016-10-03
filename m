From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98030] New: Stuttering video playback in totem after
 update to 1.19-rc1
Date: Mon, 03 Oct 2016 15:11:30 +0000
Message-ID: <bug-98030-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0483402760=="
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


--===============0483402760==
Content-Type: multipart/alternative; boundary="14755074900.c5C89bC5.5723";
 charset="UTF-8"


--14755074900.c5C89bC5.5723
Date: Mon, 3 Oct 2016 15:11:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98030

            Bug ID: 98030
           Summary: Stuttering video playback in totem after update to
                    1.19-rc1
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: piotrdrag-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

After updating to xorg-x11-server-1.19.0-0.1.20160929.fc25 and
xorg-x11-drv-nouveau-1.0.13-1.fc25 (from
<https://bodhi.fedoraproject.org/updates/FEDORA-2016-a5c3ebe67a>) video
playback in totem stutters every few seconds to the point of being unwatcha=
ble.
It doesn't happen with video playback (e.g. YouTube) in Firefox, and system
generally works fine. Downgrading the update "fixes" the problem.


I'm using X11 with nouveau on a GT216M (GeForce GT 240M), no hybrid cards:

Providers: number : 1
Provider 0: id: 0x64 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 3 associated providers: 0 name:nouveau


Hans de Goede in <https://bugzilla.redhat.com/show_bug.cgi?id=3D1381014> ki=
ndly
helped to discover that xf86-video-nouveau-1.0.13 does not show this problem
with xserver-1.18.4, but does show it with xserver-1.19-rc1, and that using=
 the
modesetting driver with xserver-1.19-rc1 makes the problem go away.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14755074900.c5C89bC5.5723
Date: Mon, 3 Oct 2016 15:11:30 +0000
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
   title=3D"NEW - Stuttering video playback in totem after update to 1.19-r=
c1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98030">98030</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Stuttering video playback in totem after update to 1.19-rc1
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
          <td>piotrdrag&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>After updating to xorg-x11-server-1.19.0-0.1.20160929.fc25 and
xorg-x11-drv-nouveau-1.0.13-1.fc25 (from
&lt;<a href=3D"https://bodhi.fedoraproject.org/updates/FEDORA-2016-a5c3ebe6=
7a">https://bodhi.fedoraproject.org/updates/FEDORA-2016-a5c3ebe67a</a>&gt;)=
 video
playback in totem stutters every few seconds to the point of being unwatcha=
ble.
It doesn't happen with video playback (e.g. YouTube) in Firefox, and system
generally works fine. Downgrading the update &quot;fixes&quot; the problem.


I'm using X11 with nouveau on a GT216M (GeForce GT 240M), no hybrid cards:

Providers: number : 1
Provider 0: id: 0x64 cap: 0x7, Source Output, Sink Output, Source Offload
crtcs: 2 outputs: 3 associated providers: 0 name:nouveau


Hans de Goede in &lt;<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=
=3D1381014">https://bugzilla.redhat.com/show_bug.cgi?id=3D1381014</a>&gt; k=
indly
helped to discover that xf86-video-nouveau-1.0.13 does not show this problem
with xserver-1.18.4, but does show it with xserver-1.19-rc1, and that using=
 the
modesetting driver with xserver-1.19-rc1 makes the problem go away.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14755074900.c5C89bC5.5723--

--===============0483402760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0483402760==--
