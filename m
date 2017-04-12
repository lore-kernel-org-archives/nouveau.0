From: Oscar Salvador <osalvador.vilardaga@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/1] nouveau_hwmon: migrate to
 hwmon_device_register_with_info
Date: Wed, 12 Apr 2017 09:19:25 +0200
Message-ID: <CAOXBz7gEACVmksABr0Ks8LLdS8tJr+=e-zm_0QuyUPp4=yMwZA@mail.gmail.com>
References: <20170411165457.nnwag3t3lc5r5ihr@linux-3pot>
 <CAEXux-Zmu3eEiAumdQRzQBwbtibp247DPKTiHF-hDwnDr8SCqQ@mail.gmail.com>
 <CAOXBz7ifO9u3RU5xjiv+6DQvjB8rqUbu5qH4c=ifdpNzJ3em8w@mail.gmail.com>
 <CAOXBz7hFShf92Ncuw3mkJ4n9Us0s4kR0+7atJkTSW4-tyerJ-g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1582208990=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CAOXBz7hFShf92Ncuw3mkJ4n9Us0s4kR0+7atJkTSW4-tyerJ-g@mail.gmail.com>
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

--===============1582208990==
Content-Type: multipart/alternative; boundary=f4030435c97c458dd7054cf3076e

--f4030435c97c458dd7054cf3076e
Content-Type: text/plain; charset=UTF-8

Sorry for that. I'll split the patch and I'll come again ;)

El dia 11/04/2017 22:12, "Karol Herbst" <karolherbst@gmail.com> va escriure:

thanks for the work, but could you please split that patch?
It looks like you are doing several things at once and it isn't really
easy to review like this. And it isn't bisectable.

If there are clean ups here, please do it in a seperate patch. I
highly doubt that it all has to be done within one single big patch.

