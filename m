From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98712] New: [PPC64] GPU Lock Up when Nouveau 2D
 acceleration is enabled + X failures
Date: Sun, 13 Nov 2016 22:42:05 +0000
Message-ID: <bug-98712-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0062461945=="
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


--===============0062461945==
Content-Type: multipart/alternative; boundary="14790769250.Fd8b98B1.4485";
 charset="UTF-8"


--14790769250.Fd8b98B1.4485
Date: Sun, 13 Nov 2016 22:42:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98712

            Bug ID: 98712
           Summary: [PPC64] GPU Lock Up when Nouveau 2D acceleration is
                    enabled + X failures
           Product: xorg
           Version: 7.7 (2012.06)
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: jeffbai-ymACFijhrKM@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 127956
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D127956&action=3Dedit
dmesg without nouveau.noaccel=3D1

Happened to get 2 FX4500's for my PowerMac G5 11,2, but it didn't seem will=
ing
to cooperate.

Without nouveau.noaccel=3D1 in the kernel parameter, the system starts fine=
, but
X would only work with fbdev driver - as GPU locks up at early stages of
startup (dmesg attached above).

With nouveau.noaccel=3D1 in the kernel parameter, system starts fine withou=
t the
lock up message, but X will **still** only work with fbdev - using nouveau =
with
result in a looped output of the following message:

"nouveau 0000:0a:00.0: DRM: 0x13DC: Parsing digital output script table"

And the system is inaccessible, this also appears to hang any `systemctl st=
op
lightdm` operation and even the `reboot` command itself.

---------------------------

Xorg-Server version: 1.18.4
Kernel version: 4.8.6
xf86-video-nouveau version: 1.0.12

---------------------------

I would happily donate one of my FX4500's to one who's willing to investiga=
te
this issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14790769250.Fd8b98B1.4485
Date: Sun, 13 Nov 2016 22:42:05 +0000
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
   title=3D"NEW - [PPC64] GPU Lock Up when Nouveau 2D acceleration is enabl=
ed + X failures"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98712">98712</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[PPC64] GPU Lock Up when Nouveau 2D acceleration is enabled +=
 X failures
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>7.7 (2012.06)
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
          <td>jeffbai&#64;aosc.xyz
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D127956=
" name=3D"attach_127956" title=3D"dmesg without nouveau.noaccel=3D1">attach=
ment 127956</a> <a href=3D"attachment.cgi?id=3D127956&amp;action=3Dedit" ti=
tle=3D"dmesg without nouveau.noaccel=3D1">[details]</a></span>
dmesg without nouveau.noaccel=3D1

Happened to get 2 FX4500's for my PowerMac G5 11,2, but it didn't seem will=
ing
to cooperate.

Without nouveau.noaccel=3D1 in the kernel parameter, the system starts fine=
, but
X would only work with fbdev driver - as GPU locks up at early stages of
startup (dmesg attached above).

With nouveau.noaccel=3D1 in the kernel parameter, system starts fine withou=
t the
lock up message, but X will **still** only work with fbdev - using nouveau =
with
result in a looped output of the following message:

&quot;nouveau 0000:0a:00.0: DRM: 0x13DC: Parsing digital output script tabl=
e&quot;

And the system is inaccessible, this also appears to hang any `systemctl st=
op
lightdm` operation and even the `reboot` command itself.

---------------------------

Xorg-Server version: 1.18.4
Kernel version: 4.8.6
xf86-video-nouveau version: 1.0.12

---------------------------

I would happily donate one of my FX4500's to one who's willing to investiga=
te
this issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14790769250.Fd8b98B1.4485--

--===============0062461945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0062461945==--
