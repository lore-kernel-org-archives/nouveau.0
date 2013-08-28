From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH 3/6] drm/nouveau: hook up cache sync functions
Date: Wed, 28 Aug 2013 12:43:57 -0400
Message-ID: <20130828164357.GB27172@phenom.dumpdata.com>
References: <1377648050-6649-1-git-send-email-dev@lynxeye.de>
	<1377648050-6649-4-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <1377648050-6649-4-git-send-email-dev@lynxeye.de>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Aug 28, 2013 at 02:00:47AM +0200, Lucas Stach wrote:
> Signed-off-by: Lucas Stach <dev@lynxeye.de>
> ---
>  drivers/gpu/drm/nouveau/nouveau_bo.c  | 4 ++++
>  drivers/gpu/drm/nouveau/nouveau_gem.c | 5 +++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index af20fba..f4a2eb9 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -411,6 +411,10 @@ nouveau_bo_validate(struct nouveau_bo *nvbo, bool interruptible,
>  {
>  	int ret;
>  
> +	if (nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)

You don't want to do it also for tt_wc ?

> +		ttm_dma_tt_cache_sync_for_device((struct ttm_dma_tt *)nvbo->bo.ttm,
> +			&nouveau_bdev(nvbo->bo.ttm->bdev)->dev->pdev->dev);
> +
>  	ret = ttm_bo_validate(&nvbo->bo, &nvbo->placement,
>  			      interruptible, no_wait_gpu);
>  	if (ret)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 830cb7b..f632b92 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -901,6 +901,11 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
>  	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
>  	spin_unlock(&nvbo->bo.bdev->fence_lock);
>  	drm_gem_object_unreference_unlocked(gem);
> +
> +	if (!ret && nvbo->bo.ttm && nvbo->bo.ttm->caching_state == tt_cached)

Ditto? 
> +		ttm_dma_tt_cache_sync_for_cpu((struct ttm_dma_tt *)nvbo->bo.ttm,
> +					      &dev->pdev->dev);
> +
>  	return ret;
>  }
>  
> -- 
> 1.8.3.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
