From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102349] nv4x crashing with plasmashell - gdb log
 included
Date: Thu, 27 Dec 2018 04:57:44 +0000
Message-ID: <bug-102349-8800-EoS0736u8y@http.bugs.freedesktop.org/>
References: <bug-102349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0610006867=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0610006867==
Content-Type: multipart/alternative; boundary="15458866641.c2a0114.9895"
Content-Transfer-Encoding: 7bit


--15458866641.c2a0114.9895
Date: Thu, 27 Dec 2018 04:57:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102349

--- Comment #14 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I believe the issue is mostly resolved by:

https://patchwork.freedesktop.org/patch/270609/

There's a lingering issue, which I don't think was truly being hit, but fix=
ed
by:

https://patchwork.freedesktop.org/patch/270610/

Of course when I went to test these patches with xonotic, I was immediately
confronted by the fact that we don't handle 3d transfers (which ~never used=
 to
happen before, but some recent improvements have made it a thing that happe=
ns a
lot more often). I quickly hacked around that with the below patch, but tha=
t's
obviously not generally acceptable.

diff --git a/src/gallium/auxiliary/util/u_transfer.c
b/src/gallium/auxiliary/util/u_transfer.c
index 3089bcb1f34..3550e1e26d3 100644
--- a/src/gallium/auxiliary/util/u_transfer.c
+++ b/src/gallium/auxiliary/util/u_transfer.c
@@ -56,11 +56,16 @@ void u_default_texture_subdata(struct pipe_context *pip=
e,
    /* texture_subdata implicitly discards the rewritten buffer range */
    usage |=3D PIPE_TRANSFER_DISCARD_RANGE;

+   for (int z =3D box->z; z < box->z + box->depth; z++) {
+      struct pipe_box t =3D *box;
+      t.z =3D z;
+      t.depth =3D 1;
+
    map =3D pipe->transfer_map(pipe,
                             resource,
                             level,
                             usage,
-                            box, &transfer);
+                            &t, &transfer);
    if (!map)
       return;

@@ -71,13 +76,14 @@ void u_default_texture_subdata(struct pipe_context *pip=
e,
                  0, 0, 0,
                  box->width,
                  box->height,
-                 box->depth,
+                 1,
                  src_data,
                  stride,       /* bytes */
                  layer_stride, /* bytes */
-                 0, 0, 0);
+                 0, 0, t.z);

    pipe_transfer_unmap(pipe, transfer);
+   }
 }

FWIW xonotic looks terrible on the nv34 -- all the colors are messed up, and
maybe some of the geometry too. But it's the same with 18.3.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15458866641.c2a0114.9895
Date: Thu, 27 Dec 2018 04:57:44 +0000
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
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349#c14">Comme=
nt # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x crashing with plasmashell - gdb log included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102349">bug 10234=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I believe the issue is mostly resolved by:

<a href=3D"https://patchwork.freedesktop.org/patch/270609/">https://patchwo=
rk.freedesktop.org/patch/270609/</a>

There's a lingering issue, which I don't think was truly being hit, but fix=
ed
by:

<a href=3D"https://patchwork.freedesktop.org/patch/270610/">https://patchwo=
rk.freedesktop.org/patch/270610/</a>

Of course when I went to test these patches with xonotic, I was immediately
confronted by the fact that we don't handle 3d transfers (which ~never used=
 to
happen before, but some recent improvements have made it a thing that happe=
ns a
lot more often). I quickly hacked around that with the below patch, but tha=
t's
obviously not generally acceptable.

diff --git a/src/gallium/auxiliary/util/u_transfer.c
b/src/gallium/auxiliary/util/u_transfer.c
index 3089bcb1f34..3550e1e26d3 100644
--- a/src/gallium/auxiliary/util/u_transfer.c
+++ b/src/gallium/auxiliary/util/u_transfer.c
&#64;&#64; -56,11 +56,16 &#64;&#64; void u_default_texture_subdata(struct p=
ipe_context *pipe,
    /* texture_subdata implicitly discards the rewritten buffer range */
    usage |=3D PIPE_TRANSFER_DISCARD_RANGE;

+   for (int z =3D box-&gt;z; z &lt; box-&gt;z + box-&gt;depth; z++) {
+      struct pipe_box t =3D *box;
+      t.z =3D z;
+      t.depth =3D 1;
+
    map =3D pipe-&gt;transfer_map(pipe,
                             resource,
                             level,
                             usage,
-                            box, &amp;transfer);
+                            &amp;t, &amp;transfer);
    if (!map)
       return;

&#64;&#64; -71,13 +76,14 &#64;&#64; void u_default_texture_subdata(struct p=
ipe_context *pipe,
                  0, 0, 0,
                  box-&gt;width,
                  box-&gt;height,
-                 box-&gt;depth,
+                 1,
                  src_data,
                  stride,       /* bytes */
                  layer_stride, /* bytes */
-                 0, 0, 0);
+                 0, 0, t.z);

    pipe_transfer_unmap(pipe, transfer);
+   }
 }

FWIW xonotic looks terrible on the nv34 -- all the colors are messed up, and
maybe some of the geometry too. But it's the same with 18.3.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15458866641.c2a0114.9895--

--===============0610006867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0610006867==--
