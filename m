From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] moved gpio so it is sorted by values
Date: Fri, 12 Jul 2019 15:03:19 +1000
Message-ID: <CA+iOQUGGshxRTo43fjMTZ53-z+xQ02L3z9Syf_EQyiVZn-2g7g@mail.gmail.com>
References: <20190711141153.7723-1-mmenzyns@redhat.com>
 <20190711141153.7723-2-mmenzyns@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1147692857=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190711141153.7723-2-mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Mark Menzynski <mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1147692857==
Content-Type: multipart/alternative; boundary="000000000000dc65a5058d74d4be"

--000000000000dc65a5058d74d4be
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jul 2019 at 00:42, Mark Menzynski <mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> Signed-off-by: Mark Menzynski <mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>

In addition to the general comments I provided to this patch series, you
should add a prefix before ":" to the first line of
this commit message:

Maybe something like "drm/nouveau/bios/gpio: sort gpio function names by
value"

You can see the general approach with:

  $ git log -n10 --oneline
drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/gpio.h

---
>  drm/nouveau/include/nvkm/subdev/bios/gpio.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> b/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> index b71a3555..2f40935f 100644
> --- a/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> +++ b/drm/nouveau/include/nvkm/subdev/bios/gpio.h
> @@ -3,9 +3,9 @@
>  #define __NVBIOS_GPIO_H__
>  enum dcb_gpio_func_name {
>         DCB_GPIO_PANEL_POWER = 0x01,
> +       DCB_GPIO_FAN = 0x09,
>         DCB_GPIO_TVDAC0 = 0x0c,
>         DCB_GPIO_TVDAC1 = 0x2d,
> -       DCB_GPIO_FAN = 0x09,
>         DCB_GPIO_FAN_SENSE = 0x3d,
>         DCB_GPIO_LOGO_LED_PWM = 0x84,
>         DCB_GPIO_UNUSED = 0xff,
> --
> 2.21.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--000000000000dc65a5058d74d4be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, 12 Jul 2019 at 00:42, Mark Menzyn=
ski &lt;<a href=3D"mailto:mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Signed-off-by: Mark Menzynski &lt;<a href=3D"mailto:mmenz=
yns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" target=3D"_blank">mmenzyns-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br></blockquo=
te><div><br></div><div>In addition to the general comments I provided to th=
is patch series, you should add a prefix before &quot;:&quot; to the first =
line of</div><div>this commit message:</div><div><br></div><div>Maybe somet=
hing like &quot;drm/nouveau/bios/gpio: sort gpio function names by value&qu=
ot;<br></div><div><br></div><div>You can see the general approach with:</di=
v><div><br></div><div>=C2=A0 $ git log -n10 --oneline drivers/gpu/drm/nouve=
au/include/nvkm/subdev/bios/gpio.h</div><div><br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
---<br>
=C2=A0drm/nouveau/include/nvkm/subdev/bios/gpio.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drm/nouveau/include/nvkm/subdev/bios/gpio.h b/drm/nouveau/incl=
ude/nvkm/subdev/bios/gpio.h<br>
index b71a3555..2f40935f 100644<br>
--- a/drm/nouveau/include/nvkm/subdev/bios/gpio.h<br>
+++ b/drm/nouveau/include/nvkm/subdev/bios/gpio.h<br>
@@ -3,9 +3,9 @@<br>
=C2=A0#define __NVBIOS_GPIO_H__<br>
=C2=A0enum dcb_gpio_func_name {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_PANEL_POWER =3D 0x01,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0DCB_GPIO_FAN =3D 0x09,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_TVDAC0 =3D 0x0c,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_TVDAC1 =3D 0x2d,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0DCB_GPIO_FAN =3D 0x09,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_FAN_SENSE =3D 0x3d,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_LOGO_LED_PWM =3D 0x84,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 DCB_GPIO_UNUSED =3D 0xff,<br>
-- <br>
2.21.0<br>
<br>
_______________________________________________<br>
Nouveau mailing list<br>
<a href=3D"mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" target=3D"_blank">Nouveau@=
lists.freedesktop.org</a><br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.freedesktop.org/mailman/listinfo=
/nouveau</a></blockquote></div></div>

--000000000000dc65a5058d74d4be--

--===============1147692857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1147692857==--
