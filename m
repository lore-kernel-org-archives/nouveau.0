From: Thomas Hellstrom <thomas@shipmail.org>
Subject: Re: [PATCH 1/3] drm/nouveau: add reservation to
	nouveau_gem_ioctl_cpu_prep
Date: Thu, 18 Oct 2012 18:30:12 +0200
Message-ID: <50802E94.3040706@shipmail.org>
References: <50783208.305@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <50783208.305@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

So this is a typical case where a NO_WAIT can indeed become a WAIT
because of the use of a reservation instead of a spinlock.

(See the remove_fence_lock discussion)

/Thomas


On 10/12/2012 05:06 PM, Maarten Lankhorst wrote:
> Apart from some code inside ttm itself and nouveau_bo_vma_del,
> this is the only place where ttm_bo_wait is used without a reservation.
> Fix this so we can remove the fence_lock later on.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_gem.c |   22 ++++++++++++++++++----
>   1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
> index 5e2f521..18342b0 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> @@ -837,17 +837,31 @@ nouveau_gem_ioctl_cpu_prep(struct drm_device *dev, void *data,
>   	struct drm_gem_object *gem;
>   	struct nouveau_bo *nvbo;
>   	bool no_wait = !!(req->flags & NOUVEAU_GEM_CPU_PREP_NOWAIT);
> -	int ret = -EINVAL;
> +	int ret;
> +	struct nouveau_fence *fence = NULL;
>   
>   	gem = drm_gem_object_lookup(dev, file_priv, req->handle);
>   	if (!gem)
>   		return -ENOENT;
>   	nvbo = nouveau_gem_object(gem);
>   
> -	spin_lock(&nvbo->bo.bdev->fence_lock);
> -	ret = ttm_bo_wait(&nvbo->bo, true, true, no_wait);
> -	spin_unlock(&nvbo->bo.bdev->fence_lock);
> +	ret = ttm_bo_reserve(&nvbo->bo, true, false, false, 0);
> +	if (!ret) {
> +		spin_lock(&nvbo->bo.bdev->fence_lock);
> +		ret = ttm_bo_wait(&nvbo->bo, true, true, true);
> +		if (!no_wait && ret)
> +			fence = nouveau_fence_ref(nvbo->bo.sync_obj);
> +		spin_unlock(&nvbo->bo.bdev->fence_lock);
> +
> +		ttm_bo_unreserve(&nvbo->bo);
> +	}
>   	drm_gem_object_unreference_unlocked(gem);
> +
> +	if (fence) {
> +		ret = nouveau_fence_wait(fence, true, no_wait);
> +		nouveau_fence_unref(&fence);
> +	}
> +
>   	return ret;
>   }
>   
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
