From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106227] New: GP107 hangs on boot
Date: Wed, 25 Apr 2018 03:25:50 +0000
Message-ID: <bug-106227-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0069613346=="
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


--===============0069613346==
Content-Type: multipart/alternative; boundary="15246267501.1d0Da.6814"
Content-Transfer-Encoding: 7bit


--15246267501.1d0Da.6814
Date: Wed, 25 Apr 2018 03:25:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106227

            Bug ID: 106227
           Summary: GP107 hangs on boot
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gquigs+bugs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139089
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139089&action=3Dedit
full journal of previous boot

Hangs on boot with small cursor in top left of screen.  No power changes se=
em
to help - only nomodeset and nouveau.nofbaccel (which seems to just turn off
nouveau).  Journal indicates it is just a graphics hang. Trying VTs has no
effect.

Hardware: 1c:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeFo=
rce
GTX 1050] (rev a1)
Software:
OS: Ubuntu 18.04 - also similar results with stock 18.04 and Fedora 28 beta
Mesa: 18.2.0 git from oibaf PPA
Kernel: 4.17.0-041700rc2-generic from Ubuntu Mainline PPA
xserver-xorg-video-nouveau: 1.0.15-2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15246267501.1d0Da.6814
Date: Wed, 25 Apr 2018 03:25:50 +0000
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
   title=3D"NEW - GP107 hangs on boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106227">106227</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GP107 hangs on boot
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
          <td>critical
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
          <td>gquigs+bugs&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139089=
" name=3D"attach_139089" title=3D"full journal of previous boot">attachment=
 139089</a> <a href=3D"attachment.cgi?id=3D139089&amp;action=3Dedit" title=
=3D"full journal of previous boot">[details]</a></span>
full journal of previous boot

Hangs on boot with small cursor in top left of screen.  No power changes se=
em
to help - only nomodeset and nouveau.nofbaccel (which seems to just turn off
nouveau).  Journal indicates it is just a graphics hang. Trying VTs has no
effect.

Hardware: 1c:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeFo=
rce
GTX 1050] (rev a1)
Software:
OS: Ubuntu 18.04 - also similar results with stock 18.04 and Fedora 28 beta
Mesa: 18.2.0 git from oibaf PPA
Kernel: 4.17.0-041700rc2-generic from Ubuntu Mainline PPA
xserver-xorg-video-nouveau: 1.0.15-2</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15246267501.1d0Da.6814--

--===============0069613346==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0069613346==--
