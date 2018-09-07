From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH v4 2/6] drm/nouveau: Add NV_PRINTK_ONCE and variants
Date: Thu, 06 Sep 2018 22:35:59 -0700
Message-ID: <4d74256435a71cdb7ec8d114b1c3cb640f29c267.camel@perches.com>
References: <20180906214328.24012-1-lyude@redhat.com>
         <20180906214328.24012-3-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180906214328.24012-3-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, 2018-09-06 at 17:43 -0400, Lyude Paul wrote:
> Since we're about to use this in nouveau_backlight.c. Same thing as
> DRM_WARN_ONCE, DRM_INFO_ONCE, etc...

Can you redefine this in terms of the patches I submitted
instead?

https://lore.kernel.org/patchwork/patch/979598/
https://lore.kernel.org/patchwork/patch/979601/


> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Cc: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 6e1acaec3400..d9d687916553 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -244,10 +244,12 @@ void nouveau_drm_device_remove(struct drm_device *dev);
>  	struct nouveau_cli *_cli = (c);                                        \
>  	dev_##l(_cli->drm->dev->dev, "%s: "f, _cli->name, ##a);                \
>  } while(0)
> +
>  #define NV_FATAL(drm,f,a...) NV_PRINTK(crit, &(drm)->client, f, ##a)
>  #define NV_ERROR(drm,f,a...) NV_PRINTK(err, &(drm)->client, f, ##a)
>  #define NV_WARN(drm,f,a...) NV_PRINTK(warn, &(drm)->client, f, ##a)
>  #define NV_INFO(drm,f,a...) NV_PRINTK(info, &(drm)->client, f, ##a)
> +
>  #define NV_DEBUG(drm,f,a...) do {                                              \
>  	if (unlikely(drm_debug & DRM_UT_DRIVER))                               \
>  		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
> @@ -257,6 +259,12 @@ void nouveau_drm_device_remove(struct drm_device *dev);
>  		NV_PRINTK(info, &(drm)->client, f, ##a);                       \
>  } while(0)
>  
> +#define NV_PRINTK_ONCE(l,c,f,a...) NV_PRINTK(l##_once,c,f, ##a)
> +
> +#define NV_ERROR_ONCE(drm,f,a...) NV_PRINTK_ONCE(err, &(drm)->client, f, ##a)
> +#define NV_WARN_ONCE(drm,f,a...) NV_PRINTK_ONCE(warn, &(drm)->client, f, ##a)
> +#define NV_INFO_ONCE(drm,f,a...) NV_PRINTK_ONCE(info, &(drm)->client, f, ##a)
> +
>  extern int nouveau_modeset;
>  
>  #endif
