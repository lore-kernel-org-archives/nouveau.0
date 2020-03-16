From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] mm: remove device private page support
 from hmm_range_fault
Date: Mon, 16 Mar 2020 11:42:19 -0700
Message-ID: <c099cc3c-c19f-9d61-4297-2e83df899ca4@nvidia.com>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-3-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200316175259.908713-3-hch-jcswGhMUV9g@public.gmane.org>
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
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


On 3/16/20 10:52 AM, Christoph Hellwig wrote:
> No driver has actually used properly wire up and support this feature.
> There is various code related to it in nouveau, but as far as I can tell
> it never actually got turned on, and the only changes since the initial
> commit are global cleanups.

This is not actually true. OpenCL 2.x does support SVM with nouveau and
device private memory via clEnqueueSVMMigrateMem().
Also, Ben Skeggs has accepted a set of patches to map GPU memory after being
migrated and this change would conflict with that.


> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  | 37 -------------------------
>   drivers/gpu/drm/nouveau/nouveau_dmem.h  |  2 --
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |  3 --
>   include/linux/hmm.h                     |  2 --
>   mm/hmm.c                                | 28 -------------------
>   6 files changed, 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index dee446278417..90821ce5e6ca 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -776,7 +776,6 @@ struct amdgpu_ttm_tt {
>   static const uint64_t hmm_range_flags[HMM_PFN_FLAG_MAX] = {
>   	(1 << 0), /* HMM_PFN_VALID */
>   	(1 << 1), /* HMM_PFN_WRITE */
> -	0 /* HMM_PFN_DEVICE_PRIVATE */
>   };
>   
>   static const uint64_t hmm_range_values[HMM_PFN_VALUE_MAX] = {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 7605c4c48985..42808efceaf2 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -671,40 +671,3 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   out:
>   	return ret;
>   }
> -
> -static inline bool
> -nouveau_dmem_page(struct nouveau_drm *drm, struct page *page)
> -{
> -	return is_device_private_page(page) && drm->dmem == page_to_dmem(page);
> -}
> -
> -void
> -nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
> -			 struct hmm_range *range)
> -{
> -	unsigned long i, npages;
> -
> -	npages = (range->end - range->start) >> PAGE_SHIFT;
> -	for (i = 0; i < npages; ++i) {
> -		struct page *page;
> -		uint64_t addr;
> -
> -		page = hmm_device_entry_to_page(range, range->pfns[i]);
> -		if (page == NULL)
> -			continue;
> -
> -		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> -			continue;
> -		}
> -
> -		if (!nouveau_dmem_page(drm, page)) {
> -			WARN(1, "Some unknown device memory !\n");
> -			range->pfns[i] = 0;
> -			continue;
> -		}
> -
> -		addr = nouveau_dmem_page_addr(page);
> -		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
> -		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
> -	}
> -}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.h b/drivers/gpu/drm/nouveau/nouveau_dmem.h
> index 92394be5d649..1ac620b3d4fb 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.h
> @@ -38,8 +38,6 @@ int nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   			     unsigned long start,
>   			     unsigned long end);
>   
> -void nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
> -			      struct hmm_range *range);
>   #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
>   static inline void nouveau_dmem_init(struct nouveau_drm *drm) {}
>   static inline void nouveau_dmem_fini(struct nouveau_drm *drm) {}
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index df9bf1fd1bc0..7e0376dca137 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -367,7 +367,6 @@ static const u64
>   nouveau_svm_pfn_flags[HMM_PFN_FLAG_MAX] = {
>   	[HMM_PFN_VALID         ] = NVIF_VMM_PFNMAP_V0_V,
>   	[HMM_PFN_WRITE         ] = NVIF_VMM_PFNMAP_V0_W,
> -	[HMM_PFN_DEVICE_PRIVATE] = NVIF_VMM_PFNMAP_V0_VRAM,
>   };
>   
>   static const u64
> @@ -558,8 +557,6 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>   		break;
>   	}
>   
> -	nouveau_dmem_convert_pfn(drm, &range);
> -
>   	svmm->vmm->vmm.object.client->super = true;
>   	ret = nvif_object_ioctl(&svmm->vmm->vmm.object, data, size, NULL);
>   	svmm->vmm->vmm.object.client->super = false;
> diff --git a/include/linux/hmm.h b/include/linux/hmm.h
> index 4bf8d6997b12..5e6034f105c3 100644
> --- a/include/linux/hmm.h
> +++ b/include/linux/hmm.h
> @@ -74,7 +74,6 @@
>    * Flags:
>    * HMM_PFN_VALID: pfn is valid. It has, at least, read permission.
>    * HMM_PFN_WRITE: CPU page table has write permission set
> - * HMM_PFN_DEVICE_PRIVATE: private device memory (ZONE_DEVICE)
>    *
>    * The driver provides a flags array for mapping page protections to device
>    * PTE bits. If the driver valid bit for an entry is bit 3,
> @@ -86,7 +85,6 @@
>   enum hmm_pfn_flag_e {
>   	HMM_PFN_VALID = 0,
>   	HMM_PFN_WRITE,
> -	HMM_PFN_DEVICE_PRIVATE,
>   	HMM_PFN_FLAG_MAX
>   };
>   
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 180e398170b0..3d10485bf323 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -118,15 +118,6 @@ static inline void hmm_pte_need_fault(const struct hmm_vma_walk *hmm_vma_walk,
>   	/* We aren't ask to do anything ... */
>   	if (!(pfns & range->flags[HMM_PFN_VALID]))
>   		return;
> -	/* If this is device memory then only fault if explicitly requested */
> -	if ((cpu_flags & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> -		/* Do we fault on device memory ? */
> -		if (pfns & range->flags[HMM_PFN_DEVICE_PRIVATE]) {
> -			*write_fault = pfns & range->flags[HMM_PFN_WRITE];
> -			*fault = true;
> -		}
> -		return;
> -	}
>   
>   	/* If CPU page table is not valid then we need to fault */
>   	*fault = !(cpu_flags & range->flags[HMM_PFN_VALID]);
> @@ -259,25 +250,6 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   	if (!pte_present(pte)) {
>   		swp_entry_t entry = pte_to_swp_entry(pte);
>   
> -		/*
> -		 * This is a special swap entry, ignore migration, use
> -		 * device and report anything else as error.
> -		 */
> -		if (is_device_private_entry(entry)) {
> -			cpu_flags = range->flags[HMM_PFN_VALID] |
> -				range->flags[HMM_PFN_DEVICE_PRIVATE];
> -			cpu_flags |= is_write_device_private_entry(entry) ?
> -				range->flags[HMM_PFN_WRITE] : 0;
> -			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
> -					   &fault, &write_fault);
> -			if (fault || write_fault)
> -				goto fault;
> -			*pfn = hmm_device_entry_from_pfn(range,
> -					    swp_offset(entry));
> -			*pfn |= cpu_flags;
> -			return 0;
> -		}
> -
>   		hmm_pte_need_fault(hmm_vma_walk, orig_pfn, 0, &fault,
>   				   &write_fault);
>   		if (!fault && !write_fault)
> 
