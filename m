From: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: use NULL for pointer assignment.
Date: Mon, 6 Jan 2020 08:08:01 +1000
Message-ID: <CACAvsv5SF18v7t8kbo0LPQi3L8U3xGGf70_UEfOnKdHu89yo9A@mail.gmail.com>
References: <20191231205734.1452-1-wambui.karugax@gmail.com> <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Wambui Karuga <wambui.karugax@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@linux.ie>, ML dri-devel <dri-devel@lists.freedesktop.org>, ML nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
List-Id: nouveau.vger.kernel.org

On Thu, 2 Jan 2020 at 04:51, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Dec 31, 2019 at 11:57:34PM +0300, Wambui Karuga wrote:
> > Replace the use of 0 in the pointer assignment with NULL to address the
> > following sparse warning:
> > drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer
> >
> > Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> I'll check with Ben next week or so whether he wants to pick these up or
> whether I should stuff them into drm-misc-next.
I'll grab them.

Ben.

> -Daniel
>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > index d445c6f3fece..1c3104d20571 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > @@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
> >                       special_groups[i++] = &pwm_fan_sensor_group;
> >       }
> >
> > -     special_groups[i] = 0;
> > +     special_groups[i] = NULL;
> >       hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
> >                                                       &nouveau_chip_info,
> >                                                       special_groups);
> > --
> > 2.17.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
