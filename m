From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH hmm v2 5/5] mm/hmm: remove the customizable
 pfn format from hmm_range_fault
Date: Fri, 1 May 2020 17:53:26 -0700
Message-ID: <3c06a94c-c17f-dc31-537e-f3f6e1ace9a2@nvidia.com>
References: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <5-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
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
To: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "Yang, Philip" <Philip.Yang-5C7GfCeVMHo@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Niranjana Vishwanathapura <niranjana.vishwanathapura-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 5/1/20 11:20 AM, Jason Gunthorpe wrote:
> From: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> Presumably the intent here was that hmm_range_fault() could put the data
> into some HW specific format and thus avoid some work. However, nothing
> actually does that, and it isn't clear how anything actually could do that
> as hmm_range_fault() provides CPU addresses which must be DMA mapped.
> 
> Perhaps there is some special HW that does not need DMA mapping, but we
> don't have any examples of this, and the theoretical performance win of
> avoiding an extra scan over the pfns array doesn't seem worth the
> complexity. Plus pfns needs to be scanned anyhow to sort out any
> DEVICE_PRIVATE pages.
> 
> This version replaces the uint64_t with an usigned long containing a pfn
> and fixed flags. On input flags is filled with the HMM_PFN_REQ_* values,
> on successful output it is filled with HMM_PFN_* values, describing the
> state of the pages.
> 
> amdgpu is simple to convert, it doesn't use snapshot and doesn't use
> per-page flags.
> 
> nouveau uses only 16 hmm_pte entries at most (ie fits in a few cache
> lines), and it sweeps over its pfns array a couple of times anyhow. It
> also has a nasty call chain before it reaches the dma map and hardware
> suggesting performance isn't important:
> 
>     nouveau_svm_fault():
>       args.i.m.method = NVIF_VMM_V0_PFNMAP
>       nouveau_range_fault()
>        nvif_object_ioctl()
>         client->driver->ioctl()
> 	  struct nvif_driver nvif_driver_nvkm:
> 	    .ioctl = nvkm_client_ioctl
> 	   nvkm_ioctl()
> 	    nvkm_ioctl_path()
> 	      nvkm_ioctl_v0[type].func(..)
> 	      nvkm_ioctl_mthd()
> 	       nvkm_object_mthd()
> 		  struct nvkm_object_func nvkm_uvmm:
> 		    .mthd = nvkm_uvmm_mthd
> 		   nvkm_uvmm_mthd()
> 		    nvkm_uvmm_mthd_pfnmap()
> 		     nvkm_vmm_pfn_map()
> 		      nvkm_vmm_ptes_get_map()
> 		       func == gp100_vmm_pgt_pfn
> 			struct nvkm_vmm_desc_func gp100_vmm_desc_spt:
> 			  .pfn = gp100_vmm_pgt_pfn
> 			 nvkm_vmm_iter()
> 			  REF_PTES == func == gp100_vmm_pgt_pfn()
> 			    dma_map_page()
> 
> Acked-by: Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>
> Tested-by: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
> ---
>   Documentation/vm/hmm.rst                |  26 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  35 ++----
>   drivers/gpu/drm/nouveau/nouveau_dmem.c  |  27 +---
>   drivers/gpu/drm/nouveau/nouveau_dmem.h  |   3 +-
>   drivers/gpu/drm/nouveau/nouveau_svm.c   |  87 ++++++++-----
>   include/linux/hmm.h                     |  99 ++++++---------
>   mm/hmm.c                                | 160 +++++++++++-------------
>   7 files changed, 192 insertions(+), 245 deletions(-)
> 

...snip...

>   
> +static void nouveau_hmm_convert_pfn(struct nouveau_drm *drm,
> +				    struct hmm_range *range, u64 *ioctl_addr)
> +{
> +	unsigned long i, npages;
> +
> +	/*
> +	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
> +	 * to an eventual DMA map in something like gp100_vmm_pgt_pfn()
> +	 *
> +	 * This is all just encoding the internal hmm reprensetation into a

s/reprensetation/representation/

Looks good and still tests OK with nouveau.
