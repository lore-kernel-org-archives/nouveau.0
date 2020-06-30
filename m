From: Matthew Wilcox <willy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Subject: Re: [PATCH v2 2/5] mm/hmm: add output flags for PMD/PUD page mapping
Date: Tue, 30 Jun 2020 22:23:43 +0100
Message-ID: <20200630212343.GP25523@casper.infradead.org>
References: <20200630195737.8667-1-rcampbell@nvidia.com>
 <20200630195737.8667-3-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200630195737.8667-3-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-rdma-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerome Glisse <jglisse-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, John Hubbard <jhubbard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>, Jason Gunthorpe <jgg-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Jun 30, 2020 at 12:57:34PM -0700, Ralph Campbell wrote:
> hmm_range_fault() returns an array of page frame numbers and flags for
> how the pages are mapped in the requested process' page tables. The PFN
> can be used to get the struct page with hmm_pfn_to_page() and the page
> size order can be determined with compound_order(page) but if the page
> is larger than order 0 (PAGE_SIZE), there is no indication that a
> compound page is mapped by the CPU using a larger page size. Without
> this information, the caller can't safely use a large device PTE to map
> the compound page because the CPU might be using smaller PTEs with
> different read/write permissions.
> 
> Add two new output flags to indicate the mapping size (PMD or PUD sized)
> so that callers know the pages are being mapped with consistent permissions
> and a large device page table mapping can be used if one is available.

The problem I have with this is that PTE/PMD/PUD are not the only choices
for how the CPU might choose to map something.  For example, ARM has
the ability to map 64kB pages using 16 consecutive page table entries
(marked specially so the CPU knows to use a single TLB entry for the
64kB range).  Some other CPUs have similar capabilities.

I'd rather you encoded the order of the mapping in the flags (eg a
number between 0 and 31) so that we have the flexibility in the future
to describe how memory is mapped.
