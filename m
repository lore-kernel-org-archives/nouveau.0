From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v3 3/6] mm: support THP migration to device private
 memory
Date: Wed, 2 Dec 2020 11:14:26 +0100
Message-ID: <20201202101426.GC7597@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com> <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de> <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com> <20201109091415.GC28918@lst.de> <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org, nouveau@lists.freedesktop.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Ben Skeggs <bskeggs@redhat.com>, Shuah Khan <shuah@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Logan Gunthorpe <logang@deltatee.com>, Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org, linux-fsdevel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

[adding a few of the usual suspects]

On Wed, Nov 11, 2020 at 03:38:42PM -0800, Ralph Campbell wrote:
> There are 4 types of ZONE_DEVICE struct pages:
> MEMORY_DEVICE_PRIVATE, MEMORY_DEVICE_FS_DAX, MEMORY_DEVICE_GENERIC, and
> MEMORY_DEVICE_PCI_P2PDMA.
>
> Currently, memremap_pages() allocates struct pages for a physical address range
> with a page_ref_count(page) of one and increments the pgmap->ref per CPU
> reference count by the number of pages created since each ZONE_DEVICE struct
> page has a pointer to the pgmap.
>
> The struct pages are not freed until memunmap_pages() is called which
> calls put_page() which calls put_dev_pagemap() which releases a reference to
> pgmap->ref. memunmap_pages() blocks waiting for pgmap->ref reference count
> to be zero. As far as I can tell, the put_page() in memunmap_pages() has to
> be the *last* put_page() (see MEMORY_DEVICE_PCI_P2PDMA).
> My RFC [1] breaks this put_page() -> put_dev_pagemap() connection so that
> the struct page reference count can go to zero and back to non-zero without
> changing the pgmap->ref reference count.
>
> Q1: Is that safe? Is there some code that depends on put_page() dropping
> the pgmap->ref reference count as part of memunmap_pages()?
> My testing of [1] seems OK but I'm sure there are lots of cases I didn't test.

It should be safe, but the audit you've done is important to make sure
we do not miss anything important.

> MEMORY_DEVICE_PCI_P2PDMA:
> Struct pages are created in pci_p2pdma_add_resource() and represent device
> memory accessible by PCIe bar address space. Memory is allocated with
> pci_alloc_p2pmem() based on a byte length but the gen_pool_alloc_owner()
> call will allocate memory in a minimum of PAGE_SIZE units.
> Reference counting is +1 per *allocation* on the pgmap->ref reference count.
> Note that this is not +1 per page which is what put_page() expects. So
> currently, a get_page()/put_page() works OK because the page reference count
> only goes 1->2 and 2->1. If it went to zero, the pgmap->ref reference count
> would be incorrect if the allocation size was greater than one page.
>
> I see pci_alloc_p2pmem() is called by nvme_alloc_sq_cmds() and
> pci_p2pmem_alloc_sgl() to create a command queue and a struct scatterlist *.
> Looks like sg_page(sg) returns the ZONE_DEVICE struct page of the scatterlist.
> There are a huge number of places sg_page() is called so it is hard to tell
> whether or not get_page()/put_page() is ever called on MEMORY_DEVICE_PCI_P2PDMA
> pages.

Nothing should call get_page/put_page on them, as they are not treated
as refcountable memory.  More importantly nothing is allowed to keep
a reference longer than the time of the I/O.

> pci_p2pmem_virt_to_bus() will return the physical address and I guess
> pfn_to_page(physaddr >> PAGE_SHIFT) could return the struct page.
>
> Since there is a clear allocation/free, pci_alloc_p2pmem() can probably be
> modified to increment/decrement the MEMORY_DEVICE_PCI_P2PDMA struct page
> reference count. Or maybe just leave it at one like it is now.

And yes, doing that is probably a sensible safe guard.

> MEMORY_DEVICE_FS_DAX:
> Struct pages are created in pmem_attach_disk() and virtio_fs_setup_dax() with
> an initial reference count of one.
> The problem I see is that there are 3 states that are important:
> a) memory is free and not allocated to any file (page_ref_count() == 0).
> b) memory is allocated to a file and in the page cache (page_ref_count() == 1).
> c) some gup() or I/O has a reference even after calling unmap_mapping_pages()
>    (page_ref_count() > 1). ext4_break_layouts() basically waits until the
>    page_ref_count() == 1 with put_page() calling wake_up_var(&page->_refcount)
>    to wake up ext4_break_layouts().
> The current code doesn't seem to distinguish (a) and (b). If we want to use
> the 0->1 reference count to signal (c), then the page cache would have hold
> entries with a page_ref_count() == 0 which doesn't match the general page cache

I think the sensible model here is to grab a reference when it is
added to the page cache.  That is exactly how normal system memory pages
work.
