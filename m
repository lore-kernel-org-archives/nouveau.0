From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/4] nouveau_hwmon: migrate to
 hwmon_device_register_with_info
Date: Thu, 13 Apr 2017 23:16:43 +0100
Message-ID: <6c953447-e01c-37fc-5eb0-a8bc91451071@spliet.org>
References: <20170413090706.qlmph5y4g5iac45l@linux-3pot>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1537459884=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20170413090706.qlmph5y4g5iac45l@linux-3pot>
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

This is a multi-part message in MIME format.
--===============1537459884==
Content-Type: multipart/alternative;
 boundary="------------96A9FF6F4AF70E4399E9561D"

This is a multi-part message in MIME format.
--------------96A9FF6F4AF70E4399E9561D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Just a non-technical (but important!) point: if you send four patches, 
make sure their title (the first line of your git commit messages) 
describes the content. Given you re-used the same title four times, I 
dare to say it's too generic.
Also, I noticed that this is not the standard git patch format as 
produced by git format-patch. I don't know whether this is a concern (or 
whether you tweaked the format yourself), but in the off chance that you 
are relatively new to git, I recommend you to look up the "git 
format-patch" and "git send-email" commands. They make life a lot easier 
in our mailing-list based work-flow!
This being said, thanks for the work! I'm sure with a bit of minor 
tweaking this is suitable for upstream.

Roy

