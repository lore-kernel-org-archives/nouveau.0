From: Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH 0/6] nouveau/hmm: add support for mapping large pages
Date: Fri, 8 May 2020 12:59:10 -0700
Message-ID: <20200508195910.GR16070@bombadil.infradead.org>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200508192009.15302-1-rcampbell@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@linuxfoundation.org>
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

This explanation doesn't make any sense.  It doesn't matter how somebody
else has it mapped; if it's a PMD-sized page, you can map it with a
2MB mapping.
