From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: =?utf-8?q?=5BBug_97900=5D_New=3A_=5Bregression=5D_nouve?=
 =?utf-8?q?au=5Fscreen=2Ec=3A230=3A2=3A_error=3A__implicit_declaration_of_?=
 =?utf-8?b?ZnVuY3Rpb24g4oCYbm91dmVhdV9kcm1fZGVs4oCZ?=
Date: Fri, 23 Sep 2016 01:51:05 +0000
Message-ID: <bug-97900-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0340475923=="
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


--===============0340475923==
Content-Type: multipart/alternative; boundary="14745954650.1A48.718";
 charset="UTF-8"


--14745954650.1A48.718
Date: Fri, 23 Sep 2016 01:51:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97900

            Bug ID: 97900
           Summary: [regression] nouveau_screen.c:230:2: error: implicit
                    declaration of function =E2=80=98nouveau_drm_del=E2=80=
=99
           Product: Mesa
           Version: git
          Hardware: x86 (IA32)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: David.Ronis-BAnzPxqWUM23NexWsGEg3A@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I'm building git-master versions of X and mesa on an x86_64 box running
slackware.   I've been doing this for a long time.  My build fails with:

 CC     nouveau_screen.lo
nouveau_screen.c: In function =E2=80=98nouveau_init_screen2=E2=80=99:
nouveau_screen.c:105:8: error: implicit declaration of function
=E2=80=98nouveau_drm_new=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  ret =3D nouveau_drm_new(dri_screen->fd, &screen->drm);
        ^~~~~~~~~~~~~~~
nouveau_screen.c:111:8: error: implicit declaration of function
=E2=80=98nouveau_device_new=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
  ret =3D nouveau_device_new(&screen->drm->client, NV_DEVICE,
        ^~~~~~~~~~~~~~~~~~
nouveau_screen.c:111:39: error: dereferencing pointer to incomplete type
=E2=80=98struct nouveau_drm=E2=80=99
  ret =3D nouveau_device_new(&screen->drm->client, NV_DEVICE,
                                       ^~
nouveau_screen.c: In function =E2=80=98nouveau_destroy_screen=E2=80=99:
nouveau_screen.c:230:2: error: implicit declaration of function
=E2=80=98nouveau_drm_del=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  nouveau_drm_del(&screen->drm);
  ^~~~~~~~~~~~~~~

I;ve got the current git/master of xf86-video-nouveau installed.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14745954650.1A48.718
Date: Fri, 23 Sep 2016 01:51:05 +0000
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
   title=3D"NEW - [regression] nouveau_screen.c:230:2: error: implicit decl=
aration of function =E2=80=98nouveau_drm_del=E2=80=99"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97900">97900</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression] nouveau_screen.c:230:2: error: implicit declarat=
ion of function =E2=80=98nouveau_drm_del=E2=80=99
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
          <td>x86 (IA32)
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
          <td>major
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
          <td>David.Ronis&#64;McGill.CA
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I'm building git-master versions of X and mesa on an x86_64 bo=
x running
slackware.   I've been doing this for a long time.  My build fails with:

 CC     nouveau_screen.lo
nouveau_screen.c: In function =E2=80=98nouveau_init_screen2=E2=80=99:
nouveau_screen.c:105:8: error: implicit declaration of function
=E2=80=98nouveau_drm_new=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  ret =3D nouveau_drm_new(dri_screen-&gt;fd, &amp;screen-&gt;drm);
        ^~~~~~~~~~~~~~~
nouveau_screen.c:111:8: error: implicit declaration of function
=E2=80=98nouveau_device_new=E2=80=99 [-Werror=3Dimplicit-function-declarati=
on]
  ret =3D nouveau_device_new(&amp;screen-&gt;drm-&gt;client, NV_DEVICE,
        ^~~~~~~~~~~~~~~~~~
nouveau_screen.c:111:39: error: dereferencing pointer to incomplete type
=E2=80=98struct nouveau_drm=E2=80=99
  ret =3D nouveau_device_new(&amp;screen-&gt;drm-&gt;client, NV_DEVICE,
                                       ^~
nouveau_screen.c: In function =E2=80=98nouveau_destroy_screen=E2=80=99:
nouveau_screen.c:230:2: error: implicit declaration of function
=E2=80=98nouveau_drm_del=E2=80=99 [-Werror=3Dimplicit-function-declaration]
  nouveau_drm_del(&amp;screen-&gt;drm);
  ^~~~~~~~~~~~~~~

I;ve got the current git/master of xf86-video-nouveau installed.</pre>
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

--14745954650.1A48.718--

--===============0340475923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0340475923==--
