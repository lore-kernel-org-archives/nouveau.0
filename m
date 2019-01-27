From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] update known chipsets list
Date: Sun, 27 Jan 2019 10:56:08 -0500
Message-ID: <CA+iOQUFu7w1_XhCN+5ZHqsLa0LB+m2QupY_r5tmJk6j=vunNtw@mail.gmail.com>
References: <20190127040047.6412-1-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1300219593=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190127040047.6412-1-imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1300219593==
Content-Type: multipart/alternative; boundary="000000000000d9036c05807299ab"

--000000000000d9036c05807299ab
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

On Sat, Jan 26, 2019 at 11:00 PM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:

> ---
>  man/nouveau.man | 9 ++++++++-
>  src/nv_driver.c | 8 ++++++--
>  2 files changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/man/nouveau.man b/man/nouveau.man
> index 07d53c8..4878f24 100644
> --- a/man/nouveau.man
> +++ b/man/nouveau.man
> @@ -63,7 +63,14 @@ GF100, GF104, GF106, GF108, GF110, GF114, GF116, GF117,
> GF119
>  GK104, GK106, GK107, GK110, GK208
>  .TP 22
>  .B GeForce GTX 750
> -GM107
> +GM107, GM108
> +.TP 22
> +.B GeForce GTX 9XX
> +GM200, GM204, GM206
> +.TP 22
> +.B GeForce GTX 10XX
> +GP102, GP104, GP106, GP107, GP108
> +
>
>  .SH CONFIGURATION DETAILS
>  Please refer to __xconfigfile__(__filemansuffix__) for general
> configuration
> diff --git a/src/nv_driver.c b/src/nv_driver.c
> index 1d276cf..2f8c89c 100644
> --- a/src/nv_driver.c
> +++ b/src/nv_driver.c
> @@ -140,8 +140,12 @@ static struct NvFamily NVKnownFamilies[] =
>    { "GeForce 6",   "NV4x" },
>    { "GeForce 7",   "G7x" },
>    { "GeForce 8",   "G8x" },
> -  { "GeForce GTX 200", "NVA0" },
> -  { "GeForce GTX 400", "NVC0" },
> +  { "GeForce 9",   "G9x" },
> +  { "GeForce GTX 2xx/3xx", "GT2xx" },
> +  { "GeForce GTX 4xx/5xx", "GFxxx" },
> +  { "GeForce GTX 6xx/7xx", "GKxxx" },
> +  { "GeForce GTX 9xx", "GMxxx" },
> +  { "GeForce GTX 10xx", "GPxxx" },
>    { NULL, NULL}
>  };
>
> --
> 2.19.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--000000000000d9036c05807299ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto"><span class=3D"m_-1745118302715024216gmail-m_-210905=
5249384573246gmail-m_-3796206122752663915gmail-il" style=3D"color:rgb(49,49=
,49);word-spacing:1px">Reviewed-by: Rhys</span><span style=3D"color:rgb(49,=
49,49);word-spacing:1px;background-color:rgb(255,255,255)">=C2=A0Kidd &lt;<=
/span><a href=3D"mailto:rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" target=3D"_blank" style=3D"font=
-size:1rem;word-spacing:1px">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a><span style=3D"color:rgb=
(49,49,49);word-spacing:1px;background-color:rgb(255,255,255)">&gt;</span><=
br></div></div><div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">On=
 Sat, Jan 26, 2019 at 11:00 PM Ilia Mirkin &lt;<a href=3D"mailto:imirkin@al=
um.mit.edu" target=3D"_blank">imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">---<br>
=C2=A0man/nouveau.man | 9 ++++++++-<br>
=C2=A0src/nv_driver.c | 8 ++++++--<br>
=C2=A02 files changed, 14 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/man/nouveau.man b/man/nouveau.man<br>
index 07d53c8..4878f24 100644<br>
--- a/man/nouveau.man<br>
+++ b/man/nouveau.man<br>
@@ -63,7 +63,14 @@ GF100, GF104, GF106, GF108, GF110, GF114, GF116, GF117, =
GF119<br>
=C2=A0GK104, GK106, GK107, GK110, GK208<br>
=C2=A0.TP 22<br>
=C2=A0.B GeForce GTX 750<br>
-GM107<br>
+GM107, GM108<br>
+.TP 22<br>
+.B GeForce GTX 9XX<br>
+GM200, GM204, GM206<br>
+.TP 22<br>
+.B GeForce GTX 10XX<br>
+GP102, GP104, GP106, GP107, GP108<br>
+<br>
<br>
=C2=A0.SH CONFIGURATION DETAILS<br>
=C2=A0Please refer to __xconfigfile__(__filemansuffix__) for general config=
uration<br>
diff --git a/src/nv_driver.c b/src/nv_driver.c<br>
index 1d276cf..2f8c89c 100644<br>
--- a/src/nv_driver.c<br>
+++ b/src/nv_driver.c<br>
@@ -140,8 +140,12 @@ static struct NvFamily NVKnownFamilies[] =3D<br>
=C2=A0 =C2=A0{ &quot;GeForce 6&quot;,=C2=A0 =C2=A0&quot;NV4x&quot; },<br>
=C2=A0 =C2=A0{ &quot;GeForce 7&quot;,=C2=A0 =C2=A0&quot;G7x&quot; },<br>
=C2=A0 =C2=A0{ &quot;GeForce 8&quot;,=C2=A0 =C2=A0&quot;G8x&quot; },<br>
-=C2=A0 { &quot;GeForce GTX 200&quot;, &quot;NVA0&quot; },<br>
-=C2=A0 { &quot;GeForce GTX 400&quot;, &quot;NVC0&quot; },<br>
+=C2=A0 { &quot;GeForce 9&quot;,=C2=A0 =C2=A0&quot;G9x&quot; },<br>
+=C2=A0 { &quot;GeForce GTX 2xx/3xx&quot;, &quot;GT2xx&quot; },<br>
+=C2=A0 { &quot;GeForce GTX 4xx/5xx&quot;, &quot;GFxxx&quot; },<br>
+=C2=A0 { &quot;GeForce GTX 6xx/7xx&quot;, &quot;GKxxx&quot; },<br>
+=C2=A0 { &quot;GeForce GTX 9xx&quot;, &quot;GMxxx&quot; },<br>
+=C2=A0 { &quot;GeForce GTX 10xx&quot;, &quot;GPxxx&quot; },<br>
=C2=A0 =C2=A0{ NULL, NULL}<br>
=C2=A0};<br>
<br>
-- <br>
2.19.2<br>
<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a><br>
</blockquote></div></div>
</div>

--000000000000d9036c05807299ab--

--===============1300219593==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1300219593==--
