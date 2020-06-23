From: John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH 2/3] nouveau: fix mixed normal and
 device private page migration
Date: Mon, 22 Jun 2020 17:30:50 -0700
Message-ID: <f2bf81df-8faa-0f51-3f74-cb3b31d96aad@nvidia.com>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200622233854.10889-3-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On 2020-06-22 16:38, Ralph Campbell wrote:
> The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
> migrate memory in the given address range to device private memory. The
> source pages might already have been migrated to device private memory.
> In that case, the source struct page is not checked to see if it is
> a device private page and incorrectly computes the GPU's physical
> address of local memory leading to data corruption.
> Fix this by checking the source struct page and computing the correct
> physical address.
> 
> Signed-off-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index cc9993837508..f6a806ba3caa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -540,6 +540,12 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   	if (!(src & MIGRATE_PFN_MIGRATE))
>   		goto out;
>   
> +	if (spage && is_device_private_page(spage)) {
> +		paddr = nouveau_dmem_page_addr(spage);
> +		*dma_addr = DMA_MAPPING_ERROR;
> +		goto done;
> +	}
> +
>   	dpage = nouveau_dmem_page_alloc_locked(drm);
>   	if (!dpage)
>   		goto out;
> @@ -560,6 +566,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   			goto out_free_page;
>   	}
>   
> +done:
>   	*pfn = NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
>   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>   	if (src & MIGRATE_PFN_WRITE)
> @@ -615,6 +622,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   	struct migrate_vma args = {
>   		.vma		= vma,
>   		.start		= start,
> +		.src_owner	= drm->dev,

Hi Ralph,

This .src_owner setting does look like a required fix, but it seems like
a completely separate fix from what is listed in this patch's commit
description, right? (It feels like a casualty of rearranging the patches.)


thanks,
-- 
John Hubbard
NVIDIA
