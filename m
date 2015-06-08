From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [PATCH 4/5] gr/gf100: wait on bottom half of FE's
	pipeline
Date: Mon, 8 Jun 2015 07:04:41 -0400
Message-ID: <CAKb7UvgC+eV1ot9CeZhCuBw79pK4v=-xja_AOMncfRjn=DsZ1g@mail.gmail.com>
References: <1433753637-24706-1-git-send-email-acourbot@nvidia.com>
 <1433753637-24706-5-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2060497844=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1433753637-24706-5-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============2060497844==
Content-Type: multipart/alternative; boundary=001a113d29dacb2ca10517ff9b16

--001a113d29dacb2ca10517ff9b16
Content-Type: text/plain; charset=UTF-8

A naive question from someone who knows nothing of icmd or bundles... Would
it be better to wait for both bits to become 0 (I.e. 0x6)?
On Jun 8, 2015 11:54 AM, "Alexandre Courbot" <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:

> When emitting the ICMD bundle, wait on the bottom half (bit 3 of the
> GR_STATUS register) instead of upper half (bit 2) to make sure methods
> are effectively emitted.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c
> b/drm/nouveau/nvkm/engine/gr/gf100.c
> index 5606c25e5d02..01efc2c96045 100644
> --- a/drm/nouveau/nvkm/engine/gr/gf100.c
> +++ b/drm/nouveau/nvkm/engine/gr/gf100.c
> @@ -699,7 +699,7 @@ gf100_gr_icmd(struct gf100_gr_priv *priv, const struct
> gf100_gr_pack *p)
>
>                 while (addr < next) {
>                         nv_wr32(priv, 0x400200, addr);
> -                       nv_wait(priv, 0x400700, 0x00000002, 0x00000000);
> +                       nv_wait(priv, 0x400700, 0x00000004, 0x00000000);
>                         addr += init->pitch;
>                 }
>         }
> --
> 2.4.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

--001a113d29dacb2ca10517ff9b16
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">A naive question from someone who knows nothing of icmd or b=
undles... Would it be better to wait for both bits to become 0 (I.e. 0x6)?<=
/p>
<div class=3D"gmail_quote">On Jun 8, 2015 11:54 AM, &quot;Alexandre Courbot=
&quot; &lt;<a href=3D"mailto:acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org">acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&g=
t; wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">When emi=
tting the ICMD bundle, wait on the bottom half (bit 3 of the<br>
GR_STATUS register) instead of upper half (bit 2) to make sure methods<br>
are effectively emitted.<br>
<br>
Signed-off-by: Alexandre Courbot &lt;<a href=3D"mailto:acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org"=
>acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org</a>&gt;<br>
---<br>
=C2=A0drm/nouveau/nvkm/engine/gr/gf100.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drm/nouveau/nvkm/engine/gr/gf100.c b/drm/nouveau/nvkm/engine/g=
r/gf100.c<br>
index 5606c25e5d02..01efc2c96045 100644<br>
--- a/drm/nouveau/nvkm/engine/gr/gf100.c<br>
+++ b/drm/nouveau/nvkm/engine/gr/gf100.c<br>
@@ -699,7 +699,7 @@ gf100_gr_icmd(struct gf100_gr_priv *priv, const struct =
gf100_gr_pack *p)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (addr &lt; ne=
xt) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 nv_wr32(priv, 0x400200, addr);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nv_wait(priv, 0x400700, 0x00000002, 0x00000000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0nv_wait(priv, 0x400700, 0x00000004, 0x00000000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 addr +=3D init-&gt;pitch;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
--<br>
2.4.2<br>
<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"http://lists.freedesktop.org/mailman/listinfo/nouveau" target=3D=
"_blank">http://lists.freedesktop.org/mailman/listinfo/nouveau</a><br>
</blockquote></div>

--001a113d29dacb2ca10517ff9b16--

--===============2060497844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2060497844==--
