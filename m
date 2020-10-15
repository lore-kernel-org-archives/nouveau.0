From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 04/10] drm/exynos: Remove empty
 exynos_drm_gem_prime_{vmap,vunmap}()
Date: Thu, 15 Oct 2020 16:00:42 +0200
Message-ID: <7a6f6526-1b67-61c8-2239-50f2bfbdc29d@amd.com>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-5-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20201015123806.32416-5-tzimmermann@suse.de>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com, kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com, alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com, ray.huang@amd.com, sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.c
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org, nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
List-Id: nouveau.vger.kernel.org

Am 15.10.20 um 14:38 schrieb Thomas Zimmermann:
> The functions exynos_drm_gem_prime_{vmap,vunmap}() are empty. Remove
> them before changing the interface to use struct drm_buf_map. As a side
> effect of removing drm_gem_prime_vmap(), the error code changes from
> ENOMEM to EOPNOTSUPP.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/exynos/exynos_drm_gem.c | 12 ------------
>   drivers/gpu/drm/exynos/exynos_drm_gem.h |  2 --
>   2 files changed, 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index e7a6eb96f692..13a35623ac04 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -137,8 +137,6 @@ static const struct vm_operations_struct exynos_drm_gem_vm_ops = {
>   static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs = {
>   	.free = exynos_drm_gem_free_object,
>   	.get_sg_table = exynos_drm_gem_prime_get_sg_table,
> -	.vmap = exynos_drm_gem_prime_vmap,
> -	.vunmap	= exynos_drm_gem_prime_vunmap,
>   	.vm_ops = &exynos_drm_gem_vm_ops,
>   };
>   
> @@ -471,16 +469,6 @@ exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>   	return &exynos_gem->base;
>   }
>   
> -void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj)
> -{
> -	return NULL;
> -}
> -
> -void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> -{
> -	/* Nothing to do */
> -}
> -
>   int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>   			      struct vm_area_struct *vma)
>   {
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> index 74e926abeff0..a23272fb96fb 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
> @@ -107,8 +107,6 @@ struct drm_gem_object *
>   exynos_drm_gem_prime_import_sg_table(struct drm_device *dev,
>   				     struct dma_buf_attachment *attach,
>   				     struct sg_table *sgt);
> -void *exynos_drm_gem_prime_vmap(struct drm_gem_object *obj);
> -void exynos_drm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   int exynos_drm_gem_prime_mmap(struct drm_gem_object *obj,
>   			      struct vm_area_struct *vma);
>   
