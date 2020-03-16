From: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [PATCH 2/4] mm: handle multiple owners of device private pages in
 migrate_vma
Date: Mon, 16 Mar 2020 14:43:13 -0700
Message-ID: <6a110540-f954-9f0f-e785-7365135d2934@nvidia.com>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-3-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <kvm-ppc-owner@vger.kernel.org>
In-Reply-To: <20200316193216.920734-3-hch@lst.de>
Content-Language: en-US
Sender: kvm-ppc-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org


On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> Add a new src_owner field to struct migrate_vma.  If the field is set,
> only device private pages with page->pgmap->owner equal to that field
> are migrated.  If the field is not set only "normal" pages are migrated.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Fixes: df6ad69838fc ("mm/device-public-memory: device memory cache coherent with CPU")

When migrating to device private memory, setting the src_owner lets the caller
know about source pages that are already migrated and skips pages migrated to a
different device similar to pages swapped out an actual swap device.
But, it prevents normal pages from being migrated to device private memory.
It can still be useful for the driver to know that a page is owned by a
different device if it has a device to device way of migrating data.
nouveau_dmem_migrate_vma() isn't setting args.src_owner so only normal pages
will be migrated which I guess is OK for now since nouveau doesn't handle
direct GPU to GPU migration currently.

When migrating device private memory to system memory due to a CPU fault,
the source page should be the device's device private struct page so if it
isn't, then it does make sense to not migrate whatever normal page is there.
nouveau_dmem_migrate_to_ram() sets src_owner so this case looks OK.

Just had to think this through.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c     | 1 +
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 +
>   include/linux/migrate.h                | 8 ++++++++
>   mm/migrate.c                           | 9 ++++++---
>   4 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 67fefb03b9b7..f44f6b27950f 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -563,6 +563,7 @@ kvmppc_svm_page_out(struct vm_area_struct *vma, unsigned long start,
>   	mig.end = end;
>   	mig.src = &src_pfn;
>   	mig.dst = &dst_pfn;
> +	mig.src_owner = &kvmppc_uvmem_pgmap;
>   
>   	mutex_lock(&kvm->arch.uvmem_lock);
>   	/* The requested page is already paged-out, nothing to do */
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index a4682272586e..0e36345d395c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -176,6 +176,7 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
>   		.end		= vmf->address + PAGE_SIZE,
>   		.src		= &src,
>   		.dst		= &dst,
> +		.src_owner	= drm->dev,
>   	};
>   
>   	/*
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 72120061b7d4..3e546cbf03dd 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -196,6 +196,14 @@ struct migrate_vma {
>   	unsigned long		npages;
>   	unsigned long		start;
>   	unsigned long		end;
> +
> +	/*
> +	 * Set to the owner value also stored in page->pgmap->owner for
> +	 * migrating out of device private memory.  If set only device
> +	 * private pages with this owner are migrated.  If not set
> +	 * device private pages are not migrated at all.
> +	 */
> +	void			*src_owner;
>   };
>   
>   int migrate_vma_setup(struct migrate_vma *args);
> diff --git a/mm/migrate.c b/mm/migrate.c
> index b1092876e537..7605d2c23433 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2241,7 +2241,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   	arch_enter_lazy_mmu_mode();
>   
>   	for (; addr < end; addr += PAGE_SIZE, ptep++) {
> -		unsigned long mpfn, pfn;
> +		unsigned long mpfn = 0, pfn;
>   		struct page *page;
>   		swp_entry_t entry;
>   		pte_t pte;
> @@ -2255,8 +2255,6 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   		}
>   
>   		if (!pte_present(pte)) {
> -			mpfn = 0;
> -
>   			/*
>   			 * Only care about unaddressable device page special
>   			 * page table entry. Other special swap entries are not
> @@ -2267,11 +2265,16 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   				goto next;
>   
>   			page = device_private_entry_to_page(entry);
> +			if (page->pgmap->owner != migrate->src_owner)
> +				goto next;
> +
>   			mpfn = migrate_pfn(page_to_pfn(page)) |
>   					MIGRATE_PFN_MIGRATE;
>   			if (is_write_device_private_entry(entry))
>   				mpfn |= MIGRATE_PFN_WRITE;
>   		} else {
> +			if (migrate->src_owner)
> +				goto next;
>   			pfn = pte_pfn(pte);
>   			if (is_zero_pfn(pfn)) {
>   				mpfn = MIGRATE_PFN_MIGRATE;
> 
