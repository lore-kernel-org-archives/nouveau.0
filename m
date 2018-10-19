From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 108500] New: Crash when creating a depth buffer on
 GeForce 320M
Date: Fri, 19 Oct 2018 16:59:49 +0000
Message-ID: <bug-108500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0531085764=="
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


--===============0531085764==
Content-Type: multipart/alternative; boundary="15399683890.63ED7C7.25912"
Content-Transfer-Encoding: 7bit


--15399683890.63ED7C7.25912
Date: Fri, 19 Oct 2018 16:59:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108500

            Bug ID: 108500
           Summary: Crash when creating a depth buffer on GeForce 320M
           Product: Mesa
           Version: 18.2
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: timo.wiren-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 142101
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D142101&action=3Dedit
glxinfo

Every OpenGL application that wants to use a depth buffer always crashes,
including glxgears:

glxgears: dri2.c:906: dri2_allocate_textures: Assertion `*zsbuf' failed.

I debugged the assertion with gdb:

templ structure contents passed to resource_create():
$2 =3D {reference =3D {count =3D 0}, width0 =3D 300, height0 =3D 300, depth=
0 =3D 1,
array_size =3D 1, format =3D PIPE_FORMAT_Z24X8_UNORM,
  target =3D PIPE_TEXTURE_2D, last_level =3D 0, nr_samples =3D 0, nr_storag=
e_samples
=3D 0, usage =3D 0, bind =3D 1, flags =3D 0,
  next =3D 0x0, screen =3D 0x0}

In nv50_miptree_create() in gallium/drivers/nouveau/nv50/nv50_miptree.c:389
the call to nouveau_bo_new() returns -22 that causes it to return NULL.=20

MESA_DEBUG=3D1 glxgears prints the following before segfaulting:
Mesa: User error: GL_OUT_OF_MEMORY in Resizing framebuffer

Computer: MacBook Pro 2010 (NVIDIA GeForce 320M "MCP89")
Resolution: 1280x800
OS: Lubuntu 18.10
Mesa: 18.2.2, but happens also with the versions that come with Lubuntu 16.=
04
and 18.04

I can compile and run mesa from sources, if it helps debugging.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15399683890.63ED7C7.25912
Date: Fri, 19 Oct 2018 16:59:49 +0000
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
   title=3D"NEW - Crash when creating a depth buffer on GeForce 320M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108500">108500</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash when creating a depth buffer on GeForce 320M
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.2
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
          <td>timo.wiren&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D142101=
" name=3D"attach_142101" title=3D"glxinfo">attachment 142101</a> <a href=3D=
"attachment.cgi?id=3D142101&amp;action=3Dedit" title=3D"glxinfo">[details]<=
/a></span>
glxinfo

Every OpenGL application that wants to use a depth buffer always crashes,
including glxgears:

glxgears: dri2.c:906: dri2_allocate_textures: Assertion `*zsbuf' failed.

I debugged the assertion with gdb:

templ structure contents passed to resource_create():
$2 =3D {reference =3D {count =3D 0}, width0 =3D 300, height0 =3D 300, depth=
0 =3D 1,
array_size =3D 1, format =3D PIPE_FORMAT_Z24X8_UNORM,
  target =3D PIPE_TEXTURE_2D, last_level =3D 0, nr_samples =3D 0, nr_storag=
e_samples
=3D 0, usage =3D 0, bind =3D 1, flags =3D 0,
  next =3D 0x0, screen =3D 0x0}

In nv50_miptree_create() in gallium/drivers/nouveau/nv50/nv50_miptree.c:389
the call to nouveau_bo_new() returns -22 that causes it to return NULL.=20

MESA_DEBUG=3D1 glxgears prints the following before segfaulting:
Mesa: User error: GL_OUT_OF_MEMORY in Resizing framebuffer

Computer: MacBook Pro 2010 (NVIDIA GeForce 320M &quot;MCP89&quot;)
Resolution: 1280x800
OS: Lubuntu 18.10
Mesa: 18.2.2, but happens also with the versions that come with Lubuntu 16.=
04
and 18.04

I can compile and run mesa from sources, if it helps debugging.</pre>
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

--15399683890.63ED7C7.25912--

--===============0531085764==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0531085764==--
