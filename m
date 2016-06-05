From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96388] New: This War of Mine (Wine) has rendering
 issues (screen filled with black rectangles)
Date: Sun, 05 Jun 2016 14:34:42 +0000
Message-ID: <bug-96388-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1981157170=="
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


--===============1981157170==
Content-Type: multipart/alternative; boundary="14651372820.d3C8.30858";
 charset="UTF-8"


--14651372820.d3C8.30858
Date: Sun, 5 Jun 2016 14:34:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96388

            Bug ID: 96388
           Summary: This War of Mine (Wine) has rendering issues (screen
                    filled with black rectangles)
           Product: Mesa
           Version: git
          Hardware: All
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 124329
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124329&action=3Dedit
screenshot

I'm running the game This War of Mine in Wine 1.9.11 and the game has the
following problem: when I get in the game lots of objects are hidden behind
black boxes (see attached screenshot).
The problem doesn't occur when using the software renderer:
LIBGL_ALWAYS_SOFTWARE=3D1

Trace file created with apitrace (uncompressed 247M):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOYzhpS3ZOZTNGOTg

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

--14651372820.d3C8.30858
Date: Sun, 5 Jun 2016 14:34:42 +0000
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
   title=3D"NEW - This War of Mine (Wine) has rendering issues (screen fill=
ed with black rectangles)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96388">96388</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>This War of Mine (Wine) has rendering issues (screen filled w=
ith black rectangles)
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
          <td>All
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124329=
" name=3D"attach_124329" title=3D"screenshot">attachment 124329</a> <a href=
=3D"attachment.cgi?id=3D124329&amp;action=3Dedit" title=3D"screenshot">[det=
ails]</a></span>
screenshot

I'm running the game This War of Mine in Wine 1.9.11 and the game has the
following problem: when I get in the game lots of objects are hidden behind
black boxes (see attached screenshot).
The problem doesn't occur when using the software renderer:
LIBGL_ALWAYS_SOFTWARE=3D1

Trace file created with apitrace (uncompressed 247M):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOYzhpS3ZOZTNGOTg"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOYzhpS3ZOZTNGOTg</a>

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

--14651372820.d3C8.30858--

--===============1981157170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1981157170==--
