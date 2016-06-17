From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96565] New: Clive Barker's Jericho displays strange,
 vivid colors when motion blur enabled
Date: Fri, 17 Jun 2016 17:53:45 +0000
Message-ID: <bug-96565-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1222448083=="
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


--===============1222448083==
Content-Type: multipart/alternative; boundary="14661860251.2640898.5773";
 charset="UTF-8"


--14661860251.2640898.5773
Date: Fri, 17 Jun 2016 17:53:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96565

            Bug ID: 96565
           Summary: Clive Barker's Jericho displays strange,vivid colors
                    when motion blur enabled
           Product: Mesa
           Version: 11.2
          Hardware: Other
                OS: All
            Status: NEW
          Keywords: bisected, regression
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: gyebro69-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
                CC: imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org

Created attachment 124580
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D124580&action=3Dedit
screenshot

When motion blur effect is enabled in the game, the screen is filled with r=
ed,
yellow and green colors (both the menus and midgame).
The problem doesn't exist with the software renderer.

Bisecting revealed that the problem is present since

commit 7752bbc44e78e982de3cd4c34862adc38a338234
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Thu Dec 10 18:19:44 2015 -0500

    gk104/ir: simplify and fool-proof texbar algorithm

    With the current algorithm, we only look at tex uses. However there's a
    write-after-write hazard where we might decide to, on some path, not use
    a texture's output at all, but instead to write a different value to
    that register. However without the barrier, the texture might complete
    later and overwrite that value.

    This fixes Unreal Elemental demo on GK110/GK208, flightgear on GK10x,
    and likely other random-looking failures.

The game renders properly with the previous commit.

Trace (uncompressed 138M):
https://drive.google.com/open?id=3D0B-tTbLKBl-tOaVRvNmMwQW8zYlk

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV106
OpenGL core profile version string: 4.3 (Core Profile) Mesa 12.1.0-devel
(git-5a64549)
OpenGL core profile shading language version string: 4.30

Fedora 23
Libdrm 2.4.68+git
Linux kernel 4.7.0-rc3

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14661860251.2640898.5773
Date: Fri, 17 Jun 2016 17:53:45 +0000
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
   title=3D"NEW - Clive Barker's Jericho displays strange,vivid colors when=
 motion blur enabled"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96565">96565</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Clive Barker's Jericho displays strange,vivid colors when mot=
ion blur enabled
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>11.2
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
          <th>Keywords</th>
          <td>bisected, regression
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
        </tr>

        <tr>
          <th>CC</th>
          <td>imirkin&#64;alum.mit.edu
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D124580=
" name=3D"attach_124580" title=3D"screenshot">attachment 124580</a> <a href=
=3D"attachment.cgi?id=3D124580&amp;action=3Dedit" title=3D"screenshot">[det=
ails]</a></span>
screenshot

When motion blur effect is enabled in the game, the screen is filled with r=
ed,
yellow and green colors (both the menus and midgame).
The problem doesn't exist with the software renderer.

Bisecting revealed that the problem is present since

commit 7752bbc44e78e982de3cd4c34862adc38a338234
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Thu Dec 10 18:19:44 2015 -0500

    gk104/ir: simplify and fool-proof texbar algorithm

    With the current algorithm, we only look at tex uses. However there's a
    write-after-write hazard where we might decide to, on some path, not use
    a texture's output at all, but instead to write a different value to
    that register. However without the barrier, the texture might complete
    later and overwrite that value.

    This fixes Unreal Elemental demo on GK110/GK208, flightgear on GK10x,
    and likely other random-looking failures.

The game renders properly with the previous commit.

Trace (uncompressed 138M):
<a href=3D"https://drive.google.com/open?id=3D0B-tTbLKBl-tOaVRvNmMwQW8zYlk"=
>https://drive.google.com/open?id=3D0B-tTbLKBl-tOaVRvNmMwQW8zYlk</a>

OpenGL vendor string: nouveau
OpenGL renderer string: Gallium 0.4 on NV106
OpenGL core profile version string: 4.3 (Core Profile) Mesa 12.1.0-devel
(git-5a64549)
OpenGL core profile shading language version string: 4.30

Fedora 23
Libdrm 2.4.68+git
Linux kernel 4.7.0-rc3</pre>
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

--14661860251.2640898.5773--

--===============1222448083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1222448083==--
