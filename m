From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v4 03/10] drm/etnaviv: Remove empty
 etnaviv_gem_prime_vunmap()
Date: Thu, 15 Oct 2020 15:59:51 +0200
Message-ID: <2a01560b-d7f7-e59e-cf71-50b36e0ee078@amd.com>
References: <20201015123806.32416-1-tzimmermann@suse.de>
 <20201015123806.32416-4-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
In-Reply-To: <20201015123806.32416-4-tzimmermann@suse.de>
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org, alexander.deucher@amd.com, kraxel@redhat.com, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk, christian.gmeiner@gmail.com, inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org, yuq825@gmail.com, bskeggs@redhat.com, robh@kernel.org, tomeu.vizoso@collabora.com, steven.price@arm.com, alyssa.rosenzweig@collabora.com, hjc@rock-chips.com, heiko@sntech.de, hdegoede@redhat.com, sean@poorly.run, eric@anholt.net, oleksandr_andrushchenko@epam.com, ray.huang@amd.com, sumit.semwal@linaro.org, emil.velikov@collabora.com, luben.tuikov@amd.com, apaneers@amd.c
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org, nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, xen-devel@lists.xenproject.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
List-Id: nouveau.vger.kernel.org

Am 15.10.20 um 14:37 schrieb Thomas Zimmermann:
> The function etnaviv_gem_prime_vunmap() is empty. Remove it before
> changing the interface to use struct drm_buf_map.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       | 1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       | 1 -
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c | 5 -----
>   3 files changed, 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> index 914f0867ff71..9682c26d89bb 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> @@ -52,7 +52,6 @@ int etnaviv_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>   int etnaviv_gem_mmap_offset(struct drm_gem_object *obj, u64 *offset);
>   struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj);
>   void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj);
> -void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
>   int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>   			   struct vm_area_struct *vma);
>   struct drm_gem_object *etnaviv_gem_prime_import_sg_table(struct drm_device *dev,
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> index 67d9a2b9ea6a..bbd235473645 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> @@ -571,7 +571,6 @@ static const struct drm_gem_object_funcs etnaviv_gem_object_funcs = {
>   	.unpin = etnaviv_gem_prime_unpin,
>   	.get_sg_table = etnaviv_gem_prime_get_sg_table,
>   	.vmap = etnaviv_gem_prime_vmap,
> -	.vunmap = etnaviv_gem_prime_vunmap,
>   	.vm_ops = &vm_ops,
>   };
>   
> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> index 135fbff6fecf..a6d9932a32ae 100644
> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
> @@ -27,11 +27,6 @@ void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
>   	return etnaviv_gem_vmap(obj);
>   }
>   
> -void etnaviv_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr)
> -{
> -	/* TODO msm_gem_vunmap() */
> -}
> -
>   int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
>   			   struct vm_area_struct *vma)
>   {
