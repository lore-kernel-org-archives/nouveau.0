From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101206] New: intermittent lock up after login to
 GNOME under wayland
Date: Fri, 26 May 2017 19:59:35 +0000
Message-ID: <bug-101206-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0551410732=="
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


--===============0551410732==
Content-Type: multipart/alternative; boundary="14958287750.7C1313c68.17360";
 charset="UTF-8"


--14958287750.7C1313c68.17360
Date: Fri, 26 May 2017 19:59:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101206

            Bug ID: 101206
           Summary: intermittent lock up after login to GNOME under
                    wayland
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: adi-D1akFU9K7Sphl2p70BpVqQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 131529
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131529&action=3Dedit
last 260 lines of journalctl log 2017-05-26

my notebook locks up intermittently directly after login in to GNOME running
under wayland.

I'm running Fedora 24 with all updates installed. Kernel is 4.10.14, althou=
gh
I've had this problem at least since 4.9, if not before.

Attached are two logs from journalctl from when the locks up happens. I've =
only
attached just enough so I don't have to zip the logs. If needed I can attac=
hed
complete logs as zips or compressed tars.

The notebook also sometimes locks up (although not as frequently) when
unblanking the screen.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14958287750.7C1313c68.17360
Date: Fri, 26 May 2017 19:59:35 +0000
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
   title=3D"NEW - intermittent lock up after login to GNOME under wayland"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101206">101206</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>intermittent lock up after login to GNOME under wayland
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
          <td>adi&#64;sieker.io
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131529=
" name=3D"attach_131529" title=3D"last 260 lines of journalctl log 2017-05-=
26">attachment 131529</a> <a href=3D"attachment.cgi?id=3D131529&amp;action=
=3Dedit" title=3D"last 260 lines of journalctl log 2017-05-26">[details]</a=
></span>
last 260 lines of journalctl log 2017-05-26

my notebook locks up intermittently directly after login in to GNOME running
under wayland.

I'm running Fedora 24 with all updates installed. Kernel is 4.10.14, althou=
gh
I've had this problem at least since 4.9, if not before.

Attached are two logs from journalctl from when the locks up happens. I've =
only
attached just enough so I don't have to zip the logs. If needed I can attac=
hed
complete logs as zips or compressed tars.

The notebook also sometimes locks up (although not as frequently) when
unblanking the screen.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14958287750.7C1313c68.17360--

--===============0551410732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0551410732==--
