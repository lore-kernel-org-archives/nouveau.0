From: Jason Gunthorpe <jgg-uk2M96/98Pc@public.gmane.org>
Subject: Re: [PATCH 0/6] nouveau/hmm: add support for mapping large pages
Date: Mon, 25 May 2020 10:41:18 -0300
Message-ID: <20200525134118.GA2536@ziepe.ca>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200508192009.15302-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
> hmm_range_fault() returns an array of page frame numbers and flags for
> how the pages are mapped in the requested process' page tables. The PFN
> can be used to get the struct page with hmm_pfn_to_page() and the page size
> order can be determined with compound_order(page) but if the page is larger
> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
> using a larger page size. To be fully general, hmm_range_fault() would need
> to return the mapping size to handle cases like a 1GB compound page being
> mapped with 2MB PMD entries. However, the most common case is the mapping
> size the same as the underlying compound page size.
> This series adds a new output flag to indicate this so that callers know it
> is safe to use a large device page table mapping if one is available.
> Nouveau and the HMM tests are updated to use the new flag.
> 
> Note that this series depends on a patch queued in Ben Skeggs' nouveau
> tree ("nouveau/hmm: map pages after migration") and the patches queued
> in Jason's HMM tree.
> There is also a patch outstanding ("nouveau/hmm: fix nouveau_dmem_chunk
> allocations") that is independent of the above and could be applied
> before or after.

Did Christoph and Matt's remarks get addressed here?

I think ODP could use something like this, currently it checks every
page to get back to the huge page size and this flag would optimze
that

Jason
