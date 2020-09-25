From: Ralph Campbell <rcampbell@nvidia.com>
Subject: [RFC PATCH v2 0/2] mm: remove extra ZONE_DEVICE struct page refcount
Date: Fri, 25 Sep 2020 13:44:40 -0700
Message-ID: <20200925204442.31348-1-rcampbell@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
To: linux-mm@kvack.org, kvm-ppc@vger.kernel.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dan Williams <dan.j.williams@intel.com>, Ira Weiny <ira.weiny@intel.com>, Matthew Wilcox <willy@infradead.org>, Jerome Glisse <jglisse@redhat.com>, John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@nvidia.com>, Bharata B Rao <bharata@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Yang Shi <yang.shi@linux.alibaba.com>, Paul Mackerras <paulus@ozlabs.org>, Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Ralph Campbell <rcampbell@nvidia.com>
List-Id: nouveau.vger.kernel.org

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
 fs/ext4/inode.c                        |  2 +-
 fs/xfs/xfs_file.c                      |  2 +-
 include/linux/dax.h                    |  5 ++
 include/linux/memremap.h               |  7 ++-
 include/linux/mm.h                     | 44 --------------
 lib/test_hmm.c                         |  2 +-
 mm/gup.c                               | 44 --------------
 mm/internal.h                          |  8 +++
 mm/memremap.c                          | 82 ++++++--------------------
 mm/migrate.c                           |  5 --
 mm/page_alloc.c                        |  3 +
 mm/swap.c                              | 46 +++------------
 15 files changed, 54 insertions(+), 208 deletions(-)

--=20
2.20.1
