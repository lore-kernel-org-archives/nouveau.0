From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 3/4] mm: simplify device private page handling in
 hmm_range_fault
Date: Tue, 17 Mar 2020 09:47:55 -0300
Message-ID: <20200317124755.GR20941@ziepe.ca>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317121536.GQ20941@ziepe.ca>
 <20200317122445.GA11662@lst.de>
 <20200317122813.GA11866@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200317122813.GA11866@lst.de>
Sender: kvm-ppc-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>
Cc: Ralph Campbell <rcampbell@nvidia.com>, Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Ben Skeggs <bskeggs@redhat.com>, Jerome Glisse <jglisse@redhat.com>, kvm-ppc@vger.kernel.org, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-mm@kvack.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 01:28:13PM +0100, Christoph Hellwig wrote:
> On Tue, Mar 17, 2020 at 01:24:45PM +0100, Christoph Hellwig wrote:
> > On Tue, Mar 17, 2020 at 09:15:36AM -0300, Jason Gunthorpe wrote:
> > > > Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> > > > look at the struct page but what if a driver needs to fault in a page from
> > > > another device's private memory? Should it call handle_mm_fault()?
> > > 
> > > Isn't that what this series basically does?
> > >
> > > The dev_private_owner is set to the type of pgmap the device knows how
> > > to handle, and everything else is automatically faulted for the
> > > device.
> > > 
> > > If the device does not know how to handle device_private then it sets
> > > dev_private_owner to NULL and it never gets device_private pfns.
> > > 
> > > Since the device_private pfn cannot be dma mapped, drivers must have
> > > explicit support for them.
> > 
> > No, with this series (and all actual callers before this series)
> > we never fault in device private pages.
> 
> IFF we want to fault it in we'd need something like this.  But I'd
> really prefer to see test cases for that first.

In general I think hmm_range_fault should have a mode that is the same
as get_user_pages in terms of when it returns a hard failure, and
generates faults. AFAIK, GUP will fault in this case?

I need this for making ODP use this API. ODP is the one that is highly
likely to see other driver's device_private pages and must have them
always fault to CPU.

> diff --git a/mm/hmm.c b/mm/hmm.c
> index b75b3750e03d..2884a3d11a1f 100644
> +++ b/mm/hmm.c
> @@ -276,7 +276,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>  		if (!fault && !write_fault)
>  			return 0;
>  
> -		if (!non_swap_entry(entry))
> +		if (!non_swap_entry(entry) || is_device_private_entry(entry))
>  			goto fault;

Yes, OK,  makes sense.

I've been using v7 of Ralph's tester and it is working well - it has
DEVICE_PRIVATE support so I think it can test this flow too. Ralph are
you able?

This hunk seems trivial enough to me, can we include it now?

Thanks,
Jason
