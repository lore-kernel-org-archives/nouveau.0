From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH hmm 5/5] mm/hmm: remove the customizable pfn format
 from hmm_range_fault
Date: Wed, 22 Apr 2020 08:03:29 +0200
Message-ID: <20200422060329.GD22366@lst.de>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com> <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, "Kuehling, Felix" <Felix.Kuehling@amd.com>, Christoph Hellwig <hch@lst.de>, intel-gfx@lists.freedesktop.org, =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org



On Tue, Apr 21, 2020 at 09:21:46PM -0300, Jason Gunthorpe wrote:
> +void nouveau_hmm_convert_pfn(struct nouveau_drm *drm, struct hmm_range *range,
> +			     u64 *ioctl_addr)
>  {
>  	unsigned long i, npages;
>  
> +	/*
> +	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
> +	 * to an eventual DMA map on some call chain like:
> +	 *    nouveau_svm_fault():
> +	 *      args.i.m.method = NVIF_VMM_V0_PFNMAP
> +	 *      nouveau_range_fault()
> +	 *       nvif_object_ioctl()
> +	 *        client->driver->ioctl()
> +	 *           struct nvif_driver nvif_driver_nvkm:
> +	 *             .ioctl = nvkm_client_ioctl
> +	 *            nvkm_ioctl()
> +	 *             nvkm_ioctl_path()
> +	 *               nvkm_ioctl_v0[type].func(..)
> +	 *               nvkm_ioctl_mthd()
> +	 *                nvkm_object_mthd()
> +	 *                   struct nvkm_object_func nvkm_uvmm:
> +	 *                     .mthd = nvkm_uvmm_mthd
> +	 *                    nvkm_uvmm_mthd()
> +	 *                     nvkm_uvmm_mthd_pfnmap()
> +	 *                      nvkm_vmm_pfn_map()
> +	 *                       nvkm_vmm_ptes_get_map()
> +	 *                        func == gp100_vmm_pgt_pfn
> +	 *                         struct nvkm_vmm_desc_func gp100_vmm_desc_spt:
> +	 *                           .pfn = gp100_vmm_pgt_pfn
> +	 *                          nvkm_vmm_iter()
> +	 *                           REF_PTES == func == gp100_vmm_pgt_pfn()
> +	 *			      dma_map_page()
> +	 *
> +	 * This is all just encoding the internal hmm reprensetation into a
> +	 * different nouveau internal representation.
> +	 */

Nice callchain from hell..  Unfortunately such "code listings" tend to
get out of date very quickly, so I'm not sure it is worth keeping in
the code.  What would be really worthile is consolidating the two
different sets of defines (NVIF_VMM_PFNMAP_V0_ vs NVKM_VMM_PFN_)
to make the code a little easier to follow.

>  	npages = (range->end - range->start) >> PAGE_SHIFT;
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page;
>  
> +		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
> +			ioctl_addr[i] = 0;
>  			continue;
> +		}

Can't we rely on the caller pre-zeroing the array?

> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (is_device_private_page(page))
> +			ioctl_addr[i] = nouveau_dmem_page_addr(page) |
> +					NVIF_VMM_PFNMAP_V0_V |
> +					NVIF_VMM_PFNMAP_V0_VRAM;
> +		else
> +			ioctl_addr[i] = page_to_phys(page) |
> +					NVIF_VMM_PFNMAP_V0_V |
> +					NVIF_VMM_PFNMAP_V0_HOST;
> +		if (range->hmm_pfns[i] & HMM_PFN_WRITE)
> +			ioctl_addr[i] |= NVIF_VMM_PFNMAP_V0_W;

Now that this routine isn't really device memory specific any more, I
wonder if it should move to nouveau_svm.c.
