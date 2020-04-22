From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH hmm 5/5] mm/hmm: remove the customizable pfn format from
 hmm_range_fault
Date: Wed, 22 Apr 2020 09:39:11 -0300
Message-ID: <20200422123911.GV26002@ziepe.ca>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <20200422060329.GD22366@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200422060329.GD22366@lst.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>, Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, dri-devel@lists.freedesktop.org, "Kuehling, Felix" <Felix.Kuehling@amd.com>, intel-gfx@lists.freedesktop.org, =?utf-8?B?SsOpcsO0bWU=?= Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, linux-kernel@vger.kernel.org, Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Wed, Apr 22, 2020 at 08:03:29AM +0200, Christoph Hellwig wrote:
> 
> 
> On Tue, Apr 21, 2020 at 09:21:46PM -0300, Jason Gunthorpe wrote:
> > +void nouveau_hmm_convert_pfn(struct nouveau_drm *drm, struct hmm_range *range,
> > +			     u64 *ioctl_addr)
> >  {
> >  	unsigned long i, npages;
> >  
> > +	/*
> > +	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
> > +	 * to an eventual DMA map on some call chain like:
> > +	 *    nouveau_svm_fault():
> > +	 *      args.i.m.method = NVIF_VMM_V0_PFNMAP
> > +	 *      nouveau_range_fault()
> > +	 *       nvif_object_ioctl()
> > +	 *        client->driver->ioctl()
> > +	 *           struct nvif_driver nvif_driver_nvkm:
> > +	 *             .ioctl = nvkm_client_ioctl
> > +	 *            nvkm_ioctl()
> > +	 *             nvkm_ioctl_path()
> > +	 *               nvkm_ioctl_v0[type].func(..)
> > +	 *               nvkm_ioctl_mthd()
> > +	 *                nvkm_object_mthd()
> > +	 *                   struct nvkm_object_func nvkm_uvmm:
> > +	 *                     .mthd = nvkm_uvmm_mthd
> > +	 *                    nvkm_uvmm_mthd()
> > +	 *                     nvkm_uvmm_mthd_pfnmap()
> > +	 *                      nvkm_vmm_pfn_map()
> > +	 *                       nvkm_vmm_ptes_get_map()
> > +	 *                        func == gp100_vmm_pgt_pfn
> > +	 *                         struct nvkm_vmm_desc_func gp100_vmm_desc_spt:
> > +	 *                           .pfn = gp100_vmm_pgt_pfn
> > +	 *                          nvkm_vmm_iter()
> > +	 *                           REF_PTES == func == gp100_vmm_pgt_pfn()
> > +	 *			      dma_map_page()
> > +	 *
> > +	 * This is all just encoding the internal hmm reprensetation into a
> > +	 * different nouveau internal representation.
> > +	 */
> 
> Nice callchain from hell..  Unfortunately such "code listings" tend to
> get out of date very quickly, so I'm not sure it is worth keeping in
> the code.  What would be really worthile is consolidating the two
> different sets of defines (NVIF_VMM_PFNMAP_V0_ vs NVKM_VMM_PFN_)
> to make the code a little easier to follow.

I was mainly concerned that this function is using hmm properly,
becuase it sure looks like it is just forming the CPU physical address
into a HW specific data. But it turns out it is just an internal data
for some other code and the dma_map is impossibly far away

It took forever to find, I figured I'd leave a hint for the next poor
soul that has to look at this.. 

Also, I think it shows there is no 'performance' argument here, if
this path needs more performance the above should be cleaned
before we abuse hmm_range_fault.

Put it in the commit message instead?

> >  	npages = (range->end - range->start) >> PAGE_SHIFT;
> >  	for (i = 0; i < npages; ++i) {
> >  		struct page *page;
> >  
> > +		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
> > +			ioctl_addr[i] = 0;
> >  			continue;
> > +		}
> 
> Can't we rely on the caller pre-zeroing the array?

This ends up as args.phys in nouveau_svm_fault - I didn't see a
zeroing?

I think it makes sense that this routine fully sets the output array
and does not assume pre-initialize

> > +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> > +		if (is_device_private_page(page))
> > +			ioctl_addr[i] = nouveau_dmem_page_addr(page) |
> > +					NVIF_VMM_PFNMAP_V0_V |
> > +					NVIF_VMM_PFNMAP_V0_VRAM;
> > +		else
> > +			ioctl_addr[i] = page_to_phys(page) |
> > +					NVIF_VMM_PFNMAP_V0_V |
> > +					NVIF_VMM_PFNMAP_V0_HOST;
> > +		if (range->hmm_pfns[i] & HMM_PFN_WRITE)
> > +			ioctl_addr[i] |= NVIF_VMM_PFNMAP_V0_W;
> 
> Now that this routine isn't really device memory specific any more, I
> wonder if it should move to nouveau_svm.c.

Yes, if we expose nouveau_dmem_page_addr(), I will try it

Thanks,
Jason
