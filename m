From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102860] New: Nvidia 940MX (NV118,
 GM108) is reported as a NV117, GM107
Date: Tue, 19 Sep 2017 13:51:43 +0000
Message-ID: <bug-102860-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0795374943=="
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


--===============0795374943==
Content-Type: multipart/alternative; boundary="15058291030.Db56B63cB.29845";
 charset="UTF-8"


--15058291030.Db56B63cB.29845
Date: Tue, 19 Sep 2017 13:51:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102860

            Bug ID: 102860
           Summary: Nvidia 940MX (NV118, GM108) is reported as a NV117,
                    GM107
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: minor
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: bojescu.mihai-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 134334
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D134334&action=3Dedit
Kernel log

The Nvidia 940MX video card is reported wrong (according to the CodeNames p=
age
and other sources such as videocardz). Should be reported as NV118 (GM108),=
 is
reported as NV117 (GM107). GlxGears also reports it as NV117. GlxInfo also
reports it as NV117. Not sure if this brings other problems along.

michael@Michael:~$ DRI_PRIME=3D1 glxgears -info
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   =3D Gallium 0.4 on NV117
GL_VERSION    =3D 3.0 Mesa 13.0.6
GL_VENDOR     =3D nouveau

michael@Michael:~$ DRI_PRIME=3D1 glxinfo | grep render
direct rendering: Yes
    GLX_MESA_multithread_makecurrent, GLX_MESA_query_renderer,=20
    GLX_MESA_multithread_makecurrent, GLX_MESA_query_renderer,=20
Extended renderer info (GLX_MESA_query_renderer):
OpenGL renderer string: Gallium 0.4 on NV117
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth,=20
    GL_MESA_texture_signed_rgba, GL_NV_conditional_render, GL_NV_depth_clam=
p,=20
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth,=20
    GL_NV_conditional_render, GL_NV_depth_clamp, GL_NV_fog_distance,=20
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap,

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15058291030.Db56B63cB.29845
Date: Tue, 19 Sep 2017 13:51:43 +0000
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
   title=3D"NEW - Nvidia 940MX (NV118, GM108) is reported as a NV117, GM107"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102860">102860</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nvidia 940MX (NV118, GM108) is reported as a NV117, GM107
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
          <td>minor
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
          <td>bojescu.mihai&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D134334=
" name=3D"attach_134334" title=3D"Kernel log">attachment 134334</a> <a href=
=3D"attachment.cgi?id=3D134334&amp;action=3Dedit" title=3D"Kernel log">[det=
ails]</a></span>
Kernel log

The Nvidia 940MX video card is reported wrong (according to the CodeNames p=
age
and other sources such as videocardz). Should be reported as NV118 (GM108),=
 is
reported as NV117 (GM107). GlxGears also reports it as NV117. GlxInfo also
reports it as NV117. Not sure if this brings other problems along.

michael&#64;Michael:~$ DRI_PRIME=3D1 glxgears -info
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
GL_RENDERER   =3D Gallium 0.4 on NV117
GL_VERSION    =3D 3.0 Mesa 13.0.6
GL_VENDOR     =3D nouveau

michael&#64;Michael:~$ DRI_PRIME=3D1 glxinfo | grep render
direct rendering: Yes
    GLX_MESA_multithread_makecurrent, GLX_MESA_query_renderer,=20
    GLX_MESA_multithread_makecurrent, GLX_MESA_query_renderer,=20
Extended renderer info (GLX_MESA_query_renderer):
OpenGL renderer string: Gallium 0.4 on NV117
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth,=20
    GL_MESA_texture_signed_rgba, GL_NV_conditional_render, GL_NV_depth_clam=
p,=20
    GL_ARB_conditional_render_inverted, GL_ARB_conservative_depth,=20
    GL_NV_conditional_render, GL_NV_depth_clamp, GL_NV_fog_distance,=20
    GL_OES_element_index_uint, GL_OES_fbo_render_mipmap,</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15058291030.Db56B63cB.29845--

--===============0795374943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0795374943==--
