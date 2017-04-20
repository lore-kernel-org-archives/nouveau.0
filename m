From: Oscar Salvador <osalvador.vilardaga@gmail.com>
Subject: Re: [Nouveau] [PATCH v2 2/5] nouveau_hwmon: Add nouveau_hwmon_ops
 structure with .is_visible/.read_string
Date: Thu, 20 Apr 2017 09:32:39 +0200
Message-ID: <CAOXBz7gcBktRA82rXYHCeiiWFkhe6X29HdORMC2s02fvxFYJ+g@mail.gmail.com>
References: <1492415272-20378-1-git-send-email-osalvador.vilardaga@gmail.com>
 <1492415272-20378-3-git-send-email-osalvador.vilardaga@gmail.com>
 <CAEXux-ZSfHOFECRF4MbQ2dwUt4kbWCoD8uiAmtvHn7i8whaytg@mail.gmail.com>
 <CAOXBz7ixqxwfwr-V+fSiwiOJ65u9frgTyNLvSS4msTjNof1VBg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2018712443=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOXBz7ixqxwfwr-V+fSiwiOJ65u9frgTyNLvSS4msTjNof1VBg@mail.gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Karol Herbst <karolherbst@gmail.com>
Cc: ML nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

--===============2018712443==
Content-Type: multipart/alternative; boundary=94eb2c0566ce5adf69054d94251b

--94eb2c0566ce5adf69054d94251b
Content-Type: text/plain; charset=UTF-8

I got what you meant. I"ll fix it

El dia 20/04/2017 08:47, "Oscar Salvador" <osalvador.vilardaga@gmail.com>
va escriure:

