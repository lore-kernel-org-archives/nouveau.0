From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] drm/ttm: remove unused varibles
Date: Thu, 19 Nov 2020 21:18:43 +0100
Message-ID: <b01b7e6a-eb79-296e-7f65-2015f020b56d@amd.com>
References: <1605854993-50218-1-git-send-email-tiantao6@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <1605854993-50218-1-git-send-email-tiantao6@hisilicon.com>
Content-Language: en-US
To: Tian Tao <tiantao6@hisilicon.com>, bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
List-Id: nouveau.vger.kernel.org

Am 20.11.20 um 07:49 schrieb Tian Tao:
> fixed the following warnings
> drivers/gpu/drm/nouveau/nouveau_bo.c:1227:17: warning: variable ‘dev’
> set but not used [-Wunused-but-set-variable]
> drivers/gpu/drm/nouveau/nouveau_bo.c:1251:17: warning: variable ‘dev’
> set but not used [-Wunused-but-set-variable]
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

The subject should read drm/nouveau instead of drm/ttm, but apart from 
that the patch is Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 2 --
>   1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 7aa4286..9465f56 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1228,7 +1228,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>   {
>   	struct ttm_tt *ttm_dma = (void *)ttm;
>   	struct nouveau_drm *drm;
> -	struct device *dev;
>   	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
>   
>   	if (ttm_tt_is_populated(ttm))
> @@ -1242,7 +1241,6 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>   	}
>   
>   	drm = nouveau_bdev(bdev);
> -	dev = drm->dev->dev;
>   
>   	return ttm_pool_alloc(&drm->ttm.bdev.pool, ttm, ctx);
>   }
