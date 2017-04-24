From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100780] New: alt-tab crash gnome-shell
Date: Mon, 24 Apr 2017 21:21:47 +0000
Message-ID: <bug-100780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1879622483=="
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


--===============1879622483==
Content-Type: multipart/alternative; boundary="14930689070.2a59B0c21.6017";
 charset="UTF-8"


--14930689070.2a59B0c21.6017
Date: Mon, 24 Apr 2017 21:21:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100780

            Bug ID: 100780
           Summary: alt-tab crash gnome-shell
           Product: Mesa
           Version: 17.0
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: askstack-/E1597aS9LQAvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 131006
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D131006&action=3Dedit
log

alt-tab crash gnome-shell in F26, also in F25.=20


mesa-libglapi-17.0.2-1.fc26.x86_64
mesa-libxatracker-17.0.2-1.fc26.x86_64
mesa-libwayland-egl-17.0.2-1.fc26.x86_64
mesa-libGL-17.0.2-1.fc26.x86_64
mesa-dri-drivers-17.0.2-1.fc26.x86_64
mesa-libEGL-17.0.2-1.fc26.x86_64
mesa-filesystem-17.0.2-1.fc26.x86_64
mesa-libgbm-17.0.2-1.fc26.x86_64

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14930689070.2a59B0c21.6017
Date: Mon, 24 Apr 2017 21:21:47 +0000
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
   title=3D"NEW - alt-tab crash gnome-shell"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100780">100780</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>alt-tab crash gnome-shell
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.0
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
          <td>askstack&#64;yahoo.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D131006=
" name=3D"attach_131006" title=3D"log">attachment 131006</a> <a href=3D"att=
achment.cgi?id=3D131006&amp;action=3Dedit" title=3D"log">[details]</a></spa=
n>
log

alt-tab crash gnome-shell in F26, also in F25.=20


mesa-libglapi-17.0.2-1.fc26.x86_64
mesa-libxatracker-17.0.2-1.fc26.x86_64
mesa-libwayland-egl-17.0.2-1.fc26.x86_64
mesa-libGL-17.0.2-1.fc26.x86_64
mesa-dri-drivers-17.0.2-1.fc26.x86_64
mesa-libEGL-17.0.2-1.fc26.x86_64
mesa-filesystem-17.0.2-1.fc26.x86_64
mesa-libgbm-17.0.2-1.fc26.x86_64</pre>
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

--14930689070.2a59B0c21.6017--

--===============1879622483==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1879622483==--
