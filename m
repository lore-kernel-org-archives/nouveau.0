From: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] hwmon: return EINVAL if the GPU is powered
 down for sensors reads
Date: Sat, 22 Jun 2019 13:35:00 +1000
Message-ID: <CA+iOQUEhHx2ofWeTEu95D2L=xXY2qAy6HZq7nboOw_9JkG1NyQ@mail.gmail.com>
References: <20190618110133.9526-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456790316=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20190618110133.9526-1-kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============1456790316==
Content-Type: multipart/alternative; boundary="0000000000002a8e82058be1446b"

--0000000000002a8e82058be1446b
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Jun 2019 at 21:01, Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:

> fixes bogus values userspace gets from hwmon while the GPU is powered down
>
> Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>

Looks good to me and successfully tested on my GP107M with runtime power
management fixes, so

Reviewed-by: Rhys Kidd <rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>


> ---
>  drm/nouveau/nouveau_hwmon.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drm/nouveau/nouveau_hwmon.c b/drm/nouveau/nouveau_hwmon.c
> index 618d8b780..d445c6f3f 100644
> --- a/drm/nouveau/nouveau_hwmon.c
> +++ b/drm/nouveau/nouveau_hwmon.c
> @@ -426,6 +426,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_temp_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 ret = nvkm_therm_temp_get(therm);
>                 *val = ret < 0 ? ret : (ret * 1000);
>                 break;
> @@ -472,6 +474,8 @@ nouveau_fan_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_fan_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 *val = nvkm_therm_fan_sense(therm);
>                 break;
>         default:
> @@ -494,6 +498,8 @@ nouveau_in_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_in_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 ret = nvkm_volt_get(volt);
>                 *val = ret < 0 ? ret : (ret / 1000);
>                 break;
> @@ -525,6 +531,8 @@ nouveau_pwm_read(struct device *dev, u32 attr, int
> channel, long *val)
>                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);
>                 break;
>         case hwmon_pwm_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 *val = therm->fan_get(therm);
>                 break;
>         default:
> @@ -546,6 +554,8 @@ nouveau_power_read(struct device *dev, u32 attr, int
> channel, long *val)
>
>         switch (attr) {
>         case hwmon_power_input:
> +               if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> +                       return -EINVAL;
>                 *val = nvkm_iccsense_read_all(iccsense);
>                 break;
>         case hwmon_power_max:
> --
> 2.21.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--0000000000002a8e82058be1446b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 18 Jun 2019 at 21:01, Karol Herbs=
t &lt;<a href=3D"mailto:kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org">kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt; wrot=
e:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">fixes bogus values userspace gets from hwmon while the GPU is=
 powered down<br>
<br>
Signed-off-by: Karol Herbst &lt;<a href=3D"mailto:kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" targe=
t=3D"_blank">kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org</a>&gt;<br></blockquote><div><br></div><div=
>Looks good to me and successfully tested on my GP107M with runtime power m=
anagement fixes, so<br></div><div><br></div><div>Reviewed-by: Rhys Kidd &lt=
;<a href=3D"mailto:rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">rhyskidd-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0drm/nouveau/nouveau_hwmon.c | 10 ++++++++++<br>
=C2=A01 file changed, 10 insertions(+)<br>
<br>
diff --git a/drm/nouveau/nouveau_hwmon.c b/drm/nouveau/nouveau_hwmon.c<br>
index 618d8b780..d445c6f3f 100644<br>
--- a/drm/nouveau/nouveau_hwmon.c<br>
+++ b/drm/nouveau/nouveau_hwmon.c<br>
@@ -426,6 +426,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int cha=
nnel, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_temp_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nvkm_therm_=
temp_get(therm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ret &lt; 0=
 ? ret : (ret * 1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
@@ -472,6 +474,8 @@ nouveau_fan_read(struct device *dev, u32 attr, int chan=
nel, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_fan_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D nvkm_therm=
_fan_sense(therm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
@@ -494,6 +498,8 @@ nouveau_in_read(struct device *dev, u32 attr, int chann=
el, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_in_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D nvkm_volt_g=
et(volt);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D ret &lt; 0=
 ? ret : (ret / 1000);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
@@ -525,6 +531,8 @@ nouveau_pwm_read(struct device *dev, u32 attr, int chan=
nel, long *val)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D therm-&gt;=
attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_pwm_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D therm-&gt;=
fan_get(therm);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
@@ -546,6 +554,8 @@ nouveau_power_read(struct device *dev, u32 attr, int ch=
annel, long *val)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_input:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (drm_dev-&gt;swi=
tch_power_state !=3D DRM_SWITCH_POWER_ON)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D nvkm_iccse=
nse_read_all(iccsense);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_max:<br>
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

--0000000000002a8e82058be1446b--

--===============1456790316==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1456790316==--
