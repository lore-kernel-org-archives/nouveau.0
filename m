From: Ralph Campbell <rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/6] mm: support THP migration to device
 private memory
Date: Wed, 11 Nov 2020 15:38:42 -0800
Message-ID: <bbf1f0df-85f3-5887-050e-beb2aad750f2@nvidia.com>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
 <20201109091415.GC28918@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20201109091415.GC28918-jcswGhMUV9g@public.gmane.org>
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
To: Christoph Hellwig <hch-jcswGhMUV9g@public.gmane.org>
Cc: Yang Shi <yang.shi-KPsoFbNs7GizrGE5bRqYAgC/G2K4zDHf@public.gmane.org>, Jason Gunthorpe <jgg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alistair Popple <apopple-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bharata B Rao <bharata-tEXmvtCZX7AybS5Ee8rs3A@public.gmane.org>, linux-mm-Bw31MaZKKs3YtjvyW6yDsg@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-kselftest-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Zi Yan <ziy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Shuah Khan <shuah-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "Kirill A . Shutemov" <kirill.shutemov-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


On 11/9/20 1:14 AM, Christoph Hellwig wrote:
> On Fri, Nov 06, 2020 at 01:26:50PM -0800, Ralph Campbell wrote:
>>
>> On 11/6/20 12:03 AM, Christoph Hellwig wrote:
>>> I hate the extra pin count magic here.  IMHO we really need to finish
>>> off the series to get rid of the extra references on the ZONE_DEVICE
>>> pages first.
>>
>> First, thanks for the review comments.
>>
>> I don't like the extra refcount either, that is why I tried to fix that up
>> before resending this series. However, you didn't like me just fixing the
>> refcount only for device private pages and I don't know the dax/pmem code
>> and peer-to-peer PCIe uses of ZONE_DEVICE pages well enough to say how
>> long it will take me to fix all the use cases.
>> So I wanted to make progress on the THP migration code in the mean time.
> 
> I think P2P is pretty trivial, given that ZONE_DEVICE pages are used like
> a normal memory allocator.  DAX is the interesting case, any specific
> help that you need with that?

There are 4 types of ZONE_DEVICE struct pages:
MEMORY_DEVICE_PRIVATE, MEMORY_DEVICE_FS_DAX, MEMORY_DEVICE_GENERIC, and
MEMORY_DEVICE_PCI_P2PDMA.

Currently, memremap_pages() allocates struct pages for a physical address range
with a page_ref_count(page) of one and increments the pgmap->ref per CPU
reference count by the number of pages created since each ZONE_DEVICE struct
page has a pointer to the pgmap.

The struct pages are not freed until memunmap_pages() is called which
calls put_page() which calls put_dev_pagemap() which releases a reference to
pgmap->ref. memunmap_pages() blocks waiting for pgmap->ref reference count
to be zero. As far as I can tell, the put_page() in memunmap_pages() has to
be the *last* put_page() (see MEMORY_DEVICE_PCI_P2PDMA).
My RFC [1] breaks this put_page() -> put_dev_pagemap() connection so that
the struct page reference count can go to zero and back to non-zero without
changing the pgmap->ref reference count.

Q1: Is that safe? Is there some code that depends on put_page() dropping
the pgmap->ref reference count as part of memunmap_pages()?
My testing of [1] seems OK but I'm sure there are lots of cases I didn't test.

MEMORY_DEVICE_PCI_P2PDMA:
Struct pages are created in pci_p2pdma_add_resource() and represent device
memory accessible by PCIe bar address space. Memory is allocated with
pci_alloc_p2pmem() based on a byte length but the gen_pool_alloc_owner()
call will allocate memory in a minimum of PAGE_SIZE units.
Reference counting is +1 per *allocation* on the pgmap->ref reference count.
Note that this is not +1 per page which is what put_page() expects. So
currently, a get_page()/put_page() works OK because the page reference count
only goes 1->2 and 2->1. If it went to zero, the pgmap->ref reference count
would be incorrect if the allocation size was greater than one page.

I see pci_alloc_p2pmem() is called by nvme_alloc_sq_cmds() and
pci_p2pmem_alloc_sgl() to create a command queue and a struct scatterlist *.
Looks like sg_page(sg) returns the ZONE_DEVICE struct page of the scatterlist.
There are a huge number of places sg_page() is called so it is hard to tell
whether or not get_page()/put_page() is ever called on MEMORY_DEVICE_PCI_P2PDMA
pages. pci_p2pmem_virt_to_bus() will return the physical address and I guess
pfn_to_page(physaddr >> PAGE_SHIFT) could return the struct page.

Since there is a clear allocation/free, pci_alloc_p2pmem() can probably be
modified to increment/decrement the MEMORY_DEVICE_PCI_P2PDMA struct page
reference count. Or maybe just leave it at one like it is now.

MEMORY_DEVICE_GENERIC:
Struct pages are created in dev_dax_probe() and represent non-volatile memory.
The device can be mmap()'ed which calls dax_mmap() which sets
vma->vm_flags | VM_HUGEPAGE.
A CPU page fault will result in a PTE, PMD, or PUD sized page
(but not compound) to be inserted by vmf_insert_mixed() which will call either
insert_pfn() or insert_page().
Neither insert_pfn() nor insert_page() increments the page reference count.
Invalidations don't callback into the device driver so I don't see how page
reference counts can be tracked without adding a mmu_interval_notifier.

I think just leaving the page reference count at one is better than trying
to use the mmu_interval_notifier or changing vmf_insert_mixed() and
invalidations of pfn_t_devmap(pfn) to adjust the page reference count.

MEMORY_DEVICE_PRIVATE:
This case has the most core mm code having to specially check for
is_device_private_page() and adjusting the expected reference count when the
page isn't mapped by any process. There is a clear allocation and free so it
can be changed to use a reference count of zero while free (see [2]).

MEMORY_DEVICE_FS_DAX:
Struct pages are created in pmem_attach_disk() and virtio_fs_setup_dax() with
an initial reference count of one.
The problem I see is that there are 3 states that are important:
a) memory is free and not allocated to any file (page_ref_count() == 0).
b) memory is allocated to a file and in the page cache (page_ref_count() == 1).
c) some gup() or I/O has a reference even after calling unmap_mapping_pages()
    (page_ref_count() > 1). ext4_break_layouts() basically waits until the
    page_ref_count() == 1 with put_page() calling wake_up_var(&page->_refcount)
    to wake up ext4_break_layouts().
The current code doesn't seem to distinguish (a) and (b). If we want to use
the 0->1 reference count to signal (c), then the page cache would have hold
entries with a page_ref_count() == 0 which doesn't match the general page cache
assumptions.

Q2: So how should I resolve that?

[1] https://lore.kernel.org/linux-mm/20201001181715.17416-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
[2] https://lore.kernel.org/linux-mm/20201012174540.17328-1-rcampbell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
