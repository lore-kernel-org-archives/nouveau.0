From: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH 5/9] nouveau: simplify nouveau_dmem_migrate_to_ram
Date: Wed, 31 Jul 2019 15:27:35 +0530
Message-ID: <20190731095735.GB18807@in.ibm.com>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-6-hch@lst.de>
Reply-To: bharata@linux.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190729142843.22320-6-hch@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Ralph Campbell <rcampbell@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Mon, Jul 29, 2019 at 05:28:39PM +0300, Christoph Hellwig wrote:
> Factor the main copy page to ram routine out into a helper that acts on
> a single page and which doesn't require the nouveau_dmem_fault
> structure for argument passing.  Also remove the loop over multiple
> pages as we only handle one at the moment, although the structure of
> the main worker function makes it relatively easy to add multi page
> support back if needed in the future.  But at least for now this avoid
> the needed to dynamically allocate memory for the dma addresses in
> what is essentially the page fault path.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 158 ++++++-------------------
>  1 file changed, 39 insertions(+), 119 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 21052a4aaf69..036e6c07d489 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -86,13 +86,6 @@ static inline struct nouveau_dmem *page_to_dmem(struct page *page)
>  	return container_of(page->pgmap, struct nouveau_dmem, pagemap);
>  }
>  
> -struct nouveau_dmem_fault {
> -	struct nouveau_drm *drm;
> -	struct nouveau_fence *fence;
> -	dma_addr_t *dma;
> -	unsigned long npages;
> -};
> -
>  struct nouveau_migrate {
>  	struct vm_area_struct *vma;
>  	struct nouveau_drm *drm;
> @@ -146,130 +139,55 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
>  	}
>  }
>  
> -static void
> -nouveau_dmem_fault_alloc_and_copy(struct vm_area_struct *vma,
> -				  const unsigned long *src_pfns,
> -				  unsigned long *dst_pfns,
> -				  unsigned long start,
> -				  unsigned long end,
> -				  struct nouveau_dmem_fault *fault)
> +static vm_fault_t nouveau_dmem_fault_copy_one(struct nouveau_drm *drm,
> +		struct vm_area_struct *vma, unsigned long addr,
> +		unsigned long src, unsigned long *dst, dma_addr_t *dma_addr)
>  {
> -	struct nouveau_drm *drm = fault->drm;
>  	struct device *dev = drm->dev->dev;
> -	unsigned long addr, i, npages = 0;
> -	nouveau_migrate_copy_t copy;
> -	int ret;
> -
> -
> -	/* First allocate new memory */
> -	for (addr = start, i = 0; addr < end; addr += PAGE_SIZE, i++) {
> -		struct page *dpage, *spage;
> -
> -		dst_pfns[i] = 0;
> -		spage = migrate_pfn_to_page(src_pfns[i]);
> -		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> +	struct page *dpage, *spage;
>  
> -		dpage = alloc_page_vma(GFP_HIGHUSER, vma, addr);
> -		if (!dpage) {
> -			dst_pfns[i] = MIGRATE_PFN_ERROR;
> -			continue;
> -		}
> -		lock_page(dpage);
> -
> -		dst_pfns[i] = migrate_pfn(page_to_pfn(dpage)) |
> -			      MIGRATE_PFN_LOCKED;
> -		npages++;
> -	}
> +	spage = migrate_pfn_to_page(src);
> +	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
> +		return 0;
>  
> -	/* Allocate storage for DMA addresses, so we can unmap later. */
> -	fault->dma = kmalloc(sizeof(*fault->dma) * npages, GFP_KERNEL);
> -	if (!fault->dma)
> +	dpage = alloc_page_vma(GFP_HIGHUSER, args->vma, addr);
> +	if (!dpage)
>  		goto error;
> +	lock_page(dpage);
>  
> -	/* Copy things over */
> -	copy = drm->dmem->migrate.copy_func;
> -	for (addr = start, i = 0; addr < end; addr += PAGE_SIZE, i++) {
> -		struct page *spage, *dpage;
> -
> -		dpage = migrate_pfn_to_page(dst_pfns[i]);
> -		if (!dpage || dst_pfns[i] == MIGRATE_PFN_ERROR)
> -			continue;
> -
> -		spage = migrate_pfn_to_page(src_pfns[i]);
> -		if (!spage || !(src_pfns[i] & MIGRATE_PFN_MIGRATE)) {
> -			dst_pfns[i] = MIGRATE_PFN_ERROR;
> -			__free_page(dpage);
> -			continue;
> -		}
> -
> -		fault->dma[fault->npages] =
> -			dma_map_page_attrs(dev, dpage, 0, PAGE_SIZE,
> -					   PCI_DMA_BIDIRECTIONAL,
> -					   DMA_ATTR_SKIP_CPU_SYNC);
> -		if (dma_mapping_error(dev, fault->dma[fault->npages])) {
> -			dst_pfns[i] = MIGRATE_PFN_ERROR;
> -			__free_page(dpage);
> -			continue;
> -		}
> -
> -		ret = copy(drm, 1, NOUVEAU_APER_HOST,
> -				fault->dma[fault->npages++],
> -				NOUVEAU_APER_VRAM,
> -				nouveau_dmem_page_addr(spage));
> -		if (ret) {
> -			dst_pfns[i] = MIGRATE_PFN_ERROR;
> -			__free_page(dpage);
> -			continue;
> -		}
> -	}
> +	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
> +	if (dma_mapping_error(dev, *dma_addr))
> +		goto error_free_page;
>  
> -	nouveau_fence_new(drm->dmem->migrate.chan, false, &fault->fence);
> +	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
> +			NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage)))
> +		goto error_dma_unmap;
>  
> -	return;
> +	*dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
>  
> +error_dma_unmap:
> +	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
> +error_free_page:
> +	__free_page(dpage);
>  error:
> -	for (addr = start, i = 0; addr < end; addr += PAGE_SIZE, ++i) {
> -		struct page *page;
> -
> -		if (!dst_pfns[i] || dst_pfns[i] == MIGRATE_PFN_ERROR)
> -			continue;
> -
> -		page = migrate_pfn_to_page(dst_pfns[i]);
> -		dst_pfns[i] = MIGRATE_PFN_ERROR;
> -		if (page == NULL)
> -			continue;
> -
> -		__free_page(page);
> -	}
> -}
> -
> -static void
> -nouveau_dmem_fault_finalize_and_map(struct nouveau_dmem_fault *fault)
> -{
> -	struct nouveau_drm *drm = fault->drm;
> -
> -	nouveau_dmem_fence_done(&fault->fence);
> -
> -	while (fault->npages--) {
> -		dma_unmap_page(drm->dev->dev, fault->dma[fault->npages],
> -			       PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> -	}
> -	kfree(fault->dma);
> +	return VM_FAULT_SIGBUS;

Looks like nouveau_dmem_fault_copy_one() is now returning VM_FAULT_SIGBUS
for success case. Is this expected?

Regards,
Bharata.
