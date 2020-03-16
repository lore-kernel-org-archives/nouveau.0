From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Mon, 16 Mar 2020 15:49:51 -0700
Message-ID: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200316193216.920734-4-hch-jcswGhMUV9g@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: kvm-ppc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


On 3/16/20 12:32 PM, Christoph Hellwig wrote:
> Remove the code to fault device private pages back into system memory
> that has never been used by any driver.  Also replace the usage of the
> HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
> is_device_private_page check in nouveau.
> 
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>

Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
look at the struct page but what if a driver needs to fault in a page from
another device's private memory? Should it call handle_mm_fault()?


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  1 -
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  5 +++--
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |  1 -
>   include/linux/hmm.h                     |  2 --
>   mm/hmm.c                                | 25 +++++--------------------
>   5 files changed, 8 insertions(+), 26 deletions(-)
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
> index 0e36345d395c..edfd0805fba4 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -28,6 +28,7 @@
>   
>   #include <nvif/class.h>
>   #include <nvif/object.h>
> +#include <nvif/if000c.h>
>   #include <nvif/if500b.h>
>   #include <nvif/if900b.h>
>   
> @@ -692,9 +693,8 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   		if (page == NULL)
>   			continue;
>   
> -		if (!(range->pfns[i] & range->flags[HMM_PFN_DEVICE_PRIVATE])) {
> +		if (!is_device_private_page(page))
>   			continue;
> -		}
>   
>   		if (!nouveau_dmem_page(drm, page)) {
>   			WARN(1, "Some unknown device memory !\n");
> @@ -705,5 +705,6 @@ nouveau_dmem_convert_pfn(struct nouveau_drm *drm,
>   		addr = nouveau_dmem_page_addr(page);
>   		range->pfns[i] &= ((1UL << range->pfn_shift) - 1);
>   		range->pfns[i] |= (addr >> PAGE_SHIFT) << range->pfn_shift;
> +		range->pfns[i] |= NVIF_VMM_PFNMAP_V0_VRAM;
>   	}
>   }
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index df9bf1fd1bc0..39c731a99937 100644
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
> index 180e398170b0..cfad65f6a67b 100644
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
> @@ -260,21 +251,15 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   		swp_entry_t entry = pte_to_swp_entry(pte);
>   
>   		/*
> -		 * This is a special swap entry, ignore migration, use
> -		 * device and report anything else as error.
> +		 * Never fault in device private pages pages, but just report
> +		 * the PFN even if not present.
>   		 */
>   		if (is_device_private_entry(entry)) {
> -			cpu_flags = range->flags[HMM_PFN_VALID] |
> -				range->flags[HMM_PFN_DEVICE_PRIVATE];
> -			cpu_flags |= is_write_device_private_entry(entry) ?
> -				range->flags[HMM_PFN_WRITE] : 0;
> -			hmm_pte_need_fault(hmm_vma_walk, orig_pfn, cpu_flags,
> -					   &fault, &write_fault);
> -			if (fault || write_fault)
> -				goto fault;
>   			*pfn = hmm_device_entry_from_pfn(range,
>   					    swp_offset(entry));
> -			*pfn |= cpu_flags;
> +			*pfn |= range->flags[HMM_PFN_VALID];
> +			if (is_write_device_private_entry(entry))
> +				*pfn |= range->flags[HMM_PFN_WRITE];
>   			return 0;
>   		}
>   
> 
