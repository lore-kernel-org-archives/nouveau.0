From: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v4 6/6] mm/migrate: remove range invalidation in
 migrate_vma_pages()
Date: Fri, 31 Jul 2020 16:15:43 -0300
Message-ID: <20200731191543.GJ24045@ziepe.ca>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-7-rcampbell@nvidia.com>
 <20200728191940.GB159104@nvidia.com>
 <7f947311-0034-9148-1dca-fb9b9a10abc4@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kvm-ppc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7f947311-0034-9148-1dca-fb9b9a10abc4@nvidia.com>
Sender: kvm-ppc-owner@vger.kernel.org
To: Ralph Campbell <rcampbell@nvidia.com>
Cc: linux-rdma@vger.kernel.org, linux-mm@kvack.org, nouveau@lists.freedesktop.org, kvm-ppc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Christoph Hellwig <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
List-Id: nouveau.vger.kernel.org

On Tue, Jul 28, 2020 at 03:04:07PM -0700, Ralph Campbell wrote:
> 
> On 7/28/20 12:19 PM, Jason Gunthorpe wrote:
> > On Thu, Jul 23, 2020 at 03:30:04PM -0700, Ralph Campbell wrote:
> > > When migrating the special zero page, migrate_vma_pages() calls
> > > mmu_notifier_invalidate_range_start() before replacing the zero page
> > > PFN in the CPU page tables. This is unnecessary since the range was
> > > invalidated in migrate_vma_setup() and the page table entry is checked
> > > to be sure it hasn't changed between migrate_vma_setup() and
> > > migrate_vma_pages(). Therefore, remove the redundant invalidation.
> > 
> > I don't follow this logic, the purpose of the invalidation is also to
> > clear out anything that may be mirroring this VA, and "the page hasn't
> > changed" doesn't seem to rule out that case?
> > 
> > I'm also not sure I follow where the zero page came from?
> 
> The zero page comes from an anonymous private VMA that is read-only
> and the user level CPU process tries to read the page data (or any
> other read page fault).
> 
> > Jason
> > 
> 
> The overall migration process is:
> 
> mmap_read_lock()
> 
> migrate_vma_setup()
>       // invalidates range, locks/isolates pages, puts migration entry in page table
> 
> <driver allocates destination pages and copies source to dest>
> 
> migrate_vma_pages()
>       // moves source struct page info to destination struct page info.
>       // clears migration flag for pages that can't be migrated.
> 
> <driver updates device page tables for pages still migrating, rollback pages not migrating>
> 
> migrate_vma_finalize()
>       // replaces migration page table entry with destination page PFN.
> 
> mmap_read_unlock()
> 
> Since the address range is invalidated in the migrate_vma_setup() stage,
> and the page is isolated from the LRU cache, locked, unmapped, and the page table
> holds a migration entry (so the page can't be faulted and the CPU page table set
> valid again), and there are no extra page references (pins), the page
> "should not be modified".

That is the physical page though, it doesn't prove nobody else is
reading the PTE.
 
> For pte_none()/is_zero_pfn() entries, migrate_vma_setup() leaves the
> pte_none()/is_zero_pfn() entry in place but does still call
> mmu_notifier_invalidate_range_start() for the whole range being migrated.

Ok..

> In the migrate_vma_pages() step, the pte page table is locked and the
> pte entry checked to be sure it is still pte_none/is_zero_pfn(). If not,
> the new page isn't inserted. If it is still none/zero, the new device private
> struct page is inserted into the page table, replacing the pte_none()/is_zero_pfn()
> page table entry. The secondary MMUs were already invalidated in the migrate_vma_setup()
> step and a pte_none() or zero page can't be modified so the only invalidation needed
> is the CPU TLB(s) for clearing the special zero page PTE entry.

No, the secondary MMU was invalidated but the invalidation start/end
range was exited. That means a secondary MMU is immeidately able to
reload the zero page into its MMU cache.

When this code replaces the PTE that has a zero page it also has to
invalidate again so that secondary MMU's are guaranteed to pick up the
new PTE value.

So, I still don't understand how this is safe?

Jason
