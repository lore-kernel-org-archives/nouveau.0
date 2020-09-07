From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: allow limiting the scatter list
 size.
Date: Mon, 7 Sep 2020 09:13:58 +0200
Message-ID: <CAKMK7uFixrbxVoaF4-1hXvQcPySaaYRooQ=LKoivPALH-UCgbw@mail.gmail.com>
References: <20200818092017.26290-1-kraxel@redhat.com>
 <20200818092017.26290-2-kraxel@redhat.com>
 <20200901074043.GT2352366@phenom.ffwll.local>
 <20200907063901.atwjdxz7iqyra22h@sirius.home.kraxel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200907063901.atwjdxz7iqyra22h-+1R1O5xHTTbdA3i/FDNR4v2rGJfVMZC7@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Freedreno" <freedreno-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:ARM/Rockchip SoC support" <linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, "moderated list:DRM DRIVERS FOR XEN" <xen-devel-GuqFBffKawtpuQazS67q72D2FQJk+8+b@public.gmane.org>, "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "moderated list:DRM DRIVERS FOR VIVANTE GPU IP" <etnaviv@lis>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 7, 2020 at 8:39 AM Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> > > +   /**
> > > +    * @max_segment:
> > > +    *
> > > +    * Max size for scatter list segments.  When unset the default
> > > +    * (SCATTERLIST_MAX_SEGMENT) is used.
> > > +    */
> > > +   size_t max_segment;
> >
> > Is there no better place for this then "at the bottom"? drm_device is a
> > huge structure, piling stuff up randomly doesn't make it better :-)
>
> Moved next to the other gem fields for now (v3 posted).
>
> > I think ideally we'd have a gem substruct like we have on the modeset side
> > at least.
>
> Phew, that'll be quite some churn in the tree.  And there aren't that many
> gem-related fields in struct drm_device.
>
> So you are looking for something like below (header changes only)?

Hm yeah it's a lot less than I thought. And yes I think that would be neat.
-Daniel

>
> take care,
>   Gerd
>
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c455ef404ca6..950167ede98a 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -299,22 +299,8 @@ struct drm_device {
>         /** @mode_config: Current mode config */
>         struct drm_mode_config mode_config;
>
> -       /** @object_name_lock: GEM information */
> -       struct mutex object_name_lock;
> -
> -       /** @object_name_idr: GEM information */
> -       struct idr object_name_idr;
> -
> -       /** @vma_offset_manager: GEM information */
> -       struct drm_vma_offset_manager *vma_offset_manager;
> -
> -       /**
> -        * @max_segment:
> -        *
> -        * Max size for scatter list segments for GEM objects.  When
> -        * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
> -        */
> -       size_t max_segment;
> +       /** @gem_config: Current GEM config */
> +       struct drm_gem_config gem_config;
>
>         /** @vram_mm: VRAM MM memory manager */
>         struct drm_vram_mm *vram_mm;
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 337a48321705..74129fb29fb8 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -39,6 +39,25 @@
>
>  #include <drm/drm_vma_manager.h>
>
> +struct drm_gem_config {
> +       /** @object_name_lock: GEM information */
> +       struct mutex object_name_lock;
> +
> +       /** @object_name_idr: GEM information */
> +       struct idr object_name_idr;
> +
> +       /** @vma_offset_manager: GEM information */
> +       struct drm_vma_offset_manager *vma_offset_manager;
> +
> +       /**
> +        * @max_segment:
> +        *
> +        * Max size for scatter list segments for GEM objects.  When
> +        * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
> +        */
> +       size_t max_segment;
> +};
> +
>  struct drm_gem_object;
>
>  /**
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