Op 13-04-17 om 10:07 schreef Oscar Salvador:
> Hi again,
>
> I've split the patches as Karol Herbst suggested.
> I hope now it's fine.
>
> This series of patches introduce the new hwmon_device_register_with_info
> and gets rid of the old hwmon_device_register.
>
> This patch adds the default sensors with their possible config values.
> Just to prepare for the next patches
>
>
> --- linux/drivers/gpu/drm/nouveau/nouveau_hwmon.c.orig	2017-04-12 19:18:09.638073562 +0200
> +++ linux/drivers/gpu/drm/nouveau/nouveau_hwmon.c	2017-04-12 19:19:44.244797202 +0200
> @@ -692,6 +692,78 @@ static const struct attribute_group hwmo
>   static const struct attribute_group hwmon_power_caps_attrgroup = {
>   	.attrs = hwmon_power_caps_attributes,
>   };
> +
> +static const u32 nouveau_config_chip[] = {
> +	HWMON_C_UPDATE_INTERVAL,
> +	0
> +};
> +
> +static const u32 nouveau_config_in[] = {
> +	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_LABEL,
> +	0
> +};
> +
> +static const u32 nouveau_config_temp[] = {
> +	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
> +	HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_EMERGENCY |
> +	HWMON_T_EMERGENCY_HYST,
> +	0
> +};
> +
> +static const u32 nouveau_config_fan[] = {
> +	HWMON_F_INPUT,
> +	0
> +};
> +
> +static const u32 nouveau_config_pwm[] = {
> +	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +	0
> +};
> +
> +static const u32 nouveau_config_power[] = {
> +	HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info nouveau_chip = {
> +	.type = hwmon_chip,
> +	.config = nouveau_config_chip,
> +};
> +
> +static const struct hwmon_channel_info nouveau_temp = {
> +	.type = hwmon_temp,
> +	.config = nouveau_config_temp,
> +};
> +
> +static const struct hwmon_channel_info nouveau_fan = {
> +	.type = hwmon_fan,
> +	.config = nouveau_config_fan,
> +};
> +
> +static const struct hwmon_channel_info nouveau_in = {
> +	.type = hwmon_in,
> +	.config = nouveau_config_in,
> +};
> +
> +static const struct hwmon_channel_info nouveau_pwm = {
> +	.type = hwmon_pwm,
> +	.config = nouveau_config_pwm,
> +};
> +
> +static const struct hwmon_channel_info nouveau_power = {
> +	.type = hwmon_power,
> +	.config = nouveau_config_power,
> +};
> +
> +static const struct hwmon_channel_info *nouveau_info[] = {
> +	&nouveau_chip,
> +	&nouveau_temp,
> +	&nouveau_fan,
> +	&nouveau_in,
> +	&nouveau_pwm,
> +	&nouveau_power,
> +	NULL
> +};
>   #endif
>   
>   int
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--------------96A9FF6F4AF70E4399E9561D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">Just a non-technical (but important!) point: if you
      send four patches, make sure their title (the first line of your
      git commit messages) describes the content. Given you re-used the
      same title four times, I dare to say it's too generic.</font><br>
    <font size="-1">Also, I noticed that this is not the standard git
      patch format as produced by git format-patch. I don't know whether
      this is a concern (or whether you tweaked the format yourself),
      but in the off chance that you are relatively new to git, I
      recommend you to look up the "git format-patch" and "git
      send-email" commands. They make life a lot easier in our
      mailing-list based work-flow!</font><br>
    <font size="-1">This being said, thanks for the work! I'm sure with
      a bit of minor tweaking this is suitable for upstream.<br>
      <br>
    </font><font size="-1">Roy<br>
      <br>
    </font>
    <div class="moz-cite-prefix">Op 13-04-17 om 10:07 schreef Oscar
      Salvador:<br>
    </div>
    <blockquote cite="mid:20170413090706.qlmph5y4g5iac45l@linux-3pot"
      type="cite">
      <pre wrap="">Hi again,

I've split the patches as Karol Herbst suggested.
I hope now it's fine.

This series of patches introduce the new hwmon_device_register_with_info
and gets rid of the old hwmon_device_register.

This patch adds the default sensors with their possible config values.
Just to prepare for the next patches


--- linux/drivers/gpu/drm/nouveau/nouveau_hwmon.c.orig	2017-04-12 19:18:09.638073562 +0200
+++ linux/drivers/gpu/drm/nouveau/nouveau_hwmon.c	2017-04-12 19:19:44.244797202 +0200
@@ -692,6 +692,78 @@ static const struct attribute_group hwmo
 static const struct attribute_group hwmon_power_caps_attrgroup = {
 	.attrs = hwmon_power_caps_attributes,
 };
+
+static const u32 nouveau_config_chip[] = {
+	HWMON_C_UPDATE_INTERVAL,
+	0
+};
+
+static const u32 nouveau_config_in[] = {
+	HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_LABEL,
+	0
+};
+
+static const u32 nouveau_config_temp[] = {
+	HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
+	HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_EMERGENCY |
+	HWMON_T_EMERGENCY_HYST,
+	0
+};
+
+static const u32 nouveau_config_fan[] = {
+	HWMON_F_INPUT,
+	0
+};
+
+static const u32 nouveau_config_pwm[] = {
+	HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
+	0
+};
+
+static const u32 nouveau_config_power[] = {
+	HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT,
+	0
+};
+
+static const struct hwmon_channel_info nouveau_chip = {
+	.type = hwmon_chip,
+	.config = nouveau_config_chip,
+};
+
+static const struct hwmon_channel_info nouveau_temp = {
+	.type = hwmon_temp,
+	.config = nouveau_config_temp,
+};
+
+static const struct hwmon_channel_info nouveau_fan = {
+	.type = hwmon_fan,
+	.config = nouveau_config_fan,
+};
+
+static const struct hwmon_channel_info nouveau_in = {
+	.type = hwmon_in,
+	.config = nouveau_config_in,
+};
+
+static const struct hwmon_channel_info nouveau_pwm = {
+	.type = hwmon_pwm,
+	.config = nouveau_config_pwm,
+};
+
+static const struct hwmon_channel_info nouveau_power = {
+	.type = hwmon_power,
+	.config = nouveau_config_power,
+};
+
+static const struct hwmon_channel_info *nouveau_info[] = {
+	&amp;nouveau_chip,
+	&amp;nouveau_temp,
+	&amp;nouveau_fan,
+	&amp;nouveau_in,
+	&amp;nouveau_pwm,
+	&amp;nouveau_power,
+	NULL
+};
 #endif
 
 int
_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------96A9FF6F4AF70E4399E9561D--

--===============1537459884==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1537459884==--
