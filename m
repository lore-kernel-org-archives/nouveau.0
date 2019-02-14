From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109631] New: Moving gbm bo from GART to VRAM does
 not wait for rendering
Date: Thu, 14 Feb 2019 14:16:54 +0000
Message-ID: <bug-109631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1423503788=="
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


--===============1423503788==
Content-Type: multipart/alternative; boundary="15501538141.8E4A.15459"
Content-Transfer-Encoding: 7bit


--15501538141.8E4A.15459
Date: Thu, 14 Feb 2019 14:16:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109631

            Bug ID: 109631
           Summary: Moving gbm bo from GART to VRAM does not wait for
                    rendering
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: vincent.vanlaer-AgBVmzD5pcezQB+pC5nmwQ@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

A way to demonstrate this is with the following situation. This assumes that
one has opened DRM and EGL devices.

- create a gbm surface with gbm_surface_create and usage GBM_BO_USE_LINEAR
- create an EGLSurface from the gbm surface with
eglCreatePlatformWindowSurfaceEXT
- render something to it using GLES
- get the resulting buffer using gbm_bo_lock_front_buffer
- attach it to the hardware cursor using drmModeSetCursor
- the cursor is not displayed

During these steps the following things happen in the DRM driver:
- when the surface is made current using eglMakeCurrent a new bo is created=
 in
NOUVEAU_GBM_DOMAIN_GART (due to GBM_BO_USE_LINEAR)
- the rendering operations get queued (and may be flushed with glFlush(), i=
n my
specific case this didn't matter)
- when the bo is attached to the cursor plane, it is moved to
NOUVEAU_GBM_DOMAIN_VRAM. If the rendering operations haven't finished at th=
is
point, the copied buffer is empty.

Note that since this is a timing issue it might not be reproducible in all
situations.=20
This was tested on different GPUs (GTX 1080 and GT 445M) with rootston (wlr=
oots
example wayland compositor: https://github.com/swaywm/wlroots , git commit
b2f56ad4) running weston-terminal (this makes the issue appear more frequen=
tly)

Probably the driver should wait for pending rendering operations on the sur=
face
before moving it around. Another possibility for the scenario listed above =
is
to let the bo start in VRAM, so no moves are necessary. In order to prevent
other setups from breaking this would then only be done if GBM_BO_USE_SCANO=
UT
was set on creation. A workaround is to add glFinish() in the application
before calling drmModeSetCursor.

Kernel version: 4.20.6
Mesa version: 18.3.3

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15501538141.8E4A.15459
Date: Thu, 14 Feb 2019 14:16:54 +0000
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
   title=3D"NEW - Moving gbm bo from GART to VRAM does not wait for renderi=
ng"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109631">109631</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Moving gbm bo from GART to VRAM does not wait for rendering
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
          <td>vincent.vanlaer&#64;skynet.be
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>A way to demonstrate this is with the following situation. Thi=
s assumes that
one has opened DRM and EGL devices.

- create a gbm surface with gbm_surface_create and usage GBM_BO_USE_LINEAR
- create an EGLSurface from the gbm surface with
eglCreatePlatformWindowSurfaceEXT
- render something to it using GLES
- get the resulting buffer using gbm_bo_lock_front_buffer
- attach it to the hardware cursor using drmModeSetCursor
- the cursor is not displayed

During these steps the following things happen in the DRM driver:
- when the surface is made current using eglMakeCurrent a new bo is created=
 in
NOUVEAU_GBM_DOMAIN_GART (due to GBM_BO_USE_LINEAR)
- the rendering operations get queued (and may be flushed with glFlush(), i=
n my
specific case this didn't matter)
- when the bo is attached to the cursor plane, it is moved to
NOUVEAU_GBM_DOMAIN_VRAM. If the rendering operations haven't finished at th=
is
point, the copied buffer is empty.

Note that since this is a timing issue it might not be reproducible in all
situations.=20
This was tested on different GPUs (GTX 1080 and GT 445M) with rootston (wlr=
oots
example wayland compositor: <a href=3D"https://github.com/swaywm/wlroots">h=
ttps://github.com/swaywm/wlroots</a> , git commit
b2f56ad4) running weston-terminal (this makes the issue appear more frequen=
tly)

Probably the driver should wait for pending rendering operations on the sur=
face
before moving it around. Another possibility for the scenario listed above =
is
to let the bo start in VRAM, so no moves are necessary. In order to prevent
other setups from breaking this would then only be done if GBM_BO_USE_SCANO=
UT
was set on creation. A workaround is to add glFinish() in the application
before calling drmModeSetCursor.

Kernel version: 4.20.6
Mesa version: 18.3.3</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15501538141.8E4A.15459--

--===============1423503788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1423503788==--
