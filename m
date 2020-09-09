From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
Date: Wed, 9 Sep 2020 10:22:14 +0200
Message-ID: <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
References: <20200812204952.1921587-1-jcline@redhat.com>
 <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, ML nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, ML dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> >
> > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > new gp1xx temperature sensor") added support for reading finer-grain
> > temperatures, but continued to report temperatures in 1 degree Celsius
> > increments via nvkm_therm_temp_get().
> >
> > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > temperatures, which would be inconvenient for other users of the
> > function, a second interface has been added to line up with hwmon's
> > native unit of temperature.
> Hey Jeremy,
>
> Sorry this slipped past me until now.  I'm OK with adding support for
> millidegree temperature reporting, but don't think we need to keep
> both interfaces around and would rather see the existing code
> converted to return millidegrees (even on GPUs that don't support it)
> instead of degrees.
>
> Thanks!
> Ben.
>

just a note as I was trying something like that in the past: we have a
lot of code which fetches the temperature and there are a lot of
places where we would then do a divide by 1000, so having a wrapper
function at least makes sense. If we want to keep the func pointers?
well.. I guess the increased CPU overhead wouldn't be as bad if all
sub classes do this static * 1000 as well either. I just think we
should have both interfaces in subdev/therm.h so we can just keep most
of the current code as is.

> >
> > Signed-off-by: Jeremy Cline <jcline-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > ---
> >  .../drm/nouveau/include/nvkm/subdev/therm.h   | 18 +++++++++++++
> >  drivers/gpu/drm/nouveau/nouveau_hwmon.c       |  4 +--
> >  .../gpu/drm/nouveau/nvkm/subdev/therm/base.c  | 16 ++++++++++++
> >  .../gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 25 +++++++++++++++++--
> >  .../gpu/drm/nouveau/nvkm/subdev/therm/priv.h  |  1 +
> >  5 files changed, 60 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > index 62c34f98c930..7b9928dd001c 100644
> > --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/therm.h
> > @@ -100,6 +100,24 @@ struct nvkm_therm {
> >  };
> >
> >  int nvkm_therm_temp_get(struct nvkm_therm *);
> > +
> > +/**
> > + * nvkm_therm_temp_millidegree_get() - get the temperature in millidegrees
> > + * @therm: The thermal device to read from.
> > + *
> > + * This interface reports temperatures in units of millidegree Celsius to
> > + * align with the hwmon API. Some cards may only be capable of reporting in
> > + * units of Celsius, and those that report finer grain temperatures may not be
> > + * capable of millidegree Celsius accuracy,
> > + *
> > + * For cases where millidegree temperature is too fine-grain, the
> > + * nvkm_therm_temp_get() interface reports temperatures in one degree Celsius
> > + * increments.
> > + *
> > + * Return: The temperature in millidegrees Celsius, or -ENODEV if temperature
> > + *         reporting is not supported.
> > + */
> > +int nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm);
> >  int nvkm_therm_fan_sense(struct nvkm_therm *);
> >  int nvkm_therm_cstate(struct nvkm_therm *, int, int);
> >  void nvkm_therm_clkgate_init(struct nvkm_therm *,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > index 1c3104d20571..e96355f93ce5 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > @@ -428,8 +428,8 @@ nouveau_temp_read(struct device *dev, u32 attr, int channel, long *val)
> >         case hwmon_temp_input:
> >                 if (drm_dev->switch_power_state != DRM_SWITCH_POWER_ON)
> >                         return -EINVAL;
> > -               ret = nvkm_therm_temp_get(therm);
> > -               *val = ret < 0 ? ret : (ret * 1000);
> > +               ret = nvkm_therm_temp_millidegree_get(therm);
> > +               *val = ret;
> >                 break;
> >         case hwmon_temp_max:
> >                 *val = therm->attr_get(therm, NVKM_THERM_ATTR_THRS_DOWN_CLK)
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > index 4a4d1e224126..e655b32c78b8 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/base.c
> > @@ -34,6 +34,22 @@ nvkm_therm_temp_get(struct nvkm_therm *therm)
> >         return -ENODEV;
> >  }
> >
> > +int
> > +nvkm_therm_temp_millidegree_get(struct nvkm_therm *therm)
> > +{
> > +       int ret = -ENODEV;
> > +
> > +       if (therm->func->temp_millidegree_get)
> > +               return therm->func->temp_millidegree_get(therm);
> > +
> > +       if (therm->func->temp_get) {
> > +               ret = therm->func->temp_get(therm);
> > +               if (ret > 0)
> > +                       ret *= 1000;
> > +       }
> > +       return ret;
> > +}
> > +
> >  static int
> >  nvkm_therm_update_trip(struct nvkm_therm *therm)
> >  {
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > index 9f0dea3f61dc..4c3c2895a3cb 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
> > @@ -24,7 +24,7 @@
> >  #include "priv.h"
> >
> >  static int
> > -gp100_temp_get(struct nvkm_therm *therm)
> > +gp100_temp_get_raw(struct nvkm_therm *therm)
> >  {
> >         struct nvkm_device *device = therm->subdev.device;
> >         struct nvkm_subdev *subdev = &therm->subdev;
> > @@ -37,14 +37,35 @@ gp100_temp_get(struct nvkm_therm *therm)
> >
> >         /* device valid */
> >         if (tsensor & 0x20000000)
> > -               return (inttemp >> 8);
> > +               return inttemp;
> >         else
> >                 return -ENODEV;
> >  }
> >
> > +static int
> > +gp100_temp_millidegree_get(struct nvkm_therm *therm)
> > +{
> > +       int raw_temp = gp100_temp_get_raw(therm);
> > +
> > +       if (raw_temp < 0)
> > +               return raw_temp;
> > +       return raw_temp * 1000 >> 8;
> > +}
> > +
> > +static int
> > +gp100_temp_get(struct nvkm_therm *therm)
> > +{
> > +       int raw_temp = gp100_temp_get_raw(therm);
> > +
> > +       if (raw_temp < 0)
> > +               return raw_temp;
> > +       return raw_temp >> 8;
> > +}
> > +
> >  static const struct nvkm_therm_func
> >  gp100_therm = {
> >         .temp_get = gp100_temp_get,
> > +       .temp_millidegree_get = gp100_temp_millidegree_get,
> >         .program_alarms = nvkm_therm_program_alarms_polling,
> >  };
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > index 21659daf1864..a53068b4f0b9 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/priv.h
> > @@ -92,6 +92,7 @@ struct nvkm_therm_func {
> >         int (*pwm_clock)(struct nvkm_therm *, int line);
> >
> >         int (*temp_get)(struct nvkm_therm *);
> > +       int (*temp_millidegree_get)(struct nvkm_therm *therm);
> >
> >         int (*fan_sense)(struct nvkm_therm *);
> >
> > --
> > 2.26.2
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
