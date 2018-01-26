From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/therm/gp100: Do not report
 temperature when subdev is shadowed
Date: Thu, 25 Jan 2018 23:36:47 -0500
Message-ID: <CA+iOQUFEcTL4o4GYkDE5jh=Nwdo2c7e0Ar1-owk6Ci+uqpwexg@mail.gmail.com>
References: <20180125181626.3584-1-tobias.johannes.klausmann@mni.thm.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0377260281=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20180125181626.3584-1-tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0377260281==
Content-Type: multipart/alternative; boundary="94eb2c08ed98ca33fa0563a67166"

--94eb2c08ed98ca33fa0563a67166
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 25 January 2018 at 13:16, Tobias Klausmann <
tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org> wrote:

> This fixes wrong temperature outputs e.g. 511=C2=B0C if the card is aslee=
p.
>
> Signed-off-by: Tobias Klausmann <tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org>
>

LGTM,

Reviewed-by: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> index 9f0dea3f61dc..45d0ec632b5a 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> @@ -32,8 +32,10 @@ gp100_temp_get(struct nvkm_therm *therm)
>         u32 inttemp =3D (tsensor & 0x0001fff8);
>
>         /* device SHADOWed */
> -       if (tsensor & 0x40000000)
> +       if (tsensor & 0x40000000) {
>                 nvkm_trace(subdev, "reading temperature from SHADOWed
> sensor\n");
> +               return -ENODEV;
> +       }
>
>         /* device valid */
>         if (tsensor & 0x20000000)
> --
> 2.16.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--94eb2c08ed98ca33fa0563a67166
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 25 January 2018 at 13:16, Tobias Klausmann <span dir=3D=
"ltr">&lt;<a href=3D"mailto:tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org" target=3D=
"_blank">tobias.johannes.klausmann-AqjdNwhu20eELgA04lAiVw@public.gmane.org</a>&gt;</span> wrote:<br><div=
 class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">This fixes wrong temperature outputs e.g. 511=C2=
=B0C if the card is asleep.<br>
<br>
Signed-off-by: Tobias Klausmann &lt;<a href=3D"mailto:tobias.johannes.klaus=
mann-AqjdNwhu20eELgA04lAiVw@public.gmane.org">tobias.johannes.klausmann@<wbr>mni.thm.de</a>&gt;<br></blo=
ckquote><div><br></div><div>LGTM,<br><br><span class=3D"gmail-il"><span cla=
ss=3D"gmail-il">Reviewed</span>-<span class=3D"gmail-il">by</span>: Rhys</s=
pan> Kidd &lt;<a href=3D"mailto:rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&=
gt;<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drivers/gpu/drm/nouveau/nvkm/<wbr>subdev/therm/gp100.c | 4 +++-<br>
=C2=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/therm/gp100.c b/drive=
rs/gpu/drm/nouveau/<wbr>nvkm/subdev/therm/gp100.c<br>
index 9f0dea3f61dc..45d0ec632b5a 100644<br>
--- a/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/therm/gp100.c<br>
+++ b/drivers/gpu/drm/nouveau/<wbr>nvkm/subdev/therm/gp100.c<br>
@@ -32,8 +32,10 @@ gp100_temp_get(struct nvkm_therm *therm)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 inttemp =3D (tsensor &amp; 0x0001fff8);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* device SHADOWed */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tsensor &amp; 0x40000000)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (tsensor &amp; 0x40000000) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 nvkm_trace(subdev, =
&quot;reading temperature from SHADOWed sensor\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* device valid */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tsensor &amp; 0x20000000)<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.16.1<br>
<br>
______________________________<wbr>_________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9/rsn8yoX9R0@public.gmane.org=
org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailman/lis=
tinfo/nouveau</a><br>
</font></span></blockquote></div><br></div></div>

--94eb2c08ed98ca33fa0563a67166--

--===============0377260281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0377260281==--
