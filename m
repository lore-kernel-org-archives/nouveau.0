From: Samuel Pitoiset <samuel.pitoiset@gmail.com>
Subject: Re: [PATCH] nvc0: fix geometry program revalidation of
 clipping params
Date: Mon, 13 Jul 2015 10:16:45 +0200
Message-ID: <CAJd1Ru5fmsDDftu0pkQtfqtzUaoWV8TCRHm=TiXgtmb-jD-wvg@mail.gmail.com>
References: <1436634801-6319-1-git-send-email-imirkin@alum.mit.edu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1635990318=="
Return-path: <mesa-dev-bounces@lists.freedesktop.org>
In-Reply-To: <1436634801-6319-1-git-send-email-imirkin@alum.mit.edu>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
 <mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: mesa-dev-bounces@lists.freedesktop.org
Sender: "mesa-dev" <mesa-dev-bounces@lists.freedesktop.org>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: "mesa-dev@lists.freedesktop.org" <mesa-dev@lists.freedesktop.org>, "10.4 10.5" <mesa-stable@lists.freedesktop.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============1635990318==
Content-Type: multipart/alternative; boundary=047d7bf0db50093bf2051abd5a3b

--047d7bf0db50093bf2051abd5a3b
Content-Type: text/plain; charset=UTF-8

What piglit test does this fix?

On Sat, Jul 11, 2015 at 7:13 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> Cc: mesa-stable@lists.freedesktop.org
> ---
>
> Even though in practice a geometry program will never be using UCP's,
> we still were revalidating (aka recompiling) the program when more
> clip planes became enabled (which also are used for regular clip
> distances).
>
> This seems like it should have led to massive fail, but I guess you
> don't change the number of clip planes when using geometry shaders.
> But I'm going to put this through a full piglit run just in case
> there's something I'm missing.
>
>  src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> index 785e52e..11f2b10 100644
> --- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> +++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c
> @@ -339,7 +339,7 @@ nvc0_check_program_ucps(struct nvc0_context *nvc0,
>        nvc0_vertprog_validate(nvc0);
>     else
>     if (likely(vp == nvc0->gmtyprog))
> -      nvc0_vertprog_validate(nvc0);
> +      nvc0_gmtyprog_validate(nvc0);
>     else
>        nvc0_tevlprog_validate(nvc0);
>  }
> --
> 2.3.6
>
> _______________________________________________
> mesa-dev mailing list
> mesa-dev@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/mesa-dev
>



-- 
Best regards,
Samuel Pitoiset.

--047d7bf0db50093bf2051abd5a3b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What piglit test does this fix?<br><div class=3D"gmail_ext=
ra"><br><div class=3D"gmail_quote">On Sat, Jul 11, 2015 at 7:13 PM, Ilia Mi=
rkin <span dir=3D"ltr">&lt;<a href=3D"mailto:imirkin@alum.mit.edu" target=
=3D"_blank">imirkin@alum.mit.edu</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin@alum=
.mit.edu">imirkin@alum.mit.edu</a>&gt;<br>
Cc: <a href=3D"mailto:mesa-stable@lists.freedesktop.org">mesa-stable@lists.=
freedesktop.org</a><br>
---<br>
<br>
Even though in practice a geometry program will never be using UCP&#39;s,<b=
r>
we still were revalidating (aka recompiling) the program when more<br>
clip planes became enabled (which also are used for regular clip<br>
distances).<br>
<br>
This seems like it should have led to massive fail, but I guess you<br>
don&#39;t change the number of clip planes when using geometry shaders.<br>
But I&#39;m going to put this through a full piglit run just in case<br>
there&#39;s something I&#39;m missing.<br>
<br>
=C2=A0src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c b/src/g=
allium/drivers/nouveau/nvc0/nvc0_state_validate.c<br>
index 785e52e..11f2b10 100644<br>
--- a/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c<br>
+++ b/src/gallium/drivers/nouveau/nvc0/nvc0_state_validate.c<br>
@@ -339,7 +339,7 @@ nvc0_check_program_ucps(struct nvc0_context *nvc0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0nvc0_vertprog_validate(nvc0);<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 if (likely(vp =3D=3D nvc0-&gt;gmtyprog))<br>
-=C2=A0 =C2=A0 =C2=A0 nvc0_vertprog_validate(nvc0);<br>
+=C2=A0 =C2=A0 =C2=A0 nvc0_gmtyprog_validate(nvc0);<br>
=C2=A0 =C2=A0 else<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0nvc0_tevlprog_validate(nvc0);<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.3.6<br>
<br>
_______________________________________________<br>
mesa-dev mailing list<br>
<a href=3D"mailto:mesa-dev@lists.freedesktop.org">mesa-dev@lists.freedeskto=
p.org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/mesa-dev" rel=3D"n=
oreferrer" target=3D"_blank">http://lists.freedesktop.org/mailman/listinfo/=
mesa-dev</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><br>-- <br><div clas=
s=3D"gmail_signature"><div>Best regards,</div>Samuel Pitoiset.<br></div>
</div></div>

--047d7bf0db50093bf2051abd5a3b--

--===============1635990318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbWVzYS1kZXYg
bWFpbGluZyBsaXN0Cm1lc2EtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbWVzYS1kZXYK

--===============1635990318==--