2017-04-11 18:54 GMT+02:00 Oscar Salvador <osalvador.vilardaga@gmail.com>:
> Hi,
>
> this patch replaces the old hwmon_device_register with the new
> hwmon_device_register_with_info.
> I've tested it on my laptop with a GeForceGT 425M and it doesn't break
anything.
>
>
> --- linux/drivers/gpu/drm/nouveau/nouveau_hwmon.c.orig  2017-04-11
18:27:15.477623009 +0200
> +++ linux/drivers/gpu/drm/nouveau/nouveau_hwmon.c       2017-04-11
18:45:41.918688215 +0200
> @@ -1,5 +1,6 @@
>  /*
> - * Copyright 2010 Red Hat Inc.
> + * Copyright 2010 Red Hat Inc. (Ben Skeggs)
> + * Copyright 2017 Oscar Salvador
>   *
>   * Permission is hereby granted, free of charge, to any person obtaining
a
>   * copy of this software and associated documentation files (the
"Software"),
> @@ -19,7 +20,6 @@
>   * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
>   * OTHER DEALINGS IN THE SOFTWARE.
>   *
> - * Authors: Ben Skeggs
>   */
>
>  #ifdef CONFIG_ACPI
> @@ -38,21 +38,17 @@
>  #include <nvkm/subdev/volt.h>
>
>  #if defined(CONFIG_HWMON) || (defined(MODULE) &&
defined(CONFIG_HWMON_MODULE))
> -static ssize_t
> -nouveau_hwmon_show_temp(struct device *d, struct device_attribute *a,
char *buf)
> +static int
> +nouveau_hwmon_show_temp(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>         int temp = nvkm_therm_temp_get(therm);
>
>         if (temp < 0)
>                 return temp;
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n", temp * 1000);
> +       return (temp * 1000);
>  }
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, nouveau_hwmon_show_temp,
> -                                                 NULL, 0);
>
>  static ssize_t
>  nouveau_hwmon_show_temp1_auto_point1_pwm(struct device *d,
> @@ -60,7 +56,7 @@ nouveau_hwmon_show_temp1_auto_point1_pwm
>  {
>         return snprintf(buf, PAGE_SIZE, "%d\n", 100);
>  }
> -static SENSOR_DEVICE_ATTR(temp1_auto_point1_pwm, S_IRUGO,
> +static SENSOR_DEVICE_ATTR(temp1_auto_point1_pwm, 0444,
>                           nouveau_hwmon_show_temp1_auto_point1_pwm, NULL,
0);
>
>  static ssize_t
> @@ -92,7 +88,7 @@ nouveau_hwmon_set_temp1_auto_point1_temp
>
>         return count;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_auto_point1_temp, S_IRUGO | S_IWUSR,
> +static SENSOR_DEVICE_ATTR(temp1_auto_point1_temp, 0644,
>                           nouveau_hwmon_temp1_auto_point1_temp,
>                           nouveau_hwmon_set_temp1_auto_point1_temp, 0);
>
> @@ -125,319 +121,176 @@ nouveau_hwmon_set_temp1_auto_point1_temp
>
>         return count;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_auto_point1_temp_hyst, S_IRUGO | S_IWUSR,
> +static SENSOR_DEVICE_ATTR(temp1_auto_point1_temp_hyst, 0644,
>                           nouveau_hwmon_temp1_auto_point1_temp_hyst,
>                           nouveau_hwmon_set_temp1_auto_point1_temp_hyst,
0);
>
> -static ssize_t
> -nouveau_hwmon_max_temp(struct device *d, struct device_attribute *a,
char *buf)
> +static int
> +nouveau_hwmon_max_temp(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
> -              therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK) *
1000);
> +       return (therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK) *
1000);
>  }
> -static ssize_t
> -nouveau_hwmon_set_max_temp(struct device *d, struct device_attribute *a,
> -                                               const char *buf, size_t
count)
> +
> +static int
> +nouveau_hwmon_set_max_temp(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
> -
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return count;
>
> -       therm->attr_set(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK, value /
1000);
> -
> -       return count;
> +       therm->attr_set(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK, val / 1000);
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR,
nouveau_hwmon_max_temp,
> -
 nouveau_hwmon_set_max_temp,
> -                                                 0);
>
> -static ssize_t
> -nouveau_hwmon_max_temp_hyst(struct device *d, struct device_attribute *a,
> -                           char *buf)
> +static int
> +nouveau_hwmon_max_temp_hyst(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
> -         therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK_HYST) *
1000);
> +       return (therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK_HYST)
> +                                                               * 1000);
>  }
> -static ssize_t
> -nouveau_hwmon_set_max_temp_hyst(struct device *d, struct
device_attribute *a,
> -                                               const char *buf, size_t
count)
> +
> +static int
> +nouveau_hwmon_set_max_temp_hyst(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
> -
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return count;
>
>         therm->attr_set(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK_HYST,
> -                       value / 1000);
> -
> -       return count;
> +                       val / 1000);
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IRUGO | S_IWUSR,
> -                         nouveau_hwmon_max_temp_hyst,
> -                         nouveau_hwmon_set_max_temp_hyst, 0);
>
> -static ssize_t
> -nouveau_hwmon_critical_temp(struct device *d, struct device_attribute *a,
> -                                                       char *buf)
> +static int
> +nouveau_hwmon_critical_temp(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
> -              therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL) *
1000);
> +       return (therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL) *
1000);
>  }
> -static ssize_t
> -nouveau_hwmon_set_critical_temp(struct device *d, struct
device_attribute *a,
> -                                                           const char
*buf,
> -                                                               size_t
count)
> +
> +static int
> +nouveau_hwmon_set_critical_temp(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
> -
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return count;
>
> -       therm->attr_set(therm, NVKM_THERM_ATTR_THRS_CRITICAL, value /
1000);
> +       therm->attr_set(therm, NVKM_THERM_ATTR_THRS_CRITICAL, val / 1000);
>
> -       return count;
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO | S_IWUSR,
> -
 nouveau_hwmon_critical_temp,
> -
 nouveau_hwmon_set_critical_temp,
> -                                               0);
>
> -static ssize_t
> -nouveau_hwmon_critical_temp_hyst(struct device *d, struct
device_attribute *a,
> -                                                       char *buf)
> +static int
> +nouveau_hwmon_critical_temp_hyst(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
> -         therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL_HYST) *
1000);
> +       return (therm->attr_get(therm, NVKM_THERM_ATTR_THRS_CRITICAL_HYST)
> +                                                               * 1000);
>  }
> -static ssize_t
> -nouveau_hwmon_set_critical_temp_hyst(struct device *d,
> -                                    struct device_attribute *a,
> -                                    const char *buf,
> -                                    size_t count)
> +
> +static int
> +nouveau_hwmon_set_critical_temp_hyst(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
> -
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return count;
>
>         therm->attr_set(therm, NVKM_THERM_ATTR_THRS_CRITICAL_HYST,
> -                       value / 1000);
> -
> -       return count;
> +                       val / 1000);
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IRUGO | S_IWUSR,
> -                         nouveau_hwmon_critical_temp_hyst,
> -                         nouveau_hwmon_set_critical_temp_hyst, 0);
> -static ssize_t
> -nouveau_hwmon_emergency_temp(struct device *d, struct device_attribute
*a,
> -                                                       char *buf)
> +
> +static int
> +nouveau_hwmon_emergency_temp(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
> -              therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN) *
1000);
> +       return (therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN) *
1000);
>  }
> -static ssize_t
> -nouveau_hwmon_set_emergency_temp(struct device *d, struct
device_attribute *a,
> -                                                           const char
*buf,
> -                                                               size_t
count)
> +
> +static int
> +nouveau_hwmon_set_emergency_temp(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
> -
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return count;
> -
> -       therm->attr_set(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN, value /
1000);
>
> -       return count;
> +       therm->attr_set(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN, val / 1000);
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(temp1_emergency, S_IRUGO | S_IWUSR,
> -                                       nouveau_hwmon_emergency_temp,
> -                                       nouveau_hwmon_set_emergency_temp,
> -                                       0);
>
> -static ssize_t
> -nouveau_hwmon_emergency_temp_hyst(struct device *d, struct
device_attribute *a,
> -                                                       char *buf)
> +static int
> +nouveau_hwmon_emergency_temp_hyst(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
> -         therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN_HYST) *
1000);
> +       return (therm->attr_get(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN_HYST)
> +                                                               * 1000);
>  }
> -static ssize_t
> -nouveau_hwmon_set_emergency_temp_hyst(struct device *d,
> -                                     struct device_attribute *a,
> -                                     const char *buf,
> -                                     size_t count)
> +
> +static int
> +nouveau_hwmon_set_emergency_temp_hyst(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
> -
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return count;
>
>         therm->attr_set(therm, NVKM_THERM_ATTR_THRS_SHUTDOWN_HYST,
> -                       value / 1000);
> -
> -       return count;
> -}
> -static SENSOR_DEVICE_ATTR(temp1_emergency_hyst, S_IRUGO | S_IWUSR,
> -                                       nouveau_hwmon_emergency_temp_hyst,
> -                                       nouveau_hwmon_set_emergency_
temp_hyst,
> -                                       0);
> -
> -static ssize_t nouveau_hwmon_show_name(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     char *buf)
> -{
> -       return sprintf(buf, "nouveau\n");
> +                       val / 1000);
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(name, S_IRUGO, nouveau_hwmon_show_name, NULL,
0);
>
> -static ssize_t nouveau_hwmon_show_update_rate(struct device *dev,
> -                                     struct device_attribute *attr,
> -                                     char *buf)
> +static int
> +nouveau_hwmon_show_update_rate(struct nouveau_drm *drm)
>  {
> -       return sprintf(buf, "1000\n");
> +       return 1000;
>  }
> -static SENSOR_DEVICE_ATTR(update_rate, S_IRUGO,
> -                                               nouveau_hwmon_show_update_
rate,
> -                                               NULL, 0);
>
> -static ssize_t
> -nouveau_hwmon_show_fan1_input(struct device *d, struct device_attribute
*attr,
> -                             char *buf)
> +static int
> +nouveau_hwmon_show_fan1_input(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>
> -       return snprintf(buf, PAGE_SIZE, "%d\n",
nvkm_therm_fan_sense(therm));
> +       return nvkm_therm_fan_sense(therm);
>  }
> -static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO,
nouveau_hwmon_show_fan1_input,
> -                         NULL, 0);
>
> - static ssize_t
> -nouveau_hwmon_get_pwm1_enable(struct device *d,
> -                          struct device_attribute *a, char *buf)
> +static int
> +nouveau_hwmon_get_pwm1_enable(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       int ret;
>
> -       ret = therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);
> -       if (ret < 0)
> -               return ret;
> -
> -       return sprintf(buf, "%i\n", ret);
> +       return therm->attr_get(therm, NVKM_THERM_ATTR_FAN_MODE);
>  }
>
> -static ssize_t
> -nouveau_hwmon_set_pwm1_enable(struct device *d, struct device_attribute
*a,
> -                          const char *buf, size_t count)
> +static int
> +nouveau_hwmon_set_pwm1_enable(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       long value;
>         int ret;
>
> -       ret = kstrtol(buf, 10, &value);
> +       ret = therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MODE, val);
>         if (ret)
>                 return ret;
> -
> -       ret = therm->attr_set(therm, NVKM_THERM_ATTR_FAN_MODE, value);
> -       if (ret)
> -               return ret;
> -       else
> -               return count;
> +       return val;
>  }
> -static SENSOR_DEVICE_ATTR(pwm1_enable, S_IRUGO | S_IWUSR,
> -                         nouveau_hwmon_get_pwm1_enable,
> -                         nouveau_hwmon_set_pwm1_enable, 0);
>
> -static ssize_t
> -nouveau_hwmon_get_pwm1(struct device *d, struct device_attribute *a,
char *buf)
> +static int
> +nouveau_hwmon_get_pwm1(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       int ret;
>
> -       ret = therm->fan_get(therm);
> -       if (ret < 0)
> -               return ret;
> -
> -       return sprintf(buf, "%i\n", ret);
> +       return therm->fan_get(therm);
>  }
>
> -static ssize_t
> -nouveau_hwmon_set_pwm1(struct device *d, struct device_attribute *a,
> -                      const char *buf, size_t count)
> +static int
> +nouveau_hwmon_set_pwm1(struct nouveau_drm *drm, long val)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
>         int ret = -ENODEV;
> -       long value;
>
> -       if (kstrtol(buf, 10, &value) == -EINVAL)
> -               return -EINVAL;
> -
> -       ret = therm->fan_set(therm, value);
> +       ret = therm->fan_set(therm, val);
>         if (ret)
>                 return ret;
> -
> -       return count;
> +       return val;
>  }
>
> -static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR,
> -                         nouveau_hwmon_get_pwm1,
> -                         nouveau_hwmon_set_pwm1, 0);
> -
>  static ssize_t
>  nouveau_hwmon_get_pwm1_min(struct device *d,
> -                          struct device_attribute *a, char *buf)
> +                               struct device_attribute *a, char *buf)
>  {
>         struct drm_device *dev = dev_get_drvdata(d);
>         struct nouveau_drm *drm = nouveau_drm(dev);
> @@ -453,7 +306,7 @@ nouveau_hwmon_get_pwm1_min(struct device
>
>  static ssize_t
>  nouveau_hwmon_set_pwm1_min(struct device *d, struct device_attribute *a,
> -                          const char *buf, size_t count)
> +                               const char *buf, size_t count)
>  {
>         struct drm_device *dev = dev_get_drvdata(d);
>         struct nouveau_drm *drm = nouveau_drm(dev);
> @@ -471,13 +324,13 @@ nouveau_hwmon_set_pwm1_min(struct device
>         return count;
>  }
>
> -static SENSOR_DEVICE_ATTR(pwm1_min, S_IRUGO | S_IWUSR,
> -                         nouveau_hwmon_get_pwm1_min,
> -                         nouveau_hwmon_set_pwm1_min, 0);
> +static SENSOR_DEVICE_ATTR(pwm1_min, 0644,
> +                       nouveau_hwmon_get_pwm1_min,
> +                       nouveau_hwmon_set_pwm1_min, 0);
>
>  static ssize_t
>  nouveau_hwmon_get_pwm1_max(struct device *d,
> -                          struct device_attribute *a, char *buf)
> +                               struct device_attribute *a, char *buf)
>  {
>         struct drm_device *dev = dev_get_drvdata(d);
>         struct nouveau_drm *drm = nouveau_drm(dev);
> @@ -493,7 +346,7 @@ nouveau_hwmon_get_pwm1_max(struct device
>
>  static ssize_t
>  nouveau_hwmon_set_pwm1_max(struct device *d, struct device_attribute *a,
> -                          const char *buf, size_t count)
> +                               const char *buf, size_t count)
>  {
>         struct drm_device *dev = dev_get_drvdata(d);
>         struct nouveau_drm *drm = nouveau_drm(dev);
> @@ -511,16 +364,13 @@ nouveau_hwmon_set_pwm1_max(struct device
>         return count;
>  }
>
> -static SENSOR_DEVICE_ATTR(pwm1_max, S_IRUGO | S_IWUSR,
> -                         nouveau_hwmon_get_pwm1_max,
> -                         nouveau_hwmon_set_pwm1_max, 0);
> +static SENSOR_DEVICE_ATTR(pwm1_max, 0644,
> +                       nouveau_hwmon_get_pwm1_max,
> +                       nouveau_hwmon_set_pwm1_max, 0);
>
> -static ssize_t
> -nouveau_hwmon_get_in0_input(struct device *d,
> -                           struct device_attribute *a, char *buf)
> +static int
> +nouveau_hwmon_get_in0_input(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>         int ret;
>
> @@ -528,169 +378,524 @@ nouveau_hwmon_get_in0_input(struct devic
>         if (ret < 0)
>                 return ret;
>
> -       return sprintf(buf, "%i\n", ret / 1000);
> +       return (ret / 1000);
>  }
>
> -static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO,
> -                         nouveau_hwmon_get_in0_input, NULL, 0);
> -
> -static ssize_t
> -nouveau_hwmon_get_in0_min(struct device *d,
> -                           struct device_attribute *a, char *buf)
> +static int
> +nouveau_hwmon_get_in0_min(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>
>         if (!volt || !volt->min_uv)
>                 return -ENODEV;
>
> -       return sprintf(buf, "%i\n", volt->min_uv / 1000);
> +       return (volt->min_uv / 1000);
>  }
>
> -static SENSOR_DEVICE_ATTR(in0_min, S_IRUGO,
> -                         nouveau_hwmon_get_in0_min, NULL, 0);
> -
> -static ssize_t
> -nouveau_hwmon_get_in0_max(struct device *d,
> -                           struct device_attribute *a, char *buf)
> +static int
> +nouveau_hwmon_get_in0_max(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
>
>         if (!volt || !volt->max_uv)
>                 return -ENODEV;
>
> -       return sprintf(buf, "%i\n", volt->max_uv / 1000);
> +       return (volt->max_uv / 1000);
>  }
>
> -static SENSOR_DEVICE_ATTR(in0_max, S_IRUGO,
> -                         nouveau_hwmon_get_in0_max, NULL, 0);
> -
> -static ssize_t
> -nouveau_hwmon_get_in0_label(struct device *d,
> -                           struct device_attribute *a, char *buf)
> +static int
> +nouveau_hwmon_get_power1_input(struct nouveau_drm *drm)
>  {
> -       return sprintf(buf, "GPU core\n");
> -}
> -
> -static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO,
> -                         nouveau_hwmon_get_in0_label, NULL, 0);
> -
> -static ssize_t
> -nouveau_hwmon_get_power1_input(struct device *d, struct device_attribute
*a,
> -                              char *buf)
> -{
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.
device);
>         int result = nvkm_iccsense_read_all(iccsense);
>
> -       if (result < 0)
> -               return result;
> -
> -       return sprintf(buf, "%i\n", result);
> +       return result;
>  }
>
> -static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO,
> -                         nouveau_hwmon_get_power1_input, NULL, 0);
> -
> -static ssize_t
> -nouveau_hwmon_get_power1_max(struct device *d, struct device_attribute
*a,
> -                            char *buf)
> +static int
> +nouveau_hwmon_get_power1_max(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.
device);
> -       return sprintf(buf, "%i\n", iccsense->power_w_max);
> -}
>
> -static SENSOR_DEVICE_ATTR(power1_max, S_IRUGO,
> -                         nouveau_hwmon_get_power1_max, NULL, 0);
> +       return iccsense->power_w_max;
> +}
>
> -static ssize_t
> -nouveau_hwmon_get_power1_crit(struct device *d, struct device_attribute
*a,
> -                             char *buf)
> +static int
> +nouveau_hwmon_get_power1_crit(struct nouveau_drm *drm)
>  {
> -       struct drm_device *dev = dev_get_drvdata(d);
> -       struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.
device);
> -       return sprintf(buf, "%i\n", iccsense->power_w_crit);
> -}
>
> -static SENSOR_DEVICE_ATTR(power1_crit, S_IRUGO,
> -                         nouveau_hwmon_get_power1_crit, NULL, 0);
> +       return iccsense->power_w_crit;
> +}
>
> -static struct attribute *hwmon_default_attributes[] = {
> -       &sensor_dev_attr_name.dev_attr.attr,
> -       &sensor_dev_attr_update_rate.dev_attr.attr,
> +static struct attribute *pwm_fan_sensor_attrs[] = {
> +       &sensor_dev_attr_pwm1_min.dev_attr.attr,
> +       &sensor_dev_attr_pwm1_max.dev_attr.attr,
>         NULL
>  };
> -static struct attribute *hwmon_temp_attributes[] = {
> -       &sensor_dev_attr_temp1_input.dev_attr.attr,
> +ATTRIBUTE_GROUPS(pwm_fan_sensor);
> +
> +static struct attribute *temp1_auto_point_sensor_attrs[] = {
>         &sensor_dev_attr_temp1_auto_point1_pwm.dev_attr.attr,
>         &sensor_dev_attr_temp1_auto_point1_temp.dev_attr.attr,
>         &sensor_dev_attr_temp1_auto_point1_temp_hyst.dev_attr.attr,
> -       &sensor_dev_attr_temp1_max.dev_attr.attr,
> -       &sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
> -       &sensor_dev_attr_temp1_crit.dev_attr.attr,
> -       &sensor_dev_attr_temp1_crit_hyst.dev_attr.attr,
> -       &sensor_dev_attr_temp1_emergency.dev_attr.attr,
> -       &sensor_dev_attr_temp1_emergency_hyst.dev_attr.attr,
>         NULL
>  };
> -static struct attribute *hwmon_fan_rpm_attributes[] = {
> -       &sensor_dev_attr_fan1_input.dev_attr.attr,
> -       NULL
> +ATTRIBUTE_GROUPS(temp1_auto_point_sensor);
> +
> +#define N_ATTR_GROUPS  3
> +
> +static const u32 nouveau_config_chip[] = {
> +       HWMON_C_UPDATE_INTERVAL,
> +       0
>  };
> -static struct attribute *hwmon_pwm_fan_attributes[] = {
> -       &sensor_dev_attr_pwm1_enable.dev_attr.attr,
> -       &sensor_dev_attr_pwm1.dev_attr.attr,
> -       &sensor_dev_attr_pwm1_min.dev_attr.attr,
> -       &sensor_dev_attr_pwm1_max.dev_attr.attr,
> -       NULL
> +
> +static const u32 nouveau_config_in[] = {
> +       HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX | HWMON_I_LABEL,
> +       0
>  };
>
> -static struct attribute *hwmon_in0_attributes[] = {
> -       &sensor_dev_attr_in0_input.dev_attr.attr,
> -       &sensor_dev_attr_in0_min.dev_attr.attr,
> -       &sensor_dev_attr_in0_max.dev_attr.attr,
> -       &sensor_dev_attr_in0_label.dev_attr.attr,
> -       NULL
> +static const u32 nouveau_config_temp[] = {
> +       HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
> +       HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T_EMERGENCY |
> +       HWMON_T_EMERGENCY_HYST,
> +       0
>  };
>
> -static struct attribute *hwmon_power_attributes[] = {
> -       &sensor_dev_attr_power1_input.dev_attr.attr,
> -       NULL
> +static const u32 nouveau_config_fan[] = {
> +       HWMON_F_INPUT,
> +       0
>  };
>
> -static struct attribute *hwmon_power_caps_attributes[] = {
> -       &sensor_dev_attr_power1_max.dev_attr.attr,
> -       &sensor_dev_attr_power1_crit.dev_attr.attr,
> -       NULL
> +static const u32 nouveau_config_pwm[] = {
> +       HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
> +       0
>  };
>
> -static const struct attribute_group hwmon_default_attrgroup = {
> -       .attrs = hwmon_default_attributes,
> +static const u32 nouveau_config_power[] = {
> +       HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_CRIT,
> +       0
>  };
> -static const struct attribute_group hwmon_temp_attrgroup = {
> -       .attrs = hwmon_temp_attributes,
> +
> +static const struct hwmon_channel_info nouveau_chip = {
> +       .type = hwmon_chip,
> +       .config = nouveau_config_chip,
>  };
> -static const struct attribute_group hwmon_fan_rpm_attrgroup = {
> -       .attrs = hwmon_fan_rpm_attributes,
> +
> +static const struct hwmon_channel_info nouveau_temp = {
> +       .type = hwmon_temp,
> +       .config = nouveau_config_temp,
>  };
> -static const struct attribute_group hwmon_pwm_fan_attrgroup = {
> -       .attrs = hwmon_pwm_fan_attributes,
> +
> +static const struct hwmon_channel_info nouveau_fan = {
> +       .type = hwmon_fan,
> +       .config = nouveau_config_fan,
>  };
> -static const struct attribute_group hwmon_in0_attrgroup = {
> -       .attrs = hwmon_in0_attributes,
> +
> +static const struct hwmon_channel_info nouveau_in = {
> +       .type = hwmon_in,
> +       .config = nouveau_config_in,
> +};
> +
> +static const struct hwmon_channel_info nouveau_pwm = {
> +       .type = hwmon_pwm,
> +       .config = nouveau_config_pwm,
>  };
> -static const struct attribute_group hwmon_power_attrgroup = {
> -       .attrs = hwmon_power_attributes,
> +
> +static const struct hwmon_channel_info nouveau_power = {
> +       .type = hwmon_power,
> +       .config = nouveau_config_power,
>  };
> -static const struct attribute_group hwmon_power_caps_attrgroup = {
> -       .attrs = hwmon_power_caps_attributes,
> +
> +static const struct hwmon_channel_info *nouveau_info[] = {
> +       &nouveau_chip,
> +       &nouveau_temp,
> +       &nouveau_fan,
> +       &nouveau_in,
> +       &nouveau_pwm,
> +       &nouveau_power,
> +       NULL
> +};
> +
> +static umode_t
> +nouveau_chip_is_visible(const void *data, u32 attr, int channel)
> +{
> +       switch (attr) {
> +       case hwmon_chip_update_interval:
> +               return 0444;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static umode_t
> +nouveau_power_is_visible(const void *data, u32 attr, int channel)
> +{
> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> +       struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.
device);
> +
> +       switch (attr) {
> +       case hwmon_power_input:
> +               if (iccsense && iccsense->data_valid &&
> +                               !list_empty(&iccsense->rails))
> +                       return 0444;
> +       case hwmon_power_max:
> +       case hwmon_power_crit:
> +               if (iccsense->power_w_max && iccsense->power_w_crit)
> +                       return 0444;
> +       default:
> +               return 0;
> +       }
> +
> +}
> +
> +static umode_t
> +nouveau_temp_is_visible(const void *data, u32 attr, int channel)
> +{
> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> +       struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> +
> +       if (therm && therm->attr_get && therm->attr_set)
> +               if (nvkm_therm_temp_get(therm) < 0)
> +                       return 0;
> +
> +       switch (attr) {
> +       case hwmon_temp_input:
> +               return 0444;
> +       case hwmon_temp_max:
> +       case hwmon_temp_max_hyst:
> +       case hwmon_temp_crit:
> +       case hwmon_temp_crit_hyst:
> +       case hwmon_temp_emergency:
> +       case hwmon_temp_emergency_hyst:
> +               return 0644;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static umode_t
> +nouveau_pwm_is_visible(const void *data, u32 attr, int channel)
> +{
> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> +       struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> +
> +       if (therm && therm->attr_get)
> +               if (therm->fan_get && therm->fan_get(therm) < 0)
> +                       return 0;
> +
> +       switch (attr) {
> +       case hwmon_pwm_enable:
> +       case hwmon_pwm_input:
> +               return 0644;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static umode_t
> +nouveau_input_is_visible(const void *data, u32 attr, int channel)
> +{
> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> +       struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> +
> +       if (!volt || nvkm_volt_get(volt) < 0)
> +               return 0;
> +
> +       switch (attr) {
> +       case hwmon_in_input:
> +       case hwmon_in_label:
> +       case hwmon_in_min:
> +       case hwmon_in_max:
> +               return 0444;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static umode_t
> +nouveau_fan_is_visible(const void *data, u32 attr, int channel)
> +{
> +       struct nouveau_drm *drm = nouveau_drm((struct drm_device *)data);
> +       struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> +
> +       if (!therm || !therm->attr_get || nvkm_therm_fan_sense(therm) < 0)
> +               return 0;
> +
> +       switch (attr) {
> +       case hwmon_fan_input:
> +               return 0444;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static int
> +nouveau_chip_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_chip_update_interval:
> +               *val = nouveau_hwmon_show_update_rate(drm);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_temp_input:
> +               *val = nouveau_hwmon_show_temp(drm);
> +               break;
> +       case hwmon_temp_max:
> +               *val = nouveau_hwmon_max_temp(drm);
> +               break;
> +       case hwmon_temp_max_hyst:
> +               *val = nouveau_hwmon_max_temp_hyst(drm);
> +               break;
> +       case hwmon_temp_crit:
> +               *val = nouveau_hwmon_critical_temp(drm);
> +               break;
> +       case hwmon_temp_crit_hyst:
> +               *val = nouveau_hwmon_critical_temp_hyst(drm);
> +               break;
> +       case hwmon_temp_emergency:
> +               *val = nouveau_hwmon_emergency_temp(drm);
> +               break;
> +       case hwmon_temp_emergency_hyst:
> +               *val = nouveau_hwmon_emergency_temp_hyst(drm);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_fan_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_fan_input:
> +               *val = nouveau_hwmon_show_fan1_input(drm);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_in_input:
> +               *val = nouveau_hwmon_get_in0_input(drm);
> +               break;
> +       case hwmon_in_min:
> +               *val = nouveau_hwmon_get_in0_min(drm);
> +               break;
> +       case hwmon_in_max:
> +               *val = nouveau_hwmon_get_in0_max(drm);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_pwm_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_pwm_enable:
> +               *val = nouveau_hwmon_get_pwm1_enable(drm);
> +               break;
> +       case hwmon_pwm_input:
> +               *val = nouveau_hwmon_get_pwm1(drm);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_power_read(struct device *dev, u32 attr, int channel, long *val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_power_input:
> +               *val = nouveau_hwmon_get_power1_input(drm);
> +               break;
> +       case hwmon_power_max:
> +               *val = nouveau_hwmon_get_power1_max(drm);
> +               break;
> +       case hwmon_power_crit:
> +               *val = nouveau_hwmon_get_power1_crit(drm);
> +               break;
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_temp_write(struct device *dev, u32 attr, int channel, long val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_temp_max:
> +               nouveau_hwmon_set_max_temp(drm, val);
> +               break;
> +       case hwmon_temp_max_hyst:
> +               nouveau_hwmon_set_max_temp_hyst(drm, val);
> +               break;
> +       case hwmon_temp_crit:
> +               nouveau_hwmon_set_critical_temp(drm, val);
> +               break;
> +       case hwmon_temp_crit_hyst:
> +               nouveau_hwmon_set_critical_temp_hyst(drm, val);
> +               break;
> +       case hwmon_temp_emergency:
> +               nouveau_hwmon_set_emergency_temp(drm, val);
> +               break;
> +       case hwmon_temp_emergency_hyst:
> +               nouveau_hwmon_set_emergency_temp_hyst(drm, val);
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int
> +nouveau_pwm_write(struct device *dev, u32 attr, int channel, long val)
> +{
> +       struct drm_device *drm_dev = dev_get_drvdata(dev);
> +       struct nouveau_drm *drm = nouveau_drm(drm_dev);
> +
> +       switch (attr) {
> +       case hwmon_pwm_input:
> +               nouveau_hwmon_set_pwm1(drm, val);
> +               break;
> +       case hwmon_pwm_enable:
> +               nouveau_hwmon_set_pwm1_enable(drm, val);
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static umode_t
> +nouveau_is_visible(const void *data, enum hwmon_sensor_types type, u32
attr,
> +                                                               int
channel)
> +{
> +       switch (type) {
> +       case hwmon_chip:
> +               return nouveau_chip_is_visible(data, attr, channel);
> +       case hwmon_temp:
> +               return nouveau_temp_is_visible(data, attr, channel);
> +       case hwmon_fan:
> +               return nouveau_fan_is_visible(data, attr, channel);
> +       case hwmon_in:
> +               return nouveau_input_is_visible(data, attr, channel);
> +       case hwmon_pwm:
> +               return nouveau_pwm_is_visible(data, attr, channel);
> +       case hwmon_power:
> +               return nouveau_power_is_visible(data, attr, channel);
> +       default:
> +               return 0;
> +       }
> +}
> +
> +
> +static char *input_label = "GPU core";
> +
> +static int
> +nouveau_read_string(struct device *dev, enum hwmon_sensor_types type,
u32 attr,
> +                                               int channel, char **buf)
> +{
> +       if (type == hwmon_in && attr == hwmon_in_label) {
> +               *buf = input_label;
> +               return 0;
> +       }
> +
> +       return -EOPNOTSUPP;
> +}
> +
> +static int
> +nouveau_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +                                               int channel, long *val)
> +{
> +       switch (type) {
> +       case hwmon_chip:
> +               return nouveau_chip_read(dev, attr, channel, val);
> +       case hwmon_temp:
> +               return nouveau_temp_read(dev, attr, channel, val);
> +       case hwmon_fan:
> +               return nouveau_fan_read(dev, attr, channel, val);
> +       case hwmon_in:
> +               return nouveau_in_read(dev, attr, channel, val);
> +       case hwmon_pwm:
> +               return nouveau_pwm_read(dev, attr, channel, val);
> +       case hwmon_power:
> +               return nouveau_power_read(dev, attr, channel, val);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
> +static int
> +nouveau_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +                                               int channel, long val)
> +{
> +       switch (type) {
> +       case hwmon_temp:
> +               return nouveau_temp_write(dev, attr, channel, val);
> +       case hwmon_pwm:
> +               return nouveau_pwm_write(dev, attr, channel, val);
> +       default:
> +               return -EOPNOTSUPP;
> +       }
> +}
> +
> +static const struct hwmon_ops nouveau_hwmon_ops = {
> +       .is_visible = nouveau_is_visible,
> +       .read = nouveau_read,
> +       .read_string = nouveau_read_string,
> +       .write = nouveau_write,
> +};
> +
> +static const struct hwmon_chip_info nouveau_chip_info = {
> +       .ops = &nouveau_hwmon_ops,
> +       .info = nouveau_info,
>  };
>  #endif
>
> @@ -700,90 +905,36 @@ nouveau_hwmon_init(struct drm_device *de
>  #if defined(CONFIG_HWMON) || (defined(MODULE) &&
defined(CONFIG_HWMON_MODULE))
>         struct nouveau_drm *drm = nouveau_drm(dev);
>         struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
> -       struct nvkm_volt *volt = nvxx_volt(&drm->client.device);
> -       struct nvkm_iccsense *iccsense = nvxx_iccsense(&drm->client.
device);
>         struct nouveau_hwmon *hwmon;
>         struct device *hwmon_dev;
> +       const struct attribute_group *special_groups[N_ATTR_GROUPS];
>         int ret = 0;
> +       int i = 0;
>
>         hwmon = drm->hwmon = kzalloc(sizeof(*hwmon), GFP_KERNEL);
>         if (!hwmon)
>                 return -ENOMEM;
>         hwmon->dev = dev;
>
> -       hwmon_dev = hwmon_device_register(dev->dev);
> +       if (therm && therm->attr_get && therm->attr_set) {
> +               if (nvkm_therm_temp_get(therm) >= 0)
> +                       special_groups[i++] = &temp1_auto_point_sensor_
group;
> +               if (therm->fan_get && therm->fan_get(therm) >= 0)
> +                       special_groups[i++] = &pwm_fan_sensor_group;
> +       }
> +
> +       special_groups[i] = 0;
> +       hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau",
dev,
> +                                       &nouveau_chip_info,
special_groups);
> +
>         if (IS_ERR(hwmon_dev)) {
>                 ret = PTR_ERR(hwmon_dev);
>                 NV_ERROR(drm, "Unable to register hwmon device: %d\n",
ret);
>                 return ret;
>         }
> -       dev_set_drvdata(hwmon_dev, dev);
> -
> -       /* set the default attributes */
> -       ret = sysfs_create_group(&hwmon_dev->kobj,
&hwmon_default_attrgroup);
> -       if (ret)
> -               goto error;
> -
> -       if (therm && therm->attr_get && therm->attr_set) {
> -               /* if the card has a working thermal sensor */
> -               if (nvkm_therm_temp_get(therm) >= 0) {
> -                       ret = sysfs_create_group(&hwmon_dev->kobj,
&hwmon_temp_attrgroup);
> -                       if (ret)
> -                               goto error;
> -               }
> -
> -               /* if the card has a pwm fan */
> -               /*XXX: incorrect, need better detection for this, some
boards have
> -                *     the gpio entries for pwm fan control even when
there's no
> -                *     actual fan connected to it... therm table? */
> -               if (therm->fan_get && therm->fan_get(therm) >= 0) {
> -                       ret = sysfs_create_group(&hwmon_dev->kobj,
> -
&hwmon_pwm_fan_attrgroup);
> -                       if (ret)
> -                               goto error;
> -               }
> -       }
> -
> -       /* if the card can read the fan rpm */
> -       if (therm && nvkm_therm_fan_sense(therm) >= 0) {
> -               ret = sysfs_create_group(&hwmon_dev->kobj,
> -                                        &hwmon_fan_rpm_attrgroup);
> -               if (ret)
> -                       goto error;
> -       }
> -
> -       if (volt && nvkm_volt_get(volt) >= 0) {
> -               ret = sysfs_create_group(&hwmon_dev->kobj,
> -                                        &hwmon_in0_attrgroup);
> -
> -               if (ret)
> -                       goto error;
> -       }
> -
> -       if (iccsense && iccsense->data_valid &&
!list_empty(&iccsense->rails)) {
> -               ret = sysfs_create_group(&hwmon_dev->kobj,
> -                                        &hwmon_power_attrgroup);
> -
> -               if (ret)
> -                       goto error;
> -
> -               if (iccsense->power_w_max && iccsense->power_w_crit) {
> -                       ret = sysfs_create_group(&hwmon_dev->kobj,
> -
&hwmon_power_caps_attrgroup);
> -                       if (ret)
> -                               goto error;
> -               }
> -       }
>
>         hwmon->hwmon = hwmon_dev;
> -
>         return 0;
> -
> -error:
> -       NV_ERROR(drm, "Unable to create some hwmon sysfs files: %d\n",
ret);
> -       hwmon_device_unregister(hwmon_dev);
> -       hwmon->hwmon = NULL;
> -       return ret;
>  #else
>         return 0;
>  #endif
> @@ -795,17 +946,8 @@ nouveau_hwmon_fini(struct drm_device *de
>  #if defined(CONFIG_HWMON) || (defined(MODULE) &&
defined(CONFIG_HWMON_MODULE))
>         struct nouveau_hwmon *hwmon = nouveau_hwmon(dev);
>
> -       if (hwmon->hwmon) {
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_default_attrgroup);
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_temp_attrgroup);
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_pwm_fan_attrgroup);
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_fan_rpm_attrgroup);
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_in0_attrgroup);
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_power_attrgroup);
> -               sysfs_remove_group(&hwmon->hwmon->kobj,
&hwmon_power_caps_attrgroup);
> -
> +       if (hwmon->hwmon)
>                 hwmon_device_unregister(hwmon->hwmon);
> -       }
>
>         nouveau_drm(dev)->hwmon = NULL;
>         kfree(hwmon);
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau

--f4030435c97c458dd7054cf3076e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Sorry for that. I&#39;ll split the patch and I&#39;ll com=
e again ;)</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">E=
l dia 11/04/2017 22:12, &quot;Karol Herbst&quot; &lt;<a href=3D"mailto:karo=
lherbst@gmail.com">karolherbst@gmail.com</a>&gt; va escriure:<br type=3D"at=
tribution"><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">thanks for the work, but could you plea=
se split that patch?<br>
It looks like you are doing several things at once and it isn&#39;t really<=
br>
easy to review like this. And it isn&#39;t bisectable.<br>
<br>
If there are clean ups here, please do it in a seperate patch. I<br>
highly doubt that it all has to be done within one single big patch.<br>
<div class=3D"elided-text"><br>
2017-04-11 18:54 GMT+02:00 Oscar Salvador &lt;<a href=3D"mailto:osalvador.v=
ilardaga@gmail.com">osalvador.vilardaga@gmail.com</a><wbr>&gt;:<br>
&gt; Hi,<br>
&gt;<br>
&gt; this patch replaces the old hwmon_device_register with the new<br>
&gt; hwmon_device_register_with_<wbr>info.<br>
&gt; I&#39;ve tested it on my laptop with a GeForceGT 425M and it doesn&#39=
;t break anything.<br>
&gt;<br>
&gt;<br>
&gt; --- linux/drivers/gpu/drm/nouveau/<wbr>nouveau_hwmon.c.orig=C2=A0 2017=
-04-11 18:27:15.477623009 +0200<br>
&gt; +++ linux/drivers/gpu/drm/nouveau/<wbr>nouveau_hwmon.c=C2=A0 =C2=A0 =
=C2=A0 =C2=A02017-04-11 18:45:41.918688215 +0200<br>
&gt; @@ -1,5 +1,6 @@<br>
&gt;=C2=A0 /*<br>
&gt; - * Copyright 2010 Red Hat Inc.<br>
&gt; + * Copyright 2010 Red Hat Inc. (Ben Skeggs)<br>
&gt; + * Copyright 2017 Oscar Salvador<br>
&gt;=C2=A0 =C2=A0*<br>
&gt;=C2=A0 =C2=A0* Permission is hereby granted, free of charge, to any per=
son obtaining a<br>
&gt;=C2=A0 =C2=A0* copy of this software and associated documentation files=
 (the &quot;Software&quot;),<br>
&gt; @@ -19,7 +20,6 @@<br>
&gt;=C2=A0 =C2=A0* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE =
OR THE USE OR<br>
&gt;=C2=A0 =C2=A0* OTHER DEALINGS IN THE SOFTWARE.<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; - * Authors: Ben Skeggs<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;<br>
&gt;=C2=A0 #ifdef CONFIG_ACPI<br>
&gt; @@ -38,21 +38,17 @@<br>
&gt;=C2=A0 #include &lt;nvkm/subdev/volt.h&gt;<br>
&gt;<br>
&gt;=C2=A0 #if defined(CONFIG_HWMON) || (defined(MODULE) &amp;&amp; defined=
(CONFIG_HWMON_MODULE))<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_show_temp(<wbr>struct device *d, struct device_attribut=
e *a, char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_show_temp(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int temp =3D nvkm_therm_temp_get(ther=
m);<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (temp &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return te=
mp;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;, temp * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (temp * 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_<wbr>input, S_IRUGO, nouveau_hwmon_sh=
ow_temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0);<br>
&gt;<br>
&gt;=C2=A0 static ssize_t<br>
&gt;=C2=A0 nouveau_hwmon_show_temp1_auto_<wbr>point1_pwm(struct device *d,<=
br>
&gt; @@ -60,7 +56,7 @@ nouveau_hwmon_show_temp1_auto_<wbr>point1_pwm<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot=
;%d\n&quot;, 100);<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_auto_<wbr>point1_pwm, S_IRUGO,<br>
&gt; +static SENSOR_DEVICE_ATTR(temp1_auto_<wbr>point1_pwm, 0444,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_show_temp1_auto_<wbr>point1_pwm, N=
ULL, 0);<br>
&gt;<br>
&gt;=C2=A0 static ssize_t<br>
&gt; @@ -92,7 +88,7 @@ nouveau_hwmon_set_temp1_auto_<wbr>point1_temp<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_auto_<wbr>point1_temp, S_IRUGO | S_IW=
USR,<br>
&gt; +static SENSOR_DEVICE_ATTR(temp1_auto_<wbr>point1_temp, 0644,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_temp1_auto_<wbr>point1_temp,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_temp1_auto_<wbr>point1_temp, 0=
);<br>
&gt;<br>
&gt; @@ -125,319 +121,176 @@ nouveau_hwmon_set_temp1_auto_<wbr>point1_temp<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_auto_<wbr>point1_temp_hyst, S_IRUGO |=
 S_IWUSR,<br>
&gt; +static SENSOR_DEVICE_ATTR(temp1_auto_<wbr>point1_temp_hyst, 0644,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_temp1_auto_<wbr>point1_temp_hyst,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_temp1_auto_<wbr>point1_temp_hy=
st, 0);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_max_temp(struct device *d, struct device_attribute *a, =
char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_max_temp(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 therm-&gt;attr_get(t=
herm, NVKM_THERM_ATTR_THRS_DOWN_CLK) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_THRS_DOWN_CLK) * 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_max_temp(<wbr>struct device *d, struct device_attri=
bute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_max_temp(<wbr>struct nouveau_drm *drm, long val)<br=
>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_ATTR_=
THRS_DOWN_CLK, value / 1000);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_ATTR_=
THRS_DOWN_CLK, val / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_max, S_IRUGO | S_IWUSR, nouveau_hwmon=
_max_temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_max_temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_max_temp_hyst(<wbr>struct device *d, struct device_attr=
ibute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_max_temp_hyst(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_get(therm, NVKM_THER=
M_ATTR_THRS_DOWN_CLK_<wbr>HYST) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_THRS_DOWN_CLK_<wbr>HYST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_max_temp_<wbr>hyst(struct device *d, struct device_=
attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_max_temp_<wbr>hyst(struct nouveau_drm *drm, long va=
l)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_=
ATTR_THRS_DOWN_CLK_<wbr>HYST,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0value / 1000);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0val / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_max_<wbr>hyst, S_IRUGO | S_IWUSR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_max_temp_hyst,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_max_temp_<wbr>hyst, 0);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_critical_temp(<wbr>struct device *d, struct device_attr=
ibute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_critical_temp(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 therm-&gt;attr_get(t=
herm, NVKM_THERM_ATTR_THRS_CRITICAL) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_THRS_CRITICAL) * 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_critical_<wbr>temp(struct device *d, struct device_=
attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const cha=
r *buf,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t count)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_critical_<wbr>temp(struct nouveau_drm *drm, long va=
l)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_ATTR_=
THRS_CRITICAL, value / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_ATTR_=
THRS_CRITICAL, val / 1000);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_crit, S_IRUGO | S_IWUSR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_critical_temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_critical_<wbr>temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A00);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_critical_temp_<wbr>hyst(struct device *d, struct device=
_attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_critical_temp_<wbr>hyst(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_get(therm, NVKM_THER=
M_ATTR_THRS_CRITICAL_<wbr>HYST) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_THRS_CRITICAL_<wbr>HYST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_critical_<wbr>temp_hyst(struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_attr=
ibute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *buf,<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t count)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_critical_<wbr>temp_hyst(struct nouveau_drm *drm, lo=
ng val)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_=
ATTR_THRS_CRITICAL_<wbr>HYST,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0value / 1000);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0val / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_crit_<wbr>hyst, S_IRUGO | S_IWUSR,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_critical_temp_<wbr>hyst,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_critical_<wbr>temp_hyst, 0);<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_emergency_temp(<wbr>struct device *d, struct device_att=
ribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_emergency_temp(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 therm-&gt;attr_get(t=
herm, NVKM_THERM_ATTR_THRS_SHUTDOWN) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_THRS_SHUTDOWN) * 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_emergency_<wbr>temp(struct device *d, struct device=
_attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const cha=
r *buf,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0size_t count)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_emergency_<wbr>temp(struct nouveau_drm *drm, long v=
al)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_ATTR_=
THRS_SHUTDOWN, value / 1000);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_ATTR_=
THRS_SHUTDOWN, val / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_<wbr>emergency, S_IRUGO | S_IWUSR,<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouve=
au_hwmon_emergency_temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouve=
au_hwmon_set_emergency_<wbr>temp,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<b=
r>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_emergency_temp_<wbr>hyst(struct device *d, struct devic=
e_attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_emergency_temp_<wbr>hyst(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_get(therm, NVKM_THER=
M_ATTR_THRS_SHUTDOWN_<wbr>HYST) * 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_THRS_SHUTDOWN_<wbr>HYST)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0* 1000);<br>
&gt;=C2=A0 }<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_emergency_<wbr>temp_hyst(struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct devic=
e_attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *=
buf,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count=
)<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_emergency_<wbr>temp_hyst(struct nouveau_drm *drm, l=
ong val)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0therm-&gt;attr_set(therm, NVKM_THERM_=
ATTR_THRS_SHUTDOWN_<wbr>HYST,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0value / 1000);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; -}<br>
&gt; -static SENSOR_DEVICE_ATTR(temp1_<wbr>emergency_hyst, S_IRUGO | S_IWUS=
R,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouve=
au_hwmon_emergency_temp_<wbr>hyst,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouve=
au_hwmon_set_emergency_<wbr>temp_hyst,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<b=
r>
&gt; -<br>
&gt; -static ssize_t nouveau_hwmon_show_name(struct device *dev,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct devic=
e_attribute *attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<b=
r>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;nouveau\n&quot;)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0val / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(name, S_IRUGO, nouveau_hwmon_show_name, NUL=
L, 0);<br>
&gt;<br>
&gt; -static ssize_t nouveau_hwmon_show_update_<wbr>rate(struct device *dev=
,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct devic=
e_attribute *attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<b=
r>
&gt; +static int<br>
&gt; +nouveau_hwmon_show_update_<wbr>rate(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;1000\n&quot;);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 1000;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(update_<wbr>rate, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_show_update_<wbr>rate,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0NULL, 0);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_show_fan1_<wbr>input(struct device *d, struct device_at=
tribute *attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_show_fan1_<wbr>input(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return snprintf(buf, PAGE_SIZE, &quot;%d\n=
&quot;, nvkm_therm_fan_sense(therm));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return nvkm_therm_fan_sense(therm);<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(fan1_input, S_IRUGO, nouveau_hwmon_show_fan=
1_input,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0NULL, 0);<br>
&gt;<br>
&gt; - static ssize_t<br>
&gt; -nouveau_hwmon_get_pwm1_<wbr>enable(struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *a, char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_pwm1_<wbr>enable(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D therm-&gt;attr_get(therm, NVKM_THE=
RM_ATTR_FAN_MODE);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, ret)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return therm-&gt;attr_get(therm, NVKM_THER=
M_ATTR_FAN_MODE);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_pwm1_<wbr>enable(struct device *d, struct device_at=
tribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_pwm1_<wbr>enable(struct nouveau_drm *drm, long val)=
<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kstrtol(buf, 10, &amp;value);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D therm-&gt;attr_set(therm, NVKM_THE=
RM_ATTR_FAN_MODE, val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D therm-&gt;attr_set(therm, NVKM_THE=
RM_ATTR_FAN_MODE, value);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt; -static SENSOR_DEVICE_ATTR(pwm1_<wbr>enable, S_IRUGO | S_IWUSR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_pwm1_enable,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_pwm1_enable, 0);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_pwm1(struct device *d, struct device_attribute *a, =
char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_pwm1(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D therm-&gt;fan_get(therm);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, ret)=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return therm-&gt;fan_get(therm);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_set_pwm1(struct device *d, struct device_attribute *a,<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 const char *buf, size_t count)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_set_pwm1(struct nouveau_drm *drm, long val)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D -ENODEV;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0long value;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (kstrtol(buf, 10, &amp;value) =3D=3D -E=
INVAL)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D therm-&gt;fan_set(therm, value);<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D therm-&gt;fan_set(therm, val);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_pwm1,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_pwm1, 0);<br>
&gt; -<br>
&gt;=C2=A0 static ssize_t<br>
&gt;=C2=A0 nouveau_hwmon_get_pwm1_min(<wbr>struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *a, char *buf)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *a, char =
*buf)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_dr=
vdata(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_d=
rm(dev);<br>
&gt; @@ -453,7 +306,7 @@ nouveau_hwmon_get_pwm1_min(<wbr>struct device<br>
&gt;<br>
&gt;=C2=A0 static ssize_t<br>
&gt;=C2=A0 nouveau_hwmon_set_pwm1_min(<wbr>struct device *d, struct device_=
attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_dr=
vdata(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_d=
rm(dev);<br>
&gt; @@ -471,13 +324,13 @@ nouveau_hwmon_set_pwm1_min(<wbr>struct device<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(pwm1_min, S_IRUGO | S_IWUSR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_pwm1_min,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_pwm1_min, 0);<br>
&gt; +static SENSOR_DEVICE_ATTR(pwm1_min, 0644,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0nouveau_hwmon_get_pwm1_min,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0nouveau_hwmon_set_pwm1_min, 0);<br>
&gt;<br>
&gt;=C2=A0 static ssize_t<br>
&gt;=C2=A0 nouveau_hwmon_get_pwm1_max(<wbr>struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 struct device_attribute *a, char *buf)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *a, char =
*buf)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_dr=
vdata(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_d=
rm(dev);<br>
&gt; @@ -493,7 +346,7 @@ nouveau_hwmon_get_pwm1_max(<wbr>struct device<br>
&gt;<br>
&gt;=C2=A0 static ssize_t<br>
&gt;=C2=A0 nouveau_hwmon_set_pwm1_max(<wbr>struct device *d, struct device_=
attribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 const char *buf, size_t count)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const char *buf, size_t count)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_dr=
vdata(d);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_d=
rm(dev);<br>
&gt; @@ -511,16 +364,13 @@ nouveau_hwmon_set_pwm1_max(<wbr>struct device<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(pwm1_max, S_IRUGO | S_IWUSR,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_pwm1_max,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_set_pwm1_max, 0);<br>
&gt; +static SENSOR_DEVICE_ATTR(pwm1_max, 0644,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0nouveau_hwmon_get_pwm1_max,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0nouveau_hwmon_set_pwm1_max, 0);<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_in0_input(<wbr>struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *a, char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_in0_input(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D nvxx_volt(=
&amp;drm-&gt;client.device)<wbr>;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt;<br>
&gt; @@ -528,169 +378,524 @@ nouveau_hwmon_get_in0_input(<wbr>struct devic<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, ret =
/ 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (ret / 1000);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(in0_input, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_in0_input, NULL, 0);<br>
&gt; -<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_in0_min(<wbr>struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *a, char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_in0_min(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D nvxx_volt(=
&amp;drm-&gt;client.device)<wbr>;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!volt || !volt-&gt;min_uv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NODEV;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, volt=
-&gt;min_uv / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (volt-&gt;min_uv / 1000);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(in0_min, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_in0_min, NULL, 0);<br>
&gt; -<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_in0_max(<wbr>struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *a, char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_in0_max(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D nvxx_volt(=
&amp;drm-&gt;client.device)<wbr>;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!volt || !volt-&gt;max_uv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NODEV;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, volt=
-&gt;max_uv / 1000);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return (volt-&gt;max_uv / 1000);<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(in0_max, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_in0_max, NULL, 0);<br>
&gt; -<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_in0_label(<wbr>struct device *d,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_attribute *a, char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_power1_<wbr>input(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;GPU core\n&quot;=
);<br>
&gt; -}<br>
&gt; -<br>
&gt; -static SENSOR_DEVICE_ATTR(in0_label, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_in0_label, NULL, 0);<br>
&gt; -<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_power1_<wbr>input(struct device *d, struct device_a=
ttribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)<br>
&gt; -{<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_iccsense *iccsense =3D nv=
xx_iccsense(&amp;drm-&gt;client.<wbr>device);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int result =3D nvkm_iccsense_read_all=
(<wbr>iccsense);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (result &lt; 0)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return result;=
<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, resu=
lt);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return result;<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(power1_<wbr>input, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_power1_<wbr>input, NULL, 0);<br>
&gt; -<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_power1_max(<wbr>struct device *d, struct device_att=
ribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_power1_max(<wbr>struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_iccsense *iccsense =3D nv=
xx_iccsense(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, iccs=
ense-&gt;power_w_max);<br>
&gt; -}<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(power1_max, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_power1_max, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return iccsense-&gt;power_w_max;<br>
&gt; +}<br>
&gt;<br>
&gt; -static ssize_t<br>
&gt; -nouveau_hwmon_get_power1_<wbr>crit(struct device *d, struct device_at=
tribute *a,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0char *buf)<br>
&gt; +static int<br>
&gt; +nouveau_hwmon_get_power1_<wbr>crit(struct nouveau_drm *drm)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *dev =3D dev_get_drvdata=
(d);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(de=
v);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_iccsense *iccsense =3D nv=
xx_iccsense(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%i\n&quot;, iccs=
ense-&gt;power_w_crit);<br>
&gt; -}<br>
&gt;<br>
&gt; -static SENSOR_DEVICE_ATTR(power1_<wbr>crit, S_IRUGO,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_get_power1_crit, NULL, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return iccsense-&gt;power_w_crit;<br>
&gt; +}<br>
&gt;<br>
&gt; -static struct attribute *hwmon_default_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_name.dev_<wbr>attr.at=
tr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_update_rate.<wbr>dev_=
attr.attr,<br>
&gt; +static struct attribute *pwm_fan_sensor_attrs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1_min.dev_<wbr>att=
r.attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1_max.dev_<wbr>att=
r.attr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt;=C2=A0 };<br>
&gt; -static struct attribute *hwmon_temp_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_input.<wbr>dev_=
attr.attr,<br>
&gt; +ATTRIBUTE_GROUPS(pwm_fan_<wbr>sensor);<br>
&gt; +<br>
&gt; +static struct attribute *temp1_auto_point_sensor_<wbr>attrs[] =3D {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_auto_<wbr>=
point1_pwm.dev_attr.attr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_auto_<wbr>=
point1_temp.dev_attr.attr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_auto_<wbr>=
point1_temp_hyst.dev_attr.<wbr>attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_max.<wbr>dev_at=
tr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_max_<wbr>hyst.d=
ev_attr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_crit.<wbr>dev_a=
ttr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_crit_<wbr>hyst.=
dev_attr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_<wbr>emergency.=
dev_attr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_temp1_<wbr>emergency_=
hyst.dev_attr.attr,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt;=C2=A0 };<br>
&gt; -static struct attribute *hwmon_fan_rpm_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_fan1_input.<wbr>dev_a=
ttr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +ATTRIBUTE_GROUPS(temp1_auto_<wbr>point_sensor);<br>
&gt; +<br>
&gt; +#define N_ATTR_GROUPS=C2=A0 3<br>
&gt; +<br>
&gt; +static const u32 nouveau_config_chip[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_C_UPDATE_INTERVAL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 };<br>
&gt; -static struct attribute *hwmon_pwm_fan_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1_enable.<wbr>dev_=
attr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1.dev_<wbr>attr.at=
tr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1_min.dev_<wbr>att=
r.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1_max.dev_<wbr>att=
r.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +<br>
&gt; +static const u32 nouveau_config_in[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_I_INPUT | HWMON_I_MIN | HWMON_I_MAX =
| HWMON_I_LABEL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -static struct attribute *hwmon_in0_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_in0_input.<wbr>dev_at=
tr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_in0_min.dev_<wbr>attr=
.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_in0_max.dev_<wbr>attr=
.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_in0_label.<wbr>dev_at=
tr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +static const u32 nouveau_config_temp[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_=
HYST |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_T_CRIT | HWMON_T_CRIT_HYST | HWMON_T=
_EMERGENCY |<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_T_EMERGENCY_HYST,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -static struct attribute *hwmon_power_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_power1_input.<wbr>dev=
_attr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +static const u32 nouveau_config_fan[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_F_INPUT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -static struct attribute *hwmon_power_caps_attributes[] =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_power1_max.<wbr>dev_a=
ttr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_power1_crit.<wbr>dev_=
attr.attr,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +static const u32 nouveau_config_pwm[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_PWM_INPUT | HWMON_PWM_ENABLE,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 };<br>
&gt;<br>
&gt; -static const struct attribute_group hwmon_default_attrgroup =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_default_attributes,<br>
&gt; +static const u32 nouveau_config_power[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0HWMON_P_INPUT | HWMON_P_CAP_MAX | HWMON_P_=
CRIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A00<br>
&gt;=C2=A0 };<br>
&gt; -static const struct attribute_group hwmon_temp_attrgroup =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_temp_attributes,<br>
&gt; +<br>
&gt; +static const struct hwmon_channel_info nouveau_chip =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_chip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D nouveau_config_chip,<br>
&gt;=C2=A0 };<br>
&gt; -static const struct attribute_group hwmon_fan_rpm_attrgroup =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_fan_rpm_attributes,<br>
&gt; +<br>
&gt; +static const struct hwmon_channel_info nouveau_temp =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_temp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D nouveau_config_temp,<br>
&gt;=C2=A0 };<br>
&gt; -static const struct attribute_group hwmon_pwm_fan_attrgroup =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_pwm_fan_attributes,<br>
&gt; +<br>
&gt; +static const struct hwmon_channel_info nouveau_fan =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_fan,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D nouveau_config_fan,<br>
&gt;=C2=A0 };<br>
&gt; -static const struct attribute_group hwmon_in0_attrgroup =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_in0_attributes,<br>
&gt; +<br>
&gt; +static const struct hwmon_channel_info nouveau_in =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D nouveau_config_in,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct hwmon_channel_info nouveau_pwm =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_pwm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D nouveau_config_pwm,<br>
&gt;=C2=A0 };<br>
&gt; -static const struct attribute_group hwmon_power_attrgroup =3D {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_power_attributes,<br>
&gt; +<br>
&gt; +static const struct hwmon_channel_info nouveau_power =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.type =3D hwmon_power,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.config =3D nouveau_config_power,<br>
&gt;=C2=A0 };<br>
&gt; -static const struct attribute_group hwmon_power_caps_attrgroup =3D {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.attrs =3D hwmon_power_caps_attributes,<br=
>
&gt; +<br>
&gt; +static const struct hwmon_channel_info *nouveau_info[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_chip,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_temp,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_fan,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_in,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_pwm,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;nouveau_power,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
&gt; +};<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_chip_is_visible(const void *data, u32 attr, int channel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_chip_update_interval:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0444;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_power_is_visible(<wbr>const void *data, u32 attr, int channel=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm((s=
truct drm_device *)data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_iccsense *iccsense =3D nvxx_ic=
csense(&amp;drm-&gt;client.<wbr>device);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsense &=
amp;&amp; iccsense-&gt;data_valid &amp;&amp;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!list_empty(&amp;iccsense-&gt;rai=
ls))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0444;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_crit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsense-&=
gt;power_w_max &amp;&amp; iccsense-&gt;power_w_crit)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0444;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +}<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_temp_is_visible(const void *data, u32 attr, int channel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm((s=
truct drm_device *)data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_therm(&a=
mp;drm-&gt;client.<wbr>device);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp; therm-&gt;attr_get &a=
mp;&amp; therm-&gt;attr_set)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvkm_therm=
_temp_get(therm) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0444;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0644;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_pwm_is_visible(const void *data, u32 attr, int channel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm((s=
truct drm_device *)data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_therm(&a=
mp;drm-&gt;client.<wbr>device);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp; therm-&gt;attr_get)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm-&gt;=
fan_get &amp;&amp; therm-&gt;fan_get(therm) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_enable:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0644;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_input_is_visible(<wbr>const void *data, u32 attr, int channel=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm((s=
truct drm_device *)data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D nvxx_volt(&amp;=
drm-&gt;client.device)<wbr>;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!volt || nvkm_volt_get(volt) &lt; 0)<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_label:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_min:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0444;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_fan_is_visible(const void *data, u32 attr, int channel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm((s=
truct drm_device *)data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_therm(&a=
mp;drm-&gt;client.<wbr>device);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!therm || !therm-&gt;attr_get || nvkm_=
therm_fan_sense(therm) &lt; 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_fan_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0444;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_chip_read(struct device *dev, u32 attr, int channel, long *va=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_chip_update_interval:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_show_update_<wbr>rate(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_temp_read(struct device *dev, u32 attr, int channel, long *va=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_show_temp(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_max_temp(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_max_temp_hyst(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_critical_temp(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_critical_temp_<wbr>hyst(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_emergency_temp(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_emergency_temp_<wbr>hyst(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_fan_read(struct device *dev, u32 attr, int channel, long *val=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_fan_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_show_fan1_input(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_in_read(struct device *dev, u32 attr, int channel, long *val)=
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_in0_input(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_min:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_in0_min(drm)<wbr>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_in0_max(drm)<wbr>;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_pwm_read(struct device *dev, u32 attr, int channel, long *val=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_enable:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_pwm1_enable(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_pwm1(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_power_read(struct device *dev, u32 attr, int channel, long *v=
al)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_power1_<wbr>input(drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_power1_max(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power_crit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*val =3D nouve=
au_hwmon_get_power1_crit(<wbr>drm);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_temp_write(struct device *dev, u32 attr, int channel, long va=
l)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_max_temp(<wbr>drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_max_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_max_temp_<wbr>hyst(drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_critical_<wbr>temp(drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_crit_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_critical_<wbr>temp_hyst(drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_emergency_<wbr>temp(drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp_emergency_hyst:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_emergency_<wbr>temp_hyst(drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_pwm_write(struct device *dev, u32 attr, int channel, long val=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_device *drm_dev =3D dev_get_drv=
data(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_drm(dr=
m_dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (attr) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_input:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_pwm1(drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm_enable:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_hwmon_=
set_pwm1_enable(<wbr>drm, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static umode_t<br>
&gt; +nouveau_is_visible(const void *data, enum hwmon_sensor_types type, u3=
2 attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0int channel)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_chip:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_chip_is_visible(data, attr, channel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_temp_is_visible(data, attr, channel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_fan:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_fan_is_visible(data, attr, channel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_input_is_visible(data, attr, channel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_pwm_is_visible(data, attr, channel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_power_is_visible(data, attr, channel);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +static char *input_label =3D &quot;GPU core&quot;;<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_read_string(struct device *dev, enum hwmon_sensor_types type,=
 u32 attr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int channel, char **buf)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (type =3D=3D hwmon_in &amp;&amp; attr =
=3D=3D hwmon_in_label) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*buf =3D input=
_label;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOTSUPP;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_read(struct device *dev, enum hwmon_sensor_types type, u32 at=
tr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int channel, long *val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_chip:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_chip_read(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_temp_read(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_fan:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_fan_read(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_in:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_in_read(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_pwm_read(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_power:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_power_read(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +nouveau_write(struct device *dev, enum hwmon_sensor_types type, u32 a=
ttr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0int channel, long val)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0switch (type) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_temp:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_temp_write(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0case hwmon_pwm:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return nouveau=
_pwm_write(dev, attr, channel, val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EOPNOT=
SUPP;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static const struct hwmon_ops nouveau_hwmon_ops =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.is_visible =3D nouveau_is_visible,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.read =3D nouveau_read,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.read_string =3D nouveau_read_string,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.write =3D nouveau_write,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct hwmon_chip_info nouveau_chip_info =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ops =3D &amp;nouveau_hwmon_ops,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.info =3D nouveau_info,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 #endif<br>
&gt;<br>
&gt; @@ -700,90 +905,36 @@ nouveau_hwmon_init(struct drm_device *de<br>
&gt;=C2=A0 #if defined(CONFIG_HWMON) || (defined(MODULE) &amp;&amp; defined=
(CONFIG_HWMON_MODULE))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_drm *drm =3D nouveau_d=
rm(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_therm *therm =3D nvxx_the=
rm(&amp;drm-&gt;client.<wbr>device);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_volt *volt =3D nvxx_volt(&amp;=
drm-&gt;client.device)<wbr>;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0struct nvkm_iccsense *iccsense =3D nvxx_ic=
csense(&amp;drm-&gt;client.<wbr>device);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_hwmon *hwmon;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *hwmon_dev;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0const struct attribute_group *special_grou=
ps[N_ATTR_GROUPS]<wbr>;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int i =3D 0;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon =3D drm-&gt;hwmon =3D kzalloc(s=
izeof(*hwmon), GFP_KERNEL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!hwmon)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -E=
NOMEM;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon-&gt;dev =3D dev;<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon_dev =3D hwmon_device_register(dev-&g=
t;<wbr>dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp; therm-&gt;attr_get &a=
mp;&amp; therm-&gt;attr_set) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvkm_therm=
_temp_get(therm) &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0special_groups[i++] =3D &amp;temp1_auto_point_sensor_<wbr>gro=
up;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm-&gt;=
fan_get &amp;&amp; therm-&gt;fan_get(therm) &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0special_groups[i++] =3D &amp;pwm_fan_sensor_group;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0special_groups[i] =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon_dev =3D hwmon_device_register_with_<=
wbr>info(dev-&gt;dev, &quot;nouveau&quot;, dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;=
nouveau_chip_info, special_groups);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hwmon_dev)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D P=
TR_ERR(hwmon_dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NV_ERROR(=
drm, &quot;Unable to register hwmon device: %d\n&quot;, ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return re=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0dev_set_drvdata(hwmon_dev, dev);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* set the default attributes */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sysfs_create_group(&amp;hwmon_dev-=
<wbr>&gt;kobj, &amp;hwmon_default_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br=
>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp; therm-&gt;attr_get &a=
mp;&amp; therm-&gt;attr_set) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the card=
 has a working thermal sensor */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvkm_therm=
_temp_get(therm) &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D sysfs_create_group(&amp;hwmon_dev-<wbr>&gt;kobj, &amp=
;hwmon_temp_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the card=
 has a pwm fan */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*XXX: incorre=
ct, need better detection for this, some boards have<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=
=A0 =C2=A0the gpio entries for pwm fan control even when there&#39;s no<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=C2=A0 =C2=
=A0 =C2=A0actual fan connected to it... therm table? */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm-&gt;=
fan_get &amp;&amp; therm-&gt;fan_get(therm) &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D sysfs_create_group(&amp;hwmon_dev-<wbr>&gt;kobj,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;hwmon_pwm_fan_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0/* if the card can read the fan rpm */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (therm &amp;&amp; nvkm_therm_fan_sense(=
therm) &gt;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sysfs_=
create_group(&amp;hwmon_dev-<wbr>&gt;kobj,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;hwmon_fan_rpm_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (volt &amp;&amp; nvkm_volt_get(volt) &g=
t;=3D 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sysfs_=
create_group(&amp;hwmon_dev-<wbr>&gt;kobj,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;hwmon_in0_attrgroup);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsense &amp;&amp; iccsense-&gt;data_=
valid &amp;&amp; !list_empty(&amp;iccsense-&gt;rails)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D sysfs_=
create_group(&amp;hwmon_dev-<wbr>&gt;kobj,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp=
;hwmon_power_attrgroup);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0goto error;<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (iccsense-&=
gt;power_w_max &amp;&amp; iccsense-&gt;power_w_crit) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ret =3D sysfs_create_group(&amp;hwmon_dev-<wbr>&gt;kobj,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 &amp;hwmon_power_caps_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (ret)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto error;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon-&gt;hwmon =3D hwmon_dev;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; -<br>
&gt; -error:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0NV_ERROR(drm, &quot;Unable to create some =
hwmon sysfs files: %d\n&quot;, ret);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon_device_unregister(hwmon_<wbr>dev);<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon-&gt;hwmon =3D NULL;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
&gt;=C2=A0 #else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt;=C2=A0 #endif<br>
&gt; @@ -795,17 +946,8 @@ nouveau_hwmon_fini(struct drm_device *de<br>
&gt;=C2=A0 #if defined(CONFIG_HWMON) || (defined(MODULE) &amp;&amp; defined=
(CONFIG_HWMON_MODULE))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nouveau_hwmon *hwmon =3D nouve=
au_hwmon(dev);<br>
&gt;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwmon-&gt;hwmon) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_default_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_temp_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_pwm_fan_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_fan_rpm_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_in0_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_power_attrgroup);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sysfs_remove_g=
roup(&amp;hwmon-&gt;<wbr>hwmon-&gt;kobj, &amp;hwmon_power_caps_attrgroup);<=
br>
&gt; -<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (hwmon-&gt;hwmon)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon_dev=
ice_unregister(hwmon-<wbr>&gt;hwmon);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nouveau_drm(dev)-&gt;hwmon =3D NULL;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(hwmon);<br>
</div>&gt; ______________________________<wbr>_________________<br>
&gt; Nouveau mailing list<br>
&gt; <a href=3D"mailto:Nouveau@lists.freedesktop.org">Nouveau@lists.freedes=
ktop.org</a><br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/nouveau" rel=
=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org/<wbr>mailma=
n/listinfo/nouveau</a><br>
</blockquote></div><br></div>

--f4030435c97c458dd7054cf3076e--

--===============1582208990==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

--===============1582208990==--
