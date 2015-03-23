From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89730] NV50: LightDM GTK+ Greeter Background -
 inconsistent display
Date: Mon, 23 Mar 2015 17:06:18 +0000
Message-ID: <bug-89730-8800-PxvQ7afM2d@http.bugs.freedesktop.org/>
References: <bug-89730-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0748493426=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89730-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0748493426==
Content-Type: multipart/alternative; boundary="1427130378.E7e51e1.23664"; charset="UTF-8"


--1427130378.E7e51e1.23664
Date: Mon, 23 Mar 2015 17:06:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D89730

--- Comment #4 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #2)
> Here's a simple patch to try... *no* idea if it'll help. I assume not, but
> who knows. [Patch to xf86-video-nouveau.]
>=20
> diff --git a/src/nv50_accel.c b/src/nv50_accel.c
> index 5efbd19..ecad602 100644
> --- a/src/nv50_accel.c
> +++ b/src/nv50_accel.c
> @@ -207,6 +207,8 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
>  	PUSH_DATA (push, 0);
>  	BEGIN_NV04(push, NV50_3D(COLOR_MASK_COMMON), 1);
>  	PUSH_DATA (push, 1);
> +	BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
> +	PUSH_DATA (push, 0);
>=20=20
>  	BEGIN_NV04(push, NV50_3D(TIC_ADDRESS_HIGH), 3);
>  	PUSH_DATA (push, (pNv->scratch->offset + TIC_OFFSET) >> 32);


With this nouve git:
http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/

dunno whether it is proper position, but comparing with the
NV50_3D(ZETA_ENABLE) in src/nvc0_accel.c
your patch fit like this:

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index b27f67a..50b3a08 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
@@ -207,6 +207,8 @@ NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
     PUSH_DATA (push, 0);
     BEGIN_NV04(push, SUBC_3D(0x0f90), 1);
     PUSH_DATA (push, 1);
+    BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
+    PUSH_DATA (push, 0);

     BEGIN_NV04(push, NV50_3D(TIC_ADDRESS_HIGH), 3);
     PUSH_DATA (push, (pNv->scratch->offset + TIC_OFFSET) >> 32);


Nevertheless it still has no effect.

With regard to your question - GL, I tried the following:
options nouveau noaccel=3D1

and it has a positive effect - Greeter Background is displayed correctly.

After all this, if I understand it correctly:
1. Family : NV30 / Chipset: NV34 (NV34) / GeForce FX 5200=20
   because it has no problemos in this case - per se is not accelerated?
2. the same applies if the modesetting is used - not accelerated?
3. also there is no problemos if nouveau noaccel=3D1 is used - not accelera=
ted?

Perhaps this is flaw within the greeter application then?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1427130378.E7e51e1.23664
Date: Mon, 23 Mar 2015 17:06:18 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV50: LightDM GTK+ Greeter Background - inconsistent disp=
lay"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89730#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NV50: LightDM GTK+ Greeter Background - inconsistent disp=
lay"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89730">bug 89730<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D897=
30#c2">comment #2</a>)
<span class=3D"quote">&gt; Here's a simple patch to try... *no* idea if it'=
ll help. I assume not, but
&gt; who knows. [Patch to xf86-video-nouveau.]
&gt;=20
&gt; diff --git a/src/nv50_accel.c b/src/nv50_accel.c
&gt; index 5efbd19..ecad602 100644
&gt; --- a/src/nv50_accel.c
&gt; +++ b/src/nv50_accel.c
&gt; &#64;&#64; -207,6 +207,8 &#64;&#64; NVAccelInitNV50TCL(ScrnInfoPtr pSc=
rn)
&gt;  	PUSH_DATA (push, 0);
&gt;  	BEGIN_NV04(push, NV50_3D(COLOR_MASK_COMMON), 1);
&gt;  	PUSH_DATA (push, 1);
&gt; +	BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
&gt; +	PUSH_DATA (push, 0);
&gt;=20=20
&gt;  	BEGIN_NV04(push, NV50_3D(TIC_ADDRESS_HIGH), 3);
&gt;  	PUSH_DATA (push, (pNv-&gt;scratch-&gt;offset + TIC_OFFSET) &gt;&gt; =
32);</span >


With this nouve git:
<a href=3D"http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/">http://=
cgit.freedesktop.org/nouveau/xf86-video-nouveau/</a>

dunno whether it is proper position, but comparing with the
NV50_3D(ZETA_ENABLE) in src/nvc0_accel.c
your patch fit like this:

diff --git a/src/nv50_accel.c b/src/nv50_accel.c
index b27f67a..50b3a08 100644
--- a/src/nv50_accel.c
+++ b/src/nv50_accel.c
&#64;&#64; -207,6 +207,8 &#64;&#64; NVAccelInitNV50TCL(ScrnInfoPtr pScrn)
     PUSH_DATA (push, 0);
     BEGIN_NV04(push, SUBC_3D(0x0f90), 1);
     PUSH_DATA (push, 1);
+    BEGIN_NV04(push, NV50_3D(ZETA_ENABLE), 1);
+    PUSH_DATA (push, 0);

     BEGIN_NV04(push, NV50_3D(TIC_ADDRESS_HIGH), 3);
     PUSH_DATA (push, (pNv-&gt;scratch-&gt;offset + TIC_OFFSET) &gt;&gt; 32=
);


Nevertheless it still has no effect.

With regard to your question - GL, I tried the following:
options nouveau noaccel=3D1

and it has a positive effect - Greeter Background is displayed correctly.

After all this, if I understand it correctly:
1. Family : NV30 / Chipset: NV34 (NV34) / GeForce FX 5200=20
   because it has no problemos in this case - per se is not accelerated?
2. the same applies if the modesetting is used - not accelerated?
3. also there is no problemos if nouveau noaccel=3D1 is used - not accelera=
ted?

Perhaps this is flaw within the greeter application then?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427130378.E7e51e1.23664--

--===============0748493426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0748493426==--
