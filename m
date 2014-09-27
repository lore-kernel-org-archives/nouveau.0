From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Subject: Re: [RFC PATCH 7/7] drm/prime: Support explicit fence on export
Date: Sat, 27 Sep 2014 08:49:39 +0200
Message-ID: <54265E03.80705@canonical.com>
References: <1411725612-10455-1-git-send-email-lpeltonen@nvidia.com>
 <1411725612-10455-8-git-send-email-lpeltonen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1411725612-10455-8-git-send-email-lpeltonen@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Lauri Peltonen <lpeltonen@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Colin Cross <ccross@android.com>, Dave Airlie <airlied@redhat.com>
Cc: Stephen Warren <swarren@nvidia.com>, nouveau@lists.freedesktop.org, James Jones <jajones@nvidia.com>, dri-devel@lists.freedesktop.org, Thierry Reding <treding@nvidia.com>, Ken Adams <kadams@nvidia.com>
List-Id: nouveau.vger.kernel.org



On 26-09-14 12:00, Lauri Peltonen wrote:
> Allow user space to provide an explicit sync fence fd when exporting
> a dma-buf from gem handle.  The fence will be stored as the explicit
> fence to the reservation object.
> 
> Signed-off-by: Lauri Peltonen <lpeltonen@nvidia.com>
> ---
>  drivers/gpu/drm/drm_prime.c | 41 +++++++++++++++++++++++++++++++++--------
>  include/uapi/drm/drm.h      |  9 ++++++++-
>  2 files changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
> index 2807a77..c69df2e 100644
> --- a/drivers/gpu/drm/drm_prime.c
> +++ b/drivers/gpu/drm/drm_prime.c
> @@ -28,8 +28,10 @@
>  
>  #include <linux/export.h>
>  #include <linux/dma-buf.h>
> +#include <linux/reservation.h>
>  #include <drm/drmP.h>
>  #include "drm_internal.h"
> +#include "../../staging/android/sync.h"
>  
>  /*
>   * DMA-BUF/GEM Object references and lifetime overview:
> @@ -329,7 +331,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
>   * drm_gem_prime_export - helper library implemention of the export callback
>   * @dev: drm_device to export from
>   * @obj: GEM object to export
> - * @flags: flags like DRM_CLOEXEC
> + * @flags: flags like DRM_CLOEXEC or DRM_SYNC_FD
>   *
>   * This is the implementation of the gem_prime_export functions for GEM drivers
>   * using the PRIME helpers.
> @@ -385,7 +387,7 @@ static struct dma_buf *export_and_register_object(struct drm_device *dev,
>   * @dev: dev to export the buffer from
>   * @file_priv: drm file-private structure
>   * @handle: buffer handle to export
> - * @flags: flags like DRM_CLOEXEC
> + * @flags: flags like DRM_CLOEXEC or DRM_SYNC_FD
>   * @prime_fd: pointer to storage for the fd id of the create dma-buf
>   *
>   * This is the PRIME export function which must be used mandatorily by GEM
> @@ -401,6 +403,24 @@ int drm_gem_prime_handle_to_fd(struct drm_device *dev,
>  	struct drm_gem_object *obj;
>  	int ret = 0;
>  	struct dma_buf *dmabuf;
> +	struct fence *fence = NULL;
> +
> +	if (flags & DRM_SYNC_FD) {
> +#ifdef CONFIG_SYNC
> +		struct sync_fence *sf = sync_fence_fdget(*prime_fd);
> +		if (!sf)
> +			return -ENOENT;
> +		if (sf->num_fences != 1) {
> +			sync_fence_put(sf);
> +			return -EINVAL;
> +		}
> +		fence = fence_get(sf->cbs[0].sync_pt);
> +		sync_fence_put(sf);
> +		flags &= ~DRM_SYNC_FD;
> +#else
> +		return -ENODEV;
> +#endif
> +	}
>  
>  	mutex_lock(&file_priv->prime.lock);
>  	obj = drm_gem_object_lookup(dev, file_priv, handle);
> @@ -453,6 +473,14 @@ out_have_obj:
>  		goto fail_put_dmabuf;
>  
>  out_have_handle:
> +	if (fence) {
> +		if (!dmabuf->resv) {
> +			ret = -ENODEV;
> +			goto fail_put_dmabuf;
> +		}
This is never true. A default resv gets allocated, see dma_buf's create function.

~Maarten

~Maarten
