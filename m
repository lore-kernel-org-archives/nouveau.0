From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH v4 01/10] drm/vram-helper: Remove invariant parameters
 from internal kmap function
Date: Thu, 15 Oct 2020 15:57:14 +0200
Message-ID: <06cab96a-5224-46dc-dbd2-8eb4950946cc@gmail.com>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-2-tzimmermann@suse.de>
Reply-To: christian.koenig@amd.com
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20201015123806.32416-2-tzimmermann@suse.de>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com, christian.koenig@amd.com, kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com, alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com, ray.huang@amd.com, sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuik
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org, nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>, etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, linaro-mm-sig@lists.linaro.org, linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org, spice-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Am 15.10.20 um 14:37 schrieb Thomas Zimmermann:
> The parameters map and is_iomem are always of the same value. Removed them
> to prepares the function for conversion to struct dma_buf_map.
>
> v4:
> 	* don't check for !kmap->virtual; will always be false
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/drm_gem_vram_helper.c | 18 ++++--------------
>   1 file changed, 4 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 3213429f8444..2d5ed30518f1 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -382,32 +382,22 @@ int drm_gem_vram_unpin(struct drm_gem_vram_object *gbo)
>   }
>   EXPORT_SYMBOL(drm_gem_vram_unpin);
>   
> -static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo,
> -				      bool map, bool *is_iomem)
> +static void *drm_gem_vram_kmap_locked(struct drm_gem_vram_object *gbo)
>   {
>   	int ret;
>   	struct ttm_bo_kmap_obj *kmap = &gbo->kmap;
> +	bool is_iomem;
>   
>   	if (gbo->kmap_use_count > 0)
>   		goto out;
>   
> -	if (kmap->virtual || !map)
> -		goto out;
> -
>   	ret = ttm_bo_kmap(&gbo->bo, 0, gbo->bo.num_pages, kmap);
>   	if (ret)
>   		return ERR_PTR(ret);
>   
>   out:
> -	if (!kmap->virtual) {
> -		if (is_iomem)
> -			*is_iomem = false;
> -		return NULL; /* not mapped; don't increment ref */
> -	}
>   	++gbo->kmap_use_count;
> -	if (is_iomem)
> -		return ttm_kmap_obj_virtual(kmap, is_iomem);
> -	return kmap->virtual;
> +	return ttm_kmap_obj_virtual(kmap, &is_iomem);
>   }
>   
>   static void drm_gem_vram_kunmap_locked(struct drm_gem_vram_object *gbo)
> @@ -452,7 +442,7 @@ void *drm_gem_vram_vmap(struct drm_gem_vram_object *gbo)
>   	ret = drm_gem_vram_pin_locked(gbo, 0);
>   	if (ret)
>   		goto err_ttm_bo_unreserve;
> -	base = drm_gem_vram_kmap_locked(gbo, true, NULL);
> +	base = drm_gem_vram_kmap_locked(gbo);
>   	if (IS_ERR(base)) {
>   		ret = PTR_ERR(base);
>   		goto err_drm_gem_vram_unpin_locked;