> Hi Karol,
>
> I don't get what you mean with return due to fallthrough. I mean, I
> know what is it, but I don't see how I can do it there.
> Moving the check before the switch looks like that:
>
>         if (!iccsense)
>                 return 0;
>
>         switch (attr) {
>         case hwmon_power_input:
>                 if (iccsense->data_valid &&
>                         !list_empty(&iccsense->rails))
>                         return 0444;
>         case hwmon_power_max:
>                 if (iccsense->power_w_max)
>                         return 0444;
>         case hwmon_power_crit:
>                 if (iccsense->power_w_crit)
>                         return 0444;
>         default:
>                 return 0;
>         }
>
> Could you drop me a hint?
>
>
> On 18 April 2017 at 09:56, Karol Herbst <karolherbst@gmail.com> wrote:
> > 2017-04-17 9:47 GMT+02:00 Oscar Salvador <osalvador.vilardaga@gmail.com
> >:
> >> This patch introduces the nouveau_hwmon_ops structure, sets up
> >> .is_visible and .read_string operations and adds all the functions
> >> for these operations.
> >> This is also a preparation for the next patches, where most of the
> >> work is being done.
> >> This code doesn't interacture with the old one.
> >> It's just to make easier the review of all patches.
> >> ---
> >>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 166
> ++++++++++++++++++++++++++++++++
> >>  1 file changed, 166 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> >> index 24b40c5..9b6423c 100644
> >> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> >> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> >> @@ -764,6 +764,172 @@ static const struct hwmon_channel_info
> *nouveau_info[] = {
> >>         &nouveau_power,
> >>         NULL
> >>  };
> >> +
> >> +static umode_t
> >> +nouveau_chip_is_visible(const void *data, u32 attr, int channel)
> >> +{
> >> +       switch (attr) {
> >> +       case hwmon_chip_update_interval:
> >> +               return 0444;
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static umode_t
> >> +nouveau_power_is_visible(const void *data, u32 attr, int channel)
> >> +{
> >> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device
> *)data);
> >> +       struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.
> device);
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_power_input:
> >> +               if (iccsense &&
> >
> > move the pointer check before the switch, because you need to check it
> > in every case (or move it to every case, but doing it once is
> > simplier/cleaner)
> >
> >> +                       iccsense->data_valid &&
> >> +                       !list_empty(&iccsense->rails))
> >> +                       return 0444;
> >
> > add return due to fallthrough
> >
> >> +       case hwmon_power_max:
> >> +               if (iccsense->power_w_max)
> >> +                       return 0444;
> >
> > add return due to fallthrough
> >
> >> +       case hwmon_power_crit:
> >> +               if (iccsense->power_w_crit)
> >> +                       return 0444;
> >
> > add return due to fallthrough
> >
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static umode_t
> >> +nouveau_temp_is_visible(const void *data, u32 attr, int channel)
> >> +{
> >> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device
> *)data);
> >> +       struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> >> +
> >> +       if (therm &&
> >> +               therm->attr_get &&
> >> +               therm->attr_set &&
> >> +               nvkm_therm_temp_get(therm) < 0)
> >> +               return 0;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_temp_input:
> >> +       case hwmon_temp_max:
> >> +       case hwmon_temp_max_hyst:
> >> +       case hwmon_temp_crit:
> >> +       case hwmon_temp_crit_hyst:
> >> +       case hwmon_temp_emergency:
> >> +       case hwmon_temp_emergency_hyst:
> >> +               return 0444;
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static umode_t
> >> +nouveau_pwm_is_visible(const void *data, u32 attr, int channel)
> >> +{
> >> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device
> *)data);
> >> +       struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> >> +
> >> +       if (therm &&
> >> +               therm->attr_get &&
> >> +               therm->fan_get &&
> >> +               therm->fan_get(therm) < 0)
> >> +               return 0;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_pwm_enable:
> >> +       case hwmon_pwm_input:
> >> +               return 0644;
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static umode_t
> >> +nouveau_input_is_visible(const void *data, u32 attr, int channel)
> >> +{
> >> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device
> *)data);
> >> +       struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> >> +
> >> +       if (!volt || nvkm_volt_get(volt) < 0)
> >> +               return 0;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_in_input:
> >> +       case hwmon_in_label:
> >> +       case hwmon_in_min:
> >> +       case hwmon_in_max:
> >> +               return 0444;
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static umode_t
> >> +nouveau_fan_is_visible(const void *data, u32 attr, int channel)
> >> +{
> >> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device
> *)data);
> >> +       struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> >> +
> >> +       if (!therm || !therm->attr_get || nvkm_therm_fan_sense(therm) <
> 0)
> >> +               return 0;
> >> +
> >> +       switch (attr) {
> >> +       case hwmon_fan_input:
> >> +               return 0444;
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static umode_t
> >> +nouveau_is_visible(const void *data, enum hwmon_sensor_types type, u32
> attr,
> >> +                                                               int
> channel)
> >> +{
> >> +       switch (type) {
> >> +       case hwmon_chip:
> >> +               return nouveau_chip_is_visible(data, attr, channel);
> >> +       case hwmon_temp:
> >> +               return nouveau_temp_is_visible(data, attr, channel);
> >> +       case hwmon_fan:
> >> +               return nouveau_fan_is_visible(data, attr, channel);
> >> +       case hwmon_in:
> >> +               return nouveau_input_is_visible(data, attr, channel);
> >> +       case hwmon_pwm:
> >> +               return nouveau_pwm_is_visible(data, attr, channel);
> >> +       case hwmon_power:
> >> +               return nouveau_power_is_visible(data, attr, channel);
> >> +       default:
> >> +               return 0;
> >> +       }
> >> +}
> >> +
> >> +static char *input_label = "GPU core";
> >> +
> >> +static int
> >> +nouveau_read_string(struct device *dev, enum hwmon_sensor_types type,
> u32 attr,
> >> +                                                       int channel,
> char **buf)
> >> +{
> >> +       if (type == hwmon_in && attr == hwmon_in_label) {
> >> +               *buf = input_label;
> >> +               return 0;
> >> +       }
> >> +
> >> +       return -EOPNOTSUPP;
> >> +}
> >> +
> >> +static const struct hwmon_ops nouveau_hwmon_ops = {
> >> +       .is_visible = nouveau_is_visible,
> >> +       .read = NULL,
> >> +       .read_string = nouveau_read_string,
> >> +       .write = NULL,
> >> +};
> >> +
> >> +static const struct hwmon_chip_info nouveau_chip_info = {
> >> +       .ops = &nouveau_hwmon_ops,
> >> +       .info = nouveau_info,
> >> +};
> >>  #endif
> >>
> >>  int
> >> --
> >> 2.1.4
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

--94eb2c0566ce5adf69054d94251b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I got what you meant. I&quot;ll fix it</div><div class=3D=
"gmail_extra"><br><div class=3D"gmail_quote">El dia 20/04/2017 08:47, &quot=
;Oscar Salvador&quot; &lt;<a href=3D"mailto:osalvador.vilardaga@gmail.com">=
osalvador.vilardaga@gmail.com</a>&gt; va escriure:<br type=3D"attribution">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi Karol,<br>
<br>
I don&#39;t get what you mean with return due to fallthrough. I mean, I<br>
know what is it, but I don&#39;t see how I can do it there.<br>
Moving the check before the switch looks like that:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!iccsense)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (attr) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_input:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iccsense-&gt;da=
ta_valid &amp;&amp;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 !list_empty(&amp;iccsense-&gt;rails))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0444;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_max:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iccsense-&gt;po=
wer_w_max)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0444;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 case hwmon_power_crit:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (iccsense-&gt;po=
wer_w_crit)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 return 0444;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Could you drop me a hint?<br>
<br>
<br>
On 18 April 2017 at 09:56, Karol Herbst &lt;<a href=3D"mailto:karolherbst@g=
mail.com">karolherbst@gmail.com</a>&gt; wrote:<br>
&gt; 2017-04-17 9:47 GMT+02:00 Oscar Salvador &lt;<a href=3D"mailto:osalvad=
or.vilardaga@gmail.com">osalvador.vilardaga@gmail.com</a><wbr>&gt;:<br>
&gt;&gt; This patch introduces the nouveau_hwmon_ops structure, sets up<br>
&gt;&gt; .is_visible and .read_string operations and adds all the functions=
<br>
&gt;&gt; for these operations.<br>
&gt;&gt; This is also a preparation for the next patches, where most of the=
<br>
&gt;&gt; work is being done.<br>
&gt;&gt; This code doesn&#39;t interacture with the old one.<br>
&gt;&gt; It&#39;s just to make easier the review of all patches.<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 drivers/gpu/drm/nouveau/<wbr>nouveau_hwmon.c | 166 +++++++++=
+++++++++++++++++++++<wbr>++<br>
&gt;&gt;=C2=A0 1 file changed, 166 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/drivers/gpu/drm/nouveau/<wbr>nouveau_hwmon.c b/driver=
s/gpu/drm/nouveau/<wbr>nouveau_hwmon.c<br>
&gt;&gt; index 24b40c5..9b6423c 100644<br>
&gt;&gt; --- a/drivers/gpu/drm/nouveau/<wbr>nouveau_hwmon.c<br>
&gt;&gt; +++ b/drivers/gpu/drm/nouveau/<wbr>nouveau_hwmon.c<br>
&gt;&gt; @@ -764,6 +764,172 @@ static const struct hwmon_channel_info *nouv=
eau_info[] =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_power,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_chip_is_visible(const void *data, u32 attr, int channel)<=
br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_chip_update_interval:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 044=
4;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_power_is_visible(<wbr>const void *data, u32 attr, int cha=
nnel)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_dr=
m((struct drm_device *)data);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_iccsense *iccsense =3D nvx=
x_iccsense(&amp;drm-&gt;client.<wbr>device);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_input:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsen=
se &amp;&amp;<br>
&gt;<br>
&gt; move the pointer check before the switch, because you need to check it=
<br>
&gt; in every case (or move it to every case, but doing it once is<br>
&gt; simplier/cleaner)<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0iccsense-&gt;data_valid &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0!list_empty(&amp;iccsense-&gt;rails))<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return 0444;<br>
&gt;<br>
&gt; add return due to fallthrough<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_max:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsen=
se-&gt;power_w_max)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return 0444;<br>
&gt;<br>
&gt; add return due to fallthrough<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_crit:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsen=
se-&gt;power_w_crit)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return 0444;<br>
&gt;<br>
&gt; add return due to fallthrough<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_temp_is_visible(const void *data, u32 attr, int channel)<=
br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_dr=
m((struct drm_device *)data);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_ther=
m(&amp;drm-&gt;client.<wbr>device);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;=
attr_get &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;=
attr_set &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvkm_therm=
_temp_get(therm) &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_input:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max_hyst:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit_hyst:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency_hyst:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 044=
4;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_pwm_is_visible(const void *data, u32 attr, int channel)<b=
r>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_dr=
m((struct drm_device *)data);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_ther=
m(&amp;drm-&gt;client.<wbr>device);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;=
attr_get &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;=
fan_get &amp;&amp;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;=
fan_get(therm) &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_enable:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_input:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 064=
4;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_input_is_visible(<wbr>const void *data, u32 attr, int cha=
nnel)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_dr=
m((struct drm_device *)data);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D nvxx_volt(&=
amp;drm-&gt;client.device)<wbr>;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!volt || nvkm_volt_get(volt) &lt; =
0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_input:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_label:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_min:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_max:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 044=
4;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_fan_is_visible(const void *data, u32 attr, int channel)<b=
r>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_dr=
m((struct drm_device *)data);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_ther=
m(&amp;drm-&gt;client.<wbr>device);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!therm || !therm-&gt;attr_get || n=
vkm_therm_fan_sense(therm) &lt; 0)<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_fan_input:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 044=
4;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static umode_t<br>
&gt;&gt; +nouveau_is_visible(const void *data, enum hwmon_sensor_types type=
, u32 attr,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0int channel)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_chip:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nou=
veau_chip_is_visible(data, attr, channel);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nou=
veau_temp_is_visible(data, attr, channel);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_fan:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nou=
veau_fan_is_visible(data, attr, channel);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nou=
veau_input_is_visible(data, attr, channel);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nou=
veau_pwm_is_visible(data, attr, channel);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nou=
veau_power_is_visible(data, attr, channel);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static char *input_label =3D &quot;GPU core&quot;;<br>
&gt;&gt; +<br>
&gt;&gt; +static int<br>
&gt;&gt; +nouveau_read_string(struct device *dev, enum hwmon_sensor_types t=
ype, u32 attr,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int channel, cha=
r **buf)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D hwmon_in &amp;&amp; at=
tr =3D=3D hwmon_in_label) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*buf =3D i=
nput_label;<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt; +static const struct hwmon_ops nouveau_hwmon_ops =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.is_visible =3D nouveau_is_visible,<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D NULL,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.read_string =3D nouveau_read_string,<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D NULL,<br>
&gt;&gt; +};<br>
&gt;&gt; +<br>
&gt;&gt; +static const struct hwmon_chip_info nouveau_chip_info =3D {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;nouveau_hwmon_ops,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.info =3D nouveau_info,<br>
&gt;&gt; +};<br>
&gt;&gt;=C2=A0 #endif<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 int<br>
&gt;&gt; --<br>
&gt;&gt; 2.1.4<br>
&gt;&gt;<br>
&gt;&gt; ______________________________<wbr>_________________<br>
&gt;&gt; Nouveau mailing list<br>
&gt;&gt; <a href=3D"mailto:Nouveau@lists.freedesktop.org">Nouveau@lists.fre=
edesktop.org</a><br>
&gt;&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau"=
 rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>ma=
ilman/listinfo/nouveau</a><br>
</blockquote></div></div>

--94eb2c0566ce5adf69054d94251b--

--===============2018712443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============2018712443==--
