From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101199] New: nouveau_screen.c: undefined reference
 to `nouveau_drm_del'
Date: Fri, 26 May 2017 12:38:28 +0000
Message-ID: <bug-101199-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1952837224=="
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


--===============1952837224==
Content-Type: multipart/alternative; boundary="14958023080.fAC6.23948";
 charset="UTF-8"


--14958023080.fAC6.23948
Date: Fri, 26 May 2017 12:38:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101199

            Bug ID: 101199
           Summary: nouveau_screen.c: undefined reference to
                    `nouveau_drm_del'
           Product: Mesa
           Version: 17.1
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: andrewponomarenko-o+MxOtu4lMCHXe+LvDLADg@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

The build of mesa 17.1.1 has failed with error:

nouveau_screen.c:230: undefined reference to `nouveau_drm_del'
nouveau/.libs/libnouveau_dri.a(nouveau_screen.o): In function
`nouveau_init_screen2':
nouveau/nouveau_screen.c:105: undefined reference to `nouveau_drm_new'
nouveau/nouveau_screen.c:111: undefined reference to `nouveau_device_new'

The library is configured with the following parameters:

./configure --enable-shared --enable-glx --disable-osmesa --enable-debug
--enable-gles2 --enable-gles1 --with-llvm-prefix=3D/path/to/LLVM-3.8.1/
PKG_CONFIG_PATH=3D'/path/to/libdrm/2.4.80/lib/pkgconfig'

GCC version: 4.9.2

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14958023080.fAC6.23948
Date: Fri, 26 May 2017 12:38:28 +0000
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
   title=3D"NEW - nouveau_screen.c: undefined reference to `nouveau_drm_del=
'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101199">101199</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau_screen.c: undefined reference to `nouveau_drm_del'
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>17.1
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
          <td>andrewponomarenko&#64;yandex.ru
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The build of mesa 17.1.1 has failed with error:

nouveau_screen.c:230: undefined reference to `nouveau_drm_del'
nouveau/.libs/libnouveau_dri.a(nouveau_screen.o): In function
`nouveau_init_screen2':
nouveau/nouveau_screen.c:105: undefined reference to `nouveau_drm_new'
nouveau/nouveau_screen.c:111: undefined reference to `nouveau_device_new'

The library is configured with the following parameters:

./configure --enable-shared --enable-glx --disable-osmesa --enable-debug
--enable-gles2 --enable-gles1 --with-llvm-prefix=3D/path/to/LLVM-3.8.1/
PKG_CONFIG_PATH=3D'/path/to/libdrm/2.4.80/lib/pkgconfig'

GCC version: 4.9.2</pre>
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

--14958023080.fAC6.23948--

--===============1952837224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1952837224==--
