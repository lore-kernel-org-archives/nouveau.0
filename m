From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109600] New: nv138 hibernete resume bug
Date: Sat, 09 Feb 2019 17:53:12 +0000
Message-ID: <bug-109600-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1378950833=="
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


--===============1378950833==
Content-Type: multipart/alternative; boundary="15497347920.0EaeF.10040"
Content-Transfer-Encoding: 7bit


--15497347920.0EaeF.10040
Date: Sat, 9 Feb 2019 17:53:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109600

            Bug ID: 109600
           Summary: nv138 hibernete resume bug
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: ulf.dambacher-S0/GAf8tV78@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 143350
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143350&action=3Dedit
dmesg

I plugged a new gp108 dev into my system, now SUSPEND and HIBERNATE don't w=
ork
anymore and gnome-shell-wayland crashes in clutter  - card seems to be too =
new
.-(

So enclosed is a dmes output of a kernel 4.20.7 test pm-hibernate featuring:
[  521.248229] nouveau 0000:01:00.0: fifo: fault ...
[  521.349802] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x9c/0xc0
[  525.550237] nouveau 0000:01:00.0: DRM: GPU lockup ...

what further info do you need to debug this?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15497347920.0EaeF.10040
Date: Sat, 9 Feb 2019 17:53:12 +0000
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
   title=3D"NEW - nv138 hibernete resume bug"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109600">109600</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nv138 hibernete resume bug
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
          <td>ulf.dambacher&#64;web.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143350=
" name=3D"attach_143350" title=3D"dmesg">attachment 143350</a> <a href=3D"a=
ttachment.cgi?id=3D143350&amp;action=3Dedit" title=3D"dmesg">[details]</a><=
/span>
dmesg

I plugged a new gp108 dev into my system, now SUSPEND and HIBERNATE don't w=
ork
anymore and gnome-shell-wayland crashes in clutter  - card seems to be too =
new
.-(

So enclosed is a dmes output of a kernel 4.20.7 test pm-hibernate featuring:
[  521.248229] nouveau 0000:01:00.0: fifo: fault ...
[  521.349802] RIP: 0010:nvkm_falcon_v1_wait_for_halt+0x9c/0xc0
[  525.550237] nouveau 0000:01:00.0: DRM: GPU lockup ...

what further info do you need to debug this?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15497347920.0EaeF.10040--

--===============1378950833==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1378950833==--
