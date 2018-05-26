From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106662] New: nouveau DPMS poblem with DRI3 (GM107)
Date: Sat, 26 May 2018 06:27:24 +0000
Message-ID: <bug-106662-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0998074040=="
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


--===============0998074040==
Content-Type: multipart/alternative; boundary="15273160440.8fdF.4837"
Content-Transfer-Encoding: 7bit


--15273160440.8fdF.4837
Date: Sat, 26 May 2018 06:27:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106662

            Bug ID: 106662
           Summary: nouveau DPMS poblem with DRI3 (GM107)
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: roman.elshin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 139785
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139785&action=3Dedit
Xorg.log

There are ubuntu mate-16.04 with mainline 4.16.7 kernel and oibaf ppa, opti=
on
"power off monitor when system idle" in DE settings enabled and GLMatrix
screensaver are used.
By default dpms works, but adding
/usr/share/X11/xorg.conf.d/20-nouveau.conf with content :

Section "Module"
    Load "dri3"
EndSection

Section "Device"
    Identifier "Device0"
    Driver "nouveau"

    Option "DRI" "3"
EndSection

cause a issue: after monitor wake up there are only one frame from screensa=
ver
and mouse cursor over it (mouse work). System does not hang - is possible to
switch to virtual console, DE seems to think that all rigth (after some mou=
se
click there new folders appeares on a desktop) and X can be restarted witho=
ut
problem.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15273160440.8fdF.4837
Date: Sat, 26 May 2018 06:27:24 +0000
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
   title=3D"NEW - nouveau DPMS poblem with DRI3 (GM107)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106662">106662</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau DPMS poblem with DRI3 (GM107)
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
          <td>roman.elshin&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139785=
" name=3D"attach_139785" title=3D"Xorg.log">attachment 139785</a> <a href=
=3D"attachment.cgi?id=3D139785&amp;action=3Dedit" title=3D"Xorg.log">[detai=
ls]</a></span>
Xorg.log

There are ubuntu mate-16.04 with mainline 4.16.7 kernel and oibaf ppa, opti=
on
&quot;power off monitor when system idle&quot; in DE settings enabled and G=
LMatrix
screensaver are used.
By default dpms works, but adding
/usr/share/X11/xorg.conf.d/20-nouveau.conf with content :

Section &quot;Module&quot;
    Load &quot;dri3&quot;
EndSection

Section &quot;Device&quot;
    Identifier &quot;Device0&quot;
    Driver &quot;nouveau&quot;

    Option &quot;DRI&quot; &quot;3&quot;
EndSection

cause a issue: after monitor wake up there are only one frame from screensa=
ver
and mouse cursor over it (mouse work). System does not hang - is possible to
switch to virtual console, DE seems to think that all rigth (after some mou=
se
click there new folders appeares on a desktop) and X can be restarted witho=
ut
problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15273160440.8fdF.4837--

--===============0998074040==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0998074040==--
