From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [RFC PATCH v3 0/2] mm: remove extra ZONE_DEVICE struct page refcount
Date: Thu, 1 Oct 2020 11:17:13 -0700
Message-ID: <20201001181715.17416-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <kvm-ppc-owner@vger.kernel.org>
To: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

This is still an RFC because after looking at the pmem/dax code some
more, I realized that the ZONE_DEVICE struct pages are being inserted
into the process' page tables with vmf_insert_mixed() and a zero
refcount on the ZONE_DEVICE struct page. This is sort of OK because
insert_pfn() increments the reference count on the pgmap which is what
prevents memunmap_pages() from freeing the struct pages and it doesn't
check for a non-zero struct page reference count.
But, any calls to get_page() will hit the VM_BUG_ON_PAGE() that
checks for a reference count =3D=3D 0.

// mmap() an ext4 file that is mounted -o dax.
ext4_dax_fault()
  ext4_dax_huge_fault()
    dax_iomap_fault(&ext4_iomap_ops)
      dax_iomap_pte_fault()
        ops->iomap_begin() // ext4_iomap_begin()
          ext4_map_blocks()
          ext4_set_iomap()
        dax_iomap_pfn()
        dax_insert_entry()
        vmf_insert_mixed(pfn)
          __vm_insert_mixed()
            if (!IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL) &&
                !pfn_t_devmap(pfn) && pfn_t_valid(pfn))
              insert_page()
                get_page(page) // XXX would trigger VM_BUG_ON_PAGE()
                page_add_file_rmap()
                set_pte_at()
            else
              insert_pfn()
                pte_mkdevmap()
                set_pte_at()

Should pmem set the page reference count to one before inserting the
pfn into the page tables (and decrement when removing devmap PTEs)?
What about MEMORY_DEVICE_GENERIC and MEMORY_DEVICE_PCI_P2PDMA use cases?
Where should they icrement/decrement the page reference count?
I don't know enough about how these are used to really know what to
do at this point. If people want me to continue to work on this series,
I will need some guidance.

---

Matthew Wilcox, Ira Weiny, and others have complained that ZONE_DEVICE
struct page reference counting is ugly because they are "free" when the
reference count is one instead of zero. This leads to explicit checks
for ZONE_DEVICE pages in places like put_page(), GUP, THP splitting, and
page migration which have to adjust the expected reference count when
determining if the page is isolated or idle. This is my attempt to make
ZONE_DEVICE pages be free when the reference count is zero and removing
the special cases.

I'm only sending this out as a RFC since I'm not that familiar with the
DAX, PMEM, XEN, and other uses of ZONE_DEVICE struct pages allocated
with devm_memremap_pages() or memremap_pages() but my best reading of
the code looks like it might be OK. I could use help testing these
configurations.
I have been able to successfully run xfstests on ext4 with the memmap
kernel boot option to simulate pmem.

Changes in v3:
Rebase to linux-mm 5.9.0-rc7-mm1.
Added a check for page_free() as suggested by Christoph Hellwig.
Added a helper for dax_wait_page() as suggested by Christoph Hellwig.

Changes in v2:
One of the big changes in v2 is that devm_memremap_pages() and
memremap_pages() now return the struct pages' reference count set to
zero instead of one. Normally, get_page() will VM_BUG_ON_PAGE() if
page->_refcount is zero. I didn't see any such warnings running the
xfstests with dax/pmem but I'm not clear how the zero to one reference
count is handled.

Other changes in v2:
Rebased to Linux-5.9.0-rc6 to include pmem fixes.
I added patch 1 to introduce a page refcount helper for ext4 and xfs as
suggested by Christoph Hellwig.
I also applied Christoph Hellwig's other suggested changes for removing
the devmap_managed_key, etc.

Ralph Campbell (2):
  ext4/xfs: add page refcount helper
  mm: remove extra ZONE_DEVICE struct page refcount

 arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
 fs/dax.c                               |  8 +--
 fs/ext4/inode.c                        |  5 +-
 fs/xfs/xfs_file.c                      |  4 +-
 include/linux/dax.h                    | 10 +++
 include/linux/memremap.h               |  7 ++-
 include/linux/mm.h                     | 44 --------------
 lib/test_hmm.c                         |  2 +-
 mm/gup.c                               | 44 --------------
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 84 +++++++-------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 +
 mm/swap.c                              | 44 ++------------
 15 files changed, 63 insertions(+), 209 deletions(-)

--=20
2.20.1
