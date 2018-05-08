From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103351] Nouveau fails when booting with a screen
 connected to displayport since 13a86519202c5d119d83640d6f781f3181205d2c
Date: Tue, 08 May 2018 18:23:29 +0000
Message-ID: <bug-103351-8800-S72obDPytU@http.bugs.freedesktop.org/>
References: <bug-103351-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0161409689=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103351-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0161409689==
Content-Type: multipart/alternative; boundary="15258038090.31b6bfc.18754"
Content-Transfer-Encoding: 7bit


--15258038090.31b6bfc.18754
Date: Tue, 8 May 2018 18:23:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103351

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Just something I noticed... does this help? (Obviously without a revert
applied.)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
index a23c5f315221..ff94c6cb9a29 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
@@ -26,7 +26,7 @@

 static const struct nvkm_i2c_func
 gm200_i2c =3D {
-       .pad_x_new =3D gf119_i2c_pad_x_new,
+       .pad_x_new =3D gm200_i2c_pad_x_new,
        .pad_s_new =3D gm200_i2c_pad_s_new,
        .aux =3D 8,
        .aux_stat =3D gk104_aux_stat,

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15258038090.31b6bfc.18754
Date: Tue, 8 May 2018 18:23:29 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails when booting with a screen connected to dis=
playport since 13a86519202c5d119d83640d6f781f3181205d2c"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103351">bug 10335=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Just something I noticed... does this help? (Obviously without=
 a revert
applied.)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
index a23c5f315221..ff94c6cb9a29 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
&#64;&#64; -26,7 +26,7 &#64;&#64;

 static const struct nvkm_i2c_func
 gm200_i2c =3D {
-       .pad_x_new =3D gf119_i2c_pad_x_new,
+       .pad_x_new =3D gm200_i2c_pad_x_new,
        .pad_s_new =3D gm200_i2c_pad_s_new,
        .aux =3D 8,
        .aux_stat =3D gk104_aux_stat,</pre>
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

--15258038090.31b6bfc.18754--

--===============0161409689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0161409689==--
