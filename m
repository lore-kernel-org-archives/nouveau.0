From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105525] New: Freeze when playing videos in WebKit
Date: Thu, 15 Mar 2018 16:43:49 +0000
Message-ID: <bug-105525-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0241563530=="
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


--===============0241563530==
Content-Type: multipart/alternative; boundary="15211322290.2ad9E.27587"
Content-Transfer-Encoding: 7bit


--15211322290.2ad9E.27587
Date: Thu, 15 Mar 2018 16:43:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105525

            Bug ID: 105525
           Summary: Freeze when playing videos in WebKit
           Product: Mesa
           Version: 17.3
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: link.dupont-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 138134
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D138134&action=3Dedit
Epiphany/WebKit logs

My Wayland desktop session freezes when I load a web video (for example,
YouTube) in a WebKitProcess Epiphany.

=3D=3D Steps to Reproduce =3D=3D

1. Log into a Wayland session
2. Launch Epiphany
3. Load a youtube.com video

=3D=3D Expected Results =3D=3D

The video plays.

=3D=3D Actual Results =3D=3D

The desktop freezes until I remotely connect to the computer over SSH and k=
ill
the WebKitProcess process rendering the content.

=3D=3D Notes =3D=3D

This can be avoided by running epiphany with WEBKIT_DISABLE_COMPOSITING_MOD=
E=3D1
set, which leads me to believe it is a nouveau bug (rather than a WebKit bu=
g).
I've attached logs with Epiphany output. These two lines are particularly
concerning:

> Mar 15 07:20:03 bant org.gnome.Epiphany.desktop[14459]: WebKitWebProcess:=
 pushbuf.c:727: nouveau_pushbuf_data: Assertion `kref' failed.
> Mar 15 07:20:16 bant org.gnome.Epiphany.desktop[14459]: nouveau: kernel r=
ejected pushbuf: Device or resource busy

=3D=3D=3D mesa version =3D=3D=3D
mesa-dri-drivers.i686                17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-dri-drivers.x86_64              17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-filesystem.i686                 17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-filesystem.x86_64               17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libEGL.x86_64                   17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libGL.x86_64                    17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libGLU.x86_64                   9.0.0-13.fc27              @fedora=20=
=20=20=20=20=20=20=20=20
mesa-libOpenCL.x86_64                17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libgbm.x86_64                   17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libglapi.i686                   17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libglapi.x86_64                 17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libwayland-egl.x86_64           17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libwayland-egl-devel.x86_64     17.3.6-1.fc27              @updates=20=
=20=20=20=20=20=20=20
mesa-libxatracker.x86_64             17.3.6-1.fc27              @updates=20

=3D=3D=3D NVIDIA card =3D=3D=3D
$ lspci | grep NV=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
01:00.0 VGA compatible controller: NVIDIA Corporation GK104M [GeForce GTX 7=
75M
Mac Edition] (rev a1)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15211322290.2ad9E.27587
Date: Thu, 15 Mar 2018 16:43:49 +0000
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
   title=3D"NEW - Freeze when playing videos in WebKit"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105525">105525</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Freeze when playing videos in WebKit
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.3
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
          <td>link.dupont&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D138134=
" name=3D"attach_138134" title=3D"Epiphany/WebKit logs">attachment 138134</=
a> <a href=3D"attachment.cgi?id=3D138134&amp;action=3Dedit" title=3D"Epipha=
ny/WebKit logs">[details]</a></span>
Epiphany/WebKit logs

My Wayland desktop session freezes when I load a web video (for example,
YouTube) in a WebKitProcess Epiphany.

=3D=3D Steps to Reproduce =3D=3D

1. Log into a Wayland session
2. Launch Epiphany
3. Load a youtube.com video

=3D=3D Expected Results =3D=3D

The video plays.

=3D=3D Actual Results =3D=3D

The desktop freezes until I remotely connect to the computer over SSH and k=
ill
the WebKitProcess process rendering the content.

=3D=3D Notes =3D=3D

This can be avoided by running epiphany with WEBKIT_DISABLE_COMPOSITING_MOD=
E=3D1
set, which leads me to believe it is a nouveau bug (rather than a WebKit bu=
g).
I've attached logs with Epiphany output. These two lines are particularly
concerning:

<span class=3D"quote">&gt; Mar 15 07:20:03 bant org.gnome.Epiphany.desktop[=
14459]: WebKitWebProcess: pushbuf.c:727: nouveau_pushbuf_data: Assertion `k=
ref' failed.
&gt; Mar 15 07:20:16 bant org.gnome.Epiphany.desktop[14459]: nouveau: kerne=
l rejected pushbuf: Device or resource busy</span >

=3D=3D=3D mesa version =3D=3D=3D
mesa-dri-drivers.i686                17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-dri-drivers.x86_64              17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-filesystem.i686                 17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-filesystem.x86_64               17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libEGL.x86_64                   17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libGL.x86_64                    17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libGLU.x86_64                   9.0.0-13.fc27              &#64;fedora=
=20=20=20=20=20=20=20=20=20
mesa-libOpenCL.x86_64                17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libgbm.x86_64                   17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libglapi.i686                   17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libglapi.x86_64                 17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libwayland-egl.x86_64           17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libwayland-egl-devel.x86_64     17.3.6-1.fc27              &#64;update=
s=20=20=20=20=20=20=20=20
mesa-libxatracker.x86_64             17.3.6-1.fc27              &#64;update=
s=20

=3D=3D=3D NVIDIA card =3D=3D=3D
$ lspci | grep NV=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
01:00.0 VGA compatible controller: NVIDIA Corporation GK104M [GeForce GTX 7=
75M
Mac Edition] (rev a1)</pre>
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

--15211322290.2ad9E.27587--

--===============0241563530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0241563530==--
