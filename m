From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 4/9] nouveau: factor out dmem fence completion
Date: Mon, 29 Jul 2019 16:23:18 -0700
Message-ID: <f2af6247-c935-12de-fb12-e418101efdfa@nvidia.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-5-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190729142843.22320-5-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Bharata B Rao <bharata@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org


On 7/29/19 7:28 AM, Christoph Hellwig wrote:
> Factor out the end of fencing logic from the two migration routines.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 33 ++++++++++++--------------
>   1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index d469bc334438..21052a4aaf69 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -133,6 +133,19 @@ static void nouveau_dmem_page_free(struct page *page)
>   	spin_unlock(&chunk->lock);
>   }
>   
> +static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
> +{
> +	if (fence) {
> +		nouveau_fence_wait(*fence, true, false);
> +		nouveau_fence_unref(fence);
> +	} else {
> +		/*
> +		 * FIXME wait for channel to be IDLE before calling finalizing
> +		 * the hmem object.
> +		 */
> +	}
> +}
> +
>   static void
>   nouveau_dmem_fault_alloc_and_copy(struct vm_area_struct *vma,
>   				  const unsigned long *src_pfns,
> @@ -236,15 +249,7 @@ nouveau_dmem_fault_finalize_and_map(struct nouveau_dmem_fault *fault)
>   {
>   	struct nouveau_drm *drm = fault->drm;
>   
> -	if (fault->fence) {
> -		nouveau_fence_wait(fault->fence, true, false);
> -		nouveau_fence_unref(&fault->fence);
> -	} else {
> -		/*
> -		 * FIXME wait for channel to be IDLE before calling finalizing
> -		 * the hmem object below (nouveau_migrate_hmem_fini()).
> -		 */
> -	}
> +	nouveau_dmem_fence_done(&fault->fence);
>   
>   	while (fault->npages--) {
>   		dma_unmap_page(drm->dev->dev, fault->dma[fault->npages],
> @@ -748,15 +753,7 @@ nouveau_dmem_migrate_finalize_and_map(struct nouveau_migrate *migrate)
>   {
>   	struct nouveau_drm *drm = migrate->drm;
>   
> -	if (migrate->fence) {
> -		nouveau_fence_wait(migrate->fence, true, false);
> -		nouveau_fence_unref(&migrate->fence);
> -	} else {
> -		/*
> -		 * FIXME wait for channel to be IDLE before finalizing
> -		 * the hmem object below (nouveau_migrate_hmem_fini()) ?
> -		 */
> -	}
> +	nouveau_dmem_fence_done(&migrate->fence);
>   
>   	while (migrate->dma_nr--) {
>   		dma_unmap_page(drm->dev->dev, migrate->dma[migrate->dma_nr],
> 
