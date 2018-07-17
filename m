From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 4/5] drm/nouveau: Grab RPM ref when i2c bus is
 in use
Date: Tue, 17 Jul 2018 12:17:23 +0200
Message-ID: <CACO55tv9B+GNM=nhpH1UfeWd9F1x5nTp+vHSuJ-TsuzRFK_AEA@mail.gmail.com>
References: <20180716235936.11268-1-lyude@redhat.com> <20180716235936.11268-5-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20180716235936.11268-5-lyude@redhat.com>
Sender: stable-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

mhh, we shouldn't call to Linux APIs from within of nvkm. Rather gaurd
the Linux glue code to the i2c stuff instead, but this is all done
from inside of nvkm. I think we should move it out into
drm/nouveau/nouveau_i2c.c and do the handling there.

On Tue, Jul 17, 2018 at 1:59 AM, Lyude Paul <lyude@redhat.com> wrote:
> The i2c bus can be both accessed by DRM itself, along with any of it's
> devnodes (/sys/class/i2c). So, we need to make sure that all codepaths
> using the i2c bus keep the GPU resumed.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <karolherbst@gmail.com>
> Cc: stable@vger.kernel.org
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
> index 807a2b67bd64..1de48c990b80 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/bus.c
> @@ -119,18 +119,28 @@ nvkm_i2c_bus_release(struct nvkm_i2c_bus *bus)
>         BUS_TRACE(bus, "release");
>         nvkm_i2c_pad_release(pad);
>         mutex_unlock(&bus->mutex);
> +       pm_runtime_put_autosuspend(pad->i2c->subdev.device->dev);
>  }
>
>  int
>  nvkm_i2c_bus_acquire(struct nvkm_i2c_bus *bus)
>  {
>         struct nvkm_i2c_pad *pad = bus->pad;
> +       struct device *dev = pad->i2c->subdev.device->dev;
>         int ret;
> +
>         BUS_TRACE(bus, "acquire");
> +
> +       ret = pm_runtime_get_sync(dev);
> +       if (ret < 0 && ret != -EACCES)
> +               return ret;
> +
>         mutex_lock(&bus->mutex);
>         ret = nvkm_i2c_pad_acquire(pad, NVKM_I2C_PAD_I2C);
> -       if (ret)
> +       if (ret) {
>                 mutex_unlock(&bus->mutex);
> +               pm_runtime_put_autosuspend(dev);
> +       }
>         return ret;
>  }
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
