From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96391] New: Payday: The Heist has rendering issues
 when anti-aliasing enabled
Date: Sun, 05 Jun 2016 16:52:52 +0000
Message-ID: <bug-96391-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0896093227=="
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


--===============0896093227==
Content-Type: multipart/alternative; boundary="14651455710.A7678bC.2462";
 charset="UTF-8"


--14651455710.A7678bC.2462
Date: Sun, 5 Jun 2016 16:52:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96391

            Bug ID: 96391
           Summary: Payday: The Heist has rendering issues when
                    anti-aliasing enabled
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 124335
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124335&action=3Dedit
screenshot, comparison (nouveau vs. nvidia, AA enabled)

When I launch Payday: The Heist in Wine, everything looks fine in the menus.
The problem arises when I start a mission: the loading screen becomes way t=
oo
dark so hardly anything can be seen. When the actual mission is loaded the
screen looks as if it was rendered with some special effect applied.=20
I'm attaching a screenshot here to demonstrate what the game looks like with
nouveau and nvidia 340.xx

If I disable in-game anti-aliasing then the game renders properly, except f=
or
the loading screen which still remains so dark (maybe the game always uses =
AA
on the loading screen, or it is a different issue).

If I start the game with the software renderer (LIBGL_ALWAYS_SOFTWARE=3D1) =
then
both the loading screen and the actual game are rendered properly.

Trace created with apitrace (uncompressed 185M):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOOG9fNklaYzZUekE

Fedora 23 32-bit
Linux kernel: 4.6
Libdrm 2.4.68
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 12.1.0-devel
(git-fd6bbc2)
OpenGL core profile shading language version string: 3.30

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14651455710.A7678bC.2462
Date: Sun, 5 Jun 2016 16:52:51 +0000
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
   title=3D"NEW - Payday: The Heist has rendering issues when anti-aliasing=
 enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96391">96391</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Payday: The Heist has rendering issues when anti-aliasing ena=
bled
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
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
          <td>gyebro69&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124335=
" name=3D"attach_124335" title=3D"screenshot, comparison (nouveau vs. nvidi=
a, AA enabled)">attachment 124335</a> <a href=3D"attachment.cgi?id=3D124335=
&amp;action=3Dedit" title=3D"screenshot, comparison (nouveau vs. nvidia, AA=
 enabled)">[details]</a></span>
screenshot, comparison (nouveau vs. nvidia, AA enabled)

When I launch Payday: The Heist in Wine, everything looks fine in the menus.
The problem arises when I start a mission: the loading screen becomes way t=
oo
dark so hardly anything can be seen. When the actual mission is loaded the
screen looks as if it was rendered with some special effect applied.=20
I'm attaching a screenshot here to demonstrate what the game looks like with
nouveau and nvidia 340.xx

If I disable in-game anti-aliasing then the game renders properly, except f=
or
the loading screen which still remains so dark (maybe the game always uses =
AA
on the loading screen, or it is a different issue).

If I start the game with the software renderer (LIBGL_ALWAYS_SOFTWARE=3D1) =
then
both the loading screen and the actual game are rendered properly.

Trace created with apitrace (uncompressed 185M):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOOG9fNklaYzZUekE"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOOG9fNklaYzZUekE</a>

Fedora 23 32-bit
Linux kernel: 4.6
Libdrm 2.4.68
OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV92
OpenGL core profile version string: 3.3 (Core Profile) Mesa 12.1.0-devel
(git-fd6bbc2)
OpenGL core profile shading language version string: 3.30</pre>
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

--14651455710.A7678bC.2462--

--===============0896093227==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0896093227==--
