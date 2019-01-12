From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109330] New: GL_ALPHA_BITS set to non-zero with
 EGL_PLATFORM_GBM_MESA
Date: Sat, 12 Jan 2019 13:59:45 +0000
Message-ID: <bug-109330-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0119796607=="
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


--===============0119796607==
Content-Type: multipart/alternative; boundary="15473015860.7C5a6cc.15896"
Content-Transfer-Encoding: 7bit


--15473015860.7C5a6cc.15896
Date: Sat, 12 Jan 2019 13:59:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109330

            Bug ID: 109330
           Summary: GL_ALPHA_BITS set to non-zero with
                    EGL_PLATFORM_GBM_MESA
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: contact-sV0wSBM+kKVWj0EZb7rXcA@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

When creating an EGL context with EGL_PLATFORM_GBM_MESA and EGL_ALPHA_SIZE=
=3D1,
Nouveau produces completely transparent images when using glReadPixels. Note
that my code works with other drivers (i915, amdgpu), only Nouveau is affec=
ted.

How to reproduce:

1. Create an EGL context with these attribs:

static const EGLint config_attribs[] =3D {
        EGL_RED_SIZE, 1,
        EGL_GREEN_SIZE, 1,
        EGL_BLUE_SIZE, 1,
        EGL_ALPHA_SIZE, 1,
        EGL_NONE,
};

Set platform to EGL_PLATFORM_GBM_MESA and visual to GBM_FORMAT_ARGB8888.

2. Try to get the alpha size:

eglGetConfigAttrib(EGL_ALPHA_SIZE)
glGetIntegerv(GL_ALPHA_BITS)

Both return 8, meaning an alpha channel is present.

3. Try to read pixels with glReadPixels and GL_BGRA_EXT. The resulting image
has an alpha channel which sets the pixels to be completely transparent.
Editing the image with gimp reveals that inverting the alpha channel makes =
the
image correct.

Software is wlroots [1] with grim [2]. To reproduce, compile both, start
rootston, run grim. Let me know if you need more info.

[1]: https://github.com/swaywm/wlroots
[2]: https://github.com/emersion/grim

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15473015860.7C5a6cc.15896
Date: Sat, 12 Jan 2019 13:59:46 +0000
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
   title=3D"NEW - GL_ALPHA_BITS set to non-zero with EGL_PLATFORM_GBM_MESA"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109330">109330</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GL_ALPHA_BITS set to non-zero with EGL_PLATFORM_GBM_MESA
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
          <td>contact&#64;emersion.fr
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>When creating an EGL context with EGL_PLATFORM_GBM_MESA and EG=
L_ALPHA_SIZE=3D1,
Nouveau produces completely transparent images when using glReadPixels. Note
that my code works with other drivers (i915, amdgpu), only Nouveau is affec=
ted.

How to reproduce:

1. Create an EGL context with these attribs:

static const EGLint config_attribs[] =3D {
        EGL_RED_SIZE, 1,
        EGL_GREEN_SIZE, 1,
        EGL_BLUE_SIZE, 1,
        EGL_ALPHA_SIZE, 1,
        EGL_NONE,
};

Set platform to EGL_PLATFORM_GBM_MESA and visual to GBM_FORMAT_ARGB8888.

2. Try to get the alpha size:

eglGetConfigAttrib(EGL_ALPHA_SIZE)
glGetIntegerv(GL_ALPHA_BITS)

Both return 8, meaning an alpha channel is present.

3. Try to read pixels with glReadPixels and GL_BGRA_EXT. The resulting image
has an alpha channel which sets the pixels to be completely transparent.
Editing the image with gimp reveals that inverting the alpha channel makes =
the
image correct.

Software is wlroots [1] with grim [2]. To reproduce, compile both, start
rootston, run grim. Let me know if you need more info.

[1]: <a href=3D"https://github.com/swaywm/wlroots">https://github.com/swayw=
m/wlroots</a>
[2]: <a href=3D"https://github.com/emersion/grim">https://github.com/emersi=
on/grim</a></pre>
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

--15473015860.7C5a6cc.15896--

--===============0119796607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0119796607==--
